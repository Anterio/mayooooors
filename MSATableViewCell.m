////
////  MSATableViewCell.m
////  MayorShips
////
////  Created by Arthur Boia on 8/19/14.
////  Copyright (c) 2014 Arthur Boia. All rights reserved.
////
//
//#import "MSATableViewCell.h"
//#import "MSAFirstViewController.h"
//#import <CoreLocation/CoreLocation.h>
//#import "MSARequest.h"
//
//@implementation MSATableViewCell
//{
//    UILabel* mayorName;
//    
//    UIImageView* mayorImage;
//}
//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        
//        mayorName = [[UILabel alloc] initWithFrame:(CGRectMake(115, 5, 200, 40))];
//        [self addSubview: mayorName];
//        mayorImage = [[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, 100, 100))];
//        [self addSubview: mayorImage];
//    }
//    return self;
//}
//
//- (void)awakeFromNib
//{
//    // Initialization code
//}
//-(void)setMayorInfo:(NSDictionary *)mayorInfo
//{
//   //_ma NSDictionary * mayor = mayorships[indexPath.row];
//    _mayorInfo = mayorInfo;
//    //cell.textLabel.text = mayor[@"user"][@"firstName"];
//    self.backgroundColor = [UIColor lightGrayColor];
//    //cell.alignmentRectInsets
////    NSDictionary * venueInfo = [MSARequest foursquareRequestWithEndPoint:endpoint andParameters:@{}];
//    NSDictionary * mayor = venueInfo[@"response"][@"venue"][@"mayor"];
//    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"https://irs2.4sqi.net/img/user/100x100%@", mayor[@"user"][@"photo"][@"suffix"]]];
//    NSData * data = [NSData dataWithContentsOfURL:url];
//    
//    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(200, 2, 45, 45)];
//    button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithData:data]];
//    [self addSubview:button];
//    
//    mayorName.text = mayor[@"user"][@"firstName"];
//    mayorName.textColor = [UIColor blackColor];
//    mayorName.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight"  size:20];
//    
//    
//    mayorImage.image = mayor[@"photo"];
//
//}
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}
//
//@end
