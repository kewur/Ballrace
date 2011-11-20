//
//  Camera.m
//  EG-TD
//
//  Created by Gurcan Yavuz on 10/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Camera.h"
#import "GameScene.h"
#import "ball.h"
#import "RaceBall.h"
#import "EG_TDAppDelegate.h"
@implementation Camera

@synthesize collideCube;
@synthesize readyCheck;
@synthesize cameraZ;
@synthesize lookUpX;
@synthesize lookUpY;
@synthesize lookUpZ;
@synthesize xDifference;
@synthesize yDifference;
@synthesize oldPosition;
@synthesize raceBall;

- (void)dealloc {

    
    [super dealloc];
}


#pragma mark -
#pragma mark Init

- (id)initWithTileLocation:(EGVertex3D)startLocation {
    self = [super init];
	if (self != nil) {
        _sharedDirector = [Director sharedDirector];
        position.x = startLocation.x;
        position.y = startLocation.y;
        position.z = startLocation.z;
        
        
        otherBall.x = startLocation.x;
        otherBall.y = startLocation.y;
        otherBall.z = startLocation.z;
        raceBall = [[RaceBall alloc] initWithTileLocation:Vector3fMake(0, 0, 0)];
        oldPosition = position.x;
        // Set up the spritesheets that will give us out player animation
     
        // Speed at which the player moves
        _cameraSpeed = 0.04f;
        
        // Set the players state to alive
        entityState = kEntity_Alive;
        
        lookUpX = 0;
        lookUpZ = 0;
        

    }
    return self;
}


#pragma mark -
#pragma mark Update

- (void)update:(GLfloat)aDelta {

    _scene = (GameScene*)[_sharedDirector currentScene];
    xDifference = [(GameScene*)[_sharedDirector currentScene]  xDifference];
    yDifference = [(GameScene*)[_sharedDirector currentScene]  yDifference];
    collideCube = [(GameScene*)[_sharedDirector currentScene]  collideCube];
    readyCheck  = [(GameScene*)[_sharedDirector currentScene]  readyCheck];
//    position.x -= xDifference*kMapAcceloremeter;
//    position.z -= yDifference*kMapAcceloremeter;
//    lookUpZ -= yDifference*kMapAcceloremeter;
//    lookUpX -= xDifference*kMapAcceloremeter;
//    
    //NSLog(@"%f",collideCube);
    
    if (readyCheck != 0)
    {
     //   NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"20",@"x",@"20",@"y",@"20",@"z", nil];
     //   [[(EG_TDAppDelegate*)[[UIApplication sharedApplication] delegate] mClient] sendXtMessage:@"bb" cmd:@"upd" paramObj:dic type:@"xml" roomId:41];
        static float velocityOfBall = 0;
        
        if (collideCube == 0)
        {
            
            velocityOfBall += 0.005;
            
            if (velocityOfBall > MAX_Acceleration)
            {
                velocityOfBall = MAX_Acceleration;
                
            }
            position.z += velocityOfBall;
            lookUpZ +=velocityOfBall;
            
        }
        else
        {
            //NSLog(@"VELOCITY %f",velocityOfBall);
            if (velocityOfBall-0.5<0)
            {
                velocityOfBall = 0 ;
            }
            else
            {
                // NSLog(@"GIRDINMI");
                velocityOfBall-=0.5;
            }
            
        }
        
        ///  position.z += 0.1;
        //  lookUpZ +=0.1;
        oldPosition = position.x;
        position.x += xDifference*1.5;
        lookUpX += xDifference*1.5;
        
        
       // GLfloat x = position.x*0.6/0.55;
       // NSString * x = [NSString stringWithFormat:@"%f",position.x*0.6/0.55];
       // NSString * y = [NSString stringWithFormat:@"%f",position.y];
       // NSString * z = [NSString stringWithFormat:@"%f",position.z+20];

        
    }

       
   
  
  //[raceBall update:aDelta xPos:xDifference*1.1 yPos:position.y zPos:position.z oldPos:oldPosition];
 
}
- (void)updateX:(NSString *)xPos updateY:(NSString *)yPos updateZ:(NSString *)zPos TimeStamp:(NSString*)mStamp
{
    otherBallOldPos = otherBall;
    
    otherBall.x = [xPos floatValue];
    otherBall.y = [yPos floatValue];
    otherBall.z = [zPos floatValue];
    
    oldPackageTime = LastPackageTime;
    LastPackageTime = [mStamp doubleValue];
}

- (EGVertex3D) DeadReckoning
{
    EGVertex3D framePos;
    
    //dead reckoning code here
    
    return framePos;
}

#pragma mark -
#pragma mark Render

- (void)render {
   // [raceBall render];
  /*  glPushMatrix();
    glLoadIdentity();

     glScalef(0.6, 0.6, 0.6);
   // glScalef(0.6, 0.2, 0.6);
    glColor4f(1, 0, 0, 1);
    
    glTranslatef(position.x-oldPosition,  -5, -15);
    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_NORMAL_ARRAY);
    glVertexPointer(3, GL_FLOAT, sizeof(vertexData), &MeshVertexData[0].vertex);
    glNormalPointer(GL_FLOAT, sizeof(vertexData), &MeshVertexData[0].normal);
    glDrawArrays(GL_TRIANGLES, 0, 2880);
    glDisableClientState(GL_VERTEX_ARRAY);
    glDisableClientState(GL_NORMAL_ARRAY);

    glPopMatrix();
   */ 

    
    glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();

    gluLookAt(position.x, position.y, position.z, lookUpX,0 , lookUpZ, 0, 1, 0);
    
    glPushMatrix();
    //glLoadIdentity();
    
  
    // glScalef(0.6, 0.2, 0.6);
    glColor4f(1, 0, 0, 1);
    // glTranslatef(-oldPosition.x, -1, -oldPosition.z);
  //  NSLog(@"%f %f",position.x*1/0.55,position.z*1/0.6+20);
  //  NSLog(@"GAME X %f GAME Z %f",position.x,position.z);
    glTranslatef(position.x*0.6/0.55, 0, position.z+20);
    glScalef(0.6, 0.6, 0.6);
   // glTranslatef(position.x, 0, position.z+20);
  //  glP
    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_NORMAL_ARRAY);
    glVertexPointer(3, GL_FLOAT, sizeof(vertexData), &MeshVertexData[0].vertex);
    glNormalPointer(GL_FLOAT, sizeof(vertexData), &MeshVertexData[0].normal);
    glDrawArrays(GL_TRIANGLES, 0, 2880);
    glDisableClientState(GL_VERTEX_ARRAY);
    glDisableClientState(GL_NORMAL_ARRAY);
    
    glPopMatrix();
    
    glPushMatrix();
    //glLoadIdentity();
    
    
    // glScalef(0.6, 0.2, 0.6);
    glColor4f(0, 1, 0, 1);
    // glTranslatef(-oldPosition.x, -1, -oldPosition.z);
    //  NSLog(@"%f %f",position.x*1/0.55,position.z*1/0.6+20);
    //  NSLog(@"GAME X %f GAME Z %f",position.x,position.z);
    glTranslatef(otherBall.x, 0, otherBall.z);
    glScalef(0.6, 0.6, 0.6);
    // glTranslatef(position.x, 0, position.z+20);
    //  glP
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
