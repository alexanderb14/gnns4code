__kernel void A(__global const float4* a, __global float4* b, int c, int d, __global uint* e, int f, float16 g) {
  int h = get_global_id(0);

  if (h >= c) {
    return;
  }

  float4 i = a[d + h];

  float4 j;
  j.x = dot(g.lo.lo, i);
  j.y = dot(g.lo.hi, i);
  j.z = dot(g.hi.lo, i);
  j.w = dot(g.hi.hi, i);

  if (j.x < j.w && j.x > -j.w && j.y < j.w && j.y > -j.w && j.z < j.w && j.z > -j.w) {
    uint k = atomic_add(&e[f], 1);

    b[d + k] = i;
  }
}