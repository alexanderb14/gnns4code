typedef unsigned char fixed8; kernel void A(global fixed8* a, global float* b, global float* c, global int* d, global int* e, global fixed8* f, int g, int h) {
  int i = get_global_id(0);
  int j = get_global_id(1);
  int k = get_global_size(0);
  int l = get_global_size(1);
  float m = 0, n = 0, o = 0;
  int p = 0;

  global fixed8* q = a;
  global fixed8* r = q + g * l;
  global fixed8* s = r + (g >> 1) * (l >> 1);

  global fixed8* t = f;
  global fixed8* u = t + k * l;
  global fixed8* v = u + (k >> 1) * (l >> 1);

  int w = j * k + i;
  global fixed8* x = q + (j * g);
  for (int p = 0; p < h; p++) {
    m += (b[i + p * k] * x[d[i] + p]);
  }
  t[w] = m;

  if (j < (l >> 1) && i < (k >> 1)) {
    int w = j * (k >> 1) + i;
    global fixed8* y = r + (j * (g >> 1));
    global fixed8* z = s + (j * (g >> 1));
    for (p = 0; p < h; p++) {
      n += (c[i + p * (k >> 1)] * y[e[i] + p]);
      o += (c[i + p * (k >> 1)] * z[e[i] + p]);
    }
    u[w] = n;
    v[w] = o;
  }
}