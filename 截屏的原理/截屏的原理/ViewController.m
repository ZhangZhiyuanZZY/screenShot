//
//  ViewController.m
//  截屏的原理
//
//  Created by 章芝源 on 16/1/6.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//截屏
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIGraphicsBeginImageContext(self.view.bounds.size);
    //获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:ctx];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    NSData *data = UIImagePNGRepresentation(image);
    [data writeToFile:@"/Users/apple/Desktop/xx.png" atomically:YES];
   
}

- (void)cutImage
{
    UIGraphicsBeginImageContext(self.view.frame.size);
    //获得图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //画线
    //    UIBezierPath *bzrPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 200)];
    //    [bzrPath stroke];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 100, 100);
    CGPathAddLineToPoint(path, NULL, 200, 200);
    CGContextAddPath(ctx, path);
    CGContextStrokePath(ctx);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *data = UIImagePNGRepresentation(image);
    [data writeToFile:@"/Users/apple/Desktop/3.png" atomically:YES];
}
@end
