//
//  BSViewProtocol.h
//  FreePlay
//
//  Created by 隋帮林 on 2019/4/29.
//  Copyright © 2019 Share Exp. All rights reserved.
//

#ifndef BSViewProtocol_h
#define BSViewProtocol_h

#import <UIKit/UIKit.h>

@protocol BSViewProtocol <NSObject>

@optional
// MARK: - 初始化UI
- (void)setupViews;
- (void)setupConstraints;
- (void)setupDefaultConfigration;


@end


#endif /* BSViewProtocol_h */
