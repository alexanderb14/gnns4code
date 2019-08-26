__kernel void A(__global int* a, const int b, const int c, const int d) {
  const int e = get_global_id(0);

  const int f = d * d;

  if (e < f) {
    int g = e / d;
    int h = e % d;

    int i = g * b * c + h * b;
    int j = i + 1;
    int k = i + c;
    int l = k + 1;

    a[4 * e + 0] = i;
    a[4 * e + 1] = j;
    a[4 * e + 2] = k;
    a[4 * e + 3] = l;
  }
}

__kernel void B(__global float* a, __global float* b, __global bool* c, __global int* d, const int e, const int f, const int g, const int h, const int i) {
  const int j = get_global_id(0);

  if (j < g * i) {
    int k = j / g;
    int l = (j % g) / h;
    int m = j % h;

    int n = k * e + l * f;

    int o[4];
    float p[4];
    for (int q = 0; q < 4; q++) {
      o[q] = n + d[4 * m + q];
      p[q] = b[o[q]];
    }

    float r = -__builtin_inff();
    for (int q = 0; q < 4; q++) {
      if (p[q] > r)
        r = p[q];
    }
    a[j] = r;

    for (int q = 0; q < 4; q++) {
      c[o[q]] = (p[q] == r) ? true : false;
    }
  }
}

__kernel void C(__global float* a, __global float* b, __global bool* c, __global int* d, const int e, const int f, const int g, const int h, const int i) {
  const int j = get_global_id(0);

  if (j < g * i) {
    int k = j / g;
    int l = (j % g) / h;
    int m = k * e + l * f;

    int n = j % h;

    for (int o = 0; o < 4; o++) {
      int p = m + d[4 * n + o];
      if (c[p])
        a[p] = b[j];
      else
        a[p] = 0.0f;
    }
  }
}