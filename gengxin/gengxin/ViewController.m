//
//  ViewController.m
//  gengxin
//
//  Created by zhongchuren on 2021/1/28.
//

#import "ViewController.h"
#import "languageViewController.h"
#import "NSBundle+AppLanguageSwitch.h"
#import "XYPopWinView.h"

@interface ViewController ()<XYPopWinViewDelegte>

@property (nonatomic, strong) XYPopWinView *alertView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton new];
    button.frame = CGRectMake(200, 200, 200, 50);
    button.backgroundColor = UIColor.redColor;
    [self.view addSubview:button];
    [button addTarget:self action:@selector(demo:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel  *label = [UILabel new];
    
    label.frame = CGRectMake(150, 300, 200, 50);
    label.backgroundColor = UIColor.blueColor;
    [self.view addSubview:label];
    label.text = NSLocalizedString(@"第一天", nil);
}
-(void)demo:(UIButton *) button{
    
    
    
   UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"语言切换" message:@"" preferredStyle:UIAlertControllerStyleAlert];

   //添加取消类型按钮
   [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
       NSLog(@"点击取消");
       [self showWindows];
   }]];

   //添加常规类型按钮
   [alertController addAction:[UIAlertAction actionWithTitle:@"英文" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       
       languageViewController *VC = [languageViewController new];
       VC.modalPresentationStyle = UIModalPresentationFullScreen;
       VC.languageString = @"en";
       [self presentViewController:VC animated:NO completion:nil];
//       [self.view removeFromSuperview];
      
   }]];

   //添加销毁类型按钮
   [alertController addAction:[UIAlertAction actionWithTitle:@"简体中文" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
       
       languageViewController *VC = [languageViewController new];
       VC.modalPresentationStyle = UIModalPresentationFullScreen;
       VC.languageString = @"zh-Hans";
       [self presentViewController:VC animated:NO completion:nil];
//       self.view = nil;
       
       
   }]];

   //显示
   [self presentViewController:alertController animated:YES completion:nil];
    
    

    
    
    
    
    
}


- (void)showWindows{
    
   
    _alertView = [[XYPopWinView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.view addSubview:_alertView];
    [_alertView show];
    
    _alertView.delegate = self;
    
    
    [_alertView showIcon];


    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        [self->_alertView hideIcon];
        [self->_alertView dismiss];
        self->_alertView.hidden = YES;
        self->_alertView = nil;

    });

    
    
    
    
    
    
}


- (void)alertView:(XYPopWinView *)alertView didShow:(NSString *)String{
    
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"语言切换完成" message:@"需要重新进入app" preferredStyle:UIAlertControllerStyleAlert];

    //添加取消类型按钮
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        exit(1);
    }]];

 

    //显示
    [self presentViewController:alertController animated:YES completion:nil];
    
    
    
}

@end
