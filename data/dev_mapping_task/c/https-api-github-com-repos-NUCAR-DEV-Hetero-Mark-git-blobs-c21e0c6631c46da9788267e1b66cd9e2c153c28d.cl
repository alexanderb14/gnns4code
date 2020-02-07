__kernel void A(__global uchar* a, __global float* b, __global uchar* c, uint d, uint e, uint f, uint g, float h) {
  uint i = get_global_id(0);

  if (i > d * e * f) {
    return;
  }

  uint j;
  if (a[i] > b[i]) {
    j = a[i] - b[i];
  } else {
    j = b[i] - a[i];
  }

  if (j > g) {
    c[i] = a[i];
  } else {
    c[i] = 0;
  }

  b[i] = b[i] * (1 - h) + a[i] * h;
}