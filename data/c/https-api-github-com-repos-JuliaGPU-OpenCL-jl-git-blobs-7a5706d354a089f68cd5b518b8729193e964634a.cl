__kernel void A(const int a, const int b, const int c, __global float* d, __global float* e, __global float* f, __local float* g) {
  int h, i;
  int j = get_global_id(0);
  int k = get_local_id(0);
  int l = get_local_size(0);
  float m[1024];
  float n;
  if (j < b) {
    for (h = 0; h < c; h++)
      m[h] = d[j * b + h];
    for (i = 0; i < a; i++) {
      for (h = k; h < c; h += l)
        g[h] = e[h * c + i];
      barrier(1);
      n = 0.0f;
      for (h = 0; h < c; h++)
        n += m[h] * g[h];
      f[j * b + i] = n;
      barrier(1);
    }
  }
}