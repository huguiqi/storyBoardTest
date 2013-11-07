//
//  WFJJViewViewController.h
//  storyboardTest
//
//  Created by 胡 桂祁 on 11/5/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFJJNavigationViewController : UINavigationController<UIActionSheetDelegate>


@property(nonatomic,strong) UIButton* rightBtn;
@property(nonatomic,strong) UIButton* leftBtn;

@property(nonatomic,weak) id<NavigationBackDelegate> backDelegate;

- (void)call;

-(void)addCustomRightBarButton:(id)target imageName:(NSString *)imageName  selector:(SEL)action;

-(void)addCustomLeftBarButton: (id)target imageName:(NSString *)imageName selector:(SEL)action;

-(void)addTitleRightBarButton:(id)target selector:(SEL)action title:(NSString *) title;



-(void)restoreRightBarButton;

@end
