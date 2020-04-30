
#import "RNTotplibe.h"
//#import "RNTotplibeSwift.h"

//#import "IOSSimpleTotp.h"
//#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonHMAC.h>
#import "React/RCTBridgeModule.h"






@implementation RNTotplibe

RCT_EXPORT_MODULE()
RCT_EXTERN_METHOD(getTOTP: (RCTResponseSenderBlock)callback)
RCT_EXPORT_METHOD(sampleMethod:(NSString *)stringArgument numberParameter:(nonnull NSNumber *)numberArgument callback:(RCTResponseSenderBlock)callback)
{
    // TODO: Implement some actually useful functionality
    callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@", numberArgument, stringArgument]]);
}


//RCT_EXPORT_METHOD(getTOTP:(NSString *)semilla tiempo:(NSString *)tiempo fecha:(NSString *)fecha callback:(RCTResponseSenderBlock)callback )
//{
//    if(semilla==@""|| tiempo==@"" || fecha==@""){
//        callback(@[[NSString stringWithFormat: @"{\"error\": \"Verifique los datos\"}"]]);
//    }else{
//   HOTPAlgorithm * myOb = [HOTPAlgorithm new];
//
//
//   NSString * retString = [myOb getTOTP:semilla tiempo fecha ];
////    TOTP = hotpAlgo.generateByTimeOTP(semilla:semilla, tiempo: tiempo, fecha: fecha)
////    callback(@[[NSString stringWithFormat: @"{\"TOTP\": \"%@\"}", TOTP]]);
//    }
//}




@end


