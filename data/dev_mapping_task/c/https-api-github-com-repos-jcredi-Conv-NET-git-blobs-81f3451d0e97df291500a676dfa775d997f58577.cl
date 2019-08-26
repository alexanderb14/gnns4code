__kernel void A(__global float* a, __global float* b, const float c, const int d) {
  int e = get_global_id(0);

  if (e < d) {
    if (b[e] < 0)
      a[e] = c * (exp(b[e]) - 1.0f);
    else
      a[e] = b[e];
  }
}

__kernel void B(__global float* a, __global float* b, __global float* c, const float d, const int e) {
  int f = get_global_id(0);

  if (f < e) {
    if (c[f] < 0.0F) {
      float g = d * exp(c[f]);
      a[f] = g * b[f];
    } else
      a[f] = b[f];
  }
}