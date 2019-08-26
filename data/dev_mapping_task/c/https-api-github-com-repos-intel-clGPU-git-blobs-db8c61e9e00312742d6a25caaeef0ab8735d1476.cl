__kernel void A(float a, __global float* b, __global float* c, __global float* d, uint e) {
  const uint f = get_global_id(0);
  const uint g = get_global_id(1);

  const uint h = g * e + f;
  float i = d[h];
  float j = b[f] * c[g];
  i = mad(a, j, i);
  d[h] = i;
}