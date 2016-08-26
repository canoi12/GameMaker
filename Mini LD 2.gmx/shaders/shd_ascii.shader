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

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

//#define HAS_GREENSCREEN
float character(float n, vec2 p){
    p = floor(p*vec2(4.0,-4.0) + 2.5);
    if (clamp(p.x, 0.0, 4.0) == p.x && clamp(p.y, 0.0, 4.0) == p.y)
    {
        if (int(mod(n/exp2(p.x + 5.0*p.y), 2.0)) == 1) return 1.0;
    }
    return 0.0;
}

void main()
{
    float raio = 150.0;
    vec2 uv = v_vTexcoord.xy*u_resolution.xy;
    vec2 vish = v_vTexcoord;
    float dist = sqrt(((u_mouse.x - uv.x)*(u_mouse.x - uv.x))+((u_mouse.y - uv.y)*(u_mouse.y - uv.y)));
    vec2 n_mouse = vec2(u_mouse)/u_resolution;
    /*if(dist < raio){
        vish.x /= 2.0;
        vish.y /= 2.0;
        //vish.y += fract(vish.x*20.0+u_time*5.0)/30.0;
        //col.r = 0.5
    }*/
    vec3 col = texture2D( gm_BaseTexture, vish).rgb;
    
    //#ifdef HAS_GREENSCREEN
    float gray = (col.r + col.b)/2.0;
    /*#else
    float gray = (col.r + col.g + col.b)/3.0;
    #endif*/
    
    float n =  65536.0;             // .
    if (gray > 0.2) n = 65600.0;    // :
    if (gray > 0.3) n = 332772.0;   // *
    if (gray > 0.4) n = 15255086.0; // o 
    if (gray > 0.5) n = 23385164.0; // &
    if (gray > 0.6) n = 15252014.0; // 8
    if (gray > 0.7) n = 13199452.0; // @
    if (gray > 0.8) n = 11512810.0; // #
    
    vec2 p = mod(uv/4.0, 2.0) - vec2(1.0);
    //col += gray;
    col = col*character(n, p);
    
    //col += col*mod(col,0.5);
    
    gl_FragColor = vec4(col,1.0);
}

