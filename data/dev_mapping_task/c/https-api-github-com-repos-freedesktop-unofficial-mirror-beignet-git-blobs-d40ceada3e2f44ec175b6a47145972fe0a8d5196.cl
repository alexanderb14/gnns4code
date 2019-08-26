float3 A(float3 a, float3 b) {
  union {
    float3 f3;
    float farray[4];
  } c, d, e;
  c.f3 = a;
  d.f3 = b;
  int f;
  for (f = 0; f < 3; f++)
    e.farray[f] = __clc_pow(c.farray[f], d.farray[f]);
  return e.f3;
}

__kernel void B(__global float* a, __global float* b) {
  int c = get_global_id(0);
  float3 d = vload3(c, a);
  float3 e = (float3)(1.f, 2.f, 3.f);
  float3 f = A(d, e);
  vstore3(f, c, b);
}