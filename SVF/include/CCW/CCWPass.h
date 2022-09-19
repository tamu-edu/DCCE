//===- CCWPass.h -- Whole program analysis------------------------------------//
//
//                     SVF: Static Value-Flow Analysis
//
// Copyright (C) <2013-2017>  <Yulei Sui>
//

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
//===----------------------------------------------------------------------===//


/*
 * @file: CCW.h
 * @author: ksungkeun84
 * @date: 08/17/2022
 * @version: 1.0
 *
 * @section LICENSE
 *
 * @section DESCRIPTION
 *
 */


#ifndef CCW_H_
#define CCW_H_

#include <unordered_map>
#include <string>

namespace SVF
{

class SVFModule;

/*!
 * Whole program pointer analysis.
 * This class performs various pointer analysis on the given module.
 */
// excised ", public llvm::AliasAnalysis" as that has a very light interface
// and I want to see what breaks.
class CCWPass
{

public:
    /// Pass ID
    static char ID;

    typedef std::unordered_map<std::string, std::unordered_map<uint64_t, std::string>> ccw_t;

    /// Constructor needs TargetLibraryInfo to be passed to the AliasAnalysis
    CCWPass()
    {

    }

    /// Destructor
    virtual ~CCWPass();


    virtual void runOnModule(SVFModule* svfModule);
    virtual bool runOnModule(Module& module);

    void parseCCWFile(const std::string&, ccw_t&);

    /// PTA name
    virtual inline std::string getPassName() const
    {
        return "CCWPass";
    }

};

} // End namespace SVF

#endif /* CCW_H_ */
