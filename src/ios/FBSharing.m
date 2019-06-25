/********* FBSharing.m Cordova Plugin Implementation *******/

#import "FBSharing.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>

@interface FBSharing ()<FBSDKSharingDelegate>
@end

@implementation FBSharing

- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

//contentUrl, Title, description, imageUrl
-(void)fbShareIOS:(CDVInvokedUrlCommand*)command{
    NSString *imageUrl = [[command arguments] objectAtIndex:0];
    UIImage *shareImg = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]];
    FBSDKSharePhoto *photo = [[FBSDKSharePhoto alloc] init];
    photo.image = shareImg;
    photo.userGenerated = YES;
    FBSDKSharePhotoContent *content = [[FBSDKSharePhotoContent alloc] init];
    content.photos = @[photo];
    [FBSDKShareDialog showFromViewController:self.viewController withContent:content delegate:self];
}

#pragma mark FBSDKSharingDelegate
-(void)sharer:(id<FBSDKSharing>)sharer didCompleteWithResults:(NSDictionary *)results{
    NSLog(@"success");
}

-(void)sharerDidCancel:(id<FBSDKSharing>)sharer{
    NSLog(@"cancel");
}

-(void)sharer:(id<FBSDKSharing>)sharer didFailWithError:(NSError *)error{
    NSLog(@"faile");
}


@end
