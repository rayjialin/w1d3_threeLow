//
//  GameController.m
//  threeLow
//
//  Created by ruijia lin on 4/11/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "GameController.h"

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        Dice *dice1 = [Dice new];
        Dice *dice2 = [Dice new];
        Dice *dice3 = [Dice new];
        Dice *dice4 = [Dice new];
        Dice *dice5 = [Dice new];
        _diceDict = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                    @"1": dice1,
                                                                    @"2": dice2,
                                                                    @"3": dice3,
                                                                    @"4": dice4,
                                                                    @"5": dice5,
                                                                    }];
    }
    return self;
}
-(void)toggleDiceState{
    BOOL toggleAgain = YES;
    char inputChar[255];
    NSMutableDictionary *diceDict = [NSMutableDictionary new];
    while (toggleAgain) {
        NSLog(@"\nSelect your dice by index to toggle dice status - 'held' or 'unheld'");
        fgets(inputChar, 255, stdin);
        //    NSArray *inputHold = [[[NSString stringWithCString:inputChar encoding: NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n"]] componentsSeparatedByString:@" "];
        NSString *inputHold = [[NSString stringWithCString:inputChar encoding: NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n"]];
        
        for (NSString *key in _diceDict){
            Dice *dice = [Dice new];
            dice = [_diceDict objectForKey:key];
            if ([inputHold containsString:key]){
                if ([dice.diceState isEqualToString:@"unHeld"]){
                    dice.diceState = [NSMutableString stringWithFormat:@"held"];
                }else if ([dice.diceState isEqualToString:@"held"]){
                    dice.diceState = [NSMutableString stringWithFormat:@"unHeld"];
                }
            }
            diceDict[key] = dice;
            NSLog(@"\n'Dice#: %@\tDice Value: %ld' are {%@}", key, dice.diceValue, dice.diceState);
        }
        
        [_diceDict setDictionary:diceDict];
        
        NSLog(@"\nDo you want to put down held dice and hold difference dices?");
        fgets(inputChar, 255, stdin);
        NSString *inputString = [[NSString stringWithCString:inputChar encoding: NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n"]];
        
        if ([inputString isEqualToString:@"no"]){
            toggleAgain = NO;
        }
        
    }
}

-(void)toggleReset{
    NSMutableDictionary *diceDict = [NSMutableDictionary new];
    
    for (NSString *key in _diceDict){
        _dice = [_diceDict objectForKey:key];
        if ([_dice.diceState isEqualToString:@"held"]){
            _dice.diceState = [NSMutableString stringWithFormat:@"unHeld"];
        }
        diceDict[key] = _dice;
    }
    
    [_diceDict setDictionary:diceDict];
}

-(NSInteger)calculateScore{
    NSInteger score = 0;
    for (NSString *key in _diceDict){
        _dice = [_diceDict objectForKey:key];
        if ([_dice.diceState isEqualToString:@"unHeld"]){
            // dont calculate unheld dice
        }else{
            if (_dice.diceValue == 3){
                score += 0;
            }else{
                score += _dice.diceValue;
            }
        }
    }
    
    return score;
}

-(void)rollDice{
    NSMutableDictionary *diceDict = [NSMutableDictionary new];
    
    for (NSString *key in _diceDict){
        _dice = [_diceDict objectForKey:key];
        if ([_dice.diceState isEqualToString:@"held"]){
            _dice.diceValue = [_dice roll];
            _dice.diceState = [NSMutableString stringWithFormat:@"rolled"];
        }
        diceDict[key] = _dice;
    }
    
    [_diceDict setDictionary:diceDict];
}
@end
