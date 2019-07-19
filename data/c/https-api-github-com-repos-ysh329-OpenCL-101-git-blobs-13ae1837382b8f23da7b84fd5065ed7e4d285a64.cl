__kernel void A(const int a, const int b, __global const float* c, __global float* d) {
  const int e = get_global_id(0);

  for (int f = 0; f < a; f++) {
    d[e * a + f] = c[f * b + e];
  }
}