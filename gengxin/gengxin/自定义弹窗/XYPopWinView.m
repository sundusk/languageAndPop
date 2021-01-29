//
//  XYPopWinView.m
//  gengxin
//
//  Created by zhongchuren on 2021/1/29.
//

#import "XYPopWinView.h"

@implementation XYPopWinView


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    
    
    if (self){
        
        self.windowLevel = UIWindowLevelAlert;
        UIView *backView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        backView.backgroundColor = [UIColor blackColor];
        backView.alpha = 0.7;
        [self addSubview:backView];
        
        
        
        UIActivityIndicatorView *iconView = [UIActivityIndicatorView new];
        
        iconView=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];

        iconView.center= backView.center;

        [iconView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleMedium];

        [iconView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleLarge];

        [iconView setBackgroundColor:[UIColor lightGrayColor]];

        [backView addSubview:iconView];

      
        
        self.icon = iconView;
        
        
        UILabel *iconLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, backView.frame.size.height/2 + 120, backView.frame.size.width, 15)];
        
        [backView addSubview:iconLabel];
        
        iconLabel.text = @"正在设置语言...";
        
        iconLabel.textColor = UIColor.redColor;
        
        self.titleLabel = iconLabel;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
         
        
        
        
        
        
        self.icon.hidesWhenStopped = YES;
        
        
    }
    
    return  self;
   
}


- (void) hideIcon {
    [self.icon
     stopAnimating];
    
    [_delegate alertView:self didShow:self.iconStr];
    
   
}
- (void) showIcon {
    [self.icon startAnimating];
    
}


- (void)show{
    [self makeKeyAndVisible];
    
}
- (void)dismiss{
    [self resignKeyWindow];
    [self removeFromSuperview];
   
}



@end
