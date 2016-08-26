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
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

//uniform vec2 stepSize;

void main()
{
    vec2 stepSize = vec2(0.003,0.003);
    float alpha = 4.0*texture2D(gm_BaseTexture, v_vTexcoord).a;
    alpha -= texture2D(gm_BaseTexture, v_vTexcoord + vec2(stepSize.x,0.0)).a;
    alpha -= texture2D(gm_BaseTexture, v_vTexcoord + vec2(-stepSize.x,0.0)).a;
    alpha -= texture2D(gm_BaseTexture, v_vTexcoord + vec2(0.0,stepSize.y)).a;
    alpha -= texture2D(gm_BaseTexture, v_vTexcoord + vec2(0.0,-stepSize.y)).a;
    
    /*alpha -= texture2D(gm_BaseTexture, v_vTexcoord + vec2(-stepSize.x,-stepSize.y)).a;
    alpha -= texture2D(gm_BaseTexture, v_vTexcoord + vec2(-stepSize.x,stepSize.y)).a;
    alpha -= texture2D(gm_BaseTexture, v_vTexcoord + vec2(stepSize.x,-stepSize.y)).a;
    alpha -= texture2D(gm_BaseTexture, v_vTexcoord + vec2(stepSize.x,stepSize.y)).a;*/
    
    vec2 uv = v_vTexcoord;
    //uv.x = stepSize.x;
    vec4 col = vec4(0.0,0.0,0.0,alpha);
    gl_FragColor = col;
}

