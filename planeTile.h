//If not using MC3D, change 1 to 0 to add needed types
#if 0
	#import "MC3DTypes.h"
#else
	struct texCoord
	{
		GLfloat		u;
		GLfloat		v;
	};
	typedef struct texCoord texCoord;
	typedef texCoord* texCoordPtr;

	typedef struct vec2 vec2;
	typedef vec2* vec2Ptr;

	struct vec3
	{
		GLfloat x;
		GLfloat y;
		GLfloat z;
	};

	typedef struct vec3 vec3;
	typedef vec3* vec3Ptr;

	struct vec4
	{
		GLfloat x;
		GLfloat y;
		GLfloat z;
		GLfloat w;
		};

	typedef struct vec4 vec4;
	typedef vec4* vec4Ptr;
	
#endif

struct vertexDataTextured
{
	vec3		vertex;
	vec3		normal;
	texCoord	texCoord;
};
typedef struct vertexDataTextured vertexDataTextured;
typedef vertexDataTextured* vertexDataTexturedPtr;


static const vertexDataTextured MeshVertexData[] = {
	{/*v:*/{1.000000, -0.000000, -1.000000}, /*n:*/{0.000000, 0.999969, 0.000000}, /*t:*/{0.000000, 0.000000}},
	{/*v:*/{-1.000000, -0.000000, -1.000000}, /*n:*/{0.000000, 1.000000, 0.000000}, /*t:*/{1.000000, 0.000000}},
	{/*v:*/{-1.000000, 0.000000, 1.000000}, /*n:*/{0.000000, 1.000000, 0.000000}, /*t:*/{1.000000, 1.000000}},
	{/*v:*/{1.000000, -0.000000, -1.000000}, /*n:*/{0.000000, 0.999969, 0.000000}, /*t:*/{0.000000, 0.000000}},
	{/*v:*/{-1.000000, 0.000000, 1.000000}, /*n:*/{0.000000, 1.000000, 0.000000}, /*t:*/{1.000000, 1.000000}},
	{/*v:*/{1.000000, 0.000000, 1.000000}, /*n:*/{0.000000, 1.000000, 0.000000}, /*t:*/{0.000000, 1.000000}},
};

static const vertexDataTextured MeshVertexData1[] = {
	{/*v:*/{1.000000, -1.000000, -0.000000}, /*n:*/{0.000000, 0.999969, 0.000000}, /*t:*/{0.000000, 0.000000}},
	{/*v:*/{-1.000000, -1.000000, -0.000000}, /*n:*/{0.000000, 1.000000, 0.000000}, /*t:*/{1.000000, 0.000000}},
	{/*v:*/{-1.000000, 1.000000, 0.000000}, /*n:*/{0.000000, 1.000000, 0.000000}, /*t:*/{1.000000, 1.000000}},
	{/*v:*/{1.000000, -1.000000, -0.000000}, /*n:*/{0.000000, 0.999969, 0.000000}, /*t:*/{0.000000, 0.000000}},
	{/*v:*/{-1.000000, 1.000000, 0.000000}, /*n:*/{0.000000, 1.000000, 0.000000}, /*t:*/{1.000000, 1.000000}},
	{/*v:*/{1.000000, 1.000000, 0.000000}, /*n:*/{0.000000, 1.000000, 0.000000}, /*t:*/{0.000000, 1.000000}},
};

// Example OpenGL ES 1.1 Drawing Code:
// glEnableClientState(GL_VERTEX_ARRAY);
// glEnableClientState(GL_TEXTURE_COORD_ARRAY);
// glEnableClientState(GL_NORMAL_ARRAY);
// glVertexPointer(3, GL_FLOAT, sizeof(vertexDataTextured), &MeshVertexData[0].vertex);
// glNormalPointer(GL_FLOAT, sizeof(vertexDataTextured), &MeshVertexData[0].normal);
// glTexCoordPointer(2, GL_FLOAT, sizeof(vertexDataTextured), &MeshVertexData[0].texCoord);
// glDrawArrays(GL_TRIANGLES, 0, sizeof(vertexDataTextured));
// glDisableClientState(GL_VERTEX_ARRAY);
// glDisableClientState(GL_TEXTURE_COORD_ARRAY);
// glDisableClientState(GL_NORMAL_ARRAY);


