__kernel void A(__global float* a) {
  for (int b = 0; b < 100; b++) {
    a[b] = b * 2;
  }
}