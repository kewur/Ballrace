//
//  RaceBall.m
//  EG-TD
//
//  Created by Gurcan Yavuz on 11/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RaceBall.h"
#import "ball.h"


@implementation RaceBall
@synthesize oldPosition;

- (id)initWithTileLocation:(EGVertex3D)startLocation
{

    self = [super init];
	if (self != nil) {
        _sharedDirector = [Director sharedDirector];
        position.x = startLocation.x;
        position.y = startLocation.y;
        position.z = startLocation.z;
        oldPosition.x = position.x;
         oldPosition.y = position.y;
         oldPosition.z = position.z;
        // Set the players state to alive
        entityState = kEntity_Alive;

        
    }
    return self;


}

#pragma mark -
#pragma mark Update

- (void)update:(GLfloat)aDelta xPos:(float)xPos yPos:(float)yPos zPos:(float)zPos oldPos:(float)oldPos{
    
    _scene = (GameScene*)[_sharedDirector currentScene];
    xDifference = [(GameScene*)[_sharedDirector currentScene]  xDifference];
    yDifference = [(GameScene*)[_sharedDirector currentScene]  yDifference];

    
    oldPosition.x = position.x;
    oldPosition.y = position.y;
    oldPosition.z = position.z;
    
    position.x += xPos;
    position.y = yPos;
    position.z =zPos;
 
    //    
    //    position.x -= xDifference*kMapAcceloremeter;
    //    position.z -= yDifference*kMapAcceloremeter;
    //    lookUpZ -= yDifference*kMapAcceloremeter;
    //    lookUpX -= xDifference*kMapAcceloremeter;
    //    
  /*  if (position.z >450)
    {
        position.z += 2;
        position.x += xDifference*2;
             
        
    }
    else
    {
        position.z += 0.5;
        position.x += xDifference*1.5;
    }
    */

    
}

#pragma mark -
#pragma mark Render

- (void)render 
{

    glPushMatrix();
    //glLoadIdentity();
    
    glScalef(0.6, 0.6, 0.6);
    // glScalef(0.6, 0.2, 0.6);
    glColor4f(1, 0, 0, 1);
   // glTranslatef(-oldPosition.x, -1, -oldPosition.z);
    glTranslatef(position.x,  1, position.z+30);
    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_NORMAL_ARRAY);
    glVertexPointer(3, GL_FLOAT, sizeof(vertexData), &MeshVertexData[0].vertex);
    glNormalPointer(GL_FLOAT, sizeof(vertexData), &MeshVertexData[0].normal);
    glDrawArrays(GL_TRIANGLES, 0, 2880);
    glDisableClientState(GL_VERTEX_ARRAY);
    glDisableClientState(GL_NORMAL_ARRAY);
    
    glPopMatrix();
    
    
    
}




@end
