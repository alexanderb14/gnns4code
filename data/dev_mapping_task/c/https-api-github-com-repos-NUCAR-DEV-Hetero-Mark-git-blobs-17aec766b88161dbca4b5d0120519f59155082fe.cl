__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, uint e) {
  uint f = get_global_id(0);
  uint g = get_global_size(0);

  float h = 0;
  uint i = 0;
  for (i = 0; i < e; i++) {
    if (f >= i) {
      h = h + b[i] * c[f - i];
    } else {
      h = h + b[i] * d[e - (i - f)];
    }
  }
  a[f] = h;
}