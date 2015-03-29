//
//  Hangman.h
//  Hangman
//
//  Created by Neil Argade on 3/20/15.
//  Copyright (c) 2015 Neil Argade. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hangman : NSObject

@property (nonatomic, retain) NSString * correctWord;
@property (nonatomic, retain) NSString * displayedWord;
@property (nonatomic, retain) NSMutableArray * wrongLetters;
@property (nonatomic) BOOL win;
@property (nonatomic) BOOL lose;



- (void) chooseWord;

- (NSString *) setUpWord;

- (NSString *) checkLetter: (NSString *) guessedLetter;

- (NSString *) arrayToString: (NSMutableArray*) array;

- (void) checkState;



@end
