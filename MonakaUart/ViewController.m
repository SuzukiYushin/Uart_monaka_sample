//
//  ViewController.m
//  MonakaUart
//
//  Created by kizusuMac on 13/02/26.
//  Copyright (c) 2013年 kizusuMac. All rights reserved.
//

#import "ViewController.h"
#import "Konashi.h"
#import "Konashi2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [Konashi initialize];
    
    [Konashi addObserver:self selector:@selector(connected) name:KONASHI_EVENT_CONNECTED];
    [Konashi addObserver:self selector:@selector(ready) name:KONASHI_EVENT_READY];
    [Konashi addObserver:self selector:@selector(recvUartRx) name:KONASHI_EVENT_UART_RX_COMPLETE];
    
    [Konashi2 initialize];
    
    [Konashi2 addObserver:self selector:@selector(connected2) name:KONASHI_EVENT_CONNECTED];
    [Konashi2 addObserver:self selector:@selector(ready2) name:KONASHI_EVENT_READY];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) connected
{
    NSLog(@"CONNECTED");
}

- (void) connected2
{
    NSLog(@"CONNECTED");
}

- (void) ready
{
    NSLog(@"READY");
    
    self.statusMessage.hidden = FALSE;
    
    [Konashi uartBaudrate:KONASHI_UART_RATE_9K6];
    [Konashi uartMode:KONASHI_UART_ENABLE];
}

- (void) ready2
{
    NSLog(@"READY");
    
    self.statusMessage2.hidden = FALSE;
    
    [Konashi2 pinModeAll:0xFF];
}

- (void) recvUartRx
{
    NSLog(@"UartRx %d", [Konashi uartRead]);
    NSLog(@"UartRx %d", [Konashi2 uartRead]);
}

- (IBAction)find:(id)sender {
    [Konashi find];
}

- (IBAction)find2:(id)sender {
    [Konashi2 find];
}

- (IBAction)forward:(id)sender {
    [Konashi uartWrite:'n'];
    NSLog(@"n");
}

- (IBAction)reversed:(id)sender {
    [Konashi uartWrite:'f'];
    NSLog(@"f");
}

- (IBAction)ledOn:(id)sender {
    [Konashi2 digitalWrite:LED5 value:HIGH];
    NSLog(@"LED5 HIGH");
}

- (IBAction)ledOff:(id)sender {
    [Konashi2 digitalWrite:LED5 value:LOW];
    NSLog(@"LED5 LOW");
}
@end