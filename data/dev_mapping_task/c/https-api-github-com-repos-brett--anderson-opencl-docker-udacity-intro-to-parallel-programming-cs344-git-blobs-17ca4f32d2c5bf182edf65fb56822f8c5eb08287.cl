__kernel void A(const int a, __global float* b, __global float* c, __global float* d) {
  int e, f;
  int g = get_global_id(0);
  float h[1024];
  float i;
  if (g < a) {
    for (e = 0; e < a; e++)
      h[e] = b[g * a + e];

    for (f = 0; f < a; f++) {
      i = 0.0f;
      for (e = 0; e < a; e++)
        i += h[e] * c[e * a + f];
      d[g * a + f] = i;
    }
  }
}