typedef struct {
  float4 target;
  float speed;
  float dummy1;
  float dummy2;
  float dummy3;
} Particle;

__kernel void A(__global Particle* a, __global float4* b) {
  int c = get_global_id(0);
  __global Particle* d = &a[c];
  __global float4* e = &b[c];

  float4 f = d->target - *e;
  *e += f * d->speed;
}