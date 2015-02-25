//
//  QuoteChain.m
//  Lab3
//
//  Created by Nicky on 2/23/15.
//  Copyright (c) 2015 Nicky Gaungorena. All rights reserved.
//

#import "QuoteChain.h"
@interface QuoteChain()

@property (strong, atomic) NSMutableArray* QuoteChain;
@property NSUInteger lookingAtIndex;


@end

@implementation QuoteChain

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSDictionary* quote1 = @{
                                @"quote": @"The inner machinations of my mind are an enigma.",
                                @"author":@"Patrick Star"
                                 };
        NSDictionary* quote2 = @{
                                 @"quote":@"I'm like, over love. Crush, smush. I can't. I'm giving up on love at this point. I'm hoping for a crush. Actually, no. I don't want a crush. I want someone to crush on me.",
                                 @"author":@"Xosha Roquemore"
                                 };
        NSDictionary* quote3 = @{
                                 @"quote":@"Think left and think right and think low and think high. Oh, the thinks you can think up if only you try!",
                                 @"author":@"Dr. Seuss"
                                 };
        NSDictionary* quote4 = @{
                                 @"quote":@"I like refried beans. That's why I wanna try fried beans, because maybe they're just as good and we're just wasting time. You don't have to fry them again after all.",
                                 @"author":@"Mitch Hedberg"
                                 };
        NSDictionary* quote5 = @{
                                 @"quote":@"Learning without thought is labor lost; thought without learning is perilous.",
                                 @"author":@"Confucius"
                                 };
        NSDictionary* quoteTest = @{
                                 @"quote":@"Test Quote 1",
                                 @"author":@"Please Ignore"
                                 };
        _QuoteChain = [[NSMutableArray alloc] initWithObjects:quote1,quote2,quote3,quote4,quote5, quoteTest,nil];
        self.lookingAtIndex = 0;
    }
    return self;
    

    
}

- (NSDictionary *) randomQuote{
    self.lookingAtIndex = random()%self.QuoteChain.count;
    return [self.QuoteChain objectAtIndex:self.lookingAtIndex];
}
- (NSUInteger) numberOfQuotes{
    return self.QuoteChain.count;
}
- (NSDictionary *) quoteAtIndex: (NSUInteger) index{
    if ( index < self.QuoteChain.count) {
        return [self.QuoteChain objectAtIndex:index];
    }
    else{
        return nil;
    }
}
- (void) removeQuoteAtIndex: (NSUInteger) index{
    if ( index < self.QuoteChain.count) {
        [self.QuoteChain removeObjectAtIndex:index];
    }
}
- (void) insertQuote: (NSString *) quote author: (NSString *) author atIndex: (NSUInteger) index{
    NSDictionary* newQuote = @{
                               @"quote":quote,
                               @"author":author
                               };
    if(index <= self.QuoteChain.count)
        [self.QuoteChain insertObject:newQuote atIndex:index];
}

- (void) insertQuote: (NSDictionary *) quote
             atIndex: (NSUInteger) index{
    if(index <= self.QuoteChain.count)
        [self.QuoteChain insertObject:quote atIndex:index];
}
- (NSDictionary *) nextQuote{
    if (self.lookingAtIndex >= self.QuoteChain.count - 2) {
        self.lookingAtIndex = 0;
    }
    else{
        self.lookingAtIndex++;
    }
    return [self quoteAtIndex:self.lookingAtIndex];
}
- (NSDictionary *) prevQuote{
    if (self.lookingAtIndex <= 0) {
        self.lookingAtIndex = self.QuoteChain.count-2;
    }
    else{
        self.lookingAtIndex--;
    }
    return [self quoteAtIndex:self.lookingAtIndex];
}


@end
