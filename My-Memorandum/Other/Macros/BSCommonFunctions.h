//
//  BSCommonFunctions.h
//  My-Memorandum
//
//  Created by suibanglin on 2020/6/6.
//  Copyright © 2020 banglin. All rights reserved.
//

// MARK: - 设备类型
inline static BOOL is_iPhone () {
    return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone ? YES : NO;
}

inline static BOOL is_iPad () {
    return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad ? YES : NO;
}

// MARK: - 设备方向相关
inline static BOOL bs_currentOrientationIsPortrait () {
    return UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation);
}

// MARK: - frame 相关
inline static BOOL is_iPhone_X () {
    return [UIDevice is_iPhone_X];
}

inline static CGFloat leading_safeAreaInsets () {
    return [UIView bs_leadingSpaceOfSafeAreaInsets];
}

inline static CGFloat trailing_safeAreaInsets () {
    return [UIView bs_trailingSpaceOfSareAreaInsets];
}

inline static CGFloat top_safeAreaInsets () {
    return [UIView bs_topSpaceOfSafeAreaInsets];
}

inline static CGFloat bottom_safeAreaInsets () {
    return [UIView bs_bottomSpaceOfSafeAreaInsets];
}
