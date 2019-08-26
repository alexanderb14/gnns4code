typedef float DATA_TYPE; __kernel void A(__global DATA_TYPE* a, __global DATA_TYPE* b, __global DATA_TYPE* c, DATA_TYPE d, DATA_TYPE e, int f, int g) {
  int h = get_global_id(0);
  int i = get_global_id(1);

  if ((i < g) && (h < g)) {
    c[i * g + h] *= e;

    int j;
    for (j = 0; j < f; j++) {
      c[i * g + h] += d * a[i * f + j] * b[h * f + j] + d * b[i * f + j] * a[h * f + j];
    }
  }
}