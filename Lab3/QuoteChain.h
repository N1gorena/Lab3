//
//  QuoteChain.h
//  Lab3
//
//  Created by Nicky on 2/23/15.
//  Copyright (c) 2015 Nicky Gaungorena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuoteChain : NSObject
-(instancetype)init;
- (NSDictionary *) randomQuote;
- (NSUInteger) numberOfQuotes;
- (NSDictionary *) quoteAtIndex: (NSUInteger) index;
- (void) removeQuoteAtIndex: (NSUInteger) index;
- (void) insertQuote: (NSString *) quote
              author: (NSString *) author
             atIndex: (NSUInteger) index;
- (void) insertQuote: (NSDictionary *) quote
             atIndex: (NSUInteger) index;
- (NSDictionary *) nextQuote;
- (NSDictionary *) prevQuote;
@end
