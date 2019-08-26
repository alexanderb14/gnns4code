__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, __global int* e, __global int* f, __global int* g, __global int* h) {
  int i;
  int j;
  float k;
  float l;
  float m;
  float n;
  float o;
  int p;
  float q = *a;
  float r = *c;
  float s = *b;
  float t = *d;
  int u = *e;
  int v = *f;
  int w = *g;

  __private float x = get_global_id(0);
  __private float y = get_global_size(0);

  __private float z = get_global_id(1);
  __private float aa = get_global_size(1);

  r -= q;
  t -= s;
  j = 0;

  __private int ab;
  __private int ac;
  __private int ad;
  __private int ae;

  ab = (v / y) * x;
  ac = (v / y) * (x + 1);

  ad = (u / aa) * z;
  ae = (u / aa) * (z + 1);

  for (j = ab; j < ac; j++) {
    l = (j * t) / v + s;

    for (i = ad; i < ae; i++) {
      k = (i * r) / u + q;

      m = k;
      n = l;
      for (p = 0; p < w; p++) {
        o = (m * m) + (n * n);
        if (o > 4)
          break;
        o = m * m - n * n;
        n *= 2 * m;
        m = o + k;
        n += l;
      }
      h[j * u + i] = w - p;
    }
  }
}