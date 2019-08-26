__kernel void A(__global float* a, __local float* b) {
  int c;

  if (b[0] < a[0]) {
    c = 1;
  }

  barrier(1);

  if (a[0] > 0) {
    b[0] = a[0];
  }
}