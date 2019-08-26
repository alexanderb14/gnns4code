__kernel void A(const int a, const int b, __global const float* c, __global float* d) {
  const int e = get_global_id(0);
  const int f = get_global_id(1);

  if (e < a && f < b) {
    d[e * b + f] = c[f * a + e];
  }
}