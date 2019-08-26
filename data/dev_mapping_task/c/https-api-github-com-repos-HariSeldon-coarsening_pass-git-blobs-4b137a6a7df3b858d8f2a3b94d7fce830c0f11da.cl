typedef float DATA_TYPE; __kernel void A(__global DATA_TYPE* a, __global DATA_TYPE* b, DATA_TYPE c, int d, int e) {
  int f = get_global_id(0) + 1;

  if ((f >= 1) && (f < (d + 1))) {
    a[f] = 0.0;

    int g;
    for (g = 1; g < (e + 1); g++) {
      a[f] += b[g * (d + 1) + f];
    }
    a[f] /= (DATA_TYPE)c;
  }
}

__kernel void B(__global DATA_TYPE* a, __global DATA_TYPE* b, int c, int d) {
  int e = get_global_id(0) + 1;
  int f = get_global_id(1) + 1;

  if ((f >= 1) && (f < (d + 1)) && (e >= 1) && (e < (c + 1))) {
    b[f * (c + 1) + e] -= a[e];
  }
}

__kernel void C(__global DATA_TYPE* a, __global DATA_TYPE* b, int c, int d) {
  int e = get_global_id(0) + 1;
  int f, g;

  if ((e >= 1) && (e < (c + 1))) {
    for (g = e; g < (c + 1); g++) {
      a[e * (c + 1) + g] = 0.0;
      for (f = 1; f < (d + 1); f++) {
        a[e * (c + 1) + g] += b[f * (c + 1) + e] * b[f * (c + 1) + g];
      }
      a[g * (c + 1) + e] = a[e * (c + 1) + g];
    }
  }
}