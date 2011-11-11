//
//  Map3D.m
//  EG-TD
//
//  Created by Gurcan Yavuz on 10/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Map3D.h"
#import "OpenGLTexture3D.h"
#import "planeTile.h"
#import "Image.h"
#import "side.h"

#pragma mark -
#pragma mark Private interface

@interface Map3D (Private)
//Init map vertices
-(void)initMap;

@end

@implementation Map3D

@synthesize mapWidth;
@synthesize mapHeight;
@synthesize texture;
@synthesize textureSide;
@synthesize img;
- (id)initMap3D {
	
	self = [super init];
	if (self != nil) {
		
		// Shared game state
		sharedDirector = [Director sharedDirector];
      
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tile" ofType:@"png"];
        OpenGLTexture3D *newTexture = [[OpenGLTexture3D alloc] initWithFilename:path width:512 height:512];
        self.texture = newTexture;
        [newTexture release];

        
        img = [[Image alloc] initWithImage:@"tile.png" scale:2];
        
        [self initMap];

	}
	return self;
}


- (void)render{
    

    glPushMatrix();
    
 
   // glTranslatef(0, -2, -10);
    glScalef(7, 2, 2);
   glColor4f(1, 1, 1, 1);
 //glColor4f(0.45f, 0.65f, 0.80f, 1.0f);
    [texture bind];
    
    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_NORMAL_ARRAY);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    glEnable(GL_TEXTURE_2D);
    glEnable(GL_BLEND);
        glBlendFunc(GL_ONE, GL_SRC_COLOR);
    //glEnable(GL_TEXTURE_2D);
   // glEnable(GL_BLEND);
    glTranslatef(0, -2, 0);
    glVertexPointer(3, GL_FLOAT, sizeof(vertexDataTextured), &MeshVertexData[0].vertex);
     glNormalPointer(GL_FLOAT, sizeof(vertexDataTextured), &MeshVertexData[0].normal);
     glTexCoordPointer(2, GL_FLOAT, sizeof(vertexDataTextured), &MeshVertexData[0].texCoord);
     glDrawArrays(GL_TRIANGLES, 0, 6);

   
    glPushMatrix();
    glColor4f(0, 0, 0, 1);
    glTranslatef(0, 2, 0);
    glTranslatef(5, 0, -1);
    glRotatef(90, 0, 1, 0);
    glScalef(2000, 10,5);
    glVertexPointer(3, GL_FLOAT, sizeof(vertexDataTextured), &MeshVertexData1[0].vertex);
    glNormalPointer(GL_FLOAT, sizeof(vertexDataTextured), &MeshVertexData1[0].normal);
    glTexCoordPointer(2, GL_FLOAT, sizeof(vertexDataTextured), &MeshVertexData1[0].texCoord);
    glDrawArrays(GL_TRIANGLES, 0, 6);
    glPopMatrix();
    
    glPushMatrix();
    glColor4f(0, 0, 0, 1);
    glTranslatef(-5, 0, -1);
    glRotatef(90, 0, 1, 0);
    glScalef(2000, 10,5);
    glVertexPointer(3, GL_FLOAT, sizeof(vertexDataTextured), &MeshVertexData1[0].vertex);
    glNormalPointer(GL_FLOAT, sizeof(vertexDataTextured), &MeshVertexData1[0].normal);
    glTexCoordPointer(2, GL_FLOAT, sizeof(vertexDataTextured), &MeshVertexData1[0].texCoord);
    glDrawArrays(GL_TRIANGLES, 0, 6);
    glPopMatrix();
    
    glPushMatrix();
    glTranslatef(0, -2, -40);
    glScalef(7, 40, 2000);
    glVertexPointer(3, GL_FLOAT, sizeof(vertexDataTextured), &MeshVertexData[0].vertex);
    glNormalPointer(GL_FLOAT, sizeof(vertexDataTextured), &MeshVertexData[0].normal);
    glTexCoordPointer(2, GL_FLOAT, sizeof(vertexDataTextured), &MeshVertexData[0].texCoord);
    glDrawArrays(GL_TRIANGLES, 0, 6);
    glPopMatrix();
    
    
   
    glDisableClientState(GL_VERTEX_ARRAY);
    glDisableClientState(GL_NORMAL_ARRAY);
    glDisableClientState(GL_TEXTURE_COORD_ARRAY);
    glDisable(GL_TEXTURE_2D);
    glDisable(GL_BLEND);
    
    glPopMatrix();
    
}


@end


@implementation Map3D (Private)

-(void)initMap{

    // Generate the floors vertices
    GLfloat z = -20.0f;
    for (uint index=0; index < 4; index += 2) {
        zFloorVertices[index].x = -40;
        zFloorVertices[index].y = -1.0;
        zFloorVertices[index].z = z;
        
        zFloorVertices[index+1].x = 40;
        zFloorVertices[index+1].y = -1.0;
        zFloorVertices[index+1].z = z;
        
        z += 300.0f;
    }

    GLfloat x = -40.0f;
    for (uint index=0; index < 4; index += 2) {
        xFloorVertices[index].x = x;
        xFloorVertices[index].y = -1;
        xFloorVertices[index].z = -20.0f;
        
        xFloorVertices[index+1].x = x;
        xFloorVertices[index+1].y = -1;
        xFloorVertices[index+1].z = 280.0f;
        
        x += 80.0f;
    }

   

}

@end