shader_type canvas_item;

uniform sampler2D gradient;

void fragment(){
	vec4 pixelColor = texture(TEXTURE, UV);
//	vec4 col = texture(gradient, SCREEN_UV.yx * cos(TIME * 1.) * 3.5);
	vec4 shifted_col = pixelColor * texture(gradient, SCREEN_UV * sin(TIME) + 0.3);
	COLOR = shifted_col;
//	COLOR = texture(TEXTURE, UV) * COLOR * col;
}