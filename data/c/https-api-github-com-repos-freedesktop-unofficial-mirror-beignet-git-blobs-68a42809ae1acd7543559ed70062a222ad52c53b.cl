__kernel void A(__global unsigned int* a, __global unsigned int* b, __constant unsigned int* c) {
  if (a && b == 0 && c == ((void*)0)) {
    uint d = (uint)get_global_id(0);
    a[d] = d;
  }
}