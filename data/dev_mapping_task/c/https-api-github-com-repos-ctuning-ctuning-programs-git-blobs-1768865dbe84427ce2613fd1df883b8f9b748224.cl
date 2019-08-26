typedef float DATA_TYPE; __kernel void A(__global DATA_TYPE* a, __global DATA_TYPE* b, __global DATA_TYPE* c, __global DATA_TYPE* d, __global DATA_TYPE* e, DATA_TYPE f, DATA_TYPE g, int h) {
  int i = get_global_id(0);

  if (i < h) {
    int j;
    for (j = 0; j < h; j++) {
      e[i] += a[i * h + j] * c[j];
      d[i] += b[i * h + j] * c[j];
    }
    d[i] = f * e[i] + g * d[i];
  }
}