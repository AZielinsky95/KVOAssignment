//
//  ThirdViewController.m
//  KVOAssignment
//
//  Created by Alejandro Zielinsky on 2018-04-21.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@property (nonatomic,readonly) CGFloat oldConstraint;


@end

@implementation ThirdViewController


- (IBAction)viewTapped:(UITapGestureRecognizer *)sender
{
    [self.textField resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidChange:) name:UIKeyboardDidChangeFrameNotification object:nil];
    _oldConstraint = self.bottomConstraint.constant;

}

-(void)keyboardDidChange:(NSNotification *)notification
{
    NSValue *value = notification.userInfo [UIKeyboardFrameEndUserInfoKey];
    CGRect rect = value.CGRectValue;
    
    CGFloat yPos = rect.origin.y;
    CGFloat viewHeight = self.view.bounds.size.height;
    
    if(yPos == viewHeight)
    {
        self.bottomConstraint.constant = self.oldConstraint;
    }
    else
    {
        self.bottomConstraint.constant = viewHeight - yPos;
    }
}


@end
