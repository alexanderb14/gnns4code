__kernel void A(__global float* a, __global float* b, int c) {
  const int d = get_global_id(0);
  const int e = get_global_size(0);

  float f = 0;

  for (int g = d; g < c; g += e)
    f += b[g];

  a[d] = f;
}