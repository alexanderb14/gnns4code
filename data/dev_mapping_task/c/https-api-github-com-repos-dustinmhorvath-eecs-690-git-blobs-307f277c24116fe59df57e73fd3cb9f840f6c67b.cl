__kernel void A(__global float* a, __global int* b, int c, int d, float e) {
  int f = get_global_id(0);
  int g = (c - 1) * (d - 1);

  size_t h = get_global_size(0);

  for (int i = f; i < g; i += h) {
    int j = i % (d - 1);
    int k = (int)(i / (d - 1));

    float l = a[k * d + j];
    float m = a[k * d + j + 1];
    float n = a[(k + 1) * d + j];
    float o = a[(k + 1) * d + j + 1];

    if (l != -9999 && m != -9999 && n != -9999 && o != -9999) {
      if ((l < e && m > e && n > e && o > e) || (l > e && m < e && n < e && o < e)) {
        atomic_add(b, 1);
      }

      if ((l > e && m < e && n > e && o > e) || (l < e && m > e && n < e && o < e)) {
        atomic_add(b, 1);
      }

      if ((l > e && m > e && n < e && o > e) || (l < e && m < e && n > e && o < e)) {
        atomic_add(b, 1);
      }

      if ((l > e && m > e && n > e && o < e) || (l < e && m < e && n < e && o > e)) {
        atomic_add(b, 1);
      }

      if ((l < e && m > e && n < e && o > e) || (l > e && m < e && n > e && o < e)) {
        atomic_add(b, 1);
      }

      if ((l > e && m > e && n < e && o < e) || (l < e && m < e && n > e && o > e)) {
        atomic_add(b, 1);
      }

      if ((l > e && m < e && n < e && o > e) || (l < e && m > e && n > e && o < e)) {
        atomic_add(b, 2);
      }
    }
  }
}