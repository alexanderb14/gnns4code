typedef struct {
  float2 vel;
  float mass;
  float dummy;
} Particle;

__kernel void A(__global Particle* a, __global float2* b, const float2 c, const float2 d) {
  int e = get_global_id(0);
  __global Particle* f = &a[e];

  float2 g = c - b[e];
  float h = 1.0f / dot(g, g);
  g *= 300.0f * h;

  f->vel += (d * 0.5f - b[e]) * 0.007f - g * f->mass;

  float i = dot(f->vel, f->vel);
  if (i < 0.1f)
    b[e] = c + g * (1.0f + f->mass);

  b[e] += f->vel;
  f->vel *= 0.95f;
}