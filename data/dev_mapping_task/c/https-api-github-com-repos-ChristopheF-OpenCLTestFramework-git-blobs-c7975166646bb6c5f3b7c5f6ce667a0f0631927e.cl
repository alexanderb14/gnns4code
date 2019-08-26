__kernel void A(__global const float* a, const long b, __global float* c) {
  long d = get_global_id(0) << b;
  long e = 1 << b;
  long f;

  for (f = 0; f < e; f++)
    c[d + f] = a[d + f];
}