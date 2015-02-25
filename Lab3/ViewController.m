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
    
    [self setQuote:[self.quoteChain quoteAtIndex:0] ];
    
    [self testQuoteChain];
}

-(void) testQuoteChain{

    NSDictionary* savior = [self.quoteChain quoteAtIndex:5];
    NSLog( [NSString stringWithFormat:@"Initial size: %d",[self.quoteChain numberOfQuotes]]);
    NSLog([savior valueForKey:@"quote"]);
    NSLog([savior valueForKey:@"author"]);
 
    [self.quoteChain removeQuoteAtIndex:5];
    NSLog( [NSString stringWithFormat:@"Size after Remove: %d",[self.quoteChain numberOfQuotes]]);
    
    [self.quoteChain insertQuote:@"Test Quote 2" author:@"Please Ignore Again" atIndex:5];
    NSDictionary* wavior = [self.quoteChain quoteAtIndex:5];
    NSLog( [NSString stringWithFormat:@"Size after insert: %d",[self.quoteChain numberOfQuotes]]);
    NSLog([wavior valueForKey:@"quote"]);
    NSLog([wavior valueForKey:@"author"]);
    
    [self.quoteChain removeQuoteAtIndex:5];
    NSLog( [NSString stringWithFormat:@"Size after Remove: %d",[self.quoteChain numberOfQuotes]]);
    
    [self.quoteChain insertQuote:savior atIndex:5];
    NSLog( [NSString stringWithFormat:@"Size after last insert: %d",[self.quoteChain numberOfQuotes]]);
    wavior = [self.quoteChain quoteAtIndex:5];
    NSLog([wavior valueForKey:@"quote"]);
    NSLog([wavior valueForKey:@"author"]);
    /*
    //
    
    [self.quoteChain insertQuote:@"Test Quote" author:@"Please Ignore" atIndex:5];
    poser = [self.quoteChain quoteAtIndex:5];
    NSLog([poser valueForKey:@"quote"]);
    NSLog(@"adasdsds");
    
    */
}

- (void)singleTap{
    NSLog(@"Single Tap");
    
    [self showQuote:[self.quoteChain randomQuote]];
}

-(void)setQuote:(NSDictionary*) quote{
    self.quoteSpace.text = [quote valueForKey:@"quote"];
    self.authorSpace.text = [NSString stringWithFormat:@"%@%@",@"~",[quote valueForKey:@"author"]];
    self.quoteSpace.textColor = [UIColor blackColor];
    self.quoteSpace.alpha = 1;
}
- (void)showQuote:(NSDictionary*) quote{
    
    
    [UIView animateWithDuration:1.0 animations:^{
        self.quoteSpace.alpha = 0;
    } completion:^(BOOL finished) {
        
        self.quoteSpace.text = [quote valueForKey:@"quote"];
        self.authorSpace.text = [NSString stringWithFormat:@"%@%@",@"~",[quote valueForKey:@"author"]];
        self.quoteSpace.textColor = (self.quoteSpace.textColor == [UIColor blackColor])?[UIColor whiteColor] : [UIColor blackColor] ;
        [UIView animateWithDuration:1.5 animations:^{
            self.quoteSpace.alpha = 1;
        } completion:^(BOOL finished) {
           
        }];
    }];
    
    
   /* [UIView animateWithDuration:1.0 animations:^{
        self.quoteSpace.alpha = 1;
    } completion:^(BOOL finished) {
        NSLog(@"animated");
    }];*/
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
