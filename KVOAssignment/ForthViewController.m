//
//  ForthViewController.m
//  KVOAssignment
//
//  Created by Alejandro Zielinsky on 2018-04-22.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "ForthViewController.h"
#import "customView.h"

@interface ForthViewController ()

@property (weak, nonatomic) IBOutlet customView *whiteView;

@property (weak, nonatomic) IBOutlet UIView *yellowView;

@end

@implementation ForthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.whiteView addObserver:self forKeyPath:@"point" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@" change %@", change);
    if([keyPath isEqualToString:@"point"])
    {
        id value = change[NSKeyValueChangeNewKey];
         NSLog(@" value %@", value);
        NSValue *valueCast = (NSValue *)value;
        CGPoint point = valueCast.CGPointValue;
        
        NSLog(@" point %@", NSStringFromCGPoint(point));
        
        CGFloat yellowViewX = self.yellowView.center.x;
        CGFloat yellowViewY = self.yellowView.center.y;
        
        yellowViewX += point.x;
        yellowViewY += point.y;
        
        CGPoint newCenter = CGPointMake(yellowViewX, yellowViewY);
        self.yellowView.center = newCenter;
    }
}

@end
