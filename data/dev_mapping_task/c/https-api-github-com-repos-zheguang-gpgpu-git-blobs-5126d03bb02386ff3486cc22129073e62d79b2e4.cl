__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, __local float* f, int g, int h, int i) {
  int j = get_local_id(0);
  int k = get_group_id(0);

  int l = 1;

  __local float* m = f;
  __local float* n = &m[g + 1];
  __local float* o = &n[g + 1];
  __local float* p = &o[g + 1];
  __local float* q = &p[g + 1];

  m[j] = a[j + k * g];
  n[j] = b[j + k * g];
  o[j] = c[j + k * g];
  p[j] = d[j + k * g];

  float r, s, t, u;

  barrier(1);

  for (int v = 0; v < i; v++) {
    int w = j;

    if (w < l) {
      float x = ((o[w]) / (n[w + l]));

      s = n[w] - m[w + l] * x;
      u = p[w] - p[w + l] * x;
      r = 0;
      t = -o[w + l] * x;
    } else if ((g - w - 1) < l) {
      float y = ((m[w]) / (n[w - l]));

      s = n[w] - o[w - l] * y;
      u = p[w] - p[w - l] * y;
      r = -m[w - l] * y;
      t = 0;
    } else {
      float z = ((m[w]) / (n[w - l]));
      float x = ((o[w]) / (n[w + l]));

      s = n[w] - o[w - l] * z - m[w + l] * x;
      u = p[w] - p[w - l] * z - p[w + l] * x;
      r = -m[w - l] * z;
      t = -o[w + l] * x;
    }

    barrier(1);

    n[w] = s;
    p[w] = u;
    m[w] = r;
    o[w] = t;

    l *= 2;
    barrier(1);
  }

  if (j < l) {
    int aa = j;
    int ab = j + l;
    float ac = n[ab] * n[aa] - o[aa] * m[ab];

    q[aa] = (((n[ab] * p[aa] - o[aa] * p[ab])) / (ac));
    q[ab] = (((p[ab] * n[aa] - p[aa] * m[ab])) / (ac));
  }

  barrier(1);

  e[j + k * g] = q[j];
}

__kernel void B(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, __local float* f, int g, int h, int i) {
  int j = get_local_id(0);
  int k = get_group_id(0);

  int l = 1;

  __local float* m = f;
  __local float* n = &m[g + 1];
  __local float* o = &n[g + 1];
  __local float* p = &o[g + 1];
  __local float* q = &p[g + 1];

  m[j] = a[j + k * g];
  n[j] = b[j + k * g];
  o[j] = c[j + k * g];
  p[j] = d[j + k * g];

  float r, s, t, u;

  barrier(1);

  for (int v = 0; v < i; v++) {
    int w = j;

    int x = w + l;
    x = x & (g - 1);

    int y = w - l;
    y = y & (g - 1);

    float z = ((m[w]) / (n[y]));
    float aa = ((o[w]) / (n[x]));

    s = n[w] - o[y] * z - m[x] * aa;
    u = p[w] - p[y] * z - p[x] * aa;
    r = -m[y] * z;
    t = -o[x] * aa;

    barrier(1);

    n[w] = s;
    p[w] = u;
    m[w] = r;
    o[w] = t;

    l *= 2;
    barrier(1);
  }

  if (j < l) {
    int ab = j;
    int ac = j + l;
    float ad = n[ac] * n[ab] - o[ab] * m[ac];

    q[ab] = (((n[ac] * p[ab] - o[ab] * p[ac])) / (ad));
    q[ac] = (((p[ac] * n[ab] - p[ab] * m[ac])) / (ad));
  }

  barrier(1);

  e[j + k * g] = q[j];
}