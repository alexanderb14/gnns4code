__kernel void A(const int a, __global float* b, __global float* c, __global float* d, __local float* e) {
  int f, g;
  int h = get_global_id(0);
  int i = get_local_id(0);
  int j = get_local_size(0);
  float k[1024];
  float l;
  if (h < a) {
    for (f = 0; f < a; f++)
      k[f] = b[h * a + f];

    for (g = 0; g < a; g++) {
      barrier(1);
      for (f = i; f < a; f += j)
        e[f] = c[f * a + g];
      barrier(1);
      l = 0.0f;
      for (f = 0; f < a; f++)
        l += k[f] * e[f];
      d[h * a + g] = l;
      barrier(1);
    }
  }
}