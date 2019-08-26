__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, __global int* e, __global int* f, __global int* g, __global int* h) {
  __private int i;
  __private int j;
  __private float k;
  __private float l;
  __private float m;
  __private float n;
  __private float o;
  __private int p;
  __private float q = *a;
  __private float r = *c;
  __private float s = *b;
  __private float t = *d;
  __private int u = *e;
  __private int v = *f;
  __private int w = *g;

  __private int x = get_global_id(0);
  __private int y = get_global_size(0);

  __private int z = get_global_id(1);
  __private int aa = get_global_size(1);

  r -= q;
  t -= s;
  j = 0;

  __private int ab;
  __private int ac;
  __private int ad;
  __private int ae;

  if (aa > v) {
    if (z < v)
      ab = z;
    else
      return;
  } else {
    ab = (1.0 * v / aa) * z;
    ac = (1.0 * v / aa) * (z + 1);
  }

  if (y > u) {
    if (x < u)
      ad = x;
    else
      return;
  } else {
    ad = (u / y) * x;
    ae = (u / y) * (x + 1);
  }

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