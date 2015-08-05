//
//  ATMManagerDelegate.h
//  ATMLocator
//
//  Created by Harsha Hallikeri on 8/4/15.
//  Copyright (c) 2015 Harsha Hallikeri. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ATMManagerDelegate
- (void)didReceiveLists:(NSArray *)lists;
- (void)fetchingListsFailedWithError:(NSError *)error;
@end
