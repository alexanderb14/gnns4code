typedef float DATA_TYPE; __kernel void A(__global DATA_TYPE* a, __global DATA_TYPE* b, __global DATA_TYPE* c, int d, int e) {
  int f = get_global_id(0);

  if (f < d) {
    int g;
    for (g = 0; g < e; g++) {
      c[f] += a[f * e + g] * b[g];
    }
  }
}

__kernel void B(__global DATA_TYPE* a, __global DATA_TYPE* b, __global DATA_TYPE* c, int d, int e) {
  int f = get_global_id(0);

  if (f < e) {
    int g;
    for (g = 0; g < d; g++) {
      b[f] += a[g * e + f] * c[g];
    }
  }
}