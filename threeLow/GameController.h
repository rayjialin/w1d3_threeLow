//
//  GameController.h
//  threeLow
//
//  Created by ruijia lin on 4/11/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

@interface GameController : NSObject
@property Dice *dice;
@property NSMutableDictionary *diceDict;
-(void)toggleDiceState;
-(void)toggleReset;
-(NSInteger)calculateScore;
-(void)rollDice;
@end
