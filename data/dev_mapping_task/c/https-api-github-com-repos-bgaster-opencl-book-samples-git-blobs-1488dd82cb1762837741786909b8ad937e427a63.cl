__kernel void A(__global int* a, __global int* b, __global float* c, __global int* d, __global float* e, __global float* f, int g, int h) {
  int i = get_global_id(0);

  if (d[i] != 0) {
    d[i] = 0;

    int j = a[i];
    int k;
    if (i + 1 < (g)) {
      k = a[i + 1];
    } else {
      k = h;
    }

    for (int l = j; l < k; l++) {
      int m = b[l];

      if (f[m] > (e[i] + c[l])) {
        f[m] = (e[i] + c[l]);
      }
    }
  }
}

__kernel void B(__global int* a, __global int* b, __global float* c, __global int* d, __global float* e, __global float* f, int g) {
  int h = get_global_id(0);

  if (e[h] > f[h]) {
    e[h] = f[h];
    d[h] = 1;
  }

  f[h] = e[h];
}

__kernel void C(__global int* a, __global float* b, __global float* c, int d, int e) {
  int f = get_global_id(0);

  if (d == f) {
    a[f] = 1;
    b[f] = 0.0;
    c[f] = 0.0;
  } else {
    a[f] = 0;
    b[f] = 0x1.fffffep127f;
    c[f] = 0x1.fffffep127f;
  }
}