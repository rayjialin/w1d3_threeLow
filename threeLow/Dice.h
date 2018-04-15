//
//  Dice.h
//  threeLow
//
//  Created by ruijia lin on 4/11/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

@property NSInteger diceValue;
@property NSMutableString *diceState;

-(NSInteger)roll;
@end
