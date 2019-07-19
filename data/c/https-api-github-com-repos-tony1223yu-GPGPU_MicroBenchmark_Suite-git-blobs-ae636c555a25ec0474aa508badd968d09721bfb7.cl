__kernel void A(__global int* a, __global int* b, __global int* c, int d, int e) {
  int f;
  int g = get_global_id(1);
  int h = get_global_id(0);

  f = 0;
  for (int i = 0; i < e; i++) {
    f += a[h * e + i] * b[i * d + g];
  }
  c[h * d + g] = f;
}

__kernel void B(__global float* a, __global float* b, __global float* c, int d, int e) {
  float f;
  int g = get_global_id(1);
  int h = get_global_id(0);

  f = 0.0f;
  for (int i = 0; i < e; i++) {
    f += a[h * e + i] * b[i * d + g];
  }
  c[h * d + g] = f;
}

__kernel void C(__global double* a, __global double* b, __global double* c, int d, int e) {
  double f;
  int g = get_global_id(1);
  int h = get_global_id(0);

  f = 0.0;
  for (int i = 0; i < e; i++) {
    f += a[h * e + i] * b[i * d + g];
  }
  c[h * d + g] = f;
}