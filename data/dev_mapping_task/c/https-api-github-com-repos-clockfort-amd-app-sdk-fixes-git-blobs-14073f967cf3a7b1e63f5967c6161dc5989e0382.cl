uint A(uint a, uint b, uint c, uint d, uint e, uint f) {
  uint g = a * e + c;
  uint h = b * e + d;

  return (h * f + g);
}
__kernel void B(__global float* a, __global float* b, __global float* c, __local float* d, const uint e, const uint f, const uint g)

{
  uint h = get_global_id(0);
  uint i = get_global_id(1);

  uint j = get_group_id(0);
  uint k = get_group_id(1);

  uint l = get_local_id(0);
  uint m = get_local_id(1);

  uint n = i * e + h;

  float o = 0.0f;

  for (uint p = 0; p < f; p++) {
    uint q = (g) ? l * f + p : p * f + l;
    uint r = A(j, k, m, p, f, e);

    o += c[q] * b[r];
  }
  d[m * f + l] = o;

  barrier(1);

  o = 0.0f;

  for (uint p = 0; p < f; p++) {
    uint q = l * f + p;
    uint r = (g) ? m * f + p : p * f + m;

    o += d[q] * c[r];
  }
  a[n] = o;
}