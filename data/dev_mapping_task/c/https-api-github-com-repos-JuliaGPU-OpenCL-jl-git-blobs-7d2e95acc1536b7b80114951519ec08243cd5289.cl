__kernel void A(const int a, const int b, const int c, __global float* d, __global float* e, __global float* f) {
  int g, h;
  int i = get_global_id(0);
  float j[1024];
  float k;
  if (i < b) {
    for (g = 0; g < c; g++)
      j[g] = d[i * b + g];
    for (h = 0; h < a; h++) {
      k = 0.0f;
      for (g = 0; g < c; g++)
        k += j[g] * e[g * c + h];
      f[i * b + h] = k;
    }
  }
}