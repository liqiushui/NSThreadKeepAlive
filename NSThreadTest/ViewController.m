//
//  ViewController.m
//  NSThreadTest
//
//  Created by qqvipfunction on 17/3/21.
//  Copyright © 2017年 SZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSThread *thread = [[NSThread alloc] initWithTarget:self
                                               selector:@selector(threadRun:)
                                                 object:nil];
    [thread setName:@"TestThread"];
    
    [thread start];
}


- (void)threadRun:(NSThread *)thread
{
    NSLog(@"Thread run");
    
    /*
     
    //占用100%的CPU
    while (TRUE) {
        
    }
     */
    
    
    
     //占用0%的CPU
    [NSTimer scheduledTimerWithTimeInterval:[[NSDate distantFuture] timeIntervalSinceNow]
                                     target:self
                                   selector:@selector(ignore:)
                                   userInfo:nil
                                    repeats:YES];
    
    NSThread *currentThread = [NSThread currentThread];
    NSRunLoop *currentRunLoop = [NSRunLoop currentRunLoop];
    
    BOOL isCancelled = [currentThread isCancelled];
    
    NSLog(@"hello 1");
    while (!isCancelled && [currentRunLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]])
    {
        NSLog(@"hello 2");
        isCancelled = [currentThread isCancelled];
    }
    NSLog(@"hello 3");

    
    
    /*
    //占用0%的CPU
    BOOL shouldKeepRunning = YES;        // global
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode]; // adding some input source, that is required for runLoop to runing
    while (shouldKeepRunning && [runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]]); // starting infinite loop which can be stopped by changing the shouldKeepRunning's value
    */
    
    /*
    //占用0%的CPU
    @autoreleasepool {
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop addPort:[NSMachPort port] forMode:NSRunLoopCommonModes];
        [runLoop run];
    }
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
