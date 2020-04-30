//
//#import "RNTotplibe.h"
//
//@implementation RNTotplibe
//
//- (dispatch_queue_t)methodQueue
//{
//    return dispatch_get_main_queue();
//}
//RCT_EXPORT_MODULE()
//
//@end
//



#import "RNTotplibe.h"
//#import "IOSSimpleTotp.h"
//#import <Foundation/Foundation.h>

@implementation RNTotplibe
//
//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        self.totp = [[IOSSimpleTotp alloc] init];
//    }
//    return self;
//}

//+ (BOOL)requiresMainQueueSetup
//{
//  return YES;  // only do this if your module initialization relies on calling UIKit!
//}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

//RCT_REMAP_METHOD(getTOTP:(NSString *)semilla tiempo: (NSString*)tiempo fecha: (NSString*)fecha,
//                 findEventsWithResolver:(RCTPromiseResolveBlock)resolve
//                 rejecter:(RCTPromiseRejectBlock)reject){
//    let semi=semilla
//    if (semi == "semilla") {
//        resolve(@"esta bien");
//     } else {
//         NSError *error = nil;
//       reject(@"no_events", @"There were no events",error);
//     }
//}

RCT_REMAP_METHOD(getTOTP, resolver: (RCTPromiseResolveBlock)resolve
     rejecter:(RCTPromiseRejectBlock)reject)
{
  if( true ) {
    NSString *thingToReturn = @"ALL OK";
    resolve(thingToReturn);
  } else {
        NSError *error = nil;
      reject([NSError errorWithDomain:@"com.companyname.app" code:0 userInfo:@{ @"text": @"something happend" }],@"",error);
  }
}

@end


