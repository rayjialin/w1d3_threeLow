//
//  Dice.m
//  threeLow
//
//  Created by ruijia lin on 4/11/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (instancetype)init
{
    self = [super init];
    if (self) {
        _diceValue = arc4random_uniform(6) + 1;
        _diceState = [NSMutableString stringWithFormat:@"unHeld"];
    }
    return self;
}

-(NSInteger)roll{
    return arc4random_uniform(6) + 1;
}
@end
