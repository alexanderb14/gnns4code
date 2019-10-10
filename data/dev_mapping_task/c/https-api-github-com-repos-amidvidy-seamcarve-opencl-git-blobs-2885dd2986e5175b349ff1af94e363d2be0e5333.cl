__kernel void A(__global uchar4* a, __global uchar4* b, __global int* c, int d, int e, int f) {
  int2 g = (int2)(get_global_id(0), get_global_id(1));

  if (g.x < d && g.y < e) {
    int h = c[g.y];
    if (g.x < h) {
      b[g.y * d + g.x] = a[g.y * d + g.x];
    } else if (g.x >= h && g.x < (d - f)) {
      b[g.y * d + (g.x - 1)] = a[g.y * d + g.x];
    } else {
      b[g.y * d + g.x] = (uchar4)(0, 0, 0, 0);
    }
  }
}