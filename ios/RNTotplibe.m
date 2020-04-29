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

@interface RNTotplibe()

//@property (nonatomic, retain) IOSSimpleTotp *totp;
//
//@end


@end
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
    return YES;
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(getTOTP:(NSString *)semilla tiempo:(NSString*)tiempo fecha:(NSString*)fecha findEventsWithResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    if (semilla==@"semilla") {
        resolve(@"esta bien");
     } else {
         NSString *error = @"No bien ";
       reject(@"no_events", @"There were no events", error);
     }
}

@end


