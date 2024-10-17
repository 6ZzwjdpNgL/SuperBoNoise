//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 gm_pSurfaceDimensions;
uniform float gm_pPreMultiplyAlpha;
uniform float g_Threshold;

void main()
{
	float xoffset = 1.0 / gm_pSurfaceDimensions.x;
	float yoffset = 1.0 / gm_pSurfaceDimensions.y;
	
	vec4 texcol = texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 texcol_right = texture2D( gm_BaseTexture, vec2(v_vTexcoord.x + xoffset, v_vTexcoord.y) );
	vec4 texcol_down = texture2D( gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + yoffset) );
	
	vec4 diffx = abs(texcol_right - texcol);
	vec4 diffy = abs(texcol_down - texcol);	
	diffx -= g_Threshold;
	diffy -= g_Threshold;
	diffx *= 1.0 / (1.0 - g_Threshold);
	diffy *= 1.0 / (1.0 - g_Threshold);
	
	vec4 outcol = max(diffx, diffy);

	if (gm_pPreMultiplyAlpha > 0.0)
	{
		outcol.a = max(outcol.a, max(outcol.r, max(outcol.g, outcol.b)));
	}
	else
	{
		outcol.a = 1.0;
	}
		
    gl_FragColor = outcol;
}
