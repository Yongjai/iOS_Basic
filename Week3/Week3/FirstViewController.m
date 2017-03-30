//
//  FirstViewController.m
//  Week3
//
//  Created by YongJai on 2017. 3. 29..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import "FirstViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIButton *Btn;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.Btn.layer.cornerRadius = 6.0f;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickedBtn:(id)sender {
    [self selectPhoto];
}

//사진을 가져오려면 info.plist에서 설정을 해주어야 한다.... 이거때문에 엄청난 뻘짓을..ㅜㅜ
- (void) selectPhoto {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *selectedImage = info[UIImagePickerControllerOriginalImage];
    self.imageView.image = selectedImage;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
