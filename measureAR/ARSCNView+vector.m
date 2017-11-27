//
//  ARSCNView+vector.m
//  measureAR
//
//  Created by 刘鑫忠 on 2017/11/27.
//  Copyright © 2017年 刘鑫忠. All rights reserved.
//

#import "ARSCNView+vector.h"

@implementation ARSCNView (vector)

- (SCNVector3)realWorldVector:(CGPoint)screenPos {
    NSArray<ARHitTestResult *> *planeTestResults = [self hitTest:screenPos types:ARHitTestResultTypeFeaturePoint];
    if(planeTestResults) {
        ARHitTestResult *result = planeTestResults.firstObject;
        return [self positionFromTransform:result.worldTransform];
    }
    return SCNVector3Zero;
}

- (SCNVector3)positionFromTransform:(matrix_float4x4)transform {
    return SCNVector3Make(transform.columns[3].x, transform.columns[3].y, transform.columns[3].z);
}

- (float)distance:(SCNVector3)vector myPoint:(SCNVector3)myPoint{
    float distanceX = myPoint.x - vector.x;
    float distanceY = myPoint.y - vector.y;
    float distanceZ = myPoint.z - vector.z;
    return sqrtf( (distanceX * distanceX) + (distanceY * distanceY) + (distanceZ * distanceZ));
}

@end
