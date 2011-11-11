//
//  Map3D.h
//  EG-TD
//
//  Created by Gurcan Yavuz on 10/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Director.h"

@class OpenGLTexture3D;
@class Image;
@interface Map3D : NSObject {
    
    
    // Sharte game state instance
    Director *sharedDirector;
    // The width of the map in tiles
    GLuint mapWidth;
    // The height of the map in tiles
    GLuint mapHeight;

    // Floor Vertices
    EGVertex3D zFloorVertices[81];
    EGVertex3D xFloorVertices[81];
    
    OpenGLTexture3D *texture;
    OpenGLTexture3D *textureSide;
    Image*img;
 
}

@property (nonatomic, retain) Image*img;
@property (nonatomic, retain) OpenGLTexture3D *texture;
@property (nonatomic, retain) OpenGLTexture3D *textureSide;
@property (nonatomic, readonly) GLuint mapWidth;
@property (nonatomic, readonly) GLuint mapHeight;

//Initializes the map
- (id)initMap3D;
- (void)render;

@end
