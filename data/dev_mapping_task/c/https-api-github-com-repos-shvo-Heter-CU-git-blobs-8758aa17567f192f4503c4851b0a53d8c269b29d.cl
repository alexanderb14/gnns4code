typedef float DATA_TYPE; __kernel void A(__global DATA_TYPE* a, __global DATA_TYPE* b) {
  int c = get_global_id(0);

  if (c > 0 & c < 16383) {
    b[c] = 0.33333 * (a[c - 1] + a[c] + a[c + 1]);
  }
  barrier(1);

  a[c] = b[c];
}