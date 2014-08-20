//
//  MSARequest.h
//  MayorShips
//
//  Created by Arthur Boia on 8/19/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface MSARequest : NSObject

+ (void) findMayorshipsWithLocation:(CLLocation *) location completion: (void(^)(NSArray * mayors))completion;
//+ (NSArray *) findVenuesWithLocation: (CLLocation *) location;
+(void)findVenuesWithLocation: (CLLocation *)location completion:(void(^)(NSArray * venues))completion;


@end
