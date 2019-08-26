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

__kernel void B(__global DATA_TYPE* a, __global DATA_TYPE* b, __global DATA_TYPE* c, DATA_TYPE d, DATA_TYPE e, int f, int g) {
  int h = get_global_id(0) + 1;

  if ((h >= 1) && (h < (f + 1))) {
    b[h] = 0.0;

    int i;
    for (i = 1; i < (g + 1); i++) {
      b[h] += (c[i * (f + 1) + h] - a[h]) * (c[i * (f + 1) + h] - a[h]);
    }
    b[h] /= d;
    b[h] = sqrt(b[h]);
    if (b[h] <= e) {
      b[h] = 1.0;
    }
  }
}

__kernel void C(__global DATA_TYPE* a, __global DATA_TYPE* b, __global DATA_TYPE* c, DATA_TYPE d, int e, int f) {
  int g = get_global_id(0) + 1;
  int h = get_global_id(1) + 1;

  if ((h >= 1) && (h < (f + 1)) && (g >= 1) && (g < (e + 1))) {
    c[h * (e + 1) + g] -= a[g];
    c[h * (e + 1) + g] /= (sqrt(d) * b[g]);
  }
}

__kernel void D(__global DATA_TYPE* a, __global DATA_TYPE* b, int c, int d) {
  int e = get_global_id(0) + 1;

  int f, g;
  if ((e >= 1) && (e < c)) {
    a[e * (c + 1) + e] = 1.0;

    for (g = (e + 1); g < (c + 1); g++) {
      for (f = 1; f < (d + 1); f++) {
        a[e * (c + 1) + g] += b[f * (c + 1) + e] * b[f * (c + 1) + g];
      }
      a[g * (c + 1) + e] = a[e * (c + 1) + g];
    }
  }
}