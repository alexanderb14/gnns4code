__kernel void A(__global int* a, __global int* b, __global int* c) {
  int d = c[0];
  int e = c[1];
  int f = (int)get_global_id(0);
  for (; f < e; f += d)
    b[f] = a[f];
}