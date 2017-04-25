//
//  XHLoginViewController.m
//  xinhua
//
//  Created by fengyn on 15/10/29.
//  Copyright © 2015年 lexingsoft. All rights reserved.
//

#import "XHLoginViewController.h"
#import "UINavigationController+YNBase.h"
#import "PublicViewModel.h"
#import "MBProgressHUD+Add.h"
#import "ServiceManager.h"


@interface XHLoginViewController ()
@property (weak, nonatomic) IBOutlet UIView *ui_inputBgView;
@property (weak, nonatomic) IBOutlet UIView *ui_userView;
@property (weak, nonatomic) IBOutlet UIView *ui_codeView;
@property (weak, nonatomic) IBOutlet UIButton *ui_codeButton;
@property (weak, nonatomic) IBOutlet UIButton *ui_loginButton;
@property (weak, nonatomic) IBOutlet UITextField *ui_userTextField;
@property (weak, nonatomic) IBOutlet UITextField *ui_codeTextField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *la_loginViewBottom;
@property (strong, nonatomic) NSTimer *m_theTimer;
@property (assign, nonatomic) int waitingTime;

/**
 * 新增测试数组
 */
@property (strong, nonatomic) NSArray *TestList;
@end

@implementation XHLoginViewController

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

//设置导航栏透明
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav-clearcolor-bg"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController setNavigationBarBottomLineHide:YES];
    self.navigationController.navigationBar.subviews[0].alpha = 0;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.backIndicatorImage = nil;
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController setNavigationBarBottomLineHide:NO];
    self.navigationController.navigationBar.subviews[0].alpha = 1;
}

- (void)viewDidDisappear:(BOOL)animated{
    [self.m_theTimer invalidate];
    self.m_theTimer = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)showSmsCodeWaitView{
    self.ui_codeButton.enabled=NO;
    self.waitingTime = 90;
    [self.ui_codeButton setTitle:[NSString stringWithFormat:@"%d秒后重发",self.waitingTime] forState:UIControlStateDisabled];
    self.m_theTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateSmsCodeWait) userInfo:nil repeats:YES];
}

- (void)updateSmsCodeWait
{
    self.waitingTime--;
    NSString *title = [NSString stringWithFormat:@"%d秒后重发",self.waitingTime];
    self.ui_codeButton.titleLabel.text = title;
    [self.ui_codeButton setTitle:title forState:UIControlStateDisabled];
    if (self.waitingTime <= 0) {
        [self hideSmsCodeWaitView];
    }
}

- (void)hideSmsCodeWaitView
{
    [self.m_theTimer invalidate];
    [self.ui_codeButton setTitle:@"发送验证码" forState:UIControlStateNormal];
    self.ui_codeButton.enabled=YES;
}

- (BOOL)isCanGetSMSCode
{
    if([[PublicViewModel sharedInstance] checkNullString:self.ui_userTextField.text])
    {
        [MBProgressHUD showError:@"请输入电话号码" toView:self.view];
        return NO;
    }
    
    if([[PublicViewModel sharedInstance] isValidatePhoneNumber:self.ui_userTextField.text])
    {
        [MBProgressHUD showError:@"请输入正确的电话号码" toView:self.view];
        return NO;
    }
      return YES;
}

/**
 * 获取验证码
 */
- (IBAction)getCodeAction:(id)sender {
    if ([self isCanGetSMSCode]) {
        [self showSmsCodeWaitView];
        [self.ui_codeTextField becomeFirstResponder];
    }
}

/**
 * 返回
 */
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


/**
 *  登陆
 */
- (IBAction)loginAction:(id)sender {
    [self.view endEditing:YES];
    
    if ([self isCanGetSMSCode])
    {
        [self.ui_loginButton setHidden:YES];
        NSDictionary *postDic = @{@"userName":_ui_userTextField.text};
        //防止Block循环引用
        __weak typeof (self) weakSelf = self;
        
        [[ServiceManager sharedInstance]postRequestforLogin:IP_URL parameters:postDic superClass:weakSelf.view success:^(NSDictionary *dataObject) {
            
            self.TestList = [dataObject objectForKey:@"results"];
            NSLog(@"_TestList============%@",_TestList);
            
        } invalid:^(NSString *invalidObject) {
            //错误信息
            [weakSelf warningLable:invalidObject];
        } failure:^(int resultDict) {
            [weakSelf warningLable:[NetworkError errorMessageWithCode:resultDict]];
        } errcode:^(int errcodeStr) {
             [weakSelf warningLable:[NetworkError errorMessageWithCode:errcodeStr]];
        } notInternet:^(int Internet) {
            [weakSelf warningLable:[NetworkError errorMessageWithCode:Internet]];

        }];
    }
}

- (IBAction)bgTouchAction:(id)sender {
    [self.view endEditing:YES];
}


#pragma mark - 懒加载
-(NSArray *)TestList
{
    if(_TestList == nil)
    {
        _TestList = [NSArray array];
    }
    return _TestList;
}
@end
