__kernel void A(__global float* a, __global float* b, __local float* c, const uint d, const uint e, const uint f) {
  uint g = get_global_id(0);
  uint h = get_global_id(1);

  uint i = get_local_id(0);
  uint j = get_local_id(1);

  c[j * f + i] = b[h * d + g];

  barrier(1);

  uint k = get_group_id(0);
  uint l = get_group_id(1);

  uint m = l * f + j;
  uint n = k * f + i;

  uint o = n * e + m;
  uint p = j * f + i;

  a[o] = c[p];
}