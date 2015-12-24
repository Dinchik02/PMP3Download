//
//  ViewController.h
//  ThirdLabDownload
//
//  Created by Diana Volodchenko on 12/24/15.
//  Copyright © 2015 Diana Volodchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDataDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *downloadButton;

@property (weak, nonatomic) IBOutlet UIProgressView *downloadProgress;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *downloadActivityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *downloadPercentage;

@property (weak, nonatomic) IBOutlet UITextField *imageUrlInput;

- (IBAction)downloadImage:(id)sender;
@end

