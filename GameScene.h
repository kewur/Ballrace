//
//  GameScene.h
//  EG-TD
//
//  Created by Gurcan Yavuz on 10/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractScene.h"
#import "glu.h"

@class Camera;
@class TowerMenu;
@class Cube;


@interface GameScene : AbstractScene {
    
    Map3D *gameMap;
    Camera *gameCamera;
    TowerMenu *towerMenu;
    
   
    int _mapWidht;
    int _mapHeight;
    
    float xDifference;
    float yDifference;
    //For tower screen whether started or not
    float touched;
    
    //Mini Tower Selected check
    float miniTowerTouched;
    CGRect miniTower;
    int miniTowerHash;

    CGPoint _location;
    
    //Acceleration

     Cube *collisionCube;
//    Cube *cubes[MAX_CUBES];
    NSMutableArray *cubes;

    NSMutableArray *mapList;
    
    NSString	*cubesCount;
    
    float collideCube;
    
    float readyCheck;
    
  
}

// Provide readonly because we won't change it here
@property (nonatomic, readonly) Map3D *gameMap;
@property (nonatomic, readonly) Camera *gameCamera;
@property (nonatomic, readonly) TowerMenu *towerMenu;
@property (nonatomic, readonly)Cube *collisionCube;
@property (nonatomic, assign) NSString	*cubesCount;
@property (nonatomic, readonly)NSMutableArray *cubes;
@property (nonatomic, retain) NSMutableArray *mapList;
@property (nonatomic, assign)float xDifference;
@property (nonatomic, assign)float yDifference;
@property (nonatomic, assign)float touched;
@property (nonatomic, assign)float miniTowerTouched;
@property (nonatomic, assign)CGPoint _location;
@property (nonatomic, assign)float collideCube;
- (CGPoint) unProject: (CGPoint) point;
@property (nonatomic, assign)float readyCheck;
- (void)updateX:(NSString *)xPos updateY:(NSString *)yPos updateZ:(NSString *)zPos;
- (void)updateAccelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration;
- (void)startTheGame;
- (void)serverUpdate;
- (void)gameUpdate;
@end
