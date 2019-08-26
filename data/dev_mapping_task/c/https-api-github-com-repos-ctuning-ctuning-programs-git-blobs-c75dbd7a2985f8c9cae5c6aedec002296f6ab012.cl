typedef float DATA_TYPE; __kernel void A(__global DATA_TYPE* a, __global DATA_TYPE* b, __global DATA_TYPE* c, int d, int e) {
  int f = get_global_id(0);

  if (f < d) {
    c[f] = 0.0;

    int g;
    for (g = 0; g < e; g++) {
      c[f] += a[f * e + g] * b[g];
    }
  }
}

__kernel void B(__global DATA_TYPE* a, __global DATA_TYPE* b, __global DATA_TYPE* c, int d, int e) {
  int f = get_global_id(0);

  if (f < e) {
    c[f] = 0.0;

    int g;
    for (g = 0; g < d; g++) {
      c[f] += a[g * e + f] * b[g];
    }
  }
}