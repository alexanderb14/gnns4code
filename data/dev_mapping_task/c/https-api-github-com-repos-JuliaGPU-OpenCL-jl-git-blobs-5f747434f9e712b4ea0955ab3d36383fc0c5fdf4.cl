__kernel void A(const int a, const int b, const int c, __global float* d, __global float* e, __global float* f) {
  int g;
  int h = get_global_id(0);
  int i = get_global_id(1);
  float j;
  if ((h < b) && (i < a)) {
    j = 0.0f;
    for (g = 0; g < c; g++)
      j += d[h * b + g] * e[g * c + i];
    f[h * b + i] = j;
  }
}