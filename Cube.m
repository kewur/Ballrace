//
//  Cube.m
//  EG-TD
//
//  Created by Gurcan Yavuz on 10/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Cube.h"
#import "greenCube.h"
#import "OpenGLTexture3D.h"

@implementation Cube

@synthesize size;
@synthesize x;
@synthesize y;
@synthesize z;
@synthesize texture;
typedef struct {
    float Position[3];
    float Color[4];
} Vertex;

const Vertex Vertices[] = {
    {{1, -1, 0}, {1, 0, 0, 1}},
    {{1, 1, 0}, {1, 0, 0, 1}},
    {{-1, 1, 0}, {0, 1, 0, 1}},
    {{-1, -1, 0}, {0, 1, 0, 1}},
    {{1, -1, -1}, {1, 0, 0, 1}},
    {{1, 1, -1}, {1, 0, 0, 1}},
    {{-1, 1, -1}, {0, 1, 0, 1}},
    {{-1, -1, -1}, {0, 1, 0, 1}}
};

const GLubyte Indices[] = {
    // Front
    0, 1, 2,
    2, 3, 0,
    // Back
    4, 6, 5,
    4, 7, 6,
    // Left
    2, 7, 3,
    7, 6, 2,
    // Right
    0, 4, 1,
    4, 1, 5,
    // Top
    6, 2, 1, 
    1, 6, 5,
    // Bottom
    0, 3, 7,
    0, 7, 4 
};

-(id)initWithPosition:(EGVertex3D)startLocation withColor:(EGColor)cubeColor;
{
    self = [super init];
	if (self != nil) {
        _sharedDirector = [Director sharedDirector];
        position.x = startLocation.x;
        position.y = startLocation.y;
        position.z = startLocation.z;
        
        color.red = cubeColor.red;
        color.green = cubeColor.green;
        color.blue = cubeColor.blue;
        color.alpha = cubeColor.alpha;
        
        // Set the players state to alive
        entityState = kEntity_Alive; 
 /*      
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cubeimage" ofType:@"jpg"];
        OpenGLTexture3D *newTexture = [[OpenGLTexture3D alloc] initWithFilename:path width:512 height:512];
        self.texture = newTexture;
        [newTexture release];
   */ 
    }
    return self;

}


#pragma mark -
#pragma mark Render

- (void)render {
    
    
    glPushMatrix();
    
    glTranslatef(position.x, 0.0f, position.z);
   
   // [texture bind];
    //glClear(GL_DEPTH_BUFFER_BIT);
    glEnable(GL_DEPTH_TEST);

     glColor4f(color.red, color.green, color.blue, color.alpha);
     glEnableClientState(GL_VERTEX_ARRAY);
     glEnableClientState(GL_NORMAL_ARRAY);
   //  glEnableClientState(GL_TEXTURE_COORD_ARRAY);
  //   glEnable(GL_TEXTURE_2D);
  //    glEnable(GL_BLEND);
     glVertexPointer(3, GL_FLOAT, sizeof(vertexData), &MeshVertexData[0].vertex);
     glNormalPointer(GL_FLOAT, sizeof(vertexData), &MeshVertexData[0].normal);
   //  glTexCoordPointer(2, GL_FLOAT, 0, CubeTexCoords);
     glDrawArrays(GL_TRIANGLES, 0, sizeof(vertexData));
     glDisableClientState(GL_VERTEX_ARRAY);
     glDisableClientState(GL_NORMAL_ARRAY);
   // glDisableClientState(GL_TEXTURE_COORD_ARRAY);
   // glDisable(GL_TEXTURE_2D);
    //  glDisable(GL_BLEND);
    glPopMatrix();
}

@end
