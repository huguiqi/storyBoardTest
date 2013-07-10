//
//  Item3ViewController.m
//  storyboardTest
//
//  Created by 胡 桂祁 on 5/2/13.
//  Copyright (c) 2013 huguiqi. All rights reserved.
//

#import "Item3ViewController.h"

@interface Item3ViewController ()

@end

@implementation Item3ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if ([self isCameraAvailable] &&
        [self doesCameraSupportTakingPhotos]){
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        controller.sourceType = UIImagePickerControllerSourceTypeCamera;
        NSString *requiredMediaType = (__bridge NSString *)kUTTypeImage; controller.mediaTypes = [[NSArray alloc]
                                                                                                  initWithObjects:requiredMediaType, nil];
        controller.allowsEditing = YES; controller.delegate = self;
        [self.navigationController presentViewController:controller animated:YES completion:^(void){
                
        }];

    } else {
        NSLog(@"Camera is not available.");
    }
}

-(IBAction)testCameraPhoto:(id)sender
{
    //检测是否有摄象头功能
    NSLog(@"isCameraAvailable:%@",[self isCameraAvailable]==YES?@"true":@"false");
    //检测图片库是否可用
    NSLog(@"isPhotoLibrayAvailable:%@",[self isPhotoLibrayAvailable]==YES?@"true":@"false");
    //检测前置摄象头
    NSLog(@"isFrontCameraAvailable:%@",[self isFrontCameraAvailable]==YES?@"true":@"false");
    //检测后置摄象头
    NSLog(@"isRearCameraAvailable:%@",[self isRearCameraAvailable]==YES?@"true":@"false");
}

- (BOOL) isCameraAvailable
{
    return [UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera];
}

-(BOOL) isFrontCameraAvailable
{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

-(BOOL) isRearCameraAvailable
{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

- (BOOL) isPhotoLibrayAvailable{
    return [UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary];
}


- (BOOL) doesCameraSupportTakingPhotos{
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    __block BOOL result = NO;
    if ([paramMediaType length] == 0)
    {
        NSLog(@"Media type is empty.");
        return NO;
    }
    NSArray *availableMediaTypes =
    [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock:
                                                    ^(id obj, NSUInteger idx, BOOL *stop) {
                                                                                     NSString *mediaType = (NSString *)obj;
                                                                                     if ([mediaType isEqualToString:paramMediaType]){
                                                                                         result = YES;
                                                                                         *stop= YES; }
                                                                                 }];
    return result;
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    NSLog(@"Picker returned successfully.");
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(__bridge NSString *)kUTTypeMovie])
    {
        NSURL *urlOfVideo =(NSURL *) [info objectForKey:UIImagePickerControllerMediaURL];
        NSLog(@"Video URL = %@", urlOfVideo);
    }else if ([mediaType isEqualToString:(__bridge NSString *)kUTTypeImage]){
        /* Let's get the metadata. This is only for images. Not videos */
        NSDictionary *metadata = [info objectForKey:
                                  UIImagePickerControllerMediaMetadata];
        UIImage *theImage = [info objectForKey:
                             UIImagePickerControllerOriginalImage];
        NSLog(@"Image Metadata = %@", metadata);
        NSLog(@"Image = %@", theImage);
}
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    
}

    
@end
