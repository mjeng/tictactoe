 //
//  ViewController.m
//  TicTacToe
//
//  Created by Matthew Jeng on 7/29/15.
//  Copyright (c) 2015 Matthew Jeng. All rights reserved.
//

#import "ViewController.h"


int evenIsX = 0;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _screenRect = [[UIScreen mainScreen] bounds];
    _screenWidth = _screenRect.size.width;
    _screenHeight = _screenRect.size.height;
    /*
    CGFloat squareSideLength = _screenWidth/3-10;
    
    CGRect buttonFrame = self.centerButton.frame;
    buttonFrame.size = CGSizeMake(squareSideLength, squareSideLength);
    
    self.centerButton.frame = buttonFrame;
     */
    
}

- (void)viewDidLayoutSubviews{
    
    CGFloat originx = _screenWidth/2;
    CGFloat originy = _screenHeight/2;
    CGFloat dimensionx = _screenWidth/3.5;
    CGFloat dimensiony = dimensionx;
    
    // adjustment variables
    CGFloat uniformAdjust = 18;
    
    // setup the board
    //[self.gameBoard setBounds:CGRectMake(originx-1.5*dimensionx, originy-1.5*dimensiony, dimensionx*3, dimensiony*3)];
    [self.gameBoard setFrame:CGRectMake(originx-1.5*dimensionx, originy-1.5*dimensiony, dimensionx*3, dimensiony*3)];
    
    // center button
    [self.centerButton setBounds:CGRectMake(originx-0.35*dimensionx, originy-0.35*dimensiony, _screenWidth/3.5-uniformAdjust, _screenWidth/3.5-uniformAdjust)];
    [self.centerButton setFrame:CGRectMake(originx-0.35*dimensionx, originy-0.35*dimensiony, _screenWidth/3.5-uniformAdjust, _screenWidth/3.5-uniformAdjust)];
    
    // all the other buttons
    [self.topLeftButton setBounds:CGRectMake(originx-1.55*dimensionx+uniformAdjust, originy-1.5*dimensiony+uniformAdjust, dimensionx-uniformAdjust, dimensiony-uniformAdjust)];
    [self.topLeftButton setFrame:CGRectMake(originx-1.55*dimensionx+uniformAdjust, originy-1.5*dimensiony+uniformAdjust, dimensionx-uniformAdjust, dimensiony-uniformAdjust)];
    
    [self.topButton setBounds:CGRectMake(originx-0.5*dimensionx+uniformAdjust, originy+dimensiony+uniformAdjust, dimensionx-uniformAdjust, dimensiony-uniformAdjust)];
    [self.topButton setFrame:CGRectMake(originx-0.55*dimensionx+uniformAdjust, originy-1.5*dimensiony+uniformAdjust, dimensionx-uniformAdjust, dimensiony-uniformAdjust)];
    
    [self.topRightButton setBounds:CGRectMake(originx+0.5*dimensionx+uniformAdjust, originy-1.55*dimensiony+uniformAdjust, dimensionx-uniformAdjust, dimensiony-uniformAdjust)];
    [self.topRightButton setFrame:CGRectMake(originx+0.5*dimensionx+uniformAdjust, originy-1.55*dimensiony+uniformAdjust, dimensionx-uniformAdjust, dimensiony-uniformAdjust)];
    
    [self.rightButton setBounds:CGRectMake(originx+0.5*dimensionx+uniformAdjust, originy-0.5*dimensiony+uniformAdjust, dimensionx-uniformAdjust, dimensiony-uniformAdjust)];
    [self.rightButton setFrame:CGRectMake(originx+0.5*dimensionx+uniformAdjust, originy-0.5*dimensiony+uniformAdjust, dimensionx-uniformAdjust, dimensiony-uniformAdjust)];
    
    [self.bottomRightButton setBounds:CGRectMake(originx+0.5*dimensionx+uniformAdjust, originy+0.5*dimensiony+uniformAdjust, dimensionx-uniformAdjust, dimensiony-uniformAdjust)];
    [self.bottomRightButton setFrame:CGRectMake(originx+0.5*dimensionx+uniformAdjust, originy+0.5*dimensiony+uniformAdjust, dimensionx-uniformAdjust, dimensiony-uniformAdjust)];
    
    [self.bottomButton setBounds:CGRectMake(originx-0.5*dimensionx+uniformAdjust, originy+0.5*dimensiony+uniformAdjust, dimensionx-uniformAdjust, dimensiony-uniformAdjust)];
    [self.bottomButton setFrame:CGRectMake(originx-0.5*dimensionx+uniformAdjust, originy+0.5*dimensiony+uniformAdjust, dimensionx-uniformAdjust, dimensiony-uniformAdjust)];
    
    [self.bottomLeftButton setBounds:CGRectMake(originx-1.5*dimensionx+uniformAdjust, originy+0.5*dimensiony+uniformAdjust, dimensionx-uniformAdjust, dimensiony-uniformAdjust)];
    [self.bottomLeftButton setFrame:CGRectMake(originx-1.5*dimensionx+uniformAdjust, originy+0.5*dimensiony+uniformAdjust, dimensionx-uniformAdjust, dimensiony-uniformAdjust)];
    
    [self.leftButton setBounds:CGRectMake(originx-1.5*dimensionx+uniformAdjust, originy-0.5*dimensiony+uniformAdjust, dimensionx-uniformAdjust, dimensiony-uniformAdjust)];
    [self.leftButton setFrame:CGRectMake(originx-1.5*dimensionx+uniformAdjust, originy-0.5*dimensiony+uniformAdjust, dimensionx-uniformAdjust, dimensiony-uniformAdjust)];
    
    // disable all user interaction except for start button
    //[[self.view subviews]makeObjectsPerformSelector:@selector(setUserInteractionEnabled:) withObject:[NSNumber numberWithBool:NO]];
    NSLog(@"test");
    
}

- (void)viewDidAppear:(BOOL)animated{
    for(UIButton *button in self.allButtons){
        button.userInteractionEnabled = NO;
        button.backgroundColor = [UIColor whiteColor];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startGameButton:(UIButton *)sender {
    
    sender.alpha = 0.0;
    for(UIButton *button in self.allButtons){
        button.userInteractionEnabled = YES;
    }
    self.topTextLabel.text = @"It's X's turn";
    
    self.startGameButton.userInteractionEnabled = NO;
    
}

- (IBAction)onClick:(UIButton *)sender {
    
    if(evenIsX%2==0){
        [sender setBackgroundImage:[UIImage imageNamed:@"X"] forState:normal];
        
        if(![self didSomeoneWin]){
            
            [UIView animateWithDuration:0.1 animations:^{
                self.topTextLabel.alpha = 0.0;
            }completion:^(BOOL finished){
                self.topTextLabel.text = @"It's O's turn";
                [UIView animateWithDuration:0.1 animations:^{
                    self.topTextLabel.alpha = 1.0;
                }];
            }];
            
        }
        
    }
    
    if(evenIsX<9){
        if(evenIsX%2==1){
            [sender setBackgroundImage:[UIImage imageNamed:@"O"] forState:normal];
            
            if(![self didSomeoneWin]){
                
                [UIView animateWithDuration:0.1 animations:^{
                    self.topTextLabel.alpha = 0.0;
                }completion:^(BOOL finished){
                    self.topTextLabel.text = @"It's X's turn";
                    [UIView animateWithDuration:0.1 animations:^{
                        self.topTextLabel.alpha = 1.0;
                    }];
                }];
                
            }
            
        }
    }
    else{
        [sender setBackgroundImage:[UIImage imageNamed:@"O"]forState:normal];
    }
    
    
    sender.userInteractionEnabled = NO;
    evenIsX++;
    
    if(![self didSomeoneWin]){
        if(evenIsX==9){
            self.playAgainButton.titleLabel.text = @"Play again";
            [UIView animateWithDuration:0.2 animations:^{
                self.topTextLabel.text = @"It's a draw!";
                self.playAgainButton.alpha = 1.0;
            }];
            
        }
    }
    
}

- (BOOL)didSomeoneWin{
    int index = 0;
    for(UIButton *button in self.topRow){
        if([button.currentBackgroundImage isEqual:[UIImage imageNamed:@"X"]]){
            index++;
        }
        else if([button.currentBackgroundImage isEqual:[UIImage imageNamed:@"O"]]){
            index--;
        }
    }
// layer 1
    if(index==3){[self someoneWon:@"X"];return YES;}
    else if(index==-3){[self someoneWon:@"O"];return YES;}
    else{
        index = 0;
        for(UIButton *button in self.middleRow){
            if([button.currentBackgroundImage isEqual:[UIImage imageNamed:@"X"]]){
                index++;
            }
            else if([button.currentBackgroundImage isEqual:[UIImage imageNamed:@"O"]]){
                index--;
            }
        }
// layer 2
        if(index==3){[self someoneWon:@"X"];return YES;}
        else if(index==-3){[self someoneWon:@"O"];return YES;}
        else{
            index = 0;
            for(UIButton *button in self.bottomRow){
                if([button.currentBackgroundImage isEqual:[UIImage imageNamed:@"X"]]){
                    index++;
                }
                else if([button.currentBackgroundImage isEqual:[UIImage imageNamed:@"O"]]){
                    index--;
                }
            }
// layer 3
            if(index==3){[self someoneWon:@"X"];return YES;}
            else if(index==-3){[self someoneWon:@"O"];return YES;}
            else{
                index = 0;
                for(UIButton *button in self.leftColumn){
                    if([button.currentBackgroundImage isEqual:[UIImage imageNamed:@"X"]]){
                        index++;
                    }
                    else if([button.currentBackgroundImage isEqual:[UIImage imageNamed:@"O"]]){
                        index--;
                    }
                }
// layer 4
                if(index==3){[self someoneWon:@"X"];return YES;}
                else if(index==-3){[self someoneWon:@"O"];return YES;}
                else{
                    index = 0;
                    for(UIButton *button in self.middleColumn){
                        if([button.currentBackgroundImage isEqual:[UIImage imageNamed:@"X"]]){
                            index++;
                        }
                        else if([button.currentBackgroundImage isEqual:[UIImage imageNamed:@"O"]]){
                            index--;
                        }
                    }
// layer 5
                    if(index==3){[self someoneWon:@"X"];return YES;}
                    else if(index==-3){[self someoneWon:@"O"];return YES;}
                    else{
                        index = 0;
                        for(UIButton *button in self.rightColumn){
                            if([button.currentBackgroundImage isEqual:[UIImage imageNamed:@"X"]]){
                                index++;
                            }
                            else if([button.currentBackgroundImage isEqual:[UIImage imageNamed:@"O"]]){
                                index--;
                            }
                        }
// layer 6
                        if(index==3){[self someoneWon:@"X"];return YES;}
                        else if(index==-3){[self someoneWon:@"O"];return YES;}
                        else{
                            index = 0;
                            for(UIButton *button in self.negativeDiagonal){
                                if([button.currentBackgroundImage isEqual:[UIImage imageNamed:@"X"]]){
                                    index++;
                                }
                                else if([button.currentBackgroundImage isEqual:[UIImage imageNamed:@"O"]]){
                                    index--;
                                }
                            }
// layer 7
                            if(index==3){[self someoneWon:@"X"];return YES;}
                            else if(index==-3){[self someoneWon:@"O"];return YES;}
                            else{
                                index = 0;
                                for(UIButton *button in self.positiveDiagonal){
                                    if([button.currentBackgroundImage isEqual:[UIImage imageNamed:@"X"]]){
                                        index++;
                                    }
                                    else if([button.currentBackgroundImage isEqual:[UIImage imageNamed:@"O"]]){
                                        index--;
                                    }
                                }
// final layer
                                if(index == 3){[self someoneWon:@"X"];return YES;}
                                else if(index==-3){[self someoneWon:@"O"];return YES;}
                                else{
                                    return NO;
                                }
                            }
                        }
                    }
                }
            }

        }

    }
}

- (void)someoneWon:(NSString *)winner{
    if([winner isEqualToString:@"X"]){
        self.topTextLabel.text = @"X won!";
    }
    else if([winner isEqualToString:@"O"]){
        self.topTextLabel.text = @"O won!";
    }
    else{
        self.topTextLabel.text = @"error??";
        NSLog(@"something went wrong");
    }
    for(UIButton *button in self.allButtons){
        button.userInteractionEnabled = NO;
    }
    
// play again if someone won
    self.playAgainButton.titleLabel.text = @"Play again";               //???
    [UIView animateWithDuration:0.2 animations:^{
        self.playAgainButton.alpha = 1.0;
    }];

}

@end
