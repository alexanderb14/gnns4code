__kernel void A(__global float* a, __global float* b, __global int* c, __global int* d, int e, int f, float g) {
  int h = get_global_id(0);

  int i = e * f;
  int j = (e - 1) * (f - 1);

  size_t k = get_global_size(0);

  for (int l = h; l < j; l += k) {
    int m = l % (f - 1);
    int n = (int)(l / (f - 1));

    float o = a[n * f + m];
    float p = a[n * f + m + 1];
    float q = a[(n + 1) * f + m];
    float r = a[(n + 1) * f + m + 1];

    if (o != -9999 && p != -9999 && q != -9999 && r != -9999) {
      if ((o < g && p > g && q > g && r > g) || (o > g && p < g && q < g && r < g)) {
        float s = 0.0;
        float t = 0.0;
        float u = 0.0;
        float v = 0.0;

        float w = (g - o) / (q - o);
        if (w < 0) {
          w = w * (-1);
        }
        s = m;
        t = (1 - w) * n + w * (n + 1);

        float x = (g - o) / (p - o);
        if (x < 0) {
          x = x * (-1);
        }
        u = (1 - x) * m + x * (m + 1);
        v = n;

        int y = atomic_add(d, 4);
        b[y] = s;
        b[y + 1] = t;
        b[y + 2] = u;
        b[y + 3] = v;

        atomic_add(c, 1);
      }

      if ((o > g && p < g && q > g && r > g) || (o < g && p > g && q < g && r < g)) {
        float s = 0.0;
        float t = 0.0;
        float u = 0.0;
        float v = 0.0;

        float w = (g - o) / (p - o);
        if (w < 0) {
          w = w * (-1);
        }
        s = (1 - w) * m + w * (m + 1);
        t = n;

        float x = (g - p) / (r - p);
        if (x < 0) {
          x = x * (-1);
        }
        u = m + 1;
        v = (1 - x) * n + x * (n + 1);

        int y = atomic_add(d, 4);
        b[y] = s;
        b[y + 1] = t;
        b[y + 2] = u;
        b[y + 3] = v;

        atomic_add(c, 1);
      }

      if ((o > g && p > g && q < g && r > g) || (o < g && p < g && q > g && r < g)) {
        float s = 0.0;
        float t = 0.0;
        float u = 0.0;
        float v = 0.0;

        float w = (g - o) / (q - o);
        if (w < 0) {
          w = w * (-1);
        }
        s = m;
        t = (1 - w) * n + w * (n + 1);

        float x = (g - q) / (r - q);
        if (x < 0) {
          x = x * (-1);
        }
        u = (1 - x) * m + x * (m + 1);
        v = n + 1;

        int y = atomic_add(d, 4);
        b[y] = s;
        b[y + 1] = t;
        b[y + 2] = u;
        b[y + 3] = v;

        atomic_add(c, 1);
      }

      if ((o > g && p > g && q > g && r < g) || (o < g && p < g && q < g && r > g)) {
        float s = 0.0;
        float t = 0.0;
        float u = 0.0;
        float v = 0.0;

        float w = (g - q) / (r - q);
        if (w < 0) {
          w = w * (-1);
        }
        s = (1 - w) * m + w * (m + 1);
        t = n + 1;

        float x = (g - p) / (r - p);
        if (x < 0) {
          x = x * (-1);
        }
        u = m + 1;
        v = (1 - x) * n + x * (n + 1);

        int y = atomic_add(d, 4);
        b[y] = s;
        b[y + 1] = t;
        b[y + 2] = u;
        b[y + 3] = v;

        atomic_add(c, 1);
      }

      if ((o > g && p > g && q < g && r < g) || (o < g && p < g && q > g && r > g)) {
        float s = 0.0;
        float t = 0.0;
        float u = 0.0;
        float v = 0.0;

        float w = (g - o) / (q - o);
        if (w < 0) {
          w = w * (-1);
        }
        s = m;
        t = (1 - w) * n + w * (n + 1);

        float x = (g - p) / (r - p);
        if (x < 0) {
          x = x * (-1);
        }
        u = m + 1;
        v = (1 - x) * n + x * (n + 1);

        int y = atomic_add(d, 4);
        b[y] = s;
        b[y + 1] = t;
        b[y + 2] = u;
        b[y + 3] = v;

        atomic_add(c, 1);
      }

      if ((o < g && p > g && q < g && r > g) || (o > g && p < g && q > g && r < g)) {
        float s = 0.0;
        float t = 0.0;
        float u = 0.0;
        float v = 0.0;

        float w = (g - o) / (p - o);
        if (w < 0) {
          w = w * (-1);
        }
        s = (1 - w) * m + w * (m + 1);
        t = n;

        float x = (g - q) / (r - q);
        if (x < 0) {
          x = x * (-1);
        }
        u = (1 - x) * m + x * (m + 1);
        v = n + 1;

        int y = atomic_add(d, 4);
        b[y] = s;
        b[y + 1] = t;
        b[y + 2] = u;
        b[y + 3] = v;

        atomic_add(c, 1);
      }

      if ((o > g && p < g && q < g && r > g) || (o < g && p > g && q > g && r < g)) {
        float s = 0.0;
        float t = 0.0;
        float u = 0.0;
        float v = 0.0;

        float w = (g - o) / (q - o);
        if (w < 0) {
          w = w * (-1);
        }
        s = m;
        t = (1 - w) * n + w * (n + 1);

        float x = (g - o) / (p - o);
        if (x < 0) {
          x = x * (-1);
        }
        u = (1 - x) * m + x * (m + 1);
        v = n;

        int y = atomic_add(d, 4);
        b[y] = s;
        b[y + 1] = t;
        b[y + 2] = u;
        b[y + 3] = v;

        s = 0.0;
        t = 0.0;
        u = 0.0;
        v = 0.0;

        w = (g - q) / (r - q);
        if (w < 0) {
          w = w * (-1);
        }
        s = (1 - w) * m + w * (m + 1);
        t = n + 1;

        x = (g - p) / (r - p);
        if (x < 0) {
          x = x * (-1);
        }
        u = m + 1;
        v = (1 - x) * n + x * (n + 1);

        y = atomic_add(d, 4);
        b[y] = s;
        b[y + 1] = t;
        b[y + 2] = u;
        b[y + 3] = v;

        atomic_add(c, 1);

        atomic_add(c, 1);
      }
    }
  }
}