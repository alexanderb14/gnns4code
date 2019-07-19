__kernel void A(__global const int* a, __global const int* b, __global int* c, __global int* d) {
  int e = get_global_id(0);
  int f = get_global_id(1);
  int g = d[0];

  if (a[f * g + e] == b[0]) {
    int h, i;
    int j = d[1];
    int k = d[2];
    int l = d[3];

    for (int m = 0; m < l; m++) {
      h = m * k;
      i = (f + m) * g + e;
      for (int n = 0; n < k; n++) {
        if (a[i + n] != b[h + n]) {
          return;
        }
      }
    }

    atomic_add(&d[4], 2);
    int o = d[4];
    c[o] = e;
    c[o + 1] = f;
  }
}