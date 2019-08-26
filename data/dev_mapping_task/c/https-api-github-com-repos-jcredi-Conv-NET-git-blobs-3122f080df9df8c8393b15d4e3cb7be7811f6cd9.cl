__kernel void A(__global float* a, __global float* b, const int c, const int d, const int e, const int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);

  if (g < f && h < e) {
    const int i = g * c;
    const int j = h * d;

    const int k = i + j;

    float l = 0.0F;

    for (int m = 0; m < d; m++) {
      l += b[k + m];
    }
    l /= d;

    int n = g * e + h;
    a[n] = l;
  }
}

__kernel void B(__global float* a, __global float* b, const int c, const int d, const int e, const int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);

  if (g < f && h < c) {
    int i = h / d;

    float j = b[g * e + i];
    float k = j / d;

    int l = g * c + h;

    a[l] = k;
  }
}