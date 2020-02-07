__kernel void A(const int a, __global float* b, __global float* c, __global float* d) {
  int e;
  int f = get_global_id(0);
  int g = get_global_id(1);
  float h;
  if ((f < a) && (g < a)) {
    h = 0.0;
    for (e = 0; e < a; e++)
      h += b[f * a + e] * c[e * a + g];
    d[f * a + g] = h;
  }
}