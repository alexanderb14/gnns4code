__kernel void A(__global float* a, __global float* b, const int c) {
  int d = get_global_id(0);

  if (d < c) {
    if (b[d] < 0)
      a[d] = 0.0;
    else
      a[d] = b[d];
  }
}

__kernel void B(__global float* a, __global float* b, __global float* c, const int d) {
  int e = get_global_id(0);

  if (e < d) {
    if (c[e] < 0)
      a[e] = 0.0;
    else
      a[e] = b[e];
  }
}