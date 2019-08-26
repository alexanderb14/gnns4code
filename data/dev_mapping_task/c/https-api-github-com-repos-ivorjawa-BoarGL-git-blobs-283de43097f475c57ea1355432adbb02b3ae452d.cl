__kernel void A(__global float4* a, __global float4* b, __global float4* c, __global float4* d, __global float4* e, float f) {
  unsigned int g = get_global_id(0);

  float4 h = a[g];
  float4 i = c[g];

  float j = c[g].w;

  j -= f;

  if (j <= 0.f) {
    h = d[g];
    i = e[g];
    j = 1.8f;
  }

  float k = .5;
  i.z -= 9.8f * f * k;

  h.x += i.x * f;
  h.y += i.y * f;
  h.z += i.z * f;

  i.w = j;

  a[g] = h;
  c[g] = i;

  b[g].w = j;
}