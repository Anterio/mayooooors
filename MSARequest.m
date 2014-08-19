//
//  MSARequest.m
//  MayorShips
//
//  Created by Arthur Boia on 8/19/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.
//

#import "MSARequest.h"

#define API @"https://api.foursquare.com/v2/"
#define  CLIENT_ID @"3TV0YE3DNQVZIGR0MBFLF4CCBC2BBMIP4MYJVZCQMWHV3SZD"
#define CLIENT_SECRET @"3RJA3BYE44JUJR1GEAE1BGDPFJZX0H0MAWFROHD0ZQLU3U3R"


////venues/search?ll=40.7,-74&client_id=CLIENT_ID&client_secret=CLIENT_SECRET&v=YYYYMMDD

@implementation MSARequest
+(NSArray *) findMayorshipsWithLocation:(CLLocation *)location
{
    NSArray * venues = [MSARequest findVenuesWithLocation:location];
    
    NSMutableArray * mayors = [@[]mutableCopy];
    
    for (NSDictionary * venue in venues)
    {
        NSString * endpoint = [NSString stringWithFormat:@"venues/%@", venue[@"id"]];
        
        NSDictionary * venueInfo = [MSARequest foursquareRequestWithEndPoint:endpoint andParameters:@{}];
        
        NSDictionary * mayor = venueInfo[@"response"][@"venue"][@"mayor"];
        
        [mayors addObject:mayor];
    }
    
    return mayors;
}

+ (NSArray *) findVenuesWithLocation:(CLLocation *)location
{
    NSDictionary * parameters = @{
                                  @"ll": [NSString stringWithFormat:@"%f,%f", location.coordinate.latitude, location.coordinate.longitude]
                                  };
    return [MSARequest foursquareRequestWithEndPoint:@"venues/search" andParameters:parameters][@"response"][@"venues"];
}


+(NSDictionary *)foursquareRequestWithEndPoint: (NSString *) endpoint andParameters: (NSDictionary *)parameters;
{
    NSLog(@"hello");
    
    NSMutableString * requestString = [[API stringByAppendingString:endpoint] mutableCopy];
    //make v custom to current day
    
    [requestString appendString:[NSString stringWithFormat:@"?client_id=%@&client_secret=%@&v=20140819", CLIENT_ID, CLIENT_SECRET]];
    
    for (NSString * key in [parameters allKeys])
    {
            [requestString appendFormat:@"&%@=%@", key, [parameters objectForKey:key]];
    }
    
    NSLog(@"%@", requestString);
    
    //  NSString * endpointURL = [API stringByAppendingString:endpoint];
    
    NSURL * requestURL = [NSURL URLWithString: requestString];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:requestURL];
    

    NSData * responseData = [NSURLConnection sendSynchronousRequest:request  returningResponse:nil error:nil];
    
    
    NSDictionary * responseInfo = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
    
    //    NSLog (@" response = %@", responseInfo);
    
NSLog (@"%@", responseInfo);
    
    return responseInfo;
}


//+(NSString *) buildFoursquareURLWithPath:(NSString *)path andParams:(NSDictionary *)params
//{
//    __block NSString *url = [@"https://" stringByAppendingString:FoursquareBaseURL];
//    url = [url stringByAppendingString:path];
//    url = [url stringByAppendingFormat:@"?client_id=%@",FoursquareClientID];
//    url = [url stringByAppendingFormat:@"&client_secret=%@", FoursquareClientSecret];
//    url = [url stringByAppendingFormat:@"&v=%@", FoursquareVersion];
//}
@end
