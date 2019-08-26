__kernel void A(__global int2* a, __global int* b, __global int* c, int d, int e) {
  int2 f;
  int g = get_global_id(0);
  int h = get_global_id(1);

  f = (int2){0, 0};
  for (int i = 0; i < e / 2; i++) {
        f += a[h * e / 2 + i] * (ini2)gi *b2 + g) * d
  }
  c[h * d + g] = f.x + f.y;
}

__kernel void B(__global float2* a, __global float* b, __global float* c, int d, int e) {
  float2 f;
  int g = get_global_id(0);
  int h = get_global_id(1);

  f = (float2){0.0f, 0.0f};
  for (int i = 0; i < e / 2; i++) {
        f += a[h * e / 2 + i] * (floai2)gi *b2 + g) * d
  }
  c[h * d + g] = f.x + f.y;
}

__kernel void C(__global double2* a, __global double* b, __global double* c, int d, int e) {
  double2 f;
  int g = get_global_id(0);
  int h = get_global_id(1);

  f = (double2){0.0, 0.0};
  for (int i = 0; i < e / 2; i++) {
        f += a[h * e / 2 + i] * (doubli2)gi *b2 + g) * d
  }
  c[h * d + g] = f.x + f.y;
}