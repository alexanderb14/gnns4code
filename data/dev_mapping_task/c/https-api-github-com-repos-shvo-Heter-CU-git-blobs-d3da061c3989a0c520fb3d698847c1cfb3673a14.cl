typedef float DATA_TYPE; __kernel void A(__global DATA_TYPE* a, __global DATA_TYPE* b, int c) {
  int d = get_global_id(1);
  int e = get_global_id(0);

  if ((d >= 1) && (d < (c - 1)) && (e >= 1) && (e < (c - 1))) {
    b[d * c + e] = 0.2f * (a[d * c + e] + a[d * c + (e - 1)] + a[d * c + (1 + e)] + a[(1 + d) * c + e] + a[(d - 1) * c + e]);
  }
}

__kernel void B(__global DATA_TYPE* a, __global DATA_TYPE* b, int c) {
  int d = get_global_id(1);
  int e = get_global_id(0);

  if ((d >= 1) && (d < (c - 1)) && (e >= 1) && (e < (c - 1))) {
    a[d * c + e] = b[d * c + e];
  }
}