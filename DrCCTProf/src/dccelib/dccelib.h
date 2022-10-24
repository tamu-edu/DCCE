/*
 *  Copyright (c) 2020-2021 Xuhpclab. All rights reserved.
 *  Licensed under the MIT License.
 *  See LICENSE file for more information.
 */

#ifndef _DCCELIB_H_
#define _DCCELIB_H_

#include <cstdint>
#include <vector>
#include <string>

#include "dr_api.h"


DR_EXPORT
void
dccelib_init(std::string ccw_file_path, void (*func1)(void *, instrlist_t*, instr_t*));


DR_EXPORT
void
dccelib_exit(void);

DR_EXPORT
uint64_t
dccelib_get_ccid();

#endif // _DCCELIB_H_
