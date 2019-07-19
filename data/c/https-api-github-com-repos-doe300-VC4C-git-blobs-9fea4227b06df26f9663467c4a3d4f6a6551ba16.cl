__kernel void A(__global float* a) {
  int b = get_global_id(0);
  a[b] = a[b] * 2;
}