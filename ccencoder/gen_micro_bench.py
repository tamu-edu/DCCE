tree_level =8 
num_sibling = 2
ct = {}
callers = [0]
fid = 1
for level in range(tree_level):
    next_callers = []
    for caller in callers:
        callees = []
        for sibling in range(num_sibling):
            callees.append(fid)
            next_callers.append(fid)
            fid += 1
        ct[caller] = callees
    callers = next_callers


callsite = 0
for caller, callees in ct.items():
    for callee in callees:
        print(f'{caller}-{caller}:{callsite}-d:{callsite}-{callee}-{callee},')
        callsite += 1

