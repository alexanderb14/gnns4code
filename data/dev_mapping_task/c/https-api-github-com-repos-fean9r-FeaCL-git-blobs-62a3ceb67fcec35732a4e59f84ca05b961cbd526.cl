__kernel void A(__global float4* a, __global float4* b, __global float4* c, __global float4* d, __global float4* e, float f) {
  unsigned int g = get_global_id(0);

  float4 h = a[g];
  float4 i = a[g];
  float4 j = c[g];

  float k = c[g].w;

  k -= f;

  if (k <= 0.f) {
    h = d[g];
    j = e[g];
    k = 10.0f;
  }

  j.z = 1 * f;

  float l = 10;
  float m = 28;
  float n = 8 / 3;

  h.x += (l * (i.y - i.x)) * f;
  h.y += (i.x * (m - i.z) - i.y) * f;
  h.z += (i.x * i.y - n * i.z) * f;

  j.w = k;

  a[g] = h;
  c[g] = j;
}