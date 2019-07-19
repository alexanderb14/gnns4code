typedef float DATA_TYPE; __kernel void A(__global DATA_TYPE* a, __global DATA_TYPE* b, __global DATA_TYPE* c, int d, int e, int f) {
  int g = get_global_id(0);
  int h = get_global_id(1);

  if ((h < d) && (g < e)) {
    int i;
    for (i = 0; i < f; i++) {
      c[h * e + g] += a[h * f + i] * b[i * e + g];
    }
  }
}

__kernel void B(__global DATA_TYPE* a, __global DATA_TYPE* b, __global DATA_TYPE* c, int d, int e, int f) {
  int g = get_global_id(0);
  int h = get_global_id(1);

  if ((h < d) && (g < e)) {
    int i;
    for (i = 0; i < f; i++) {
      c[h * e + g] += a[h * f + i] * b[i * e + g];
    }
  }
}