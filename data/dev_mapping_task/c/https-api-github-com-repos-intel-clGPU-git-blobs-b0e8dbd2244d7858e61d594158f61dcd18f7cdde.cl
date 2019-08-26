__kernel void A(int a, uint b, float c, __global float* d, uint e, __global float* f, uint g) {
  bool h = a == (1);

  if (h) {
    for (uint i = 0; i < b; i++) {
      float j = c * d[i * e];
      for (uint k = i; k < b; k++) {
        f[i * g + k] += j * d[k * e];
      }
    }
  } else {
    for (uint i = 0; i < b; i++) {
      float j = c * d[i * e];
      for (uint k = 0; k <= i; k++) {
        f[i * g + k] += j * d[k * e];
      }
    }
  }
}