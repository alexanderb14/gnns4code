__kernel void A(__global char* a, __global char* b, int c, int d, int e) {
  int f = get_global_id(0);
  for (int g = 0; g < c; ++g) {
    b[f * c * e + g] = a[f * c * d + g];
  }
}