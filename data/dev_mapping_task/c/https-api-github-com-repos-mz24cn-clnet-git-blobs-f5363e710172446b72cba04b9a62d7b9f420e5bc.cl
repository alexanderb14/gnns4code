inline float A(float a) {
  return 1.0f / (1.0f + exp(-a));
}
inline float B(float a) {
  return a * (1.0f - a);
}

inline float C(float a) {
  return a > 0 ? a : 0;
}
inline float D(float a) {
  return a > 0 ? 1 : 0;
}

inline float E(float a) {
  return 1.0f - a * a;
}

inline float F(float a) {
  return log(1.0f + exp(a));
}
inline float G(float a) {
  return 1.0f - exp(-a);
}

inline float H(float a) {
  return a > 0 ? a : 0.25f * a;
}
inline float I(float a) {
  return a > 0 ? 1 : 0.25f;
}

inline float J(float a, float b) {
  float c = a - b;
  return c * c;
}
inline float K(float a, float b) {
  return a - b;
}

inline float L(float a, bool b) {
  return b ? a - 1.0f : a;
}

kernel void M(global float* a) {
  const int b = get_global_id(0);
  a[b] = A(a[b]);
}

kernel void N(global float* a, const global float* b, const global float* c, const global float* d, local float* e, const int f, const int g) {
  const int h = get_global_id(0);
  const int i = h / f;
  const int j = h % f;
  const int k = j * g;
  const int l = i * g;
  float m = d != ((void*)0) ? d[j] : 0;

  for (int n = 0; n < g; n++)
    m += c[k + n] * b[l + n];
  a[h] = A(m);
}

kernel void O(global float* a, global float* b, global float* c, const global float* d, const global float* e, const global float* f, const global float* g, const int h, const int i, const int j, const int k) {
  const int l = get_global_id(0);
  const int m = l % i;
  const int n = l / i;

  if (n < h) {
    float o = 0, p = 0;
    for (int q = 0; q < j; q++) {
      const float r = e[q * i + m];
      const float s = G(f[q * h + n]) * g[q * h + n];
      p += s;
      o += r * s;
    }
    if (m == 0 && c != ((void*)0))
      c[n] += p;
    b[n * i + m] += o;
  }

  if (a != ((void*)0) && n < j) {
    float t = 0;
    for (int q = 0; q < h; q++) {
      const float u = d[q * i + m];
      const float s = G(f[n * h + q]) * g[n * h + q];
      t += u * s;
    }
    if (k)
      a[n * i + m] += t;
    else
      a[n * i + m] = t;
  }
}

kernel void P(global float* a, const global float* b, const global float* c, const global float* d, local float* e, const int f, const int g) {
  const int h = get_global_id(0);

  const int i = get_local_size(0);
  const int j = h / i / f;
  const int k = (h / i) % f;
  const int l = k * g;
  const int m = j * g;
  float n = d != ((void*)0) ? d[k] : 0;

  const int o = h % i;
  float p = 0;

  for (int q = o; q < g; q += i)
    p += c[l + q] * b[m + q];

  e[o] = p;
  barrier(1);
  for (int r = i / 2; r > 0; r = r / 2) {
    if (o < r)
      e[o] += e[o + r];
    barrier(1);
  }
  if (o == 0)
    a[h / i] = F(n + e[0]);
}

kernel void Q(global float* a, global float* b, const global float* c, const global float* d, const global float* e, const global float* f, local float* g, const int h, const int i, const int j, const int k) {
  const int l = get_global_id(0);
  const int m = l / i;
  const int n = l % i;
  float o = 0;
  float p = 0;

  for (int q = 0; q < k; q++) {
    float r = d[q * h + m];

    float s = 0;
    for (int t = 0; t < j; t++)
      s += e[t * i + m] * f[t];

    float u = s * B(r);
    o += u;
    p += c[q * i + n] * u;
  }
  if (n == 0 && b != ((void*)0))
    b[m] += o;
  a[l] += p;
}

kernel void R(global float* a, global float* b, const global float* c, const global float* d, local float* e, const int f, const int g) {
  const int h = get_global_id(0);
  const int i = get_local_size(0);
  const int j = h / i;
  const int k = h % i;

  float l = c[j * f];
  for (int m = 1; m < f; m++)
    l = max(l, c[j * f + m]);

  float n = 0;
  for (int m = k; m < f; m += i) {
    const int o = j * f + m;
    b[o] = exp(c[o] - l);
    n += b[o];
  }

  e[k] = n;
  barrier(1);
  for (int p = i / 2; p > 0; p = p / 2) {
    if (k < p)
      e[k] += e[k + p];
    barrier(1);
  }
  n = e[0];

  for (int m = k; m < f; m += i) {
    const int q = ((int)d[j]), o = j * f + m;
    b[o] /= n;
    a[o] = L(b[o], m == q);
  }
}

kernel void S(global float* a, const global float* b, const global float* c) {
  const int d = get_global_id(0);
  a[d] = K(b[d], c[d]);
}

kernel void T(global float* a, global float* b, const global float* c, const global float* d, const global float* e, local float* f, const int g, const int h, const int i) {
  const int j = get_global_id(0);
  const int k = get_local_size(0);
  const int l = j / k / h;
  const int m = (j / k) % h;
  const int n = j % k;

  float o = 0, p = 0;
  for (int q = n; q < i; q += k) {
    const float r = d[q * g + l];
    float s = K(r, e[q * g + l]) * G(r);
    o += s;
    p += c[q * h + m] * s;
  }

  local float* t = f + k;
  f[n] = o;
  t[n] = p;
  barrier(1);
  for (int u = k / 2; u > 0; u = u / 2) {
    if (n < u) {
      f[n] += f[n + u];
      t[n] += t[n + u];
    }
    barrier(1);
  }
  if (n == 0) {
    if (m == 0 && b != ((void*)0))
      b[l] += f[0];
    a[j / k] += t[0];
  }
}

kernel void U(global float* a, global float* b, const global float* c, const global float* d, const global float* e, local float* f, const int g, const int h, const int i) {
  const int j = get_global_id(0);
  const int k = get_local_size(0);
  const int l = j / k / h;
  const int m = (j / k) % h;
  const int n = j % k;

  float o = 0, p = 0;
  for (int q = n; q < i; q += k) {
    const float r = d[q * g + l];
    const int s = (int)e[q * g + l];
    const bool t = s == l;

    const float u = L(r, t) * G(r);
    o += u;
    p += c[q * h + m] * u;
  }

  local float* v = f + k;
  f[n] = o;
  v[n] = p;
  barrier(1);
  for (int w = k / 2; w > 0; w = w / 2) {
    if (n < w) {
      f[n] += f[n + w];
      v[n] += v[n + w];
    }
    barrier(1);
  }
  if (n == 0) {
    if (m == 0 && b != ((void*)0))
      b[l] += f[0];
    a[j / k] += v[0];
  }
}

kernel void V(global float* a, global float* b, float c, float d) {
  const int e = get_global_id(0);
  a[e] -= c * (b[e] + d * a[e]);
  b[e] = 0;
}

kernel void W(global float* a, global float* b, const global float* c, const global float* d, const int e, const int f, const int g, const int h) {
  const int i = get_global_id(0);
  const int j = i / h;
  const int k = i % h;
  const int l = j * f + abs(e);

  if (e >= 0) {
    const int m = j * g, n = l * g;
    for (int o = k; o < g; o += h)
      a[m + o] = c[n + o];
  }

  if (b != ((void*)0)) {
    const int p = (l - 1) * h + k;
    b[p] = d[i];
  }
}

kernel void X(global float* a, global float* b, global float* c, const global float* d, const global float* e, const global float* f, const int g, const int h, const int i, const int j) {
  const int k = get_global_id(0);
  const int l = k / j;
  const int m = k % j;
  const int n = l * h + abs(g);

  if (d != ((void*)0)) {
    const int o = (n - 1) * j + m;
    a[k] += d[o];
  }

  if (g > 0) {
    const int p = l * i, q = n * i;
    for (int r = m; r < i; r += j) {
      const int s = p + r, o = q + r;
      c[s] = f[o - i];
      b[o] = e[s];
    }
  } else if (g == 0) {
    const int p = l * i, q = n * i;
    for (int r = m; r < i; r += j)
      b[q + r] = e[p + r];
  }
}

kernel void Y(global float* a, global float* b, global float* c, const global float* d, local float* e, const int f, int g) {
  const int h = get_global_id(0);
  const int i = h / f;
  const int j = i * 4 * f + (h % f);
  const int k = j + f;
  const int l = k + f;
  const int m = l + f;
  const float n = A(d[j]);
  const float o = tanh(d[k]);
  const float p = A(d[l]);
  const float q = A(d[m]);
  const float r = a[h];
  const float s = p * r + n * o;
  const float t = tanh(s);

  if (c != ((void*)0)) {
    global float* u = c + g * get_global_size(0) * 7;

    const float v = q * E(t);
    u[j] = o * B(n);
    u[k] = n * E(o);
    u[l] = r * B(p);
    u[m] = t * B(q);

    const int w = 4 * get_global_size(0) + h;
    const int x = w + get_global_size(0);
    const int y = x + get_global_size(0);
    u[w] = b[h];
    u[x] = v;
    u[y] = p;
  }
  a[h] = s;
  b[h] = q * t;
}

kernel void Z(global float* a, global float* b, global float* c, const global float* d, const global float* e, local float* f, const int g, const int h, const int i) {
  const int j = get_global_id(0);
  const int k = j / g;
  const int l = k * 4 * g + (j % g);
  const int m = l + g;
  const int n = m + g;
  const int o = n + g;
  const int p = 4 * get_global_size(0) + j;
  const int q = p + get_global_size(0);
  const int r = q + get_global_size(0);

  const global float* s = e + i * get_global_size(0) * 7;
  const float t = d[j];
  const float u = s[q];
  const float v = s[r];
  const float w = t * u + c[j];

  a[l] = w * s[l];
  a[m] = w * s[m];
  a[n] = w * s[n];
  a[o] = t * s[o];
  b[j] = s[p];
  c[j] = w * v;
}

kernel void AA(global float* a, global float* b, global float* c, global float* d, global float* e, const global float* f, const global float* g, const global float* h, const global float* i, local float* j, const int k, const int l, const int m, const int n) {
  const int o = get_global_id(0);
  const int p = get_local_size(0);
  const int q = o / p;
  const int r = o % p;
  const int s = q;
  const int t = s + l;
  const int u = t + l;
  const int v = u + l;
  f += n * l * m * 7;

  const global float* w = f;
  for (int x = r; x < l; x += p)
    for (int y = 0; y < m; y++) {
      const float z = w[4 * l + x];
      const float aa = d[y * l + q] / m;
      a[s * l + x] += aa * w[s] * z;
      a[t * l + x] += aa * w[t] * z;
      a[u * l + x] += aa * w[u] * z;
      a[v * l + x] += aa * w[v] * z;
      w += l * 5;
    }

  w = f;
  for (int x = r; x < k; x += p)
    for (int y = 0; y < m; y++) {
      const float ab = g[y * k + x];
      const float aa = d[y * l + q] / m;
      b[s * k + x] += aa * w[s] * ab;
      b[t * k + x] += aa * w[t] * ab;
      b[u * k + x] += aa * w[u] * ab;
      b[v * k + x] += aa * w[v] * ab;
      w += l * 5;
    }

  w = f;
  if (r == 0)
    for (int y = 0; y < m; y++) {
      const float aa = d[y * l + q] / m;
      c[s] += aa * w[s];
      c[t] += aa * w[t];
      c[u] += aa * w[u];
      c[v] += aa * w[v];

      for (int x = 0; x < l; x++)
        d[y * l + q] += aa * (w[x] + w[x + l] + w[x + 2 * l] + w[x + 3 * l]) * h[x * l + q];
      w += l * 5;
    }

  w = f;
  for (int x = r; x < k; x += p)
    for (int y = 0; y < m; y++) {
      const float ac = i[y * k + x];
      const float aa = d[y * l + q] / m;
      e[s * k + x] = aa * w[s] * i[s * k + x];
      e[t * k + x] = aa * w[t] * i[t * k + x];
      e[u * k + x] = aa * w[u] * i[u * k + x];
      e[v * k + x] = aa * w[v] * i[v * k + x];
      w += l * 5;
    }
}

kernel void AB(global float* a, const global float* b, const global float* c) {
  const int d = get_global_id(0);
  a[d] = b[d] + c[d];
}

kernel void AC(global float* a, const global float* b) {
  const int c = get_global_id(0);
  a[c] += b[c];
}

kernel void AD(global float* a, const global float* b, const global float* c, local float* d, const int e, const int f) {
  const int g = get_global_id(0);
  const int h = get_local_size(0);
  const int i = g / h;
  const int j = i / e;
  const int k = i % e;
  const int l = k * f;
  const int m = j * f;
  float n = 0;

  const int o = g % h;
  float p = 0;
  for (int q = o; q < f; q += h)
    p += b[l + q] * c[m + q];

  d[o] = p;
  barrier(1);
  for (int r = h / 2; r > 0; r = r / 2) {
    if (o < r)
      d[o] += d[o + r];
    barrier(1);
  }
  if (o == 0)
    a[i] = F(n + d[0]);
}

kernel void AE(global float* a, const global float* b, const global float* c, const global float* d, const int e, const int f, const int g, const int h, const int i, const int j, const int k, const int l, const int m, const int n) {
  const int o = get_global_size(1);
  const int p = get_global_size(2);
  const int q = get_global_size(0) / n;
  const int r = get_global_id(0) / q;
  const int s = get_global_id(1);
  const int t = get_global_id(2);
  const int u = get_global_id(0) % q;
  const int v = ((r * o + s) * p + t) * q + u;

  float w = c != ((void*)0) ? c[u] : 0;

  for (int x = 0; x < h; x++)
    for (int y = 0; y < i; y++) {
      int z = s * j + x - l;
      int aa = t * k + y - m;
      if (z < 0 || z >= e || aa < 0 || aa >= f)
        continue;
      int ab = ((u * h + x) * i + y) * g;
      int ac = ((r * e + z) * f + aa) * g;
      for (int ad = 0; ad < g; ad++)
        w += b[ab++] * d[ac++];
    }
  a[v] = C(w);
}

kernel void AF(global float* a, global float* b, const global float* c, const global float* d, const global float* e, const int f, const int g, const int h, const int i, const int j, const int k, const int l, const int m, const int n, const int o, const int p) {
  const int q = get_global_size(1);
  const int r = get_global_size(2);
  const int s = get_global_id(0) / h;
  const int t = get_global_id(1);
  const int u = get_global_id(2);
  const int v = get_global_id(0) % h;

  const int w = ((s * q + t) * r + u) * h + v;
  float x = 0, y = 0;
  int z = v;
  int aa = s;
  for (int ab = 0; ab < p; ab++, z += f * g * h, aa += i * j * k)
    for (int ac = 0; ac < i; ac++) {
      int ad = ac * l + t - n;
      if (ad < 0 || ad >= f)
        continue;
      for (int ae = 0; ae < j; ae++) {
        int af = ae * m + u - o;
        if (af < 0 || af >= g)
          continue;
        int ag = z + (ad * g + af) * h;
        int ah = aa + (ac * j + ae) * k;
        float ai = e[ah];
        float aj = D(d[ah]);
        float ak = c[ag];
        float al = aj * ai;
        y += al;
        x += al * ak;
      }
    }
  a[w] += x;
  if (t == 0 && u == 0 && v == 0 && b != ((void*)0))
    b[s] += y;
}

kernel void AG(global float* a, const global float* b, const global float* c, const global float* d, const int e, const int f, const int g, const int h, const int i, const int j, const int k, const int l, const int m, const int n, const int o) {
  const int p = get_global_size(1);
  const int q = get_global_size(2);
  const int r = get_global_id(0) / g;
  const int s = get_global_id(1);
  const int t = get_global_id(2);
  const int u = get_global_id(0) % g;

  const int v = ((r * p + s) * q + t) * g + u;
  float w = 0;
  const int x = e * f * g;
  for (int y = 0; y < e; y++)
    for (int z = 0; z < f; z++) {
      int aa = (s - y + m) / k;
      int ab = (t - z + n) / l;
      if (aa < 0 || aa >= h || ab < 0 || ab >= i)
        continue;
      int ac = ((r * h + aa) * i + ab) * j;
      int ad = (y * f + z) * g + u;
      for (int ae = 0; ae < j; ae++, ad += x) {
        float af = d[ac];
        float ag = D(c[ac++]);
        float ah = b[ad];
        w += ag * af * ah;
      }
    }
  a[v] = w;
}

kernel void AH(global float* a, const global float* b, const int c, const int d, const int e, const int f, const int g, const int h, const int i, const int j, const int k, const int l, global int* m) {
  const int n = get_global_size(1);
  const int o = get_global_size(2);
  const int p = e;
  const int q = get_global_id(0) / p;
  const int r = get_global_id(1);
  const int s = get_global_id(2);
  const int t = get_global_id(0) % p;
  const int u = ((q * n + r) * o + s) * p + t;

  float v = -0x1.fffffep127f, w;
  for (int x = 0; x < f; x++)
    for (int y = 0; y < g; y++) {
      int z = r * h + x - j;
      int aa = s * i + y - k;
      if (z < 0 || z >= c || aa < 0 || aa >= d) {
        if (v < 0) {
          v = 0;
          w = -1;
        }
        continue;
      }
      int ab = ((q * c + z) * d + aa) * e + t;
      if (b[ab] > v) {
        v = b[ab];
        w = ab;
      }
    }
  a[u] = v;
  m[u] = w;
}

kernel void AI(global float* a, const global float* b, const int c, const int d, const int e, const int f, const int g, const int h, const int i, const int j, const int k, const int l, const global int* m) {
  const int n = get_global_size(1);
  const int o = get_global_size(2);
  const int p = e;
  const int q = get_global_id(0) / p;
  const int r = get_global_id(1);
  const int s = get_global_id(2);
  const int t = get_global_id(0) % p;
  const int u = n * o * p;
  const int v = (r * o + s) * p + t;

  float w = 0;
  int x = ((q * n + r) * o + s) * p + t;
  for (int y = 0; y < f; y++)
    for (int z = 0; z < g; z++) {
      int aa = (r - y + j) / h;
      int ab = (s - z + k) / i;
      if (aa < 0 || aa >= c || ab < 0 || ab >= d)
        continue;
      int ac = ((q * c + aa) * d + ab) * e + t;
      int ad = (int)m[ac];
      w += x == ad ? b[ac] : 0;
    }
  a[x] = w;
}

kernel void AJ(global float* a, const global float* b, local float* c, const int d, const int e, const int f, const int g, const int h, const int i, const int j, const int k, const int l, const int m) {
  int n = (e + k * 2 - g + 1) / i;
  int o = (f + l * 2 - h + 1) / j;
  int p = get_global_id(0);
  int q = p / n / o;
  int r = p / q / o;
  int s = (p / q) % o;

  for (int t = 0; t < m; t++)
    for (int u = 0; u < d; u++) {
      float v = 0;
      for (int w = 0; w < g; w++)
        for (int x = 0; x < h; x++) {
          int y = r + w - k;
          int z = s + x - l;
          if (y < 0 || y >= e || z < 0 || z >= f)
            continue;
          int aa = t * d * f * e + u * f * e + y * i * f + z * j;
          v += b[aa];
        }
      a[t * get_global_size(0) + p] = v / g / h;
    }
}

kernel void AK(global float* a, const global float* b, const global float* c, local float* d, const int e, const int f, const int g, const int h, const int i, const int j, const int k, const int l, const int m, const int n) {
  int o = (f + l * 2 - h + 1) / j;
  int p = (g + m * 2 - i + 1) / k;
  int q = get_global_id(0);
  int r = q / o / p;
  int s = q / r / p;
  int t = (q / r) % p;

  for (int u = 0; u < n; u++) {
    float v = 0;
    int w = u * e * p * o + s * g + f;
    a[w] = 0;
    for (int x = 0; x < h; x += j)
      for (int y = 0; y < i; y += k) {
        int z = s - x + l;
        int aa = t - y + m;
        if (z < 0 || z >= o || aa < 0 || aa >= p)
          continue;
        int ab = u * e * p * o + r * p * o + z * p + aa;
        a[w] += b[ab] / h / i;
      }
  }
}

kernel void AL(global float* a, const global float* b, local float* c, const int d, const float e, const int f) {
  int g = get_global_id(0);

  for (int h = 0; h < f; h++)
    a[h * get_global_size(0) + g] *= b[g];
}

kernel void AM(global float* a, const global float* b, local float* c, const int d, const float e, const int f, const float g) {
  int h = get_global_id(0);

  for (int i = 0; i < f; i++)
    a[i * get_global_size(0) + h] *= b[h];
}

kernel void AN(global float* a, global float* b, const global float* c, local float* d, const int e, const int f) {
  const int g = get_global_id(0);
  const int h = get_local_size(0);
  const int i = g / h;

  for (int j = g % h; j < e; j += h)
    a[j * f + i] = c[((int)b[j]) * f + i];
}

kernel void AO(global float* a, const global float* b, const global float* c, local float* d, const int e, const int f, const int g) {
  const int h = get_global_id(0);
  for (int i = 0; i < e; i++)
    a[((int)b[i]) * f + h] += c[i * f + h];
}