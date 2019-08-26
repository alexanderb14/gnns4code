typedef unsigned char fixed8; kernel void A(global fixed8* a, global float* b, global float* c, global int* d, global int* e, global fixed8* f, int g, int h) {
  int i = get_global_id(0);
  int j = get_global_id(1);
  int k = get_global_size(0);
  int l = get_global_size(1);
  float m = 0, n = 0, o = 0;
  int p = 0;

  global fixed8* q = a;
  global fixed8* r = q + g * k;
  global fixed8* s = r + (g >> 1) * (k >> 1);

  global fixed8* t = f;
  global fixed8* u = t + l * k;
  global fixed8* v = u + (l >> 1) * (k >> 1);

  int w = j * k + i;
  for (p = 0; p < h; p++) {
    m += b[j + p * l] * q[(d[j] + p) * k + i];
  }
  t[w] = m;

  if (j < (l >> 1) && i < (k >> 1)) {
    int w = j * (k >> 1) + i;
    for (p = 0; p < h; p++) {
      n += c[j + p * (l >> 1)] * r[(e[j] + p) * (k >> 1) + i];
      o += c[j + p * (l >> 1)] * s[(e[j] + p) * (k >> 1) + i];
    }
    u[w] = n;
    v[w] = o;
  }
}