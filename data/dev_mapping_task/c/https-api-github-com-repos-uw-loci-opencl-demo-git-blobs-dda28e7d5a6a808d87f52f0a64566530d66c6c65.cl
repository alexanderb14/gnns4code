__kernel void A(__global float* a, __global float* b, int c, int d) {
  int e = get_global_id(0);
  int f = 0;
  for (int g = 0; g <= d; g++) {
    if ((e & (1 << g)) != 0) {
      f |= (1 << (d - g - 1));
    }
  }
  f = (f & 0x0000ffff) + c;

  b[e] = a[f];
};