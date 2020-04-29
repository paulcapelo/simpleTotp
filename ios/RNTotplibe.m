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
#import <Foundation/Foundation.h>

@implementation RNTotplibe
//
//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        self.totp = [[IOSSimpleTotp alloc] init];
//    }
//    return self;
//}

+ (BOOL)requiresMainQueueSetup
{
  return YES;  // only do this if your module initialization relies on calling UIKit!
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(getTOTP:(NSString *)semilla tiempo:(NSString*)tiempo fecha:(NSString*)fecha findEventsWithResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    if ([semilla isEqual:@"semilla"]) {
        resolve(@"esta bien");
     } else {
         NSError *error = ...
       reject(@"no_events", @"There were no events",error);
     }
}

@end


