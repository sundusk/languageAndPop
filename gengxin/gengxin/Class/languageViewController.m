//
//  languageViewController.m
//  language
//
//  Created by zhongchuren on 2021/1/28.
//

#import "languageViewController.h"
#import "NSBundle+AppLanguageSwitch.h"
@interface languageViewController ()
@property (nonatomic, weak) UIActivityIndicatorView *icon;
@property (nonatomic, weak) UILabel *iconLabel;

@end

@implementation languageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIActivityIndicatorView *iconView = [UIActivityIndicatorView new];
    
    iconView=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];

    iconView.center=self.view.center;

    [iconView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleMedium];

    [iconView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleLarge];

    [iconView setBackgroundColor:[UIColor lightGrayColor]];

    [self.view addSubview:iconView];

    [iconView startAnimating];
    
    
//    self.view.backgroundColor = UIColor.whiteColor;
    
    [NSBundle setCusLanguage:self.languageString];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [iconView stopAnimating];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"设置成功" message:@"退出后请重新进入app" preferredStyle:UIAlertControllerStyleAlert];

        //添加取消类型按钮
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            exit(1);
        }]];

      

     

        //显示
        [self presentViewController:alertController animated:YES completion:nil];
        
    });
    
  
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//
//
//
//
//
//    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
