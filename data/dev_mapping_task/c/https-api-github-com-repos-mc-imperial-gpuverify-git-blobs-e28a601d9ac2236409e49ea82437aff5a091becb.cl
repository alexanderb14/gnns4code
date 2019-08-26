__constant int Ga[64] = {};

__kernel void A(__global float* a) {
  int b = get_global_id(0);
  int c = Ga[b];

  if (c != 0) {
    a[0] = get_global_id(0);
  }
}