__kernel void A(__global int* a, __global int* b, int c, int d) {
  int e = (int)get_global_id(0);
  int f = (int)get_global_id(1);

  if (f < c && e < d) {
    int g = a[f * d + e];
    if (0 <= g && g <= 255) {
      atomic_add(&(b[g]), 1);
    }
  }
}