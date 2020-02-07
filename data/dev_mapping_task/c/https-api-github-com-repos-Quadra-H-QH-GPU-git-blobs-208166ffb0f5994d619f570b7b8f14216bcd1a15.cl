__kernel void A(__global uint* a, __global uint* b, const int c) {
  int d;
  int e = get_global_id(0);
  int f = get_global_id(1);

  int g = f * 16 + e;

  if (g < c) {
    for (d = 0; d < 2048; d++) {
      if (a[g] == b[d]) {
        a[g] = 1;
        break;
      }
    }
    if (a[g] != 1)
      a[g] = 0;
  }
}