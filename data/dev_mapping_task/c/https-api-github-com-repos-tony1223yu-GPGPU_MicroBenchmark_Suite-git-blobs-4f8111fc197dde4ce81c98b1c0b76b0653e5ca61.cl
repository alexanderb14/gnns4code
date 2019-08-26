__kernel void A(__global int* a, __global int* b, __global int* c, int d, int e, __local int* f, __local int* g, int h) {
  int i;
  int j = get_global_id(0);
  int k = get_global_id(1);
  int l = get_local_id(0);
  int m = get_local_id(1);

  i = 0;
  for (int n = 0; n < e / h; n++) {
    f[m * h + l] = a[k * d + n * h + l];
    g[m * h + l] = b[(n * h + m) * d + j];
    barrier(1);

    for (int o = 0; o < h; o++) {
      i += f[m * h + o] * g[o * h + l];
    }
    barrier(1);
  }
  c[k * d + j] = i;
}

__kernel void B(__global float* a, __global float* b, __global float* c, int d, int e, __local int* f, __local int* g, int h) {
  float i;
  int j = get_global_id(0);
  int k = get_global_id(1);
  int l = get_local_id(0);
  int m = get_local_id(1);

  i = 0.0f;
  for (int n = 0; n < e / h; n++) {
    f[m * h + l] = a[k * d + n * h + l];
    g[m * h + l] = b[(n * h + m) * d + j];
    barrier(1);

    for (int o = 0; o < h; o++) {
      i += f[m * h + o] * g[o * h + l];
    }
    barrier(1);
  }
  c[k * d + j] = i;
}

__kernel void C(__global double* a, __global double* b, __global double* c, int d, int e, __local int* f, __local int* g, int h) {
  double i;
  int j = get_global_id(0);
  int k = get_global_id(1);
  int l = get_local_id(0);
  int m = get_local_id(1);

  i = 0.0;
  for (int n = 0; n < e / h; n++) {
    f[m * h + l] = a[k * d + n * h + l];
    g[m * h + l] = b[(n * h + m) * d + j];
    barrier(1);

    for (int o = 0; o < h; o++) {
      i += f[m * h + o] * g[o * h + l];
    }
    barrier(1);
  }
  c[k * d + j] = i;
}