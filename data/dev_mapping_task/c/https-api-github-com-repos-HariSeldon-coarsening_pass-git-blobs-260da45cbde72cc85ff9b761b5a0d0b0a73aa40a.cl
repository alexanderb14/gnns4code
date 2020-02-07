__kernel void A(__global float* a, __global float* b, uint c, uint d) {
  uint e = get_global_id(1);
  uint f = get_global_id(0);

  float g = 0.0f;

  for (uint h = 0; h < c; ++h)
    g += a[c + h];

  b[e * c + f] = g;
}

__kernel void B(const __global float* a, __global float* b, uint c, uint d) {
  uint e = get_global_id(1);
  uint f = get_global_id(0);

  float g = 0.0f;

  for (uint h = 0; h < c; ++h)
    g += a[e + h];

  b[e * c + f] = g;
}