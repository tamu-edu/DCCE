import sys
import re
import argparse

def load_clang_ccw(fname):
    caller2off2callee2ccw= {}
    empty_callsites = []
    with open(fname, 'r') as f:
        caller = None
        for line in f:
            print(f'processing {line}')
            tokens = line.strip().split(':')
            if len(tokens) == 1:
                caller = tokens[0]
                assert(caller not in caller2off2callee2ccw)
                caller2off2callee2ccw[caller] = {}
            elif len(tokens) == 2:
                assert(caller != None)
                offset = int(tokens[0]);
                assert(offset not in caller2off2callee2ccw[caller])
                caller2off2callee2ccw[caller][offset] = {}

                ccwstring = tokens[1][:-1]
                for callee_ccw in ccwstring.split(','):
                    if 'empt' == callee_ccw:
                        caller2off2callee2ccw[caller][offset] = 'empty'
                        print(f'caller: {caller}, offset: {offset}, callee-ccw: empty')
                    else:
                        _, callee, ccw = callee_ccw.split('-')
                        assert(callee not in caller2off2callee2ccw[caller][offset])
                        caller2off2callee2ccw[caller][offset][callee] = ccw;
                        print(f'caller: {caller}, offset: {offset}, callee: {callee}, ccw: {ccw}')
            else:
                print(f"Reading {fname} error at: {line}")
                exit(3)
    return caller2off2callee2ccw

def load_ccw_name(fname):
    ccw_name = {} # caller -> [{callee->ccw}, ... ]
    with open(fname, 'r') as fin:
        for line in fin:
            line = line.strip()[:-1] # Remove the last comma

            caller, callsite_id, callee_set = line.split(':')
            if caller not in ccw_name:
                ccw_name[caller] = []

            callee2ccw = {}
            for callee_ccw in callee_set.split(','):
                callee, ccw = callee_ccw.split('-')
                assert(callee not in callee2ccw)
                callee2ccw[callee] = ccw
            ccw_name[caller].append(callee2ccw)

    return ccw_name

def parse_bin(binary_path, caller2off2callee2ccw, outfile):
    cur_func_name = None
    cur_callsite = None
    cur_call_size = None
    ret_target = None
    fname2entry = {}
    fname2callsites = {} # fname -> [callsite, callsite]
    callsite2callee = {}
    debug = True
    ccw_addr = {}
    first_call = False
    first_callsite = None


    #               EmptyLine
    # Start --------------------------------------------------> Start
    #               No action
    def Start_EmptyLine_Start(matchObj):
        nonlocal cur_func_name, cur_callsite, cur_call_size, ret_target, fname2entry, fname2callsites, callsite2callee, ccw_addr, first_call, first_callsite, debug
        if debug: print(f'Start_EmptyLine_Start')
        pass
    
    #       file_format: "binary name: file format <file format>"
    # Start --------------------------------------------------> Start
    #               No action
    def Start_FileFormat_Start(matchObj):
        nonlocal cur_func_name, cur_callsite, cur_call_size, ret_target, fname2entry, fname2callsites, callsite2callee, ccw_addr, first_call, first_callsite, debug
        if debug: print(f'Start_FileFormat_Start')
        pass

    #           NewFunction: "<func_entry> <func_name>:"
    # Start -----------------------------------------------> Function
    #           cur_func_name = <func_name>
    #           fname2entry[cur_func_name] = func_entry
    def Start_NewFunction_Function(matchObj):
        nonlocal cur_func_name, cur_callsite, cur_call_size, ret_target, fname2entry, fname2callsites, callsite2callee, ccw_addr, first_call, first_callsite, debug
        assert(cur_func_name == None)
        cur_func_name = matchObj.group(2)
        idx = cur_func_name.find('@plt')
        if idx != -1:
            cur_func_name = cur_func_name[:cur_func_name.find('@plt')]
        func_entry = int(matchObj.group(1), 16)
        if debug: print(f'Start_NewFunction_Function cur_func_name: {cur_func_name} func_entry: {hex(func_entry)}')

        fname2entry[cur_func_name] = func_entry
        fname2callsites[cur_func_name] = []
        first_call = True

    #               empty_line: "Empty line"
    # Function  -----------------------------------------------> Start
    #               cur_func_name = None
    def Function_EmptyLine_Start(matchObj):
        nonlocal cur_func_name, cur_callsite, cur_call_size, ret_target, fname2entry, fname2callsites, callsite2callee, ccw_addr, first_call, first_callsite, debug
        if debug: print(f'Function_EmptyLine_Start:')
        if cur_func_name == 'main':
            assert(cur_callsite != None and cur_call_size != None)
            ret_target = cur_callsite + cur_call_size
        cur_func_name = None
        cur_callsite = None
        cur_call_size = None


    #               DirectCall: "^<callsite>: <callee> <callee_name>"
    # Function  -----------------------------------------------> Function
    #               callsite2callee[<callsite>] = <callee>
    def Function_DirectCall_Function(matchObj):
        nonlocal cur_func_name, cur_callsite, cur_call_size, ret_target, fname2entry, fname2callsites, callsite2callee, ccw_addr, first_call, first_callsite, debug
        cur_callsite = int(matchObj.group(1), 16)
        cur_call_size = len(matchObj.group(2).strip().split(' '))
        callee   = int(matchObj.group(3), 16)

        # FIXME: This is the exceptional case that LLVM treat memcpy as intrinsic function so it's not in cg file
        #callee_name = matchObj.group(4)
        #if callee_name in ['memcpy@plt', 'memset@plt', 'memmove@plt', 'memchr@plt', 'memcmp@plt', '_Unwind_Resume@plt']:
        #    if debug: print(f'Function_DirectCall_Function callsite: {hex(cur_callsite)} callee: {hex(callee)} -- skipping')
        #    return

        if debug: print(f'Function_DirectCall_Function callsite: {hex(cur_callsite)} callee: {hex(callee)}')
        callsite2callee[cur_callsite] = callee
        fname2callsites[cur_func_name].append(cur_callsite)
        if cur_func_name == 'main' and first_call:
            assert(first_callsite == None)
            first_callsite = cur_callsite
            first_call = False
            
    
    #               IndirectCall: "^<callsite>: <memory reference>"
    # Function  -----------------------------------------------> Function
    #               callsite2callee[callsite] = 0
    def Function_IndirectCall_Function(matchObj):
        nonlocal cur_func_name, cur_callsite, cur_call_size, ret_target, fname2entry, fname2callsites, callsite2callee, ccw_addr, first_call, first_callsite, debug
        cur_callsite = int(matchObj.group(1), 16)
        cur_call_size = len(matchObj.group(2).strip().split(' '))
        if debug: print(f'Function_IndirectCall_Function callsite: {hex(cur_callsite)}')
        callsite2callee[cur_callsite] = 0
        fname2callsites[cur_func_name].append(cur_callsite)
        if cur_func_name == 'main' and first_call:
            assert(first_callsite == None)
            first_callsite = cur_callsite
            first_call = False
    
    transition_table = {
        'Start': {
            'EmptyLine' : 'Start',
            'FileFormat' : 'Start',
            'NewFunction' : 'Function',
        },
        'Function': {
            'DirectCall' : 'Function',
            'IndirectCall' : 'Function',
            'EmptyLine' : 'Start'
        },
    }

    reg_exps = {
        'Comment' : '^;.*',
        'FileFormat': '^.*:.*file format elf64-x86-64',
        'EmptyLine' : '(^$)',
        'NewFunction': '^([0-9a-fA-F]+) <(.+)>:$',
        #'new_instruction' : '^ +([0-9a-fA-F]+):(.*)',
        'DirectCall' : '^ +([0-9a-fA-F]+):([ 0-9a-fA-F]+).+callq.+0x([0-9a-fA-F]+).+<(.+)>',
        'IndirectCall' : '^ +([0-9a-fA-F]+):([ 0-9a-fA-F]+).+callq.+',
        #'IndirectCall' : '^ +([0-9a-fA-F]+): .+callq.+.*\\(%.+\\)',
    }

    regexps = {}
    # compile reg_exps
    for k, r in reg_exps.items():
        regexps[k] = re.compile(r)

    state = 'Start'   # Start, Section,
    with open(binary_path, 'r') as f:
        for line in f:
            #multiple_match = False
            for k, r in regexps.items():
                matchObj = re.match(r, line)
                if matchObj:
                    #if (multiple_match):
                    #    print(f"multiple match {line} {k}")
                    #assert(not multiple_match)
                    #state = transit_state(state, k, matchObj)
                    #try:
                    if k == 'Comment':
                        break
                        #multiple_match = True
                        #continue
                    next_state = transition_table[state][k] # k is event
                    print('Calling %s_%s_%s(matchObj)' % (state, k, next_state))
                    eval('%s_%s_%s(matchObj)' % (state, k, next_state))
                    state = next_state
                    break
                    #multiple_match = True
                    #except:
                    #    print('Something wrong while parsing...')
                    #    exit(1)

    fout = open(outfile, 'w')
    assert(first_callsite != None and ret_target != None)
    fout.write(f'{hex(first_callsite)},{hex(ret_target)}\n')
    for caller, off2callee2ccw in caller2off2callee2ccw.items():
        print(f'{caller}:')
        cs_idx = 0

        for offset, callee2ccw in off2callee2ccw.items():
            print(f'caller: {caller}, cs_idx: {cs_idx}')
            callsite_addr_from_exe = fname2callsites[caller][cs_idx]
            callsite_addr_from_bc  = fname2entry[caller] + offset
            if callsite_addr_from_exe != callsite_addr_from_bc:
                print(f'mismatch callsite_addr {hex(callsite_addr_from_bc)} - {hex(callsite_addr_from_exe)}')
                exit(1)

            fout.write(f'{hex(callsite_addr_from_bc)}:')
            if 'empty' == callee2ccw:
                fout.write(f'0-0,')
            else:
                for callee, ccw in callee2ccw.items():
                    callee_addr = fname2entry[callee]
                    fout.write(f'{hex(callee_addr)}-{ccw},')
            cs_idx += 1
            fout.write('\n')
        
        num_callsite_from_bc = len(caller2off2callee2ccw[caller]) 
        num_callsite_from_exe = len(fname2callsites[caller])
        if num_callsite_from_bc != num_callsite_from_exe:
            print(f'mismatch the number of callsite in {caller} {num_callsite_from_bc} vs {num_callsite_from_exe}')
            exit(1)


    fout.close() 

def main(args):
    caller2off2callee2ccw = load_clang_ccw(args.ccw)
    parse_bin(args.bin, caller2off2callee2ccw, args.output)

    #ccw_struct = {}
    #for func_name, off2ccw in clang_ccw.items():
    #    for offset, ccw in off2ccw.items():
    #        func_entry = fname2entry[func_name]
    #        callsite = func_entry + offset
    #        print(f'{func_name} - entry: {func_entry} callsite: {callsite}')
    #        callee = callsite2callee[callsite]
    #        if callsite not in ccw_struct:
    #            ccw_struct[callsite] = []
    #        ccw_struct[callsite].append((callee, ccw))

    #fout = open(args.output, 'w')
    #for callsite, ccw_list in ccw_struct.items():
    #    fout.write(f'{hex(callsite)}:')
    #    for callee, ccw in ccw_list:
    #        fout.write(f'{hex(callee)}-{hex(ccw)},')
    #    fout.write('\n')
    #fout.close()

if __name__== "__main__":
    parser = argparse.ArgumentParser(\
            description='Binary Parser and CCW file generator')
    parser.add_argument('-ccw', required=True,
            help='A ccw file generated by clang.')
    parser.add_argument('-bin', required=True,
            help='A binary file.')
    parser.add_argument('-output', required=True,
            help='An output file.')
    args = parser.parse_args()
    main(args)
