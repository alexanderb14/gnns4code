__constant float Ga = 0.66666f; __kernel void A(__global const float* a, __global const float* b, int c, int d, int e, int f, int g, __local float* h, __global float* i) {
  for (uint j = get_group_id(0); j < g; j += get_num_groups(0)) {
    const __global float* k = b + d + j * f;

    int l = get_local_id(0);
    int m = l;

    float n;
    if (l == 0) {
      n = k[0];
      m = get_local_size(0);
    } else
      n = 0.0f;

    for (uint o = m; o < f; o += get_local_size(0))
      n += k[o] * a[o - 1 + c];

    h[l] = n;

    for (uint p = get_local_size(0) / 2; p > 0; p /= 2) {
      barrier(1);
      if (l < p)
        h[l] += h[l + p];
    }

    if (l == 0)
      i[j + e] = tanh(Ga * h[0]);

    barrier(1);
  }
}

__kernel void B(__global const float* a, __global const float* b, int c, int d, int e, int f, __global float* g, int h, __local float* i) {
  int j = get_global_id(0);

  __global const float* k = b + d;
  __global const float* l = a + c;
  __global float* m = g + f;

  int n = j % e;
  int o = j / e;

  int p = get_local_id(0);
  int q = p % e;
  int r = p / e;

  if (p < e)
    i[p] = n == 0 ? 1.0 : l[n - 1];
  if (q == 0)
    i[e + r] = k[o];

  float s = m[j];

  barrier(1);

  if (j >= h)
    return;

  float t = i[e + r] * i[q];
  m[j] = s + t;
}

__kernel void C(__global float* a, __global const float* b, int c, int d, int e, int f, int g, int h, __local float* i, __global const float* j) {
  for (uint k = get_group_id(0); k < e; k += get_num_groups(0)) {
    const __global float* l = b + g + k;

    int m = get_local_id(0);

    float n = 0.0f;
    for (uint o = m; o < f; o += get_local_size(0))
      n += l[o * h] * a[o + c];

    i[m] = n;

    for (uint p = get_local_size(0) / 2; p > 0; p /= 2) {
      barrier(1);
      if (m < p)
        i[m] += i[m + p];
    }

    if (m == 0) {
      float q = j[k + d];
      a[k + d] += i[0] * Ga * (1.0f - q * q);
    }

    barrier(1);
  }
}

__kernel void D(int a, __global const float* b, int c, int d, __global const float* e, __local float* f, __global float* g, __global float* h) {
  int i = get_local_id(0);

  float j = 0.0f;
  for (uint k = i; k < a; k += get_local_size(0)) {
    if (k < c || k >= c + d) {
      g[k] = 0.0f;
      continue;
    }

    float l = b[k] - e[k - c];
    g[k] = l * Ga * (1.0f - b[k] * b[k]);

    j += l * l;
  }

  f[i] = j;

  for (uint m = get_local_size(0) / 2; m > 0; m /= 2) {
    barrier(1);
    if (i < m)
      f[i] += f[i + m];
  }

  if (get_global_id(0) == 0)
    h[0] += sqrt(f[0]);
}

__kernel void E(__global const float* a, float b, float c, __global float* d, __global float* e) {
  int f = get_global_id(0);

  float g = b * (-a[f]) + c * d[f];

  e[f] += g;
  d[f] = g;
}

__kernel void F(__global const float* a, __global const float* b, float c, float d, __global float* e, __global float* f) {
  int g = get_global_id(0);

  float h;

  if (__clc_fabs(e[g]) > 1e-8)
    h = min(a[g] / (b[g] - a[g]), d) * e[g];
  else
    h = -c * a[g];

  f[g] += h;
  e[g] = h;
}

__kernel void G(__global const float* a, __global const float* b, __global float* c, __global float* d) {
  int e = get_global_id(0);

  if (__clc_fabs(a[e]) < 1e-6f)
    return;

  float f;
  float g = b[e] * a[e];

  const float h = 1.2f;
  const float i = 0.5f;

  if (g > 1e-6f)
    c[e] = min(h * c[e], 50.0f);
  else if (g < -1e-6f)
    c[e] = max(i * c[e], 1e-6f);

  d[e] += c[e] * (a[e] > 0.0f ? -1.0f : 1.0f);
}

__kernel void H(__global const float* a, __global const float* b, int c, __local float* d, __local float* e, __global float* f) {
  int g = get_local_id(0);

  float h = 0.0f;
  float i = 0.0f;
  for (uint j = g; j < c; j += get_local_size(0)) {
    h += a[j] * (a[j] - b[j]);
    i += b[j] * b[j];
  }

  d[g] = h;
  e[g] = i;

  for (uint k = get_local_size(0) / 2; k > 0; k /= 2) {
    barrier(1);
    if (g < k) {
      d[g] += d[g + k];
      e[g] += e[g + k];
    }
  }

  if (get_global_id(0) == 0)
    f[0] = __clc_fabs(e[0]) < 1e-3 ? 0.0 : max(0.0f, d[0] / e[0]);
}

__kernel void I(__global const float* a, __global const float* b, __global float* c, __global float* d) {
  int e = get_global_id(0);

  d[e] = a[e];
  c[e] = a[e] + b[0] * c[e];
}