// #import <React/RCTBridgeModule.h>


// @interface RCT_EXTERN_MODULE(RNTotplibe, NSObject)

// //RCT_EXTERN_METHOD(getTOTP:(NSString*)semilla tiempo:(NSString*)tiempo fecha:(NSString*)fecha resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)


// RCT_EXTERN_METHOD(getMyPromise:(BOOL) value
// resolver:(RCTPromiseResolveBlock)resolve
// rejecter:(RCTPromiseRejectBlock)reject

// @end
//#import "RNTotplibe.swift"
#import <React/RCTBridgeModule.h>
#import <Foundation/Foundation.h>

@interface RCT_EXTERN_MODULE(MyFancyLibrary, NSObject)

RCT_EXTERN_METHOD(printHelloWorld)
RCT_EXTERN_METHOD(getUnreadCount: (RCTResponseSenderBlock)callback)
@end


//#import "RNTotplibe-Swift.h"
////@interface RCT_EXTERN_REMAP_MODULE(RNTotplibe, RNTotplibe, NSObject)
////
////RCT_EXTERN_REMAP_METHOD(getTOTP:(NSString*)semilla tiempo:(NSString*)tiempo fecha:(NSString*)fecha
////                    resolver:(RCTPromiseResolveBlock)resolve
////                    rejecter:(RCTPromiseRejectBlock)reject)
////
//
////RCT_EXTERN_METHOD(getTOTP:(NSString*)semilla tiempo:(NSString*)tiempo fecha:(NSString*)fecha (RCTResponseSenderBlock)callback)

