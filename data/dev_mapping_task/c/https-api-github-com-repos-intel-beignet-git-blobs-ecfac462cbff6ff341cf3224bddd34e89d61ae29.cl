typedef float2 vec2; typedef float3 vec3; typedef float4 vec4; vec3 A(vec3 a, vec3 b) {
  return a - 2.0f * dot(b, a) * b;
}

uint B(float4 a) {
  uint b;
  b = (((uint)a.x)) | (((uint)a.y) << 8) | (((uint)a.z) << 16);
  return b;
}
float C(vec3 a) {
  float b = (sin(a.x) + a.y * .25f) * .35f;
  a = (vec3)(cos(b) * a.x - sin(b) * a.y, sin(b) * a.x + cos(b) * a.y, a.z);
  return dot(cos(a) * cos(a), (vec3)(1.f)) - 1.2f;
}

vec3 D(vec3 a, vec3 b) {
  float c = 0.0f;
  float d = 0.2f;
  float e = 0.0f;
  float f = 0.0f;
  for (int g = 0; g < 50; g++) {
    e = C(a + b * c);
    if (e > 0.0f) {
      f = e;
      c += d;
    }
  }

  if (e > 0.0f)
    return (vec3)(.93f, .94f, .85f);

  c = c - d * e / (e - f);

  vec3 h = (vec3)(0.1f, 0.0f, 0.0f);
  vec3 i = (vec3)(0.0f, 0.1f, 0.0f);
  vec3 j = (vec3)(0.0f, 0.0f, 0.1f);
  vec3 k = a + b * c;
    vec3 l=-fast_normalize((vec3)(C(k+C(k+C(k+j(vec3)((sin(k*75.f)))*.01f);

    return (vec3)(mix( ((max(-dot(l,(vec3)(.577f)),0.f) + 0.125f*max(-dot(l,(vec3)(-.707f,-.707f,0.f)),0.f)))*(fmod
    (fast_length(k.xy)*20.f,2.f)<1.0f?(vec3)(.71f,.85f,.25f):(vec3)(.79f,.93f,.4f))
                           ,(vec3)(.93f,.94f,.85f), (vec3)(__clc_pow(c/9.f,5.f)) ) );
}
__kernel void E(__global uint* a, float b, float c, int d) {
  vec2 e = (vec2)(get_global_id(0), get_global_id(1));

  vec2 f;
  f.x = -1.0f + 2.0f * e.x / b;
  f.y = -1.0f + 2.0f * e.y / c;
  vec4 g = (vec4)(D((vec3)(sin(1.f * 1.5f) * .5f, cos(1.f) * .5f, 1.f), fast_normalize((vec3)(f.xy, 1.0f))), 1.0f);
  do {
    const vec4 h = 255.f * max(min(g, (vec4)(1.f)), (vec4)(0.f));
    a[get_global_id(0) + get_global_id(1) * d] = B(h);
  } while (0);
}