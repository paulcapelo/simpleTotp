#import <React/RCTBridgeModule.h>
#import <CommonCrypto/CommonHMAC.h>

@interface RCT_EXTERN_MODULE(RNTotplibe, NSObject)
RCT_EXTERN_METHOD(getTOTP:(NSString *)semilla tiempo:(NSString *)tiempo fecha:(NSString *)fecha resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject );
// RCT_EXTERN_METHOD(getTOTP);
@end
