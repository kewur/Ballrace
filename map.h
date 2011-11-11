
#import "CommonOpenGL.h"

struct PositionAndColor
{
    EGVertex3D	position;
	EGColor		color;

	
};

typedef struct PositionAndColor PositionAndColor;

static const PositionAndColor PositionsAndColors[] = {
     {{30.6,0,66.6},{1,1,0,1}},
     {{28.4,0,66.6},{0,0,1,1}},
     {{26.2,0,66.6},{1,0,1,1}}, 
     {{24,0,66.6},{0,1,0,1}},


     {{2,0,66.6},{1,0,1,1}}, 
    // {{-0.2,0,66.6},{0,1,0,1}},
     {{-4.6,0,66.6},{0,1,0,1}},
   //  {{-6.8,0,66.6},{1,0,1,1}}, 

    
    {{23.4,0,83.6},{1,1,0,1}},
    {{23.4,0,81.4},{0,0,1,1}},
    {{23.4,0,79.2},{1,0,1,1}}, 
    {{23.4,0,77.0},{0,1,0,1}},
    
    {{16.4,0,85.6},{1,0,0,1}},
    {{14.2,0,85.6},{1,0,1,1}}, 
    
    {{4.2,0,92.6},{0,0,1,1}},
   // {{2.0,0,92.6},{1,0,0,1}},
    
    {{-12.6,0,77.6},{1,0,0,1}},
    {{-9.4,0,77.6},{1,0,1,1}},
    {{-14.8,0,77.6},{0,0,1,1}},
    
      {{-4.6,0,98.4},{0,1,0,1}},
    {{-4.6,0,93.0},{0,1,0,1}},
    
    
    {{-26.2,0,92},{0,0,1,1}}, 
    {{-24,0,77},{0,1,0,1}},
    {{-4.6,0,100.6},{1,0,1,1}}, 

    
    
};

#define Map1 24

static const PositionAndColor PositionsAndColors2[] = {

   // {{2,0,66.6},{1,0,1,1}}, 
    {{-0.2,0,66.6},{0,1,0,1}},
    {{-2.4,0,66.6},{0,0,1,1}},

    {{10,0,83.6},{1,1,0,1}},
    {{10.0,0,82.4},{0,0,1,1}},
    {{10.0,0,80.2},{1,0,1,1}}, 
    {{10.0,0,78.0},{0,1,0,1}},
    
    {{-15.4,0,95.6},{1,0,0,1}},
    {{-13.2,0,95.6},{1,0,1,1}}, 
    
   // {{4.2,0,110.6},{0,1,0,1}},
   // {{2.0,0,110.6},{1,0,0,1}},
    
   
    {{19.4,0,120.6},{1,0,1,1}},
    {{14.8,0,120.6},{0,0,1,1}},
    
    {{-4.6,0,93.6},{1,0,1,1}}, 
    {{-4.6,0,91.4},{0,1,0,1}},
    {{-4.6,0,89.2},{1,0,0,1}},
    {{-4.6,0,87.0},{0,1,0,1}},
    {{16.6,0,120.6},{1,0,0,1}},
    
};
#define Map2 18
static const PositionAndColor PositionsAndColors3[] = {
    

    //FIRST RIGHT SET
    {{7.6,0,77.6},{1,0,0,1}},
   // {{5.4,0,77.6},{1,0,1,1}},
    {{9.8,0,77.6},{1,0,1,1}},
       
    {{-13.4,0,66.6},{1,0,0,1}},
    {{-11.2,0,66.6},{0,1,0,1}}, 
    
    {{-8.0,0,66.6},{1,1,0,1}}, 
    
    {{4.2,0,85},{0,1,0,1}},
    {{2.0,0,85},{1,0,0,1}},
    
 //   {{15.6,0,99.6},{1,0,0,1}},
    {{9.4,0,99},{1,0,1,1}},
    {{14.8,0,99},{0,0,1,1}},
    
    {{-4.6,0,93.6},{1,0,1,1}}, 
    {{-4.6,0,91.4},{0,1,0,1}},
    {{-4.6,0,89.2},{1,0,0,1}},
    {{-4.6,0,87.0},{0,1,0,1}},
   
    
};

#define Map3 15

static const PositionAndColor PositionsAndColors4[] = {
    
       {{0,0,66.6},{1,0,0,1}},
    //FIRST RIGHT SET

    {{-7.4,0,66.6},{1,0,0,1}},
    //{{-5.2,0,66.6},{0,1,0,1}}, 
    
    {{-8.0,0,80},{1,1,0,1}}, 
    
    {{4.2,0,85},{0,1,0,1}},
    //{{2.0,0,85},{1,0,0,1}},
    
    {{15.6,0,99.6},{1,0,0,1}},
    {{13.4,0,102},{1,0,1,1}},

    
    
    {{-26.2,0,85},{0,0,1,1}}, 
    {{-24,0,77},{0,1,0,1}},
    {{17.8,0,105},{0,0,1,1}},
    
};

#define Map4 9

static const PositionAndColor PositionsAndColors5[] = {
    
    
    //FIRST RIGHT SET
    
    {{-7.4,0,66.6},{1,0,0,1}},
    //{{-5.2,0,66.6},{0,1,0,1}}, 
    
    {{-8.0,0,80},{1,1,0,1}}, 
    
   // {{4.2,0,85},{0,1,0,1}},
    {{2.0,0,85},{0,0,1,1}},
    
    {{15.6,0,99.6},{1,0,0,1}},
    {{13.4,0,102},{1,0,1,1}},

    
    {{30.6,0,66.6},{1,0,0,1}},
    {{28.4,0,69},{0,1,0,1}},
    {{26.2,0,74},{0,0,1,1}}, 
    {{24,0,77},{0,1,0,1}},

    {{-26.2,0,74},{0,0,1,1}}, 
    {{-24,0,77},{0,1,0,1}},
    {{17.8,0,105},{0,0,1,1}},
    
};

#define Map5 13


static const PositionAndColor PositionsAndColors6[] = {
    
    
    //FIRST RIGHT SET
    
    {{-3.4,0,66.6},{1,0,0,1}},
    //{{-5.2,0,66.6},{0,1,0,1}}, 
    
    {{-9.0,0,80},{1,1,0,1}}, 
    
    
    {{0,0,85},{1,0,0,1}},

    
    {{-26.2,0,102},{0,0,1,1}}, 
    {{-24,0,69},{0,1,0,1}},
    //{{4.2,0,85},{0,1,0,1}},
    
    
    
};

#define Map6 6
