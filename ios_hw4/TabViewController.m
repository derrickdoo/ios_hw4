//
//  TabViewController.m
//  ios_hw4
//
//  Created by Derrick Or on 6/28/14.
//  Copyright (c) 2014 derrickor. All rights reserved.
//

#import "TabViewController.h"
#import "HomeViewController.h"
#import "ExploreViewController.h"
#import "ComposeViewController.h"
#import "AccountViewController.h"
#import "TrendingViewController.h"

@interface TabViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *contentView;
@property (weak, nonatomic) IBOutlet UIView *navigationBar;
@property (weak, nonatomic) IBOutlet UIButton *homeBtn;
@property (weak, nonatomic) IBOutlet UIButton *exploreBtn;
@property (weak, nonatomic) IBOutlet UIButton *composeBtn;
@property (weak, nonatomic) IBOutlet UIButton *accountBtn;
@property (weak, nonatomic) IBOutlet UIButton *trendingBtn;
@property (weak, nonatomic) IBOutlet UIView *composeOverlay;
@property (weak, nonatomic) IBOutlet UIView *loginOverlay;
@property (weak, nonatomic) IBOutlet UIView *explorePrompt;

@property (strong, nonatomic) HomeViewController *homeViewController;
@property (strong, nonatomic) ExploreViewController *exploreViewController;
@property (strong, nonatomic) ComposeViewController *composeViewController;
@property (strong, nonatomic) AccountViewController *accountViewController;
@property (strong, nonatomic) TrendingViewController *trendingViewController;


- (IBAction)tapHomeBtn:(id)sender;
- (IBAction)tapExploreBtn:(id)sender;
- (IBAction)tapComposeBtn:(id)sender;
- (IBAction)tapAccountBtn:(id)sender;
- (IBAction)tapTrendingBtn:(id)sender;
- (IBAction)tapNevermind:(id)sender;
- (IBAction)tapLogin:(id)sender;
- (IBAction)tapCancel:(id)sender;


@end

@implementation TabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.homeViewController = [[HomeViewController alloc] init];
        self.exploreViewController = [[ExploreViewController alloc] init];
        self.composeViewController = [[ComposeViewController alloc] init];
        self.accountViewController = [[AccountViewController alloc] init];
        self.trendingViewController = [[TrendingViewController alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.homeViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.homeViewController.view];
    self.homeBtn.selected = YES;
    self.explorePrompt.alpha = 0;
    self.explorePrompt.layer.cornerRadius = 5;
    [self bounceExplorePrompt];
}

- (void)bounceExplorePrompt
{
    [UIView animateWithDuration:1 animations:^{
        self.explorePrompt.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.2 delay:1 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
            [UIView setAnimationRepeatCount:3];
            CGRect frame = self.explorePrompt.frame;
            frame.origin.y = frame.origin.y - 4;
            self.explorePrompt.frame = frame;
        } completion:^(BOOL finished) {
            CGRect frame = self.explorePrompt.frame;
            frame.origin.y = frame.origin.y + 4;
            self.explorePrompt.frame = frame;
        }];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)unselectAllButtons
{
    self.homeBtn.selected = NO;
    self.exploreBtn.selected = NO;
    self.composeBtn.selected = NO;
    self.accountBtn.selected = NO;
    self.trendingBtn.selected = NO;
}


- (IBAction)tapHomeBtn:(id)sender {
    [self bounceExplorePrompt];
    
    CGSize sz = CGSizeMake(320, 320);
    self.contentView.contentSize = sz;
    
    self.navigationBar.hidden = NO;
    
    [self unselectAllButtons];
    self.homeBtn.selected = YES;
    
    self.homeViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.homeViewController.view];
}

- (IBAction)tapExploreBtn:(id)sender {
    self.explorePrompt.alpha = 0;
    
    CGSize sz = CGSizeMake(320, 1280);
    self.contentView.contentSize = sz;
    
    self.navigationBar.hidden = YES;
    
    [self unselectAllButtons];
    self.exploreBtn.selected = YES;
    
    self.exploreViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.exploreViewController.view];
}

- (IBAction)tapComposeBtn:(id)sender {
    //self.composeViewController.view.frame = self.contentView.frame;
    //[self.contentView addSubview:self.composeViewController.view];
    self.explorePrompt.alpha = 0;
    
    self.composeOverlay.hidden = NO;
}

- (IBAction)tapAccountBtn:(id)sender {
    [self bounceExplorePrompt];
    
    CGSize sz = CGSizeMake(320, 320);
    self.contentView.contentSize = sz;
    
    self.navigationBar.hidden = YES;
    
    [self unselectAllButtons];
    self.accountBtn.selected = YES;
    
    self.accountViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.accountViewController.view];
}

- (IBAction)tapTrendingBtn:(id)sender {
    [self bounceExplorePrompt];
    
    CGSize sz = CGSizeMake(320, 1280);
    self.contentView.contentSize = sz;
    
    self.navigationBar.hidden = YES;
    
    [self unselectAllButtons];
    self.trendingBtn.selected = YES;
    
    //UIImage *btnImage = [UIImage imageNamed:@"trending_selected_icon"];
    //[self.trendingBtn setImage:btnImage forState:UIControlStateNormal];
    
    self.trendingViewController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.trendingViewController.view];
}

- (IBAction)tapNevermind:(id)sender {
    self.composeOverlay.hidden = YES;
}

- (IBAction)tapLogin:(id)sender {
    self.explorePrompt.alpha = 0;
    
    self.loginOverlay.hidden = NO;
}

- (IBAction)tapCancel:(id)sender {
    self.loginOverlay.hidden = YES;
}
@end
