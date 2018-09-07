//
//  BBNBaseTabbarController.m
//  Bibenet
//
//  Created by hc on 2017/5/18.
//  Copyright © 2017年 bib. All rights reserved.
//

#import "BBNBaseTabbarController.h"
#import "BBNBaseNavController.h"
#import "BBNBaseController.h"
#import "BBNTabberItem.h"

#define TabbarChildNum 4

@interface BBNBaseTabbarController ()<UITabBarControllerDelegate>

@property (nonatomic, assign) NSInteger oldIndex;
@property (nonatomic, strong) NSMutableArray *titleArr;
@property (nonatomic, strong) NSMutableArray *imgArr;
@property (nonatomic, strong) NSMutableArray *selectImgArr;
@property (nonatomic, strong) BBNTabberItem *selectItem;

@end

@implementation BBNBaseTabbarController

+ (void)initialize {
    
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [[UITabBarItem appearance] setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];

    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:11];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];

    [[UITabBarItem appearance] setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildViewController:[[BBNBaseController alloc] init] title:@"主页" image:@"shouyea" selectedImage:@"shouye"];
    [self setupChildViewController:[[BBNBaseController alloc] init] title:@"超级评委" image:@"pingweia" selectedImage:@"pingwei"];
    [self setupChildViewController:[[BBNBaseController alloc] init] title:@"比比驿站" image:@"yizhana" selectedImage:@"yizhan"];
    [self setupChildViewController:[[BBNBaseController alloc] init] title:@"我的" image:@"wodea" selectedImage:@"wode"];
    self.delegate = self;
    self.oldIndex = 0;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        for (NSInteger i = 0; i < self.titleArr.count; i++) {
            BBNTabberItem *barItem = [[BBNTabberItem alloc] init];
            barItem.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/TabbarChildNum*i, 0, [UIScreen mainScreen].bounds.size.width/TabbarChildNum, self.tabBar.frame.size.height);
            [self.tabBar addSubview:barItem];
            barItem.title = self.titleArr[i];
            barItem.image = self.imgArr[i];
            barItem.selectedImage = self.selectImgArr[i];
            barItem.font = [UIFont systemFontOfSize:11];
            barItem.selectedfont = [UIFont boldSystemFontOfSize:11];
            barItem.textColor = [UIColor blackColor];
            barItem.selectedtextColor = [UIColor blackColor];
//            barItem.backgroundColor = [UIColor whiteColor];
            barItem.tag = i;
            UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tabbarItemAction:)];
            [barItem addGestureRecognizer:tapGest];
            if (i == 0) {
                barItem.selected = YES;
                self.selectItem = barItem;
            }
        }
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//- (BOOL)shouldAutorotate {
//    return false;
//}
//
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//    return UIInterfaceOrientationMaskPortrait;
//}

- (NSMutableArray *)titleArr {
    if (!_titleArr) {
        _titleArr = [[NSMutableArray alloc] init];
    }
    return _titleArr;
}

- (NSMutableArray *)imgArr {
    if (!_imgArr) {
        _imgArr = [[NSMutableArray alloc] init];
    }
    return _imgArr;
}

- (NSMutableArray *)selectImgArr {
    if (!_selectImgArr) {
        _selectImgArr = [[NSMutableArray alloc] init];
    }
    return _selectImgArr;
}

- (void)tabbarItemAction:(UITapGestureRecognizer *)tapGest {
    BBNTabberItem *item = (BBNTabberItem *)tapGest.view;
    if ([item isEqual:self.selectItem]) {
        return;
    }
    self.selectItem.selected = NO;
    self.selectItem = item;
    self.selectItem.selected = YES;
    self.tabBarController.selectedIndex = item.tag;
}

- (void)setupChildViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    [self.titleArr addObject:title];
    [self.imgArr addObject:[UIImage imageNamed:image]];
    [self.selectImgArr addObject:[UIImage imageNamed:selectedImage]];
    //设置图片
//    [childController.tabBarItem setImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    [childController.tabBarItem setSelectedImage:[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    BBNBaseNavController *navCon = [[BBNBaseNavController alloc] initWithRootViewController:childController];
//    navCon.title = title;
    //设置文字偏移
//    [childController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    //设置文字
//    [childController.tabBarItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Helvetica"size:11], NSForegroundColorAttributeName : BBNNorTextClolr} forState:UIControlStateNormal];
//    [childController.tabBarItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold"size:11], NSForegroundColorAttributeName : BBNNorTextClolr} forState:UIControlStateSelected];
    [self addChildViewController:navCon];
}

//- (nullable id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
//                     animationControllerForTransitionFromViewController:(UIViewController *)fromVC
//                                                       toViewController:(UIViewController *)toVC{
//    BBNBaseNavController *toNavi = toVC;
//    if ([toNavi.topViewController isKindOfClass:[BBNPersonalCenterController class]]) {
//        return [[BBNTabbarAnimationManager alloc] init];
//    }
//    return nil;
//}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
}

/// 选择的当前控制器是否可以旋转
-(BOOL)shouldAutorotate{
    
    return [self.selectedViewController shouldAutorotate];
}

/// 选择的当前控制器是支持的旋转的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    return  [self.selectedViewController supportedInterfaceOrientations];
}

///
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    
    return  [self.selectedViewController preferredInterfaceOrientationForPresentation];
}

@end
