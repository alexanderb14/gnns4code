__kernel void A(__global float* a, __global float* b, const unsigned int c) {
  int d = get_global_id(0);
  b[d] = a[d] * a[d];

  for (unsigned e = 0; e < 10; ++e) {
    barrier(1);
    b[d] -= c;
    barrier(1);
  }
}