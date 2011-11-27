//
//  GameScene.m
//  EG-TD
//
//  Created by Gurcan Yavuz on 10/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameScene.h"
#import "Camera.h"
#import "TowerMenu.h"
#import "Cube.h"
#import "map.h"
#import "RaceBall.h"
#import "EG_TDAppDelegate.h"
@implementation GameScene

@synthesize gameMap;
@synthesize xDifference;
@synthesize yDifference;
@synthesize _location;
@synthesize towerMenu;
@synthesize touched;
@synthesize miniTowerTouched;
@synthesize collisionCube;
@synthesize cubes;
@synthesize mapList;
@synthesize cubesCount;
@synthesize collideCube;
@synthesize readyCheck;
- (id)init {
	
	if(self == [super init]) {
		
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startTheGame) name:@"startTheGame" object:nil];
        // Grab an instance of our singleton classes
		_sharedDirector = [Director sharedDirector];
        _sharedResourceManager = [ResourceManager sharedResourceManager];
        gameMap = [[Map3D alloc] initMap3D];
        towerMenu = [[TowerMenu alloc] init];
     	[NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(gameUpdate) userInfo:nil repeats:YES];
        
        //NORMAL CAMERA GAME COORDINATE SYSTEM
     //   cube = [[Cube alloc] initWithPosition:Vector3fMake(0, 0, 0)];
        gameCamera = [[Camera alloc] initWithTileLocation:Vector3fMake(0,5,-20)];
        xDifference = 0;
        yDifference = 0;
        touched = 0;
        miniTowerTouched = 0;
        miniTower = CGRectMake(240, 0, 80, 80);
        
        cubes = [[NSMutableArray alloc] init];
        mapList = [[NSMutableArray alloc] init];
       self.cubesCount = [[NSString alloc] initWithString:@"0"];
        readyCheck = 0;
        collideCube = 0;
        [mapList addObject:cubesCount ];
        
    
   /*    int  posIndex=70;
        for (int q = 0 ; q<130; q++) 
        {
            for (int i = 0; i<6; i++) 
            {
                float z = rand() % 30;
                float x = rand() % 70 - 35;
                float r = rand() % 2;
                float g = rand() % 2;
                float b = rand() % 2;
                
                Cube* cube = [[Cube alloc] initWithPosition:Vector3fMake(x,0,z+posIndex) withColor:EGColorMake(r, g, b, 1)];
                [cubes addObject:cube];
                
                [cube release];
                cube = nil;
                
            }
         
            posIndex += 30;
            
        }
   */   
        int  posIndex=0;
        int  cubesNumber = 0;
        
        for (int j= 0; j<90; j++)
        {
        
          int z = rand() % 6;
            
            if (z == 0)
            {
                int i = 0;
                for (; i<sizeof(PositionsAndColors)/28; i++)
                {
                    
                    Cube* cube = [[Cube alloc] initWithPosition:Vector3fMake(PositionsAndColors[i].position.x, PositionsAndColors[i].position.y, PositionsAndColors[i].position.z+posIndex) withColor:Color4fMake(PositionsAndColors[i].color.red, PositionsAndColors[i].color.green, PositionsAndColors[i].color.blue, PositionsAndColors[i].color.alpha)];
                    
                    [cubes addObject:cube];
                    
                    [cube release];
                    cube = nil;
                    
                }
                cubesNumber +=i;
                
                self.cubesCount = [NSString stringWithFormat:@"%d;%d",cubesNumber,posIndex];
            
                 [mapList addObject:cubesCount];
                
               // NSLog(@"%@",mapList);
               //   NSLog(@"%d",sizeof(PositionsAndColors)/28);
//                
//              [self.mapList addObject:[NSDictionary dictionaryWithObjectsAndKeys:
//                                       Map1,@"sizeMap",
//                                       z,@"whichSet",
//                                       cubesCount,@"cubesCount",
//                                       nil]];
              
            }
            else if (z == 1)
            {
                int i = 0;
               for (; i<sizeof(PositionsAndColors2)/28; i++)
                {
                    
                    Cube* cube = [[Cube alloc] initWithPosition:Vector3fMake(PositionsAndColors2[i].position.x, PositionsAndColors2[i].position.y, PositionsAndColors2[i].position.z+posIndex) withColor:Color4fMake(PositionsAndColors2[i].color.red, PositionsAndColors2[i].color.green, PositionsAndColors2[i].color.blue, PositionsAndColors2[i].color.alpha)];
                    
                    [cubes addObject:cube];
                    
                    [cube release];
                    cube = nil;
                    
                }
                 cubesNumber +=i;
                self.cubesCount = [NSString stringWithFormat:@"%d;%d",cubesNumber,posIndex];
                
                [mapList addObject:cubesCount];
                //[self.mapList addObject:[NSDictionary dictionaryWithObjectsAndKeys:Map2,@"sizeMap",z,@"whichSet",cubesCount,@"cubesCount",nil] ];
            
            }
            else if (z == 2)
            {
                int i = 0;
                for (; i<sizeof(PositionsAndColors3)/28; i++)
                {
                    
                    Cube* cube = [[Cube alloc] initWithPosition:Vector3fMake(PositionsAndColors3[i].position.x, PositionsAndColors3[i].position.y, PositionsAndColors3[i].position.z+posIndex) withColor:Color4fMake(PositionsAndColors3[i].color.red, PositionsAndColors3[i].color.green, PositionsAndColors3[i].color.blue, PositionsAndColors3[i].color.alpha)];
                    
                    [cubes addObject:cube];
                    
                    [cube release];
                    cube = nil;
                    
                }
                   cubesNumber +=i;
                self.cubesCount = [NSString stringWithFormat:@"%d;%d",cubesNumber,posIndex];
                
                [mapList addObject:cubesCount];
               //     cubesCount +=i;
               //   NSLog(@"%d",sizeof(PositionsAndColors3)/28);
//                [self.mapList addObject:[NSDictionary dictionaryWithObjectsAndKeys:
//                                         Map3,@"sizeMap",
//                                         z,@"whichSet",
//                                         cubesCount,@"cubesCount",
//                                         nil] ];
            }
            else if (z == 3)
            {
                int i = 0;
                for (; i<sizeof(PositionsAndColors4)/28; i++)
                {
                    
                    Cube* cube = [[Cube alloc] initWithPosition:Vector3fMake(PositionsAndColors4[i].position.x, PositionsAndColors4[i].position.y, PositionsAndColors4[i].position.z+posIndex) withColor:Color4fMake(PositionsAndColors4[i].color.red, PositionsAndColors4[i].color.green, PositionsAndColors4[i].color.blue, PositionsAndColors4[i].color.alpha)];
                    
                    [cubes addObject:cube];
                    
                    [cube release];
                    cube = nil;
                    
                }
                 cubesNumber +=i;
                self.cubesCount = [NSString stringWithFormat:@"%d;%d",cubesNumber,posIndex];
                
                [mapList addObject:cubesCount];
                  //   cubesCount +=i;
               //   NSLog(@"%d",sizeof(PositionsAndColors4)/28);
//                [self.mapList addObject:[NSDictionary dictionaryWithObjectsAndKeys:
//                                         Map4,@"sizeMap",
//                                         z,@"whichSet",
//                                         cubesCount,@"cubesCount",
//                                         nil] ];
                
            }
            else if (z == 4)
            {
                int i = 0;
                for (; i<sizeof(PositionsAndColors5)/28; i++)
                {
                    
                    Cube* cube = [[Cube alloc] initWithPosition:Vector3fMake(PositionsAndColors5[i].position.x, PositionsAndColors5[i].position.y, PositionsAndColors5[i].position.z+posIndex) withColor:Color4fMake(PositionsAndColors5[i].color.red, PositionsAndColors5[i].color.green, PositionsAndColors5[i].color.blue, PositionsAndColors5[i].color.alpha)];
                    
                    [cubes addObject:cube];
                    
                    [cube release];
                    cube = nil;
                    
                }
                
                cubesNumber +=i;
                self.cubesCount = [NSString stringWithFormat:@"%d;%d",cubesNumber,posIndex];
                
                [mapList addObject:cubesCount];
                  //   cubesCount +=i;
               //   NSLog(@"%d",sizeof(PositionsAndColors5)/28);
//                [self.mapList addObject:[NSDictionary dictionaryWithObjectsAndKeys:
//                                         Map5,@"sizeMap",
//                                         z,@"whichSet",
//                                          posIndex,@"positionIndex",
//                                         cubesCount,@"cubesCount",
//                                         nil] ];
            }
            else if (z == 5)
            {
                int i = 0;
                for (; i<sizeof(PositionsAndColors6)/28; i++)
                {
                    
                    Cube* cube = [[Cube alloc] initWithPosition:Vector3fMake(PositionsAndColors6[i].position.x, PositionsAndColors6[i].position.y, PositionsAndColors6[i].position.z+posIndex) withColor:Color4fMake(PositionsAndColors6[i].color.red, PositionsAndColors6[i].color.green, PositionsAndColors6[i].color.blue, PositionsAndColors6[i].color.alpha)];
                    
                    [cubes addObject:cube];
                    
                    [cube release];
                    cube = nil;
                    
                }
                cubesNumber +=i;

                self.cubesCount = [NSString stringWithFormat:@"%d;%d",cubesNumber,posIndex];
                
                [mapList addObject:cubesCount];
                   // cubesCount +=i;
               
               //   NSLog(@"%d",sizeof(PositionsAndColors6)/28);
          /*      [self.mapList addObject:[NSDictionary dictionaryWithObjectsAndKeys:
                                         Map6,@"sizeMap",
                                         z,@"whichSet",
                                         posIndex,@"positionIndex",
                                         cubesCount,@"cubesCount",
                                        nil] ];
            */    

                
            }
            
        
         /*  NSLog(@"%d",[cubes count]);
             NSLog(@"%d",z);
             NSLog(@"%d",j);
         */
            
            
         posIndex += 60;
            
        }


    }
	
	return self;
}
- (void)gameUpdate
{
    if (readyCheck == 1 )
    {
       
        //GLfloat temp = ;
        GLfloat x = [gameCamera position].x*0.6/0.55;
        GLfloat y = [gameCamera position].y;
        GLfloat z = [gameCamera position].z+20;
        NSString *zVal = [NSString stringWithFormat:@"%f",z];
         NSString *yVal = [NSString stringWithFormat:@"%f",y];
         NSString *xVal = [NSString stringWithFormat:@"%f",x];
        NSLog(@"zValzValzVal%f",z);
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:xVal,@"x",yVal,@"y",zVal,@"z", nil];
        [[(EG_TDAppDelegate*)[[UIApplication sharedApplication] delegate] mClient] sendXtMessage:@"bb" cmd:@"upd" paramObj:dic type:@"str" roomId:10];
        
    }
}
- (void)updateX:(NSString *)xPos updateY:(NSString *)yPos updateZ:(NSString *)zPos
{
    [gameCamera updateX:xPos updateY:yPos updateZ:zPos];
}
- (void)startTheGame
{

    readyCheck = 1;

}
- (void)updateAccelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
 
  if (acceleration.y<-0.1)
    {
        xDifference = acceleration.y;
    }
    else if(acceleration.y>0.1)
    {
        xDifference = acceleration.y;
    }
    else
    {
        xDifference = 0;
        
    }
 
    xDifference = acceleration.y*0.3;
}
- (void)serverUpdate
{



}
#pragma mark -
#pragma mark Update scene logic

- (void)updateWithDelta:(GLfloat)theDelta {
    
    [gameCamera update:theDelta];
   
   // [towerMenu update:theDelta];
    
}

#pragma mark -
#pragma mark Touch events

- (void)updateWithTouchLocationBegan:(NSSet*)touches withEvent:(UIEvent*)event view:(UIView*)aView {
          
    
    UITouch *touch = [[event touchesForView:aView] anyObject];

	_location = [touch locationInView:aView];

    

    // CGPoint tt = [self unProject:_location];
   //  NSLog(@"location X : %f  location Y : %f ", tt.x, tt.y);
  //  NSLog(@"location X : %f  location Y : %f ", _location.x, _location.y);
    
    if (_location.y < 30)
    {
        touched = 1;
    }
    else if(miniTowerTouched !=1)
    {
        touched = 0;
    }
    
    xDifference = 0;
    yDifference = 0;

    
}


- (void)updateWithTouchLocationMoved:(NSSet*)touches withEvent:(UIEvent*)event view:(UIView*)aView {

    UITouch *touch = [[event touchesForView:aView] anyObject];

    if ([touch hash] == miniTowerHash)
    {
        
    
    
    
    }
    
    if (!touched && miniTowerTouched != 1)
    {
      //  UITouch *touch = [[event touchesForView:aView] anyObject];
        CGPoint _nextLocation;
        _nextLocation = [touch locationInView:aView];
        
        xDifference = _nextLocation.x-_location.x;
        yDifference = _nextLocation.y-_location.y;

    } 


}
- (void)updateWithTouchLocationEnded:(NSSet*)touches withEvent:(UIEvent*)event view:(UIView*)aView {
 
//    xDifference *= 0.5;
 //   yDifference *= 0.5;

/*    
    if(miniTowerTouched == 1 )
    {
        touched = 0;
        miniTowerTouched = 0;
    }
  */  
}

#define RAY_ITERATIONS  100
- (CGPoint) unProject: (CGPoint) point
{
    
    GLfloat x=0, y=0, z=0;
    GLfloat modelMatrix[16]; 
    GLfloat projMatrix[16];
    GLint viewport[4];
    glGetFloatv(GL_MODELVIEW_MATRIX, modelMatrix);
    glGetFloatv(GL_PROJECTION_MATRIX, projMatrix);
    glGetIntegerv(GL_VIEWPORT, viewport);


   
    point.y = viewport[3] - point.y;
 
 //  NSLog(@"location X : %f  location Y : %f ", point.x, point.y);
    EGVertex3D far3d;
    EGVertex3D near3d;
    EGVertex3D rayVector3d;

    //Retreiving position projected on near plan
   	gluUnProject( point.x, point.y , 0, modelMatrix, projMatrix, viewport, &near3d.x, &near3d.y, &near3d.z);
    
	//Retreiving position projected on far plan
	gluUnProject( point.x, point.y,  1, modelMatrix, projMatrix, viewport, &far3d.x, &far3d.y, &far3d.z);
    
    rayVector3d.x = (far3d.x - near3d.x);
	rayVector3d.y = (far3d.y - near3d.y);
	rayVector3d.z = (far3d.z - near3d.z);

  //  NSLog(@"RAY X : %f  location Y : %f  location Z : %f", rayVector3d.x, rayVector3d.y,rayVector3d.z);
   // rayVector3d.x =  near3d.x;
	//rayVector3d.y =  near3d.y;
	//rayVector3d.z =  near3d.z;
    
    float rayLength = sqrtf(rayVector3d.x*rayVector3d.x + rayVector3d.y*rayVector3d.y + rayVector3d.z*rayVector3d.z);
    NSLog(@"NEAR X : %f  location Y : %f  location Z : %f", near3d.x, near3d.y,near3d.z);
   // NSLog(@"RAY X : %f  location Y : %f  location Z : %f", far3d.x, far3d.y,far3d.z);
    
    rayVector3d.x /= rayLength;
	rayVector3d.y /= rayLength;
	rayVector3d.z /= rayLength;


      

  // NSLog(@"RAY X : %f  location Y : %f  location Z : %f", rayVector3d.x, rayVector3d.y,rayVector3d.z);
    CGPoint result = { 0.0f/0.0f, 0.0f/0.0f };

    EGVertex3D collisionPoint;
    //Iterating over ray vector to check collisions
	for(int i = 0; i < RAY_ITERATIONS; i++)
	{

        collisionPoint.x = near3d.x + rayVector3d.x*i;
        collisionPoint.y = near3d.y + rayVector3d.y*i;
		collisionPoint.z = near3d.z + rayVector3d.z*i;
     
        //Checking collision 
         NSLog(@"RAY X : %f  location Y : %f  location Z : %f", collisionPoint.x, collisionPoint.y,collisionPoint.z);
	}
  //  return result;
}

-(void)fakeTimer
{
   
    collideCube = 0;
}

-(void)collide
{
[NSTimer scheduledTimerWithTimeInterval:0.01667 target:self selector:@selector(fakeTimer) userInfo:nil repeats:NO];


}
#pragma mark -
#pragma mark Render scene

- (void)render {
       
 
   
    
    [gameMap render];
    [gameCamera render];

  
    int x = 0;
    int y = 0;
    int z = 0;
   
    for (int i = 0; i<[mapList count]-5; i++)
    {
        NSString *startPiece = [mapList objectAtIndex:i];
        NSArray *startDivision = [startPiece componentsSeparatedByString:@";"];
        
        NSString *finishPiece = [mapList objectAtIndex:i+8];
        NSArray *finishDivision = [finishPiece componentsSeparatedByString:@";"];
      //    NSLog(@"X value %d  Y value %d",[[startDivision objectAtIndex:1] intValue],[[finishDivision objectAtIndex:1] intValue]);
        if (i==0)
        {
             if(gameCamera.position.z+100  < [[finishDivision objectAtIndex:1] intValue])
             {
                 x = i;
                 y = [[finishDivision objectAtIndex:0] intValue];
                 break;
             }
        }
     
       else
       {
       
      //  NSLog(@"X value %d  Y value %d",[[startDivision objectAtIndex:1] intValue],[[finishDivision objectAtIndex:1] intValue]);
     //   NSLog(@"Z value %f  Z value %f",gameCamera.position.z,gameCamera.position.z);

           if (gameCamera.position.z-100> [[startDivision objectAtIndex:1] intValue] && gameCamera.position.z+300 < [[finishDivision objectAtIndex:1] intValue])
           {
              
               x = [[startDivision objectAtIndex:0] intValue];

               y = [[finishDivision objectAtIndex:0] intValue];
               break;
           }
       
       
      //   NSLog(@"X value %d  Y value %d",x,y);
      }
        
        
        
    
    }
    //NSLog(@"X value %d  Y value %d",x,y);
    
    for(; x < y; x++)
    {
        Cube * cube = [cubes objectAtIndex:x];
       // NSLog(@"CUBE X %f CUBE Z %f ",cube.position.x,cube.position.z+20);
      //  NSLog(@"GAME X %f GAME Z %f",gameCamera.position.x,gameCamera.position.z);
        
        if (cube.position.z-1.1<= gameCamera.position.z+20 && cube.position.z+3>= gameCamera.position.z+20 )
        {
            // NSLog(@"Z CARPMASI");
            if (cube.position.x+1.1 >= gameCamera.position.x*0.6/0.55 && cube.position.x-1.6<= gameCamera.position.x*0.6/0.55   ) 
            {
                if (collisionCube !=cube) 
                {
                    collideCube = 1;
                    collisionCube = cube;
                 
                    [self collide];
                    //[NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(fakeTimer) userInfo:nil repeats:YES];
                }
                else
                {
                
                }
           
                
            }
        }
        
        

        
        [[cubes objectAtIndex:x] render];
    }
  

 
}


@end
