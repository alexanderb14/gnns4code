__kernel void A(__global float* a, int b, int c, int d, int e, __global float* f, int g, __global float* h, __global float* i) {
  const int j = get_global_id(0);
  if (j >= b)
    return;

  int k = (j / d) % c;

  if (e == 1 && g == 1) {
    i[j] = (a[j] - f[0]) * h[0];
  } else if (e == c && g == 1) {
    i[j] = (a[j] - f[k]) * h[0];
  } else if (e == 1 && g == c) {
    i[j] = (a[j] - f[0]) * h[k];
  } else if (e == c && g == c) {
    i[j] = (a[j] - f[k]) * h[k];
  }
}

__kernel void B(__global float* a, int b, int c, int d, int e, int f, int g, int h, int i, int j, int k, int l, int m, __global float* n) {
  const int o = get_global_id(0);
  if (o >= c)
    return;

  int p = o / m;
  int q = p % l;
  int r = o % m;
  int s = p / l;
  int t = s * g * g;
  int u = q * h - i;
  int v = r * h - i;
  n += (t * l + q) * m + r;
  a += b + (s * e + u) * f + v;
  for (int w = 0; w < g; ++w) {
    for (int x = 0; x < g; ++x) {
      int y = u + w * j;
      int z = v + x * j;
      *n = (y >= 0 && z >= 0 && y < e && z < f) ? a[w * j * f + x * j] : k;
      n += l * m;
    }
  }
}

__kernel void C(__global float* a, int b, int c, int d, int e, int f, int g, int h, int i, int j, int k, __global float* l) {
  const int m = get_global_id(0);
  if (m >= b)
    return;

  int n = m / k;
  int o = m % k;
  int p = n % j;
  n = n / j;
  int q = n % c;
  int r = n / c;

  int s = p * g - h, t = o * g - h;
  int u = min(s + f, d + h);
  int v = min(t + f, e + h);
  int w = (u - s) * (v - t);
  s = max(s, 0), t = max(t, 0);
  u = min(u, d), v = min(v, e);

  a += (r * c + q) * d * e;

  float x = -0x1.fffffep127f, y = 0.f;
  for (int z = s; z < u; ++z) {
    for (int aa = t; aa < v; ++aa) {
      float ab = a[z * e + aa];
      x = fmax(x, ab);
      y += ab;
    }
  }
  l[m] = (i == 0) ? x : y / w;
}

__kernel void D(__global float* a, int b, int c, int d, int e, int f, int g, __global float* h) {
  const int i = get_global_id(0);
  if (i >= b)
    return;

  int j = d * f;
  int k = i / j;
  int l = i % j;
  int m = l + (k * e + g) * d;
  h[m] = a[i];
}

__kernel void E(__global float* a, int b, int c, __global int* d, __global int* e, __global int* f, __global float* g) {
  const int h = get_global_id(0);
  if (h >= b)
    return;

  int i = 0;
  int j = h;
  for (int k = 0; k < c; ++k) {
    int l = d[k];
    i += (j / f[k]) * e[l];
    j %= f[k];
  }
  g[h] = a[i];
}

__kernel void F(__global float* a, int b, __global float* c, __global float* d, int e, int f, __global float* g) {
  const int h = get_global_id(0);
  if (h >= b)
    return;

  int i = (h / f) % e;
  g[h] = a[h] * c[i] + d[i];
}

__kernel void G(__global float* a, int b, __global float* c, int d, int e, __global float* f) {
  const int g = get_global_id(0);
  if (g >= b)
    return;

  int h = (g / e) % d;
  f[g] = a[g] + c[h];
}

__kernel void H(__global float* a, int b, int c, int d, int e, int f, int g, int h, int i, __global float* j) {
  const int k = get_global_id(0);
  if (k >= b)
    return;

  int l = k / h;
  int m = k % h;
  int n = l % g;
  l = l / g;
  int o = l % f;
  int p = l / f;

  int q = o % c;
  int r = o / c;
  int s = n * i + r / i;
  int t = m * i + r % i;
  int u = ((p * c + q) * d + s) * e + t;
  int v = ((p * f + o) * g + n) * h + m;
  j[v] = a[u];
}

__kernel void I(__global float* a, int b, int c, int d, int e, int f, float g, float h, __global float* i) {
  const int j = get_global_id(0);
  if (j >= b)
    return;

  int k = j / e;
  int l = j % e;
  int m = k % d;
  int n = k / d;

  int o = (n * c * d + m) * e + l, p = 0;
  __global float* q = a + o;
  __global float* r = i + o;
  float s = 0;
  int t = d * e;
  int u = (f - 1) / 2, v = f - u - 1;
  while (p < v && p < c) {
    s += q[p * t] * q[p * t];
    p++;
  }
  while (p < c) {
    s += q[p * t] * q[p * t];
    if (p - f >= 0) {
      s -= q[(p - f) * t] * q[(p - f) * t];
    }
    r[(p - v) * t] = h + s * g;
    p++;
  }
  while (p < c + v) {
    if (p - f >= 0) {
      s -= q[(p - f) * t] * q[(p - f) * t];
    }
    r[(p - v) * t] = h + s * g;
    p++;
  }
}

__kernel void J(__global float* a, int b, __global float* c, float d, __global float* e) {
  const int f = get_global_id(0);
  if (f >= b)
    return;

  e[f] = a[f] * __clc_pow(c[f], d);
}

__kernel void K(__global float* a, int b, __global float* c, int d, int e, int f, int g, int h, float i, __global float* j) {
  const int k = get_global_id(0);
  if (k >= b)
    return;

  int l = k % h;
  int m = (k / h) % g;
  int n = (k / h / g) % d;
  int o = k / h / g / d;

  c += o * 5;
  int p = c[0];
  int q = __clc_round(c[1] * i);
  int r = __clc_round(c[2] * i);
  int s = __clc_round(c[3] * i);
  int t = __clc_round(c[4] * i);

  int u = max(t - r + 1, 1);
  int v = max(s - q + 1, 1);
  float w = u / (float)g;
  float x = v / (float)h;

  int y = (int)__clc_floor(m * w);
  int z = (int)__clc_floor(l * x);
  int aa = (int)__clc_ceil((m + 1) * w);
  int ab = (int)__clc_ceil((l + 1) * x);

  y = min(max(y + r, 0), e);
  aa = min(max(aa + r, 0), e);
  z = min(max(z + q, 0), f);
  ab = min(max(ab + q, 0), f);

  bool ac = (aa <= y) || (ab <= z);

  a += (p * d + n) * e * f;

  float ad = ac ? 0.f : a[y * f + z];
  for (int ae = y; ae < aa; ++ae) {
    for (int af = z; af < ab; ++af) {
      ad = fmax(ad, a[ae * f + af]);
    }
  }
  j[k] = ad;
}

__kernel void L(int a, __global float* b, __global float* c, __global float* d, __global float* e, int f, int g, int h, int i, int j, __global float* k) {
  const int l = get_global_id(0);
  if (l >= a)
    return;

  int m = l % h;
  int n = (l / h) % g;
  int o = l / h / g;

  int p = f * g;
  int q = o * g + n;
  int r = m * 4 * p + q;
  float s = j * e[2];

  b += m * 4;
  k += l * 6;

  float t = c[(h + m) * p + q];

  float u = b[0] + n * i;
  float v = b[1] + o * i;
  float w = b[2] - b[0] + 1;
  float x = b[3] - b[1] + 1;
  float y = u + (w - 1) * 0.5f;
  float z = v + (x - 1) * 0.5f;

  float aa = d[r];
  float ab = d[r + p];
  float ac = d[r + p * 2];
  float ad = d[r + p * 3];

  float ae = y + w * aa, af = z + x * ab;
  float ag = w * exp(ac), ah = x * exp(ad);

  float ai = ae - (ag - 1) * 0.5f;
  float aj = af - (ah - 1) * 0.5f;
  float ak = ae + (ag - 1) * 0.5f;
  float al = af + (ah - 1) * 0.5f;

  k[0] = fmin(fmax(ai, 0.f), e[1] - 1);
  k[1] = fmin(fmax(aj, 0.f), e[0] - 1);
  k[2] = fmin(fmax(ai, 0.f), e[1] - 1);
  k[3] = fmin(fmax(aj, 0.f), e[0] - 1);
  k[4] = t;
  ag = k[2] - k[0] + 1;
  ah = k[3] - k[1] + 1;
  k[5] = (ag >= s) && (ah >= s);
}

inline float M(float a, int b, float c) {
  switch (b) {
    case 1:
      return a * (a > 0);
    case 2:
      return a > 0 ? a : c * a;
    case 3:
      return 1 / (1 + exp(-a));
    case 4:
      return log(1 + exp(a));
    case 5: {
      float d = exp(2 * a);
      return (d - 1) / (d + 1);
    }
    default:
      return a;
  }
}

__kernel void N(__global float* a, int b, int c, float d) {
  const int e = get_global_id(0);
  if (e >= b)
    return;

  a[e] = M(a[e], c, d);
}

__kernel void O(__global float* a, int b, int c, int d, int e, __global float* f) {
  const int g = get_global_id(0);
  if (g >= b)
    return;

  int h = (g / d) % c / e;
  float i = a[g];
  a[g] = i > 0 ? i : i * f[h];
}