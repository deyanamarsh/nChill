//
//  UIControl+SMRotaryWheel.h
//  dStress
//
//  Created by Darcy Meyer on 4/4/16.
//  Copyright © 2016 Darcy Meyer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMRotaryProtocol.h"

@interface UIControl (SMRotaryWheel)

    @property (weak) id <SMRotaryProtocol> delegate;
    @property (nonatomic, strong) UIView * container;
    @property int numberOfSections;

- (id) initWithFrame:(CGRect)frame andDelegate:(id)del withSections:(int)sectionsNumber;

@end
