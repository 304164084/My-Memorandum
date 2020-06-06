//
//  UIButton+KSEdgeInsets.h
//  FreePlay
//
//  Created by 隋帮林 on 2019/5/5.
//  Copyright © 2019 Share Exp. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, KSImagePositionType) {
    KSImagePositionTypeLeft,   //图片在左，标题在右，默认风格
    KSImagePositionTypeRight,  //图片在右，标题在左
    KSImagePositionTypeTop,    //图片在上，标题在下
    KSImagePositionTypeBottom  //图片在下，标题在上
};

typedef NS_ENUM(NSInteger, KSEdgeInsetsType) {
    KSEdgeInsetsTypeTitle,//标题
    KSEdgeInsetsTypeImage//图片
};

typedef NS_ENUM(NSInteger, KSMarginType) {
    KSMarginTypeTop         ,
    KSMarginTypeBottom      ,
    KSMarginTypeLeft        ,
    KSMarginTypeRight       ,
    KSMarginTypeTopLeft     ,
    KSMarginTypeTopRight    ,
    KSMarginTypeBottomLeft  ,
    KSMarginTypeBottomRight
};

/**
 默认情况下，imageEdgeInsets和titleEdgeInsets都是0。先不考虑height,
 
 if (button.width小于imageView上image的width){图像会被压缩，文字不显示}
 
 if (button.width < imageView.width + label.width){图像正常显示，文字显示不全}
 
 if (button.width >＝ imageView.width + label.width){图像和文字都居中显示，imageView在左，label在右，中间没有空隙}
 */

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (KSEdgeInsets)

/**
 *  利用UIButton的titleEdgeInsets和imageEdgeInsets来实现图片和标题的自由排布
 *  注意：1.该方法需在设置图片和标题之后才调用;
 2.图片和标题改变后需再次调用以重新计算titleEdgeInsets和imageEdgeInsets
 *
 *  @param type    图片位置类型
 *  @param spacing 图片和标题之间的间隙
 */
- (void)setImagePositionWithType:(KSImagePositionType)type spacing:(CGFloat)spacing;

/**
 *  按钮只设置了title or image，该方法可以改变它们的位置
 *
 *  @param edgeInsetsType <#edgeInsetsType description#>
 *  @param marginType     <#marginType description#>
 *  @param margin         <#margin description#>
 */
- (void)setEdgeInsetsWithType:(KSEdgeInsetsType)edgeInsetsType marginType:(KSMarginType)marginType margin:(CGFloat)margin;

@end

NS_ASSUME_NONNULL_END
