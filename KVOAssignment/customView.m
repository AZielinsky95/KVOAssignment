//
//  customView.m
//  KVOAssignment
//
//  Created by Alejandro Zielinsky on 2018-04-22.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "customView.h"

@implementation customView

- (IBAction)panning:(id)sender
{
    CGPoint point = [sender translationInView:self];

    self.point = CGPointMake(point.x * 0.1, point.y * 0.1);;
}

@end
