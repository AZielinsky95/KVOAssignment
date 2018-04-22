//
//  SecondViewController.m
//  KVOAssignment
//
//  Created by Alejandro Zielinsky on 2018-04-21.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *stepperLabel;
@property double count;
@end

@implementation SecondViewController


-(void)awakeFromNib
{
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(stepperTapped:)
                                                 name:@"stepperTapped"
                                               object:nil];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
    self.stepperLabel.text = [NSString stringWithFormat:@"%d",(int)self.count];
    
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)stepperTapped:(NSNotification*)notification
{
    self.count = [[notification.userInfo valueForKey:@"stepperValue"] doubleValue];
    self.stepperLabel.text = [NSString stringWithFormat:@"%d",(int)self.count];
}




@end
