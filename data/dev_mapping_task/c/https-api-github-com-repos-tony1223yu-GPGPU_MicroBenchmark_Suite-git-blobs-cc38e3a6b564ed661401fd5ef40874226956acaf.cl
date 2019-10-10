__kernel void A(__global int* a, __global int* b, __global int* c, int d, int e, __local int* f, int g) {
  int h;
  int i = get_global_id(0);
  int j = get_global_id(1);
  int k = get_local_id(0);
  int l = get_local_id(1);

  h = 0;
  for (int m = 0; m < e / g; m++) {
    f[l * g + k] = b[(m * g + l) * d + i];
    barrier(1);

    for (int n = 0; n < g; n++) {
      h += a[j * e + m * g + n] * f[n * g + k];
    }
    barrier(1);
  }
  c[j * d + i] = h;
}

__kernel void B(__global float* a, __global float* b, __global float* c, int d, int e, __local int* f, int g) {
  float h;
  int i = get_global_id(0);
  int j = get_global_id(1);
  int k = get_local_id(0);
  int l = get_local_id(1);

  h = 0.0f;
  for (int m = 0; m < e / g; m++) {
    f[l * g + k] = b[(m * g + l) * d + i];
    barrier(1);

    for (int n = 0; n < g; n++) {
      h += a[j * e + m * g + n] * f[n * g + k];
    }
    barrier(1);
  }
  c[j * d + i] = h;
}

__kernel void C(__global double* a, __global double* b, __global double* c, int d, int e, __local int* f, int g) {
  double h;
  int i = get_global_id(0);
  int j = get_global_id(1);
  int k = get_local_id(0);
  int l = get_local_id(1);

  h = 0.0;
  for (int m = 0; m < e / g; m++) {
    f[l * g + k] = b[(m * g + l) * d + i];
    barrier(1);

    for (int n = 0; n < g; n++) {
      h += a[j * e + m * g + n] * f[n * g + k];
    }
    barrier(1);
  }
  c[j * d + i] = h;
}