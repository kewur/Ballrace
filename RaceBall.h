//
//  RaceBall.h
//  EG-TD
//
//  Created by Gurcan Yavuz on 11/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractEntity.h"

@class GameScene;


@interface RaceBall : AbstractEntity {
    
    Director *_sharedDirector;
    GameScene *_scene;
 
    float xDifference;
    float yDifference;
    EGVertex3D oldPosition;
}
@property (nonatomic, assign)EGVertex3D oldPosition;
- (id)initWithTileLocation:(EGVertex3D)startLocation;
- (void)update:(GLfloat)aDelta xPos:(float)xPos yPos:(float)yPos zPos:(float)zPos oldPos:(float)oldPos;
@end
