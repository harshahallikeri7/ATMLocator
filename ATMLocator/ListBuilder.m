//
//  ListBuilder.m
//  ATMLocator
//
//  Created by Harsha Hallikeri on 8/4/15.
//  Copyright (c) 2015 Harsha Hallikeri. All rights reserved.
//

#import "ListBuilder.h"
#import "List.h"

@implementation ListBuilder
+ (NSArray *)listsFromJSON:(NSData *)objectNotation error:(NSError **)error
{
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    NSMutableArray *lists = [[NSMutableArray alloc] init];
    
    NSArray *results = [parsedObject valueForKey:@"locations"];
    NSLog(@"Count %lu", (unsigned long)results.count);
    
    for (NSDictionary *listDic in results) {
        List *list = [[List alloc] init];
        
        for (NSString *key in listDic) {
            if ([list respondsToSelector:NSSelectorFromString(key)]) {
                [list setValue:[listDic valueForKey:key] forKey:key];
            }
        }
        
        [lists addObject:list];
    }
    
    return lists;
}
@end