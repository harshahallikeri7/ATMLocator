//
//  ATMCommunicator.h
//  ATMLocator
//
//  Created by Harsha Hallikeri on 8/4/15.
//  Copyright (c) 2015 Harsha Hallikeri. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>

@protocol ATMCommunicatorDelegate;

@interface ATMCommunicator : NSObject
@property (weak, nonatomic) id<ATMCommunicatorDelegate> delegate;

- (void)searchListsAtCoordinate:(CLLocationCoordinate2D)coordinate;
@end