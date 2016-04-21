//
//  UIControl+SMRotaryWheel.m
//  dStress
//
//  Created by Darcy Meyer on 4/4/16.
//  Copyright © 2016 Darcy Meyer. All rights reserved.
//

#import "SMRotaryWheel.h"
#import <QuartzCore/QuartzCore.h>

@interface SMRotaryWheel()
- (void)drawWheel;
@end

@implementation SMRotaryWheel : UIControl

@synthesize delegate, container, numberOfSections;

- (id) initWithFrame:(CGRect)frame andDelegate:(id)del withSections:(int)sectionsNumber {
    // 1 - Call super init
    if ((self = [super initWithFrame:frame])) {
        // 2 - Set properties
        self.numberOfSections = sectionsNumber;
        self.delegate = del;
        // 3 - Draw wheel
        [self drawWheel];
    }
    return self;
}

- (void) drawWheel {
    // 1
    container = [[UIView alloc] initWithFrame:self.frame];
    // 2
    CGFloat angleSize = 2*M_PI/numberOfSections;
    // 3
    for (int i = 0; i < numberOfSections; i++) {
        // 4
        UILabel *im = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        im.backgroundColor = [UIColor redColor];
        im.text = [NSString stringWithFormat:@"%i", i];
        im.layer.anchorPoint = CGPointMake(1.0f, 0.5f);
        // 5
        im.layer.position = CGPointMake(container.bounds.size.width/2.0,
                                        container.bounds.size.height/2.0);
        im.transform = CGAffineTransformMakeRotation(angleSize * i);
        im.tag = i;
        // 6
        [container addSubview:im];
    }
    // 7
    container.userInteractionEnabled = NO;
    [self addSubview:container];
}

@end