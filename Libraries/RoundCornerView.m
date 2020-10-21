//
//  RoundCornerView.m
//  MYO
//
//  Created by Carlos Fuentes on 04/04/16.
//  Copyright © 2016 Carlos Fuentes. All rights reserved.
//

#import "RoundCornerView.h"

@implementation RoundCornerView

-(void) layoutSubviews
{
    CALayer *innerView = [CALayer layer];
    innerView.frame = CGRectMake(0,0,self.bounds.size.width,self.bounds.size.height);
    innerView.cornerRadius = 3.0f;
    innerView.masksToBounds = YES;
    innerView.backgroundColor = [[UIColor whiteColor] CGColor];
    [self.layer insertSublayer:innerView atIndex:0];
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOpacity = 0.1f;
    self.layer.shadowRadius = 0.3f;
    self.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    self.backgroundColor = [UIColor clearColor];
}

@end
