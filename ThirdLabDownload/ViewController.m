//
//  ViewController.m
//  ThirdLabDownload
//
//  Created by Diana Volodchenko on 12/24/15.
//  Copyright © 2015 Diana Volodchenko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSURLConnection *_connection;
    NSMutableData *_data;
    NSInteger _response;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.imageUrlInput.placeholder = @"Enter image URL";
    self.downloadActivityIndicator.hidden = YES;
    self.downloadProgress.hidden = YES;
    self.downloadPercentage.hidden = YES;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)disableDownloadButton {
    //Disable  button
    self.downloadButton.enabled = NO;
}

-(IBAction)enableDownloadButton {
    //Enable  button
    self.downloadButton.enabled = YES;
}

- (IBAction)downloadImage:(id)sender
{
    NSString *urlString	= self.imageUrlInput.text;
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    _connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [self disableDownloadButton];
    self.downloadActivityIndicator.hidden = NO;
    self.downloadProgress.hidden = NO;
    self.downloadPercentage.hidden = NO;
    self.downloadProgress.progress = 0.0;

    [self.downloadActivityIndicator startAnimating];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.imageUrlInput.text = nil;
    _data = [NSMutableData data];
    _response = response.expectedContentLength;
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_data appendData:data];
    
    NSNumber *innerProgress = [NSNumber numberWithFloat:((float)_data.length/(float)_response)];
    
    //Download progress, progressbar
    self.downloadProgress.progress = innerProgress.floatValue;
    self.downloadPercentage.text = [NSString stringWithFormat:@"%3.0f",self.downloadProgress.progress*100.0f];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    UIImage *image = [UIImage imageWithData:_data];
    self.imageView.image = image;
    _data = nil;
    _connection = nil;
    [self enableDownloadButton];
    self.downloadActivityIndicator.hidden = YES;
    self.downloadProgress.hidden = YES;
    self.downloadPercentage.hidden = YES;
}

@end
