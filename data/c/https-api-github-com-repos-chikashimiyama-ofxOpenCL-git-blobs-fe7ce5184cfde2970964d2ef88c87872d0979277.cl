__kernel void A(__global const int* a, __global const int* b, __global int* c) {
  int d = get_global_id(0);
  int e = b[d];
  for (int f = 0; f < 512; f++) {
    int g = a[f] * e;
    c[d + f] += g;
  }
}