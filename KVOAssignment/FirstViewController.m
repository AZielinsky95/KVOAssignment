//
//  FirstViewController.m
//  KVOAssignment
//
//  Created by Alejandro Zielinsky on 2018-04-21.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)stepperTapped:(UIStepper *)sender
{
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];

    [userInfo setObject:@(sender.value) forKey:@"stepperValue"];
    
    NSNotification *notification = [[NSNotification alloc] initWithName:@"stepperTapped" object:self userInfo:userInfo];
    
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

@end
