//
//  ViewController.m
//  Lab3
//
//  Created by Nicky on 2/23/15.
//  Copyright (c) 2015 Nicky Gaungorena. All rights reserved.
//

#import "ViewController.h"
#import "QuoteChain.h"

@interface ViewController ()

@property (strong,atomic) QuoteChain* quoteChain;
@property (weak, nonatomic) IBOutlet UILabel *quoteSpace;
@property (weak, nonatomic) IBOutlet UILabel *authorSpace;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _quoteChain = [[QuoteChain alloc] init];
    
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap)];
    
    UISwipeGestureRecognizer* swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftDetected)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer* swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRightDetected)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:singleTap];
    [self.view addGestureRecognizer:swipeLeft];
    [self.view addGestureRecognizer:swipeRight];
    
    [self showQuote:[self.quoteChain quoteAtIndex:0] ];
}
- (void)singleTap{
    NSLog(@"Single Tap");
    
    [self showQuote:[self.quoteChain randomQuote]];
}

- (void)showQuote:(NSDictionary*) quote{
    self.quoteSpace.text = [quote valueForKey:@"quote"];
    self.authorSpace.text = [quote valueForKey:@"author"];
}
- (void)swipeLeftDetected{
    NSLog(@"Swipe Left");
    
    [self showQuote:[self.quoteChain prevQuote]];
}
- (void) swipeRightDetected{
    NSLog(@"Swipe Right");
    [self showQuote:[self.quoteChain nextQuote]];
}
-(BOOL) canBecomeFirstResponder{
    return YES;
}
-(void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if(motion == UIEventSubtypeMotionShake){
        [self showQuote:[self.quoteChain randomQuote]];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
