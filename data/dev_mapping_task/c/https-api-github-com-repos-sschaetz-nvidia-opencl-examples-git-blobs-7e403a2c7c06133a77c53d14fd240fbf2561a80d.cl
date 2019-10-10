__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, __local float* f, int g, int h, int i) {
  int j = get_local_id(0);
  int k = get_group_id(0);

  int l = 1;
  int m = g >> 1;
  int n = m;

  __local float* o = f;
  __local float* p = &o[g];
  __local float* q = &p[g];
  __local float* r = &q[g];
  __local float* s = &r[g];

  o[j] = a[j + k * g];
  o[j + n] = a[j + n + k * g];

  p[j] = b[j + k * g];
  p[j + n] = b[j + n + k * g];

  q[j] = c[j + k * g];
  q[j + n] = c[j + n + k * g];

  r[j] = d[j + k * g];
  r[j + n] = d[j + n + k * g];

  barrier(1);

  for (int t = 0; t < i; t++) {
    barrier(1);

    l <<= 1;
    int u = l >> 1;
    if (j < n) {
      int v = l * j + l - 1;

      if (v == g - 1) {
        float w = ((o[v]) / (p[v - u]));

        p[v] = p[v] - q[v - u] * w;
        r[v] = r[v] - r[v - u] * w;
        o[v] = -o[v - u] * w;
        q[v] = 0;
      } else {
        float x = ((o[v]) / (p[v - u]));
        float y = ((q[v]) / (p[v + u]));

        p[v] = p[v] - q[v - u] * x - o[v + u] * y;
        r[v] = r[v] - r[v - u] * x - r[v + u] * y;
        o[v] = -o[v - u] * x;
        q[v] = -q[v + u] * y;
      }
    }
    n >>= 1;
  }

  if (j < 2) {
    int z = l - 1;
    int aa = (l << 1) - 1;
    float ab = p[aa] * p[z] - q[z] * o[aa];

    s[z] = (((p[aa] * r[z] - q[z] * r[aa])) / (ab));
    s[aa] = (((r[aa] * p[z] - r[z] * o[aa])) / (ab));
  }

  n = 2;
  for (int t = 0; t < i; t++) {
    int u = l >> 1;
    barrier(1);
    if (j < n) {
      int v = l * j + (l >> 1) - 1;

      if (v == u - 1)
        s[v] = (((r[v] - q[v] * s[v + u])) / (p[v]));
      else
        s[v] = (((r[v] - o[v] * s[v - u] - q[v] * s[v + u])) / (p[v]));
    }
    l >>= 1;
    n <<= 1;
  }

  barrier(1);

  e[j + k * g] = s[j];
  e[j + m + k * g] = s[j + m];
}

__kernel void B(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, __local float* f, int g, int h, int i) {
  int j = get_local_id(0);
  int k = get_group_id(0);

  int l = 1;
  int m = g >> 1;
  int n = m;

  __local float* o = f;
  __local float* p = &o[g];
  __local float* q = &p[g];
  __local float* r = &q[g];
  __local float* s = &r[g];

  o[j] = a[j + k * g];
  o[j + n] = a[j + n + k * g];

  p[j] = b[j + k * g];
  p[j + n] = b[j + n + k * g];

  q[j] = c[j + k * g];
  q[j + n] = c[j + n + k * g];

  r[j] = d[j + k * g];
  r[j + n] = d[j + n + k * g];

  barrier(1);

  for (int t = 0; t < i; t++) {
    barrier(1);

    l <<= 1;
    int u = l >> 1;
    if (j < n) {
      int v = l * j + l - 1;
      int w = v + u;
      w = w & (g - 1);

      float x = ((o[v]) / (p[v - u]));
      float y = ((q[v]) / (p[w]));

      p[v] = p[v] - q[v - u] * x - o[w] * y;
      r[v] = r[v] - r[v - u] * x - r[w] * y;
      o[v] = -o[v - u] * x;
      q[v] = -q[w] * y;
    }

    n >>= 1;
  }

  if (j < 2) {
    int z = l - 1;
    int aa = (l << 1) - 1;
    float ab = p[aa] * p[z] - q[z] * o[aa];

    s[z] = (((p[aa] * r[z] - q[z] * r[aa])) / (ab));
    s[aa] = (((r[aa] * p[z] - r[z] * o[aa])) / (ab));
  }

  n = 2;
  for (int t = 0; t < i; t++) {
    int u = l >> 1;
    barrier(1);
    if (j < n) {
      int v = l * j + (l >> 1) - 1;

      if (v == u - 1)
        s[v] = (((r[v] - q[v] * s[v + u])) / (p[v]));
      else
        s[v] = (((r[v] - o[v] * s[v - u] - q[v] * s[v + u])) / (p[v]));
    }
    l >>= 1;
    n <<= 1;
  }

  barrier(1);

  e[j + k * g] = s[j];
  e[j + m + k * g] = s[j + m];
}