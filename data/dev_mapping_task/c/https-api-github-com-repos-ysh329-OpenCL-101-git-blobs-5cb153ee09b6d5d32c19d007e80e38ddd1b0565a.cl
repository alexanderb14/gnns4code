__kernel void A(const int a, const int b, __global const float* c, __global float* d) {
  const int e = get_global_id(0);

  if (e < b) {
    for (int f = 0; f < a; f++) {
      d[f * b + e] = c[e * a + f];
    }
  }
}