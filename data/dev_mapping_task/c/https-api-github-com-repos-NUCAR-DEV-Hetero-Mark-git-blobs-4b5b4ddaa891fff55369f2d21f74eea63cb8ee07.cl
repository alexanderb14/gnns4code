__kernel void A(__global char* a, __global char* b, __global char* c, uint d, int e, int f, int g, int h) {
  size_t i = get_global_id(0);
  if (i > d)
    return;

  bool j = false;
  int k = e - f;

  for (int l = 0; l <= k; l++) {
    int m = 0;
    for (int n = 0; n < f; n++) {
      if (a[h + i + n] != b[l + n]) {
        m++;
      }
    }

    if (m < g) {
      j = true;
      break;
    }
  }
  if (j) {
    c[i] = 1;
  }
}