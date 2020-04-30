#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>


@interface RCT_EXTERN_MODULE(RNTotplibe, NSObject)

RCT_EXTERN_METHOD(getTOTP:(NSString*)semilla tiempo:(NSString*)tiempo fecha:(NSString*)fecha (RCTResponseSenderBlock)callback)


@end
