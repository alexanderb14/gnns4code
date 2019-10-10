struct Particle {
  float4 pos;
  float4 vel;
  float4 rand_life;
};

__kernel void A(__global struct Particle* a, float b, float c, float d, int e, int f) {
  const int g = get_global_id(0);

  struct Particle h = a[g];
  h.rand_life.w += d;

  float3 i = h.vel.xyz;
  float j = i.x * i.x + i.y * i.y + i.z * i.z;

  if ((h.rand_life.w > b) || (j < c)) {
    int k = (e + g) % f;
    float3 l = a[k].rand_life.xyz;
  h.vel = (float4)(l
  h.rand_life.w = 0.0f;
  h.pos = (float4)(0,0,0,1);
  } else {
    h.pos.xyz = h.pos.xyz + (h.vel.xyz * d);
    h.vel.y = h.vel.y - (9.81f * d);

    if (h.pos.y <= 0.0f) {
      h.vel.xyz *= 0.75f;
      h.vel.y = -h.vel.y;
    }
  }

  a[g] = h;
}