//
//  ViewController.h
//  lab7_1
//
//  Created by Admin on 30.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *canvas;
@property CGPoint lastPoint;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

@end

