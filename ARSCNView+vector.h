//
//  ARSCNView+vector.h
//  measureAR
//
//  Created by 刘鑫忠 on 2017/11/27.
//  Copyright © 2017年 刘鑫忠. All rights reserved.
//

#import <ARKit/ARKit.h>

@interface ARSCNView (vector)
- (SCNVector3)realWorldVector:(CGPoint)screenPos;
@end
