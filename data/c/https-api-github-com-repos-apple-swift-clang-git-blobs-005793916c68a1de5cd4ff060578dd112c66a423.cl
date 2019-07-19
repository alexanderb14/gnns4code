kernel void A(global int* a) {
  a[0] = 4;
}

__kernel void B(__global int* a) {
  A(a);
}