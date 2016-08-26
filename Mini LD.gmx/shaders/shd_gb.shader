//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    mat4 teste = mat4(1.0, 0.0, 0.0, 0.0, 
                      0.0, 1.0, 0.0, 0.0, 
                      0.0, 0.0, 1.0, 0.0, 
                      0.0, 0.0, 0.0, 1.0);
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = teste * gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;
uniform vec2 u_resolution;

vec3 palette[4];
float cmaxpal[4];

void main()
{
    mat4 teste = mat4(2.0, 0.0, 0.0, 0.0, 
                      0.0, 2.0, 0.0, 0.0, 
                      0.0, 0.0, 2.0, 0.0, 
                      0.0, 0.0, 0.0, 1.0);
    mat3 teste2 = mat3(2.0, 0.0, 0.0,
                      0.0, 1.0, 0.0,
                      0.0, 0.0, 1.0);
     vec2 uv = v_vTexcoord;
     palette[0] = vec3(43.0,83.0,59.0)/255.0;
     palette[1] = vec3(89.0,145.0,102.0)/255.0;
     palette[2] = vec3(155.0,204.0,133.0)/255.0;
     palette[3] = vec3(212.0,240.0,196.0)/255.0;
     
     for(int i = 0;i < 4;i++){
        cmaxpal[i] = max(palette[i].x,max(palette[i].y,palette[i].z));
     }
     //uv.x += sin(uv.y*20.0+u_time*2.0)/30.0;
     //uv.y += cos(uv.x*20.0+u_time*2.0)/30.0;
     vec4 col = v_vColour * teste * texture2D( gm_BaseTexture, uv);
     float cmax = max(col.r,max(col.g,col.b));
     
     for(int i = 0; i < 4; i++){
        if(cmax <= cmaxpal[i]){
            col.rgb = palette[i].rgb;
            break;
        }
        col.rgb = palette[i];
     }
     /*if(cmax <= 0.33){
        col.r = 43.0/255.0;
        col.g = 84.0/255.0;
        col.b = 59.0/255.0;
        col.a = 1.0;
     }
     else if(cmax <= 0.60){
        col.r = 89.0/255.0; 
        col.g = 145.0/255.0;
        col.b = 102.0/255.0;
        col.a = 1.0;
     }
     else if(cmax <= 0.89){
        col.r = 155.0/255.0;
        col.g = 204.0/255.0;
        col.b = 133.0/255.0;
        col.a = 1.0;
     }
     else {
        col.r = 212.0/255.0;
        col.g = 240.0/255.0;
        col.b = 196.0/255.0;
        col.a = 1.0;
     }*/
     gl_FragColor = col;
}

