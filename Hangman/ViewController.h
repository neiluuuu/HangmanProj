//
//  ViewController.h
//  Hangman
//
//  Created by Neil Argade on 3/20/15.
//  Copyright (c) 2015 Neil Argade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hangman.h"

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic, retain) Hangman* game;
@property (weak, nonatomic) IBOutlet UILabel *hangmanString;
@property (weak, nonatomic) IBOutlet UIImageView *hangmanImage;
@property (weak, nonatomic) IBOutlet UILabel *wrongLetters;
@property (weak, nonatomic) IBOutlet UITextField *textField;


- (void) setUp;

- (void) whatImage;

- (void) setWrongLettersString;

- (IBAction)createGame:(id)sender;






@end

