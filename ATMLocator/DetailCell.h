//
//  DetailCell.h
//  ATMLocator
//
//  Created by Harsha Hallikeri on 8/4/15.
//  Copyright (c) 2015 Harsha Hallikeri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@end
