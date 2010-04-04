#version 110

uniform float timer;

attribute vec4 position;

varying vec2 texcoord;
varying float fade_factor;

void main()
{
    const mat4 projection = mat4(
        vec4(3.0/4.0, 0.0, 0.0, 0.0),
        vec4(    0.0, 1.0, 0.0, 0.0),
        vec4(    0.0, 0.0, 0.5, 0.5),
        vec4(    0.0, 0.0, 0.0, 1.0)
    );

    mat4 rotation = mat4(
        vec4(1.0,         0.0,         0.0, 0.0),
        vec4(0.0,  cos(timer),  sin(timer), 0.0),
        vec4(0.0, -sin(timer),  cos(timer), 0.0),
        vec4(0.0,         0.0,         0.0, 1.0)
    );
    mat4 scale = mat4(
        vec4(4.0/3.0, 0.0, 0.0, 0.0),
        vec4(    0.0, 1.0, 0.0, 0.0),
        vec4(    0.0, 0.0, 1.0, 0.0),
        vec4(    0.0, 0.0, 0.0, 1.0)
    );

    gl_Position = projection * rotation * scale * position;
    texcoord = position.xy * vec2(0.5) + vec2(0.5);
    fade_factor = sin(timer) * 0.5 + 0.5;
}
