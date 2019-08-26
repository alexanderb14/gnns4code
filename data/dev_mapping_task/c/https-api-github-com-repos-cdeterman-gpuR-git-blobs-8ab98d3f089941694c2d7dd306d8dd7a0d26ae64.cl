__kernel void A(__global const float* a, __global float* b, const int c, const int d, const int e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);

  if ((f <= c) && (g <= d)) {
    b[f * e + g] = sign(a[f * e + g]);
  }
}