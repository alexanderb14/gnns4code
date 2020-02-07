__kernel void A(__global uchar* a, __global float* b, int c, __global uchar* d) {
  int e = get_global_id(1);
  int f = get_global_id(0);
  int g = get_global_size(0);
  int h = get_global_size(1);
  int i = c;
  int j, k;

  float l = 0;

  int m, n;

  m = e - i >= 0 ? 0 : i - e;
  n = f - i >= 0 ? 0 : i - f;

  for (j = (f - i >= 0) ? f - i : 0; j <= f + i && j < h && n < 2 * i + 1; j++) {
    m = e - i >= 0 ? 0 : i - e;

    for (k = (e - i >= 0) ? e - i : 0; k <= e + i && k < g && m < 2 * i + 1; k++) {
      l += b[m + (2 * i + 1) * n] * convert_int(a[j * g + k]);
      m++;
    }

    n++;
  }

  d[f * g + e] = convert_uchar(l);
}