__kernel void A(__global int* a, const int b, const int c, const int d, const int e, const int f) {
  int g = get_global_id(0);
  int h = get_global_id(1);

  const int i = c * c;

  if (g < e && h < i) {
    const int j = g;
    const int k = h;

    int l = 0;
    const int m = j * i + k;

    const int n = g / (d * d);
    const int o = b * b;
    const int p = o * n;

    l += p;

    const int q = h / c;
    const int r = h % c;
    const int s = q * f * b + f * r;

    l += s;

    const int t = (g % (d * d)) / d;
    const int u = g % d;
    const int v = b * t + u;

    l += v;

    a[m] = l;
  }
}
__kernel void B(__global int* a, const int b, const int c, const int d) {
  const int e = get_global_id(0);

  const int f = b * b;
  const int g = c * f;
  const int h = d * (2 * d + b);
  const int i = 4 * d * (b + d);

  if (e < g) {
    int j = e;

    int k = (e % g) / f;

    j += i * k;

    int l = (e % f) / b;

    j += h + d * (2 * l + 1);

    a[e] = j;
  }
}
__kernel void C(__global float* a, __global float* b, __global int* c, const int d, const int e, const int f) {
  const int g = get_global_id(0);

  if (g < d * f) {
    int h = g / d;
    int i = g - d * h;

    int j = h * e;

    int k = j + c[i];

    a[k] = b[g];
  }
}
__kernel void D(__global float* a, __global float* b, __global int* c, const int d, const int e, const int f) {
  const int g = get_global_id(0);

  if (g < d * f) {
    int h = g / d;
    int i = g - d * h;

    int j = h * e;

    int k = j + c[i];

    a[g] = b[k];
  }
}
__kernel void E(__global float* a, __global float* b, __global int* c, __global float* d, __global float* e, const int f, const int g, const int h, const int i, const int j, __global bool* k, const float l, const ulong m) {
  const int n = get_global_id(0);
  const int o = get_global_id(1);

  if (n < f * j && o < h) {
    const int p = n / f;
    const int q = n - f * (p);

    const int r = p * f * h;
    const int s = r + q * h + o;

    const int t = p * i;
    const int u = q * g;

    float v = 0.0;
    int w = 0;

    bool x;
    if (l < 1.0F) {
      ulong y = m + s;
      y = (y * 0x5DEECE66DL + 0xBL) & ((1L << 48) - 1);
      uint z = y >> 16;
      for (int aa = 0; aa < 6; ++aa) {
        y = z;
        y = (y * 0x5DEECE66DL + 0xBL) & ((1L << 48) - 1);
        z = y >> 16;
      }
      float ab = (float)z / (float)4294967295;

      x = ab < l;
    } else {
      x = true;
    }

    k[s] = x;

    if (x) {
      for (int ac = 0; ac < g; ++ac) {
        w = t + c[ac * h + o];

        v = __clc_fma(d[u + ac], b[w], v);
      }

      v += e[q];

      a[s] = v / l;
    } else {
      a[s] = 0.0f;
    }
  }
}

inline void F(volatile __global float* a, float b) {
  union {
    unsigned int u32;
    float f32;
  } c, d, e;
  e.f32 = *a;
  do {
    d.f32 = e.f32;
    c.f32 = d.f32 + b;
    e.u32 = atomic_cmpxchg((volatile __global unsigned int*)a, d.u32, c.u32);
  } while (e.u32 != d.u32);
}
__kernel void G(__global float* a, const int b, __global float* c, __global float* d, __global int* e, const int f, const int g, const int h, const int i, __global bool* j) {
  const int k = get_global_id(0);
  const int l = get_global_id(1);
  if (k < g * i && l < h) {
    const int m = k / g;
    const int n = k % g;

    const int o = m * (f * h);

    float p = 0.0F;

    int q = 0;

    for (int r = 0; r < f; ++r) {
      q = o + r * h + l;

      if (j[q] == true) {
        p += d[r * g + n] * c[q];
      }
    }

    const int s = m * b;
    const int t = e[n * h + l];
    const int u = s + t;

    F(&a[u], p);
  }
}
__kernel void H(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, __global float* f, const int g, __global int* h, const int i, const int j, const int k, const float l, const float m, const int n, __global bool* o, __global float* p, const float q) {
  const int r = get_global_id(0);
  const int s = get_global_id(1);
  if (r < i && s < j) {
    const int t = r * j + s;
    const float u = q * p[t];
    const int v = r;

    const int w = r * k;
    const int x = s * k;

    float y = 0.0;
    float z = 0.0;
    int aa = 0;
    int ab = 0;

    int ac = 0;
    float ad = 0.0F;

    int ae = 0;

    const int af = i * k;

    for (int ag = 0; ag < n; ++ag) {
      aa = ag * g;

      ab = ag * af + w;

      for (int ah = 0; ah < k; ++ah) {
        ac = ab + ah;

        if (o[ac]) {
          ad = e[ac];

          ae = aa + h[x + ah];

          y = __clc_fma(ad, f[ae], y) + u;

          if (s == 0) {
            z += ad;
          }
        }
      }
    }

    c[t] = y;

    a[t] = (l * a[t]) - m * y;

    if (s == 0) {
      d[v] = z;
      b[v] = (l * b[v]) - m * z;
    }
  }
}

__kernel void I(__global float* a, __global float* b, __global float* c, __global float* d, const int e, const int f)

{
  const int g = get_global_id(0);
  const int h = get_global_id(1);

  if (g < e && h < f) {
    const int i = g * f + h;
    const int j = g;

    a[i] += c[i];

    if (h == 0) {
      b[j] += d[j];
    }
  }
}

__kernel void J(__global float* a, const int b, const int c, const float d)

{
  const int e = get_global_id(0);

  if (e < b) {
    float f = 0.0F;

    for (int g = 0; g < c; g++) {
      f += __clc_pow(a[e * c + g], 2);
    }
    f = sqrt(f);

    if (f > d) {
      float h = d / c;
      for (int g = 0; g < c; g++) {
        a[e * c + g] *= h;
      }
    }
  }
}