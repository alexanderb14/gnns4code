__kernel void A(__global float* a) {
  int b = get_global_id(0);

  int c = get_global_size(0);

  float d = 0;
  for (int e = 0; e < c; e++) {
    d += a[e];
  }

  a[b] = d;
}