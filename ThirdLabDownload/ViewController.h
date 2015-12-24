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

- (IBAction)downloadImage:(id)sender;
@end

