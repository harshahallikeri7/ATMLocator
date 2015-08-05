//
//  ListBuilder.h
//  ATMLocator
//
//  Created by Harsha Hallikeri on 8/4/15.
//  Copyright (c) 2015 Harsha Hallikeri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListBuilder : NSObject

+ (NSArray *)listsFromJSON:(NSData *)objectNotation error:(NSError **)error;

@end