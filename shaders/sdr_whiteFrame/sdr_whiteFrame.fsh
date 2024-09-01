//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	gl_FragColor = vec4(0.9,1.0,0.5,color.a);
	//gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
