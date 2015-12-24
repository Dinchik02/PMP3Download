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
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)downloadImage:(id)sender
{
    NSString *urlString	= @"https://c1.staticflickr.com/5/4112/5170590074_714d36db83_b.jpg";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    _connection = [NSURLConnection connectionWithRequest:request delegate:self];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _data = [NSMutableData data];
    _response = response.expectedContentLength;
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_data appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    UIImage *image = [UIImage imageWithData:_data];
    self.imageView.image = image;
    _data = nil;
    _connection = nil;
}

@end
