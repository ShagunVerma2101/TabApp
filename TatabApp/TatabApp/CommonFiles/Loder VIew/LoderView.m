//
//  LoderView.m
//  ShreeAirlines
//
//  Created by NetprophetsMAC on 4/23/17.
//  Copyright © 2017 Netprophets. All rights reserved.
//

#import "LoderView.h"

@implementation LoderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    NSLog(@"%@",[UIScreen mainScreen].bounds);
    if (self) {
        UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"LoderView" owner:self options:nil] objectAtIndex:0];
        view.frame = frame;
        view.userInteractionEnabled = true;
        _whiteView.layer.cornerRadius = 5;
        [self addSubview:view];
        [self rotateView];
      
        return self;
    }
    
    [self rotateView];
    return self;
}

//Rotation 
-(void)rotateView{
    
//    [UIView animateWithDuration:1
//                          delay:0.0
//                        options:UIViewAnimationOptionRepeat|UIViewAnimationOptionCurveLinear|UIViewAnimationOptionBeginFromCurrentState
//                     animations:^{
//                         _imgView.transform = CGAffineTransformMakeRotation(-M_PI);
//                     }
//                     completion:^(BOOL finished){
//                         NSLog(@"Done!");
//                     }];
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1 / 500.0;
    transform = CATransform3DRotate(transform, .0 * M_PI_2, 1, 0, 0);/*Here the angle of transform set (Here angle set as 0)*/
    CABasicAnimation *animation;

    _imgView.layer.transform = transform;
    animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = [NSNumber numberWithFloat:0];
    animation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    animation.duration = 1.0;
    animation.repeatCount = HUGE_VALF;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [_imgView.layer addAnimation:animation forKey:@"transform.rotation.z"];
    [_imgView startAnimating];
}
@end
