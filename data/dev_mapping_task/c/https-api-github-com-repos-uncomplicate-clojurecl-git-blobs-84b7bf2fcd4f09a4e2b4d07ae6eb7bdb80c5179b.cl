__kernel void A(__global int4* a, int b) {
  int c = b / (4 * get_global_size(0));
  a += get_global_id(0) * c;
  for (int d = 0; d < c; d++) {
    a[d] += 1;
    a[d] *= 2;
    a[d] /= 3;
  }
}