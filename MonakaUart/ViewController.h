//
//  ViewController.h
//  MonakaUart
//
//  Created by kizusuMac on 13/02/26.
//  Copyright (c) 2013年 kizusuMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *statusMessage;

- (IBAction)find:(id)sender;
- (IBAction)forward:(id)sender;
- (IBAction)reversed:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *statusMessage2;

- (IBAction)find2:(id)sender;
- (IBAction)ledOn:(id)sender;
- (IBAction)ledOff:(id)sender;

@end
