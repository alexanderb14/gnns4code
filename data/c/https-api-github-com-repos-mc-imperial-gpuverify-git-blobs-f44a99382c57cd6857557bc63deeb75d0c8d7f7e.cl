void A(float a) {
}

__kernel void B(__global float* a) {
  A(a[0]);
}