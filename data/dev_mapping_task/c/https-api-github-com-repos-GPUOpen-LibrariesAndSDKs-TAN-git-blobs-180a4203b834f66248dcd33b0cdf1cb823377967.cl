__kernel void A(__global const float* a, __global float* b, int c, int d, int e, int f, int g, int h) {
  int i = get_global_id(0);

  int j = (i) / (g + h);
  int k = ((i + c - j * h) % d);
  int l = ((i + e) % f);

  bool m = (i % (g + h)) >= g;

  b[l] = m ? 0 : a[k];
}

__kernel void B(__global const float* a, __global float* b) {
  int c = get_global_id(0);

  b[c * 2] = a[c];
  b[c * 2 + 1] = 0;
}

__kernel void C(__global const float* a, __global float* b) {
  int c = get_global_id(0);

  b[c] = a[c * 2];
}

__kernel void D(__global const float* a, __global float* b, __global const int* c, __global const int* d, __global const int* e, int f, int g, int h) {
  int i = get_global_id(0);
  int j = i / (f / 2);
  int k = c[j];

  int l = d[j];
  int m = e[j];

  int n = i - j * (f / 2);

  if (n < g)
    b[i * 2] = a[k * g * h + m * g + n];
  else if (n < 2 * g)
    b[i * 2] = a[k * g * h + l * g + n - g];
  else
    b[i * 2] = 0;

  b[i * 2 + 1] = 0;
}

__kernel void E(__global const float* a, __global const float* b, __global float* c, int d, int e, int f) {
  int g = get_global_id(0);

  int h = (g + d * e) % (f * e);

  c[g] = b[g] * a[h];
}

__kernel void F(__global const float* a, __global float* b, int c, int d) {
  int e = get_global_id(0);

  b[e] = a[e];
  for (int f = 1; f < d; f++) {
    b[e] += a[e + f * c];
  }
}

float2 G(const float2 a, const float2 b) {
  float2 c;
  c.s0 = a.s0 * b.s0 - (a.s1 * b.s1);
  c.s1 = a.s0 * b.s1 + b.s0 * a.s1;

  return c;
}

__kernel void H(__global const float2* a, __global const float2* b, __global float2* c, int d, int e, int f) {
  int g = 2 * get_global_id(0);
  int h = g + d * e;
  int i = g;

  c[g / 2] = G(a[h / 2], b[i / 2]);
  for (int j = 1; j < f; j++) {
    h = g + (d - j) * e;
    i = g + j * e;
    if (h < 0)
      h += f * e;
    if (i > f * e)
      i -= f * e;

    c[g / 2] += G(a[h / 2], b[i / 2]);
  }
}

__kernel void I(__global const float2* a, __global const float2* b, __global float2* c, __global const int* d, __global const int* e, __global const int* f, int g, int h, int i) {
  int j = get_global_id(0);
  int k = get_global_id(1);
  int l = d[k];
  int m = e[k];
  int n = f[k];

  int o = l * g * h + n * g + j;
  int p = ((l * i + m) * h) * g + j;
  int q = k * g + j;

  if (k == 1 && ((j < 5))) {
  }

  c[q] = G(a[o], b[p]);
  for (int r = 1; true && r < h; r++) {
    int s = n - r;
    if (s < 0)
      s += h;

    o = l * g * h + s * g + j;
    p = ((l * i + m) * h + r) * g + j;

    if (k == 0 && j == 0) {
    }

    c[q] += G(a[o], b[p]);
  }
}

__kernel void J(__global const float* a, __global float* b, __global const int* c, __global const int* d, int e, int f) {
  int g = get_global_id(0);
  int h = get_global_id(1);
  int i = c[h];
  int j = d[h];

  int k = h * e + g;
  int l = i * e * f + j * e + g;

  if (h == 1 && ((g < 5))) {
  }

  b[l] = a[k];
}