//
//  List.h
//  ATMLocator
//
//  Created by Harsha Hallikeri on 8/4/15.
//  Copyright (c) 2015 Harsha Hallikeri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface List : NSObject
@property (strong, nonatomic) NSString *state;
@property (strong, nonatomic) NSString *locType;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *zip;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *bank;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSNumber *atms;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *lobbyHrs;
@property (strong, nonatomic) NSNumber *distance;
@end
