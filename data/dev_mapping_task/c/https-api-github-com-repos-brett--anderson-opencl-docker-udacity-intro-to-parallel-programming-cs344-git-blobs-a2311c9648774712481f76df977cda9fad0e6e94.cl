__kernel void A(const int a, __global float* b, __global float* c, __global float* d) {
  int e, f;
  int g = get_global_id(0);
  float h;
  if (g < a) {
    for (f = 0; f < a; f++) {
      h = 0.0;
      for (e = 0; e < a; e++)
        h += b[g * a + e] * c[e * a + f];
      d[g * a + f] = h;
    }
  }
}