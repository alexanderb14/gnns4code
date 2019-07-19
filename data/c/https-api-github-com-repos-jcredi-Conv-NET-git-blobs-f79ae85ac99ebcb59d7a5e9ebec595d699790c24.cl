__kernel void A(__global float* a, __global float* b, const float c, const int d) {
  int e = get_global_id(0);

  if (e < d) {
    float f = exp(2 * c * b[e]);
    a[e] = ((f - 1) / (f + 1));
  }
}

__kernel void B(__global float* a, __global float* b, __global float* c, const float d, const int e) {
  int f = get_global_id(0);

  if (f < e) {
    a[f] = b[f] * (1 - pown(c[f], 2));
  }
}