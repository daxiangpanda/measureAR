//
//  ViewController.m
//  measureAR
//
//  Created by 刘鑫忠 on 2017/11/27.
//  Copyright © 2017年 刘鑫忠. All rights reserved.
//

#import "ViewController.h"
#import "ARSCNView+vector.h"

@interface ViewController () <ARSCNViewDelegate>

@property (nonatomic, strong) IBOutlet ARSCNView *sceneView;
@property (nonatomic, assign) BOOL measuring;
@property (nonatomic, assign) SCNVector3 startValue;
@property (nonatomic, assign) SCNVector3 endValue;

@end

    
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupScene];
}

- (void)setupScene {
    // Set the view's delegate
    self.sceneView.delegate = self;
    
    // Show statistics such as fps and timing information
    self.sceneView.showsStatistics = YES;
    
    // Create a new scene
    SCNScene *scene = [SCNScene sceneNamed:@"art.scnassets/ship.scn"];
    
    // Set the scene to the view
    self.sceneView.scene = scene;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Create a session configuration
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];
    
    // Run the view's session
    [self.sceneView.session runWithConfiguration:configuration];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Pause the view's ses
    [self.sceneView.session pause];
}
//
//- (void)detectObjects{
//    SCNVector3 worldPos = [self realWorldVector:self.sceneView point:self.view.center];
//    if(worldPos.x != 0 || worldPos.y != 0  || worldPos.z != 0) {
//        if(_measuring) {
//            if(_startValue == SCNVector3Zero) {
//
//            }
//        }
//    }
//}

- (void)session:(ARSession *)session didFailWithError:(NSError *)error {
    // Present an error message to the user
    
}

- (void)sessionWasInterrupted:(ARSession *)session {
    // Inform the user that the session has been interrupted, for example, by presenting an overlay
    
}

- (void)sessionInterruptionEnded:(ARSession *)session {
    // Reset tracking and/or remove existing anchors if consistent tracking is required
    
}


- (SCNVector3)realWorldVector:(ARSCNView*)scnView point:(CGPoint)screenPos {
    NSArray<ARHitTestResult *> *planeTestResults = [scnView hitTest:screenPos types:ARHitTestResultTypeFeaturePoint];
    if(planeTestResults) {
        ARHitTestResult *result = planeTestResults.firstObject;
        return [self positionFromTransform:result.worldTransform];
    }
    return SCNVector3Zero;
}

- (SCNVector3)positionFromTransform:(matrix_float4x4)transform {
    return SCNVector3Make(transform.columns[3].x, transform.columns[3].y, transform.columns[3].z);
}
@end
