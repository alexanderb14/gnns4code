__kernel void A(const __global float* a, __global float* b, __constant float* c __attribute__((max_constant_size(16384))), int d, int e, int f) {
  int g = (int)get_global_id(1);
  int h = (int)get_global_id(0);

  int i = (d % 2 == 1 ? (d) / 2 : (d + 1) / 2);

  if (g < f && h < e) {
    int j = g * e + h;
    int k = 0;
    float l = 0.0f;
    int m = 0;
    int n = 0;
    int o = 0;

    for (m = -i; m < d - i; m++) {
      n = j + m;
      if (h + m < 0) {
        n = j - 2 * h - m - 1;
      }

      else if (h + m > e - 1) {
        n = (g + 2) * e - h - m - 1;
      }
      l += a[n] * c[k];

      k += 1;
    }

    b[j] = l;
  }
}
__kernel void B(const __global float* a, __global float* b, __constant float* c __attribute__((max_constant_size(16384))), int d, int e, int f) {
  int g = (int)get_global_id(1);
  int h = (int)get_global_id(0);

  if (g < f && h < e) {
    int i = (d % 2 == 1 ? (d) / 2 : (d + 1) / 2);

    int j = g * e + h;
    int k = 0;
    float l = 0.0f;
    int m = 0, n = 0;
    int o = 0;

    for (m = -i; m < d - i; m++) {
      n = j + m * (e);

      if (g + m < 0) {
        n = h - (m + 1) * e - g * e;

      } else if (g + m > f - 1) {
        n = (f - 1) * e + h + (f - m) * e - g * e;
      }
      l += a[n] * c[k];
      k += 1;
    }
    b[j] = l;
    if (o == 1)
      b[j] = 0;
  }
}