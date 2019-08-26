__kernel void A(__global double* a, int b) {
  long c = 1;
  for (long d = b; d > 0; d >>= 1) {
    a[get_global_id(0)] = 0.0;
    c *= 2;
  }
}