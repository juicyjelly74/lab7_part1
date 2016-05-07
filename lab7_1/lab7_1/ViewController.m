//
//  ViewController.m
//  lab7_1
//
//  Created by Admin on 30.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UISlider *redSlider;
@property (strong, nonatomic) IBOutlet UISlider *greenSlider;
@property (strong, nonatomic) IBOutlet UISlider *blueSlider;
@property (strong, nonatomic) IBOutlet UISlider *brushSlider;
@property (strong, nonatomic) IBOutlet UISlider *widthSlider;

@end

@implementation ViewController
@synthesize widthSlider;
@synthesize brushSlider;
@synthesize redSlider;
@synthesize greenSlider;
@synthesize blueSlider;

- (IBAction)clearView:(id)sender {
    _canvas.image = nil;
}
- (IBAction)saveImage:(id)sender {
    NSString  *jpgPath = @"/Users/admin/Documents/Test.jpg";    
    [UIImageJPEGRepresentation(_canvas.image, 1.0) writeToFile:jpgPath atomically:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    [self setLastPoint:[touch locationInView:self.view]];

}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    UIGraphicsBeginImageContext(self.view.frame.size);
    CGRect drawRect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width,
                                 self.view.frame.size.height);
    [[[self canvas] image] drawInRect:drawRect];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), [widthSlider value]);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), [redSlider value] / 255.0f, [greenSlider value]/ 255.0f, [blueSlider value]/ 255.0f, [brushSlider value]/ 255.0f);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), _lastPoint.x, _lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x,currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    [[self canvas] setImage:UIGraphicsGetImageFromCurrentImageContext()];
    UIGraphicsEndImageContext();
    _lastPoint = currentPoint;
    
}
@end
