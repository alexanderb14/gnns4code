__kernel void A(__global int4* a) {
  for (int b = 0; b < 25; b++) {
    a[b] *= 2;
  }
}