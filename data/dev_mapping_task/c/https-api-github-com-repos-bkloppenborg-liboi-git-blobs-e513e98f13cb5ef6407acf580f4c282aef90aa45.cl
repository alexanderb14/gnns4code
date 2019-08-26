__kernel void A(__global float2* a, __global unsigned int* b, __private unsigned int c, __private unsigned int d, __global float* e) {
  size_t f = get_global_id(0);

  unsigned int g = b[f];

  float2 h = a[g];

  if (f < d) {
    e[c + f] = h.s0;
    e[c + d + f] = h.s1;
  }
}