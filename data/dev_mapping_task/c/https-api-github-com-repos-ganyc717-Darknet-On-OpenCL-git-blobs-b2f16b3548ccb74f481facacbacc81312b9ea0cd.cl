__kernel void A(__global float* a, __global float* b, int c, int d) {
  size_t e = get_global_id(0);
  size_t f = get_global_id(1);
  size_t g = get_global_id(2);
  size_t h = g - get_global_offset(2);
  size_t i = get_global_size(0);
  size_t j = i * f + e;
  if (j < d)
    a[g * d + j] *= b[h];
}
__kernel void B(__global float* a, __global float* b, int c, int d, int e, __global float* f) {
  __local float g[512];
  int h, i;
  int j = get_global_id(0);
  int k = get_global_id(1);
  float l = 0;
  for (i = 0; i < c; ++i) {
    for (h = 0; h < e; h += 512) {
      int m = k + h + e * (j + d * i);
      l += (k + h < e) ? b[m] * a[m] : 0;
    }
  }
  g[k] = l;
  barrier(1);
  if (k == 0) {
    for (h = 0; h < 512; ++h)
      f[j] += g[h];
  }
}
__kernel void C(__global float* a, __global float* b, int c, int d, int e) {
  int f = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (f >= d * e * c)
    return;
  int g = f % e;
  f /= e;
  int h = f % d;
  f /= d;
  int i = f;
  a[(i * d + h) * e + g] += b[h];
}
__kernel void D(__global float* a, __global float* b, int c, int d) {
  int e = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (e >= d)
    return;
  int f;
  float g = 0;
  for (f = 0; f < c; ++f) {
    int h = f * d + e;
    g += b[h];
  }
  a[e] += g;
}
__kernel void E(__global float* a, __global float* b, int c, int d, int e) {
  __local float f[512];
  int g, h;
  int i = get_global_id(0);
  int j = get_global_id(1);
  float k = 0;
  for (h = 0; h < c; ++h) {
    for (g = 0; g < e; g += 512) {
      int l = j + g + e * (i + d * h);
      k += (j + g < e) ? b[l] : 0;
    }
  }
  f[j] = k;
  barrier(1);
  if (j == 0) {
    for (g = 0; g < 512; ++g)
      a[i] += f[g];
  }
}
__kernel void F(int a, __global float* b, __global float* c, __global float* d, float e, float f, float g, float h, int i) {
  int j = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (j >= a)
    return;
  float k = c[j] / (1.0 - __clc_pow(e, i));
  float l = d[j] / (1.0 - __clc_pow(f, i));
  b[j] = b[j] + g * k / (sqrt(l) + h);
}
__kernel void G(int a, __global float* b, __global float* c, __global float* d, int e, int f, int g) {
  int h = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (h >= a)
    return;
  int i = (h / g) % f;
  b[h] = (b[h] - c[i]) / (sqrt(d[i] + .00001f));
}
__kernel void H(int a, __global float* b, __global float* c, __global float* d, __global float* e, __global float* f, int g, int h, int i, __global float* j) {
  int k = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (k >= a)
    return;
  int l = (k / i) % h;
  j[k] = j[k] * 1.f / (sqrt(d[l] + .00001f)) + f[l] * 2.f * (b[k] - c[l]) / (i * g) + e[l] / (i * g);
}
__kernel void I(__global float* a, __global float* b, int c, int d, int e, __global float* f) {
  __local float g[512];
  int h = get_global_id(1);
  int i = get_global_id(0);
  float j = 0;
  int k, l;
  for (l = 0; l < c; ++l) {
    for (k = 0; k < e; k += 512) {
      int m = l * e * d + i * e + k + h;
      j += (k + h < e) ? a[m] : 0;
    }
  }
  g[h] = j;
  barrier(1);
  if (h == 0) {
    f[i] = 0;
    for (k = 0; k < 512; ++k) {
      f[i] += g[k];
    }
    f[i] *= (-1.f / sqrt(b[i] + .00001f));
  }
}
__kernel void J(__global float* a, __global float* b, __global float* c, __global float* d, int e, int f, int g, __global float* h) {
  __local float i[512];
  int j = get_global_id(1);
  int k = get_global_id(0);
  float l = 0;
  int m, n;
  for (n = 0; n < e; ++n) {
    for (m = 0; m < g; m += 512) {
      int o = n * g * f + k * g + m + j;
      l += (m + j < g) ? b[o] * (a[o] - c[k]) : 0;
    }
  }
  i[j] = l;
  barrier(1);
  if (j == 0) {
    h[k] = 0;
    for (m = 0; m < 512; ++m) {
      h[k] += i[m];
    }
    h[k] *= -.5f * __clc_pow(d[k] + .00001f, (float)(-3.f / 2.f));
  }
}
__kernel void K(__global float* a, __global float* b, int c, int d, int e, __global float* f) {
  int g = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (g >= d)
    return;
  int h, i;
  f[g] = 0;
  for (h = 0; h < c; ++h) {
    for (i = 0; i < e; ++i) {
      int j = h * d * e + g * e + i;
      f[g] += a[j];
    }
  }
  f[g] *= (-1.f / sqrt(b[g] + .00001f));
}
__kernel void L(__global float* a, int b, int c, int d, __global float* e) {
  float f = 1.f / (b * d);
  int g = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (g >= c)
    return;
  int h, i;
  e[g] = 0;
  for (h = 0; h < b; ++h) {
    for (i = 0; i < d; ++i) {
      int j = h * c * d + g * d + i;
      e[g] += a[j];
    }
  }
  e[g] *= f;
}
__kernel void M(__global float* a, __global float* b, int c, int d, int e, __global float* f) {
  float g = 1.f / (c * e - 1);
  int h, i;
  int j = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (j >= d)
    return;
  f[j] = 0;
  for (h = 0; h < c; ++h) {
    for (i = 0; i < e; ++i) {
      int k = h * d * e + j * e + i;
      f[j] += __clc_pow((a[k] - b[j]), 2);
    }
  }
  f[j] *= g;
}
__kernel void N(int a, __global float* b, int c, int d, int e, int f, int g, int h, __global float* i) {
  int j = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (j >= a)
    return;
  int k = j;
  int l = j % c;
  j = j / c;
  int m = j % d;
  j = j / d;
  int n = j % e;
  j = j / e;
  int o = j % f;
  int p = e / (g * g);
  int q = n % p;
  int r = n / p;
  int s = l * g + r % g;
  int t = m * g + r / g;
  int u = s + c * g * (t + d * g * (q + p * o));
  if (h)
    i[u] = b[k];
  else
    i[k] = b[u];
}
__kernel void O(int a, float b, __global float* c, int d, int e, __global float* f, int g, int h) {
  size_t i = get_global_id(0);
  size_t j = get_global_id(1);
  size_t k = get_global_id(2);
  size_t l = k * get_global_size(0) * get_global_size(1) + j * get_global_size(0) + i;
  if (l < a)
    f[g + l * h] += b * c[d + l * e];
}
__kernel void P(int a, float b, __global float* c, int d, __global float* e, int f) {
  int g = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (g < a)
    e[g * f] = __clc_pow(c[g * d], b);
}
__kernel void Q(int a, float b, __global float* c, int d) {
  int e = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (e < a)
    c[e * d] = b;
}
__kernel void R(int a, float b, __global float* c, int d) {
  int e = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (e < a)
    c[e * d] = fmin(b, fmax(-b, c[e * d]));
}
__kernel void S(int a, float b, __global float* c, int d) {
  size_t e = get_global_id(0);
  size_t f = get_global_id(1);
  size_t g = get_global_id(2);
  size_t h = g * get_global_size(0) * get_global_size(1) + f * get_global_size(0) + e;
  if (h < a) {
    if ((c[h * d] * c[h * d]) < (b * b))
      c[h * d] = 0;
  }
}
__kernel void T(int a, float b, __global float* c, int d) {
  size_t e = get_global_id(0);
  size_t f = get_global_id(1);
  size_t g = get_global_id(2);
  size_t h = g * get_global_size(0) * get_global_size(1) + f * get_global_size(0) + e;
  if (h < a)
    c[h * d] += b;
}
__kernel void U(int a, float b, __global float* c, int d) {
  size_t e = get_global_id(0);
  size_t f = get_global_id(1);
  size_t g = get_global_id(2);
  size_t h = g * get_global_size(0) * get_global_size(1) + f * get_global_size(0) + e;
  if (h < a)
    c[h * d] *= b;
}
__kernel void V(int a, float b, __global float* c, int d) {
  size_t e = get_global_id(0);
  size_t f = get_global_id(1);
  size_t g = get_global_id(2);
  size_t h = g * get_global_size(0) * get_global_size(1) + f * get_global_size(0) + e;
  if (h < a)
    c[h * d] = b;
}
__kernel void W(int a, __global float* b, int c, int d, __global float* e, int f, int g) {
  int h = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (h < a)
    e[h * g + f] = b[h * d + c];
}
__kernel void X(int a, __global float* b, int c, __global float* d, int e) {
  size_t f = get_global_id(0);
  size_t g = get_global_id(1);
  size_t h = get_global_id(2);
  size_t i = h * get_global_size(0) * get_global_size(1) + g * get_global_size(0) + f;
  if (i < a)
    d[i * e] *= b[i * c];
}
__kernel void Y(__global float* a, int b, int c, int d, __global float* e) {
  __local float f[512];
  int g = get_global_id(1);
  int h = get_global_id(0);
  float i = 0;
  int j, k;
  for (k = 0; k < b; ++k) {
    for (j = 0; j < d; j += 512) {
      int l = k * d * c + h * d + j + g;
      i += (j + g < d) ? a[l] : 0;
    }
  }
  f[g] = i;
  barrier(1);
  if (g == 0) {
    e[h] = 0;
    for (j = 0; j < 512; ++j) {
      e[h] += f[j];
    }
    e[h] /= d * b;
  }
}
__kernel void Z(__global float* a, __global float* b, int c, int d, int e, __global float* f) {
  __local float g[512];
  int h = get_global_id(1);
  int i = get_global_id(0);
  float j = 0;
  int k, l;
  for (l = 0; l < c; ++l) {
    for (k = 0; k < e; k += 512) {
      int m = l * e * d + i * e + k + h;

      j += (k + h < e) ? __clc_pow((a[m] - b[i]), 2) : 0;
    }
  }
  g[h] = j;
  barrier(1);
  if (h == 0) {
    f[i] = 0;
    for (k = 0; k < 512; ++k) {
      f[i] += g[k];
    }
    f[i] /= (e * c - 1);
  }
}

__kernel void AA(int a, __global float* b, int c, int d, int e, int f, __global float* g) {
  int h = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (h >= a)
    return;
  int i = h % c;
  h = h / c;
  int j = h % d;
  h = h / d;
  int k = h;
  int l = k * d * c + j * c + i;
  int m = k * d * c + i * d + j;
  if (f)
    g[m] = b[l];
  else
    g[l] = b[m];
}
__kernel void AB(int a, __global float* b, float c, __global float* d, float e) {
  int f = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (f < a && d[f] == c)
    b[f] *= e;
}
__kernel void AC(int a, int b, int c, int d, int e, int f, int g, int h, int i, int j, __global float* k, int l, int m, int n, float o, float p, __global float* q) {
  int r = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (r >= a)
    return;
  int s = r % b;
  r /= b;
  int t = r % c;
  r /= c;
  int u = r % d;
  r /= d;
  int v = r % g;
  int w = s * f + l * (t * f + m * (u + n * v));
  int x = s * e + h * (t * e + i * (u + j * v));
  q[w] = o * q[w] + p * k[x];
}
__kernel void AD(int a, __global float* b, __global float* c, __global float* d, __global float* e) {
  int f = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (f < a) {
    float g = c[f] - b[f];
    float h = __clc_fabs(g);
    if (h < 1) {
      e[f] = g * g;
      d[f] = g;
    } else {
      e[f] = 2 * h - 1;
      d[f] = (g > 0) ? 1 : -1;
    }
  }
}
__kernel void AE(int a, __global float* b, __global float* c, __global float* d, __global float* e) {
  int f = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (f < a) {
    float g = c[f] - b[f];
    e[f] = g * g;
    d[f] = g;
  }
}
__kernel void AF(int a, __global float* b, __global float* c, __global float* d, __global float* e) {
  int f = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  if (f < a) {
    float g = c[f] - b[f];
    e[f] = __clc_fabs(g);
    d[f] = (g > 0) ? 1 : -1;
  }
}
__kernel void AG(int a, __global float* b, __global float* c, __global float* d, __global float* e) {
  int f = get_global_id(2) * get_global_size(0) * get_global_size(1) + get_global_id(1) * get_global_size(0) + get_global_id(0);
  float g = 0.0;
  if (c != 0)
    g = c[f];
  if (f < a) {
    e[f] = d[f] * b[f] + (1 - d[f]) * g;
  }
}