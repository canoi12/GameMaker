//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec3 v_vPosition;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vPosition = (gm_Matrices[MATRIX_WORLD] * object_space_pos).xyz;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec3 v_vPosition;
varying vec4 v_vColour;

uniform vec2 u_uEntity;

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main()
{

    float L = length(u_mouse - v_vPosition.xy)/60.;
    gl_FragColor = (v_vColour * texture2D( gm_BaseTexture, v_vTexcoord )) / vec4(L,L,L,1);
}

