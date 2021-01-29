//
//  XYPopWinView.h
//  gengxin
//
//  Created by zhongchuren on 2021/1/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class XYPopWinView;
@protocol XYPopWinViewDelegte <NSObject>


- (void)alertView:(XYPopWinView *)alertView didShow:(NSString *)String;


@end

@interface XYPopWinView : UIWindow

@property (nonatomic,weak) id<XYPopWinViewDelegte> delegate;

@property (nonatomic,weak) UILabel *titleLabel;
@property (nonatomic, weak) UIActivityIndicatorView *icon;
@property (nonatomic,weak) NSString *iconStr;

- (void)show;
- (void)dismiss;
- (void) showIcon;
- (void) hideIcon;


@end

NS_ASSUME_NONNULL_END
