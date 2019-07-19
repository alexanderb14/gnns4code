__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, const int e, const int f, const int g, const float h, const ulong i, __global bool* j) {
  const int k = get_global_id(0);
  const int l = get_global_id(1);

  if (k < f && l < g) {
    int m = l * f + k;

    bool n;
    if (h < 1.0F) {
      ulong o = i + m;
      o = (o * 0x5DEECE66DL + 0xBL) & ((1L << 48) - 1);
      uint p = o >> 16;
      for (int q = 0; q < 6; ++q) {
        o = p;
        o = (o * 0x5DEECE66DL + 0xBL) & ((1L << 48) - 1);
        p = o >> 16;
      }
      float r = (float)p / (float)4294967295;

      n = r < h;
    } else {
      n = true;
    }

    j[m] = n;

    if (n) {
      int s = l * e;

      float t = 0.0;

      for (int u = 0; u < e; u++) {
        float v = c[k * e + u];

        float w = b[s + u];

        t += v * w;
      }

      t += d[k];

      a[m] = t / h;
    } else {
      a[m] = 0.0f;
    }
  }
}

__kernel void B(__global float* a, __global float* b, __global float* c, __global bool* d, const int e, const int f, const int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);

  if (h < e && i < g) {
    int j = i * f;
    int k = 0;
    float l = 0.0F;

    for (int m = 0; m < f; m++) {
      k = j + m;

      if (d[k] == true) {
        l += c[m * e + h] * b[k];
      }
    }

    a[i * e + h] = l;
  }
}
__kernel void C(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, __global float* f, __global bool* g, const int h, const int i, const float j, const float k, const int l, __global float* m, const float n)

{
  const int o = get_global_id(0);
  const int p = get_global_id(1);

  if (o < i && p < h) {
    const int q = o * h + p;
    const float r = n * m[q];
    const bool s = p == 0;

    float t = 0.0;
    float u = 0.0;

    int v = 0;

    float w = 0.0F;

    for (int x = 0; x < l; x++) {
      v = x * i + o;

      if (g[v]) {
        w = f[v];

        t += e[x * h + p] * w + r;

        if (s) {
          u += w;
        }
      }
    }

    c[q] = t;

    a[q] = (j * a[q]) - k * t;

    if (s) {
      d[o] = u;
      b[o] = (j * b[o]) - k * u;
    }
  }
}

__kernel void D(__global float* a, __global float* b, __global float* c, __global float* d, const int e, const int f)

{
  const int g = get_global_id(0);
  const int h = get_global_id(1);

  if (g < f && h < e) {
    int i = g * e + h;
    a[i] += c[i];

    if (h == 0) {
      b[g] += d[g];
    }
  }
}

__kernel void E(__global float* a, const int b, const int c, const float d)

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