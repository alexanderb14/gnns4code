kernel void A(global const uchar* a, global const uchar* b, global float* c, int d, int e, int f, int g, int h, int i, int j) {
  const int k = get_global_id(0);
  const int l = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(float);

  float m = 0;

  const int n = -g / 2;
  const int o = -h / 2;

  for (int p = 0; p < h; ++p)
    for (int q = 0; q < g; ++q) {
      int r = k + q + n;
      int s = l + p + o;

      float t = convert_float(b[p * e + q]);
      float u = 0;

      if (r < 0 || s < 0 || r >= i || s >= j)
        u = 0;
      else
        u = convert_float(a[s * d + r]);

      m += (u - t) * (u - t);
    }

  c[l * f + k] = m;
}

__attribute__((reqd_work_group_size(16, 16, 1))) kernel void B(global const uchar* a, global const uchar* b, global float* c, int d, int e, int f, int g, int h, int i, int j) {
  const int k = get_global_id(0);
  const int l = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(float);

  local float m[16 * 16];

  const int n = get_local_id(0);
  const int o = get_local_id(1);
  const int p = o * get_local_size(0) + n;

  if (n < g && o < h)
    m[p] = convert_float(b[o * e + n]);

  barrier(1);

  const int q = -g / 2;
  const int r = -h / 2;

  float s = 0;

  if (k >= i || l >= j)
    return;

  for (int t = 0; t < h; ++t)
    for (int u = 0; u < g; ++u) {
      int v = k + u + q;
      int w = l + t + r;

      float x = m[t * 16 + u];
      float y = 0;

      if (v < 0 || w < 0 || v >= i || w >= j)
        y = 0;
      else
        y = convert_float(a[w * d + v]);

      s += (y - x) * (y - x);
    }

  c[l * f + k] = s;
}

kernel void C(global const uchar* a, global const uchar* b, global float* c, int d, int e, int f, int g, int h, int i, int j) {
  const int k = get_global_id(0);
  const int l = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(float);

  float m = 0;
  float n = 0;
  float o = 0;
  float p = 0;

  const int q = -g / 2;
  const int r = -h / 2;

  for (int s = 0; s < h; ++s)
    for (int t = 0; t < g; ++t) {
      int u = k + t + q;
      int v = l + s + r;

      float w = convert_float(b[s * e + t]);
      float x = 0;

      if (u < 0 || v < 0 || u >= i || v >= j)
        x = 0;
      else
        x = convert_float(a[v * d + u]);

      m += (x - w) * (x - w);
      n += x * x;
      o += w * w;
    }

  p = m / sqrt(n * o);

  c[l * f + k] = p;
}

__attribute__((reqd_work_group_size(16, 16, 1))) kernel void D(global const uchar* a, global const uchar* b, global float* c, int d, int e, int f, int g, int h, int i, int j) {
  const int k = get_global_id(0);
  const int l = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(float);

  local float m[16 * 16];

  const int n = get_local_id(0);
  const int o = get_local_id(1);
  const int p = o * get_local_size(0) + n;

  if (n < g && o < h)
    m[p] = convert_float(b[o * e + n]);

  barrier(1);

  if (k >= i || l >= j)
    return;

  float q = 0;
  float r = 0;
  float s = 0;
  float t = 0;

  const int u = -g / 2;
  const int v = -h / 2;

  for (int w = 0; w < h; ++w)
    for (int x = 0; x < g; ++x) {
      int y = k + x + u;
      int z = l + w + v;

      float aa = m[w * 16 + x];
      float ab = 0;

      if (y < 0 || z < 0 || y >= i || z >= j)
        ab = 0;
      else
        ab = convert_float(a[z * d + y]);

      q += (ab - aa) * (ab - aa);
      r += ab * ab;
      s += aa * aa;
    }

  t = q / sqrt(r * s);

  c[l * f + k] = t;
}

kernel void E(global const uchar* a, global const uchar* b, global float* c, int d, int e, int f, int g, int h, int i, int j) {
  const int k = get_global_id(0);
  const int l = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(float);

  float m = 0;

  const int n = -g / 2;
  const int o = -h / 2;

  for (int p = 0; p < h; ++p)
    for (int q = 0; q < g; ++q) {
      int r = k + q + n;
      int s = l + p + o;

      float t = convert_float(b[p * e + q]);
      float u = 0;

      if (r < 0 || s < 0 || r >= i || s >= j)
        u = 0;
      else
        u = convert_float(a[s * d + r]);

      m += __clc_fabs(u - t);
    }

  c[l * f + k] = m;
}

__attribute__((reqd_work_group_size(16, 16, 1))) kernel void F(global const uchar* a, global const uchar* b, global float* c, int d, int e, int f, int g, int h, int i, int j) {
  const int k = get_global_id(0);
  const int l = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(float);

  local float m[16 * 16];

  const int n = get_local_id(0);
  const int o = get_local_id(1);
  const int p = o * get_local_size(0) + n;

  if (n < g && o < h)
    m[p] = convert_float(b[o * e + n]);

  barrier(1);

  if (k >= i || l >= j)
    return;

  float q = 0;

  const int r = -g / 2;
  const int s = -h / 2;

  for (int t = 0; t < h; ++t)
    for (int u = 0; u < g; ++u) {
      int v = k + u + r;
      int w = l + t + s;

      float x = m[t * 16 + u];
      float y = 0;

      if (v < 0 || w < 0 || v >= i || w >= j)
        y = 0;
      else
        y = convert_float(a[w * d + v]);

      q += __clc_fabs(y - x);
    }

  c[l * f + k] = q;
}

kernel void G(global const uchar* a, global const uchar* b, global float* c, int d, int e, int f, int g, int h, int i, int j) {
  const int k = get_global_id(0);
  const int l = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(float);

  float m = 0;

  const int n = -g / 2;
  const int o = -h / 2;

  for (int p = 0; p < h; ++p)
    for (int q = 0; q < g; ++q) {
      int r = k + q + n;
      int s = l + p + o;

      float t = convert_float(b[p * e + q]);
      float u = 0;

      if (r < 0 || s < 0 || r >= i || s >= j) {
        u = 0;
      } else {
        u = convert_float(a[s * d + r]);
      }

      m += u * t;
    }

  c[l * f + k] = m;
}

__attribute__((reqd_work_group_size(16, 16, 1))) kernel void H(global const uchar* a, global const uchar* b, global float* c, int d, int e, int f, int g, int h, int i, int j) {
  const int k = get_global_id(0);
  const int l = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(float);

  local float m[16 * 16];

  const int n = get_local_id(0);
  const int o = get_local_id(1);
  const int p = o * get_local_size(0) + n;

  if (n < g && o < h)
    m[p] = convert_float(b[o * e + n]);

  barrier(1);

  if (k >= i || l >= j)
    return;

  float q = 0;

  const int r = -g / 2;
  const int s = -h / 2;

  for (int t = 0; t < h; ++t)
    for (int u = 0; u < g; ++u) {
      int v = k + u + r;
      int w = l + t + s;

      float x = m[t * 16 + u];
      float y = 0;

      if (v < 0 || w < 0 || v >= i || w >= j) {
        y = 0;
      } else {
        y = convert_float(a[w * d + v]);
      }

      q += y * x;
    }

  c[l * f + k] = q;
}

kernel void I(global const uchar* a, global const uchar* b, global float* c, int d, int e, int f, int g, int h, int i, int j) {
  const int k = get_global_id(0);
  const int l = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(float);

  float m = 0;
  float n = 0;
  float o = 0;
  float p = 0;

  const int q = -g / 2;
  const int r = -h / 2;

  for (int s = 0; s < h; ++s)
    for (int t = 0; t < g; ++t) {
      int u = k + t + q;
      int v = l + s + r;

      float w = convert_float(b[s * e + t]);
      float x = 0;

      if (u < 0 || v < 0 || u >= i || v >= j)
        x = 0;
      else
        x = convert_float(a[v * d + u]);

      m += x * w;
      n += x * x;
      o += w * w;
    }

  p = m / sqrt(n * o);

  c[l * f + k] = p;
}

__attribute__((reqd_work_group_size(16, 16, 1))) kernel void J(global const uchar* a, global const uchar* b, global float* c, int d, int e, int f, int g, int h, int i, int j) {
  const int k = get_global_id(0);
  const int l = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(float);

  local float m[16 * 16];

  const int n = get_local_id(0);
  const int o = get_local_id(1);
  const int p = o * get_local_size(0) + n;

  if (n < g && o < h)
    m[p] = convert_float(b[o * e + n]);

  barrier(1);

  if (k >= i || l >= j)
    return;

  float q = 0;
  float r = 0;
  float s = 0;
  float t = 0;

  const int u = -g / 2;
  const int v = -h / 2;

  for (int w = 0; w < h; ++w)
    for (int x = 0; x < g; ++x) {
      int y = k + x + u;
      int z = l + w + v;

      float aa = m[w * 16 + x];
      float ab = 0;

      if (y < 0 || z < 0 || y >= i || z >= j)
        ab = 0;
      else
        ab = convert_float(a[z * d + y]);

      q += ab * aa;
      r += ab * ab;
      s += aa * aa;
    }

  t = q / sqrt(r * s);

  c[l * f + k] = t;
}