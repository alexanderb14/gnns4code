__constant int Ga[64] = {};

__kernel void A(__global float* a) {
  int b = get_global_id(0) + 1;
  int c = Ga[b];

  char d;

  __constant char* e = (__constant char*)Ga;

  d = e[0];

  if (c == 0) {
    a[0] = get_global_id(0) + d;
  }
}