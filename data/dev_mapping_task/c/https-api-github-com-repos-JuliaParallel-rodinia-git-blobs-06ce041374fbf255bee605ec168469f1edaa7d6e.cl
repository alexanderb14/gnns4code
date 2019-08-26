float A(float a) {
  int b = (int)(a);
  if (a - b < .5f)
    return b;
  else
    return b++;
}
float B(__global unsigned char* a, __global int* b, int c, int d) {
  float e = 0.0;
  int f;
  for (f = 0; f < c; f++)
    e += (__clc_pow((float)(a[b[d * c + f]] - 100), 2) - __clc_pow((float)(a[b[d * c + f]] - 228), 2)) / 50.0;
  return e;
}

void C(__global float* a, __global float* b, int c) {
  int d;
  a[0] = b[0];
  for (d = 1; d < c; d++) {
    a[d] = b[d] + a[d - 1];
  }
}

float D(__global int* a, int b) {
  int c = 2147483647;
  int d = 1103515245;
  int e = 12345;
  int f = d * a[b] + e;
  a[b] = f % c;
  return __clc_fabs(a[b] / ((float)c));
}
float E(__global int* a, int b) {
  float c = 3.14159265358979323846;
  float d = D(a, b);
  float e = D(a, b);
  float f = cos(2 * c * e);
  float g = -2 * log(d);
  return sqrt(g) * f;
}
float F(__global float* a, __global float* b, int c) {
  int d;
  float e = 0;
  for (d = 0; d < c; d++) {
    a[d] = a[d] * exp(b[d]);
    e += a[d];
  }
  return e;
}

int G(__global float* a, int b, int c, float d) {
  if (c < b)
    return -1;
  int e;
  while (c > b) {
    e = b + ((c - b) / 2);
    if (a[e] >= d) {
      if (e == 0)
        return e;
      else if (a[e - 1] < d)
        return e;
      else if (a[e - 1] == d) {
        while (a[e] == d && e >= 0)
          e--;
        e++;
        return e;
      }
    }
    if (a[e] > d)
      c = e - 1;
    else
      b = e + 1;
  }
  return -1;
}

float H(__read_only image2d_t a, int b) {
  const sampler_t c = 0x0000 | 0x0004 | 0x0000;

  if (b < 0)
    return 0;

  int d = b >> 2;

  int2 e;
  e.x = d >> 13;
  e.y = d & 0x1fff;
  float4 f = read_imagef(a, c, e);

  d = b & 0x0003;

  if (d < 2) {
    if (d == 0)
      return f.x;
    else
      return f.y;
  } else {
    if (d == 2)
      return f.z;
    else
      return f.w;
  }
}
__kernel void I(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, __global float* f, __global float* g, int h) {
  int i = get_global_id(0);

  if (i < h) {
    int j = -1;
    int k;

    for (k = 0; k < h; k++) {
      if (c[k] >= d[i]) {
        j = k;
        break;
      }
    }
    if (j == -1) {
      j = h - 1;
    }

    e[i] = a[j];
    f[i] = b[j];
  }
  barrier(2);
}
__kernel void J(__global float* a, int b, __global float* c, __global float* d, __global float* e, __global int* f) {
  int g = get_global_id(0);
  int h = get_local_id(0);
  __local float i;
  __local float j;

  if (0 == h)
    j = c[0];

  barrier(1);

  if (g < b) {
    a[g] = a[g] / j;
  }

  barrier(2);

  if (g == 0) {
    C(d, a, b);
    e[0] = (1 / ((float)(b))) * D(f, g);
  }

  barrier(2);

  if (0 == h)
    i = e[0];

  barrier(1);

  if (g < b) {
    e[g] = i + g / ((float)(b));
  }
}

__kernel void K(__global float* a, int b) {
  int c = get_global_id(0);
  size_t d = get_local_size(0);

  if (c == 0) {
    int e;
    float f = 0;
    int g = __clc_ceil((float)b / (float)d);
    for (e = 0; e < g; e++) {
      f += a[e];
    }
    a[0] = f;
  }
}
__kernel void L(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, __global int* f, __global int* g, __global float* h, __global unsigned char* i, __global float* j, __global float* k, const int l, const int m, const int n, int o, const int p, const int q, __global int* r, __global float* s, __local float* t) {
  int u = get_group_id(0);
  int v = get_local_id(0);
  int w = get_global_id(0);
  size_t x = get_local_size(0);
  int y;
  int z, aa;

  if (w < l) {
    a[w] = c[w];
    b[w] = d[w];

    k[w] = 1 / ((float)(l));

    a[w] = a[w] + 1.0 + 5.0 * E(r, w);
    b[w] = b[w] - 2.0 + 2.0 * E(r, w);
  }

  barrier(2);

  if (w < l) {
    for (y = 0; y < m; y++) {
      z = A(a[w]) + g[y * 2 + 1];
      aa = A(b[w]) + g[y * 2];

      f[w * m + y] = abs(z * p * q + aa * q + o);
      if (f[w * m + y] >= n)
        f[w * m + y] = 0;
    }
    h[w] = B(i, f, m, w);

    h[w] = h[w] / m - 300;

    k[w] = k[w] * exp(h[w]);
  }

  t[v] = 0.0;

  barrier(1 | 2);

  if (w < l) {
    t[v] = k[w];
  }

  barrier(1);

  for (unsigned int ab = x / 2; ab > 0; ab >>= 1) {
    if (v < ab) {
      t[v] += t[v + ab];
    }
    barrier(1);
  }
  if (v == 0) {
    s[u] = t[0];
  }
}