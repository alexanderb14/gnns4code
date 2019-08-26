__kernel void A(__global float* a, __global float* b, const int c, const int d, const int e, const int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);

  const int i = (f - 1) / 2;

  const int j = c - f + 1;
  const int k = d - f + 1;

  if (g < j && h < k - e) {
    for (int l = 0; l < i; l++) {
      for (int m = 0; m < f; m++) {
        const int n = l * f * j * k + m * j * k + g * k + h;

        const int o = (f - 1 - l) * f * j * k + (f - 1 - m) * j * k + (g - (i - l)) * k + (h - (i - m));

        a[n] = a[o];
        b[n] = b[o];
      }
    }
  }
}