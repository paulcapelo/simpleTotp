#import <React/RCTBridgeModule.h>


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RCT_EXTERN_MODULE(RNTotplibe, NSObject)

RCT_EXTERN_METHOD(printHelloWorld)
RCT_EXTERN_METHOD(getUnreadCount: (RCTResponseSenderBlock)callback)
@end

//@implementation Device
//
////export the name of the native module as 'Device' since no explicit name is mentioned
//RCT_EXPORT_MODULE();
//
////exports a method getDeviceName to javascript
//RCT_EXPORT_METHOD(getDeviceName:(RCTResponseSenderBlock)callback){
// @try{
//   NSString *deviceName = [[UIDevice currentDevice] name];
//   callback(@[[NSNull null], deviceName]);
// }
// @catch(NSException *exception){
//   callback(@[exception.reason, [NSNull null]]);
// }
//}
//
//@end
