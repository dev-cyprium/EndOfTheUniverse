shader_type canvas_item;
render_mode unshaded;

uniform float base_opacity;

void fragment() 
{
	vec4 curr_color = texture(TEXTURE,UV);
	COLOR = curr_color * vec4(1, 1, 1, base_opacity);
}