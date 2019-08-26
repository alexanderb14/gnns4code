__kernel void A(__global const int* a, __global const int* b, __global const int* c, __global int* d, __local int* e, const int f) {
  int g = get_global_id(0);
  int h, i, j, k, l = 0;

  if (g < f) {
    h = a[g];
    i = a[g + 1];

    for (int m = h; m < i; m++) {
      j = b[m];
      k = c[j + 1] - c[j];
      l += k;
    }

    d[g] = l;
  }

  if (g == 0)
    d[f] = 0;
}