#import <Cordova/CDV.h>

@interface FBSharing : CDVPlugin 


- (void)coolMethod:(CDVInvokedUrlCommand*)command;

//fb link share ios
-(void)fbShareIOS:(CDVInvokedUrlCommand*)command;

@end