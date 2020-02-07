__kernel void A(int2 a, __global int2* b) {
  b[0] = a;
}