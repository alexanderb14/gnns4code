typedef enum { LOGISTIC, RELU, RELIE, LINEAR, RAMP, TANH, PLSE, LEAKY, ELU, LOGGY, STAIR, HARDTAN, LHTAN } ACTIVATION;

__kernel void A(int a, __global float* b, int c, int d, int e, const int f, int g, int h, int i, __global float* j) {
  int k = get_global_id(0);
  int l = get_local_size(0) * get_num_groups(0);
  int m, n, o, p, q, r, s, t, u, v, w;

  for (; k < a; k += l) {
    m = k % i;
    n = k / i;
    o = n % h;
    p = n / h;
    q = p * e * e;
    r = o * g - f;
    s = m * g - f;

    __global float* x = j;
    x += (q * h + o) * i + m;

    const __global float* y = b;
    y += (p * c + r) * d + s;

    for (t = 0; t < 3; ++t) {
      for (u = 0; u < 3; ++u) {
        v = r + t;
        w = s + u;

        *x = (v >= 0 && w >= 0 && v < c && w < d) ? y[t * d + u] : 0;
        x += h * i;
      }
    }
  }
}

__kernel void B(int a, __global float* b, int c, int d, int e, const int f, int g, int h, int i, __global float* j) {
  int k = get_global_id(0);
  int l = get_local_size(0) * get_num_groups(0);
  int m, n, o, p, q, r, s, t = 0, u = 0, v, w, x = 0;

  for (; k < a; k += l) {
    m = k % i;
    n = k / i;
    o = n % h;
    p = n / h;
    q = p * e * e;
    r = o * g - f;
    s = m * g - f;

    __global float* y = j;
    y += (q * h + o) * i + m;

    const __global float* z = b;
    z += (p * c + r) * d + s;

    v = r;
    w = s;

    *y = (v >= 0 && w >= 0 && v < c && w < d) ? z[t * d + u] : 0;
    y += h * i;
  }
}

__kernel void C(__global float* a, __global float* b, int c) {
  int d = get_group_id(1);
  int e = get_local_size(0);
  int f = get_global_id(0) * e;
  float8 g = (float8)0;
  vstore8(g, 0, &a[f]);
}

__kernel void D(int a, __global float* b, __global float* c, __global float* d, int e, int f, int g) {
  int h = get_local_size(0);
  int i = get_global_id(0) * h;

  int j = 0, k = 0;

  for (; k < 8; k++) {
    j = (i / g) % f;
    b[i] = (b[i] - c[j]) / (sqrt(d[j]) + .000001f);
    i = i + 1;
  }
}

__kernel void E(__global float* a, __global float* b, int c, int d) {
  int e = get_global_id(0);
  int f = get_group_id(1);

  a[f * d + e] *= b[f];
}

__kernel void F(__global float* a, __global float* b, int c, int d) {
  int e = get_group_id(1);
  int f = get_local_size(0);
  int g = get_global_id(0) * f;

  __local float h;
  h = b[e];

  float8 i = vload8(0, &a[e * d + g]);
  i += h;
  vstore8(i, 0, &a[e * d + g]);
}

__kernel void G(__global float* a, __global float* b, __global float* c, int d, int e) {
  int f = get_group_id(1);
  int g = get_local_size(0);
  int h = get_global_id(0) * g;
  int i = 0;

  for (; i < 8; i++)
    a[f * e + (h++)] = a[f * e + h] * b[f] + c[f];
}

__kernel void H(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, int f, int g) {
  int h = get_group_id(1);
  int i = get_local_size(0);
  int j = get_global_id(0) * i;
  int k = 0, l = 0, m = 0;

  for (; k < 8; k++) {
    m = h * g + j;
    l = (m / g) % f;
    a[m] = (a[m] - d[l]) / (sqrt(e[l]) + .000001f);
    a[m] = a[m] * b[h] + c[h];
    j = j + 1;
  }
}

__kernel void I(__global float* a, __global float* b, int c, ACTIVATION d) {
  int e = get_local_size(0);
  int f = get_global_id(0) * e;
  int g = 0;
  int h = get_local_id(0);

  float8 i = vload8(0, &a[f]);
  i = (i > (float8)0) ? i : ((float8)0.1 * i);
  vstore8(i, 0, &a[f]);
  i *= 0;
  vstore8(i, 0, &b[f]);
}

__kernel void J(__global float* a, __global float* b, int c, ACTIVATION d) {
  int e = get_local_size(0);
  int f = get_global_id(0) * e;
  int g = 0;

  float8 h = (float8)0;
  vstore8(h, 0, &b[f]);
}

__kernel void K(int a, __global float* b, int c, int d, int e, __global float* f) {
  int g = get_local_size(0);
  int h = get_global_id(0) * g;
  int i = 0, j, k, l, m, n;

  for (; i < 8; i++) {
    j = h;
    k = j % c;
    j = j / c;
    l = j % d;
    j = j / d;

    n = l * c + k;
    m = k * d + l;

    f[m] = b[n];
    h = h + 1;
  }
}

float L(__global float* a) {
  float8 b[10];
  b[0] = vload8(0, &a[0]);
  b[1] = vload8(0, &a[8]);
  b[2] = vload8(0, &a[16]);
  b[3] = vload8(0, &a[24]);
  b[4] = vload8(0, &a[32]);
  b[5] = vload8(0, &a[40]);
  b[6] = vload8(0, &a[48]);
  b[7] = vload8(0, &a[56]);
  b[8] = vload8(0, &a[64]);
  b[9] = vload8(0, &a[72]);

  float8 c;
  float d = -__builtin_inff();

  c = max(b[0], b[1]);
  c = max(c, b[2]);
  c = max(c, b[3]);
  c = max(c, b[4]);
  c = max(c, b[5]);
  c = max(c, b[6]);
  c = max(c, b[7]);
  c = max(c, b[8]);
  c = max(c, b[9]);
  c = max(c, b[10]);

  d = (c.s0 > d) ? c.s0 : d;
  d = (c.s1 > d) ? c.s1 : d;
  d = (c.s2 > d) ? c.s2 : d;
  d = (c.s3 > d) ? c.s3 : d;
  d = (c.s4 > d) ? c.s4 : d;
  d = (c.s5 > d) ? c.s5 : d;
  d = (c.s6 > d) ? c.s6 : d;
  d = (c.s7 > d) ? c.s7 : d;

  return d;
}

void M(__global float* a, __global float* b) {
  int c = 0;
  float8 d[10];
  d[0] = vload8(0, &a[0]);
  d[1] = vload8(0, &a[8]);
  d[2] = vload8(0, &a[16]);
  d[3] = vload8(0, &a[24]);
  d[4] = vload8(0, &a[32]);
  d[5] = vload8(0, &a[40]);
  d[6] = vload8(0, &a[48]);
  d[7] = vload8(0, &a[56]);
  d[8] = vload8(0, &a[64]);
  d[9] = vload8(0, &a[72]);

  float8 e;
  float f = -__builtin_inff();

  e = max(d[0], d[1]);
  e = max(e, d[2]);
  e = max(e, d[3]);
  e = max(e, d[4]);
  e = max(e, d[5]);
  e = max(e, d[6]);
  e = max(e, d[7]);
  e = max(e, d[8]);
  e = max(e, d[9]);
  e = max(e, d[10]);

  f = (e.s0 > f) ? e.s0 : f;
  f = (e.s1 > f) ? e.s1 : f;
  f = (e.s2 > f) ? e.s2 : f;
  f = (e.s3 > f) ? e.s3 : f;
  f = (e.s4 > f) ? e.s4 : f;
  f = (e.s5 > f) ? e.s5 : f;
  f = (e.s6 > f) ? e.s6 : f;
  f = (e.s7 > f) ? e.s7 : f;

  float8 g = (float8)f;
  float8 h = (float8)0;
  float i = 0;

  for (c = 0; c < 10; c++) {
    d[c] = exp(d[c] - g);
    h += d[c];
  }

  i = h.s0 + h.s1 + h.s2 + h.s3 + h.s4 + h.s5 + h.s6 + h.s7;

  for (c = 0; c < 10; c++) {
    d[c] /= i;
    vstore8(d[c], 0, &a[c * 8]);
  }
}

void N(__global float* a, __global float* b) {
  int c = 0;
  float16 d[5];
  d[0] = vload16(0, &a[0]);
  d[1] = vload16(0, &a[16]);
  d[2] = vload16(0, &a[32]);
  d[3] = vload16(0, &a[48]);
  d[4] = vload16(0, &a[64]);

  float16 e;
  float f = -__builtin_inff();

  e = max(d[0], d[1]);
  e = max(e, d[2]);
  e = max(e, d[3]);
  e = max(e, d[4]);

  f = (e.s0 > f) ? e.s0 : f;
  f = (e.s1 > f) ? e.s1 : f;
  f = (e.s2 > f) ? e.s2 : f;
  f = (e.s3 > f) ? e.s3 : f;
  f = (e.s4 > f) ? e.s4 : f;
  f = (e.s5 > f) ? e.s5 : f;
  f = (e.s6 > f) ? e.s6 : f;
  f = (e.s7 > f) ? e.s7 : f;
  f = (e.s8 > f) ? e.s8 : f;
  f = (e.s9 > f) ? e.s9 : f;
  f = (e.sa > f) ? e.sa : f;
  f = (e.sb > f) ? e.sb : f;
  f = (e.sc > f) ? e.sc : f;
  f = (e.sd > f) ? e.sd : f;
  f = (e.se > f) ? e.se : f;
  f = (e.sf > f) ? e.sf : f;

  float16 g = (float16)f;
  float16 h = (float16)0;
  float i = 0;

  for (c = 0; c < 5; c++) {
    d[c] = exp(d[c] - g);
    h += d[c];
  }

  i = h.s0 + h.s1 + h.s2 + h.s3 + h.s4 + h.s5 + h.s6 + h.s7 + h.s8 + h.s9 + h.sa + h.sb + h.sc + h.sd + h.se + h.sf;

  for (c = 0; c < 5; c++) {
    d[c] /= i;
    vstore16(d[c], 0, &a[c * 16]);
  }
}

void O(int a, __global float* b, float c, __global float* d) {
  int e;
  float f = 0, g = 0;
  float h = -__builtin_inff();

  h = L(b);

  for (e = 0; e < 80; ++e) {
    d[e] = exp(b[e] - h);
    f += d[e];
  }

  for (e = 0; e < 80; ++e)
    d[e] /= f;
}

__kernel void P(int a, int b, int c, __global float* d, float e, __global float* f, int g) {
  int h = get_local_size(0);
  int i = get_global_id(0) * h;
  int j = 0, k = 0;
  int l = 0;

  for (; j < 2; j++) {
    l = g + i * b;
    N(d + l, f + l);
    i = i + 1;
  }
}

__kernel void Q(int a, int b, int c, int d, int e, int f, int g, __global float* h, __global float* i) {
  int j = (b + 2 * g) / e;
  int k = (c + 2 * g) / e;
  int l = d;

  int m = get_local_size(0);
  int n = get_global_id(0) * m;

  int o = 0, p = 0;
  int q, r, s, t, u, v, w, x, y, z, aa, ab;
  float ac, ad;

  for (; o < 8; o++) {
    p = n;
    q = p % k;
    p /= k;
    r = p % j;
    p /= j;
    s = p % l;
    p /= l;

    t = -g;
    u = -g;

    v = q + k * (r + j * s);
    ac = -__builtin_inff();

    for (w = 0; w < 2; ++w) {
      for (x = 0; x < 2; ++x) {
        y = u + r * e + w;
        z = t + q * e + x;
        aa = z + c * (y + b * s);
        ab = (y >= 0 && y < b && z >= 0 && z < c);
        ad = (ab != 0) ? h[aa] : -__builtin_inff();
        ac = (ad > ac) ? ad : ac;
      }
    }
    i[v] = ac;
    n = n + 1;
  }
}