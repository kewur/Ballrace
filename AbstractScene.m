//
//  AbstractScene.m
//  EG-TD
//
//  Created by Gurcan Yavuz on 10/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AbstractScene.h"


@implementation AbstractScene

@synthesize sceneState;
@synthesize sceneAlpha;

- (void)updateWithDelta:(GLfloat)aDelta {
}


- (void)updateWithTouchLocationBegan:(NSSet*)touches withEvent:(UIEvent*)event view:(UIView*)aView {
 
}

- (void)updateWithTouchLocationMoved:(NSSet*)touches withEvent:(UIEvent*)event view:(UIView*)aView {
  
}

- (void)updateWithTouchLocationEnded:(NSSet*)touches withEvent:(UIEvent*)event view:(UIView*)aView {

}

- (void)updateWithAccelerometer:(UIAcceleration*)aAcceleration {
}

- (void)transitionToSceneWithKey:(NSString*)aKey {
}
- (void)updateAccelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{

}
- (void)render {
    
   
}
- (void)updateX:(NSString *)xPos updateY:(NSString *)yPos updateZ:(NSString *)zPos
{


}
- (void)serverUpdate
{


}
@end
