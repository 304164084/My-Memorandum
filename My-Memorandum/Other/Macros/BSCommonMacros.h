//
//  BSCommonMacros.h
//  FreePlay
//
//  Created by 隋帮林 on 2019/5/5.
//  Copyright © 2019 Share Exp. All rights reserved.
//

// MARK: - 输出日志
#ifdef DEBUG
#define NSLog(fmt, ...) NSLog((@"👉👉👉" "[文件名: %s]" "[方法名: %s]" "[行号: %d]" "👈👈👈" "\n" fmt), [[NSString stringWithFormat:@"%s", __FILE__].lastPathComponent UTF8String], __FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define NSLog(fmt, ...) nil
#endif


// MARK: - 通用间距
#define BS_ONE_SPACING 4.f
#define BS_DOUBLE_SPACING (BS_ONE_SPACING * 2.f)
#define BS_TRIPLE_SPACING (BS_ONE_SPACING * 3.f)
#define BS_QUADRUPLE_SPACING (BS_ONE_SPACING * 4.f)

// MARK: - 强弱引用
