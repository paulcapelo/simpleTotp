

//#import "RNTotplibeSwift.h"

//#import "IOSSimpleTotp.h"
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonHMAC.h>
#import "React/RCTBridgeModule.h"
//#import "RCTBridge.h"

@interface RCT_EXTERN_MODULE(RNTotplibe, NSObject)
//or
//@interface RCT_EXTERN_REMAP_MODULE(YourDesiredModuleNameInJS, YourModule, NSObject)

RCT_EXTERN_METHOD(getTOTP:(NSString *)semilla tiempo:(NSString *)tiempo fecha:(NSString *)fecha )

@end

//@interface RCT_EXTERN_MODULE(RNTotplibe, NSObject)
//RCT_EXPORT_METHOD(getTOTP:(NSString *)semilla tiempo:(NSString *)tiempo fecha:(NSString *)fecha callback:(RCTResponseSenderBlock)callback )
//



//@implementation RNTotplibe
//
//RCT_EXPORT_MODULE()
//
//RCT_EXPORT_METHOD(sampleMethod:(NSString *)stringArgument numberParameter:(nonnull NSNumber *)numberArgument callback:(RCTResponseSenderBlock)callback)
//{
//    // TODO: Implement some actually useful functionality
//    callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@", numberArgument, stringArgument]]);
//}
//
//
////RCT_EXPORT_METHOD(getTOTP:(NSString *)semilla tiempo:(NSString *)tiempo fecha:(NSString *)fecha callback:(RCTResponseSenderBlock)callback )
////{
////    if(semilla==@""|| tiempo==@"" || fecha==@""){
////        callback(@[[NSString stringWithFormat: @"{\"error\": \"Verifique los datos\"}"]]);
////    }else{
////   HOTPAlgorithm * myOb = [HOTPAlgorithm new];
////
////
////   NSString * retString = [myOb getTOTP:semilla tiempo fecha ];
//////    TOTP = hotpAlgo.generateByTimeOTP(semilla:semilla, tiempo: tiempo, fecha: fecha)
//////    callback(@[[NSString stringWithFormat: @"{\"TOTP\": \"%@\"}", TOTP]]);
////    }
////}
//
//
//
//
//@end
//@end
//@end

