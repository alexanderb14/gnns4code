__attribute__((reqd_work_group_size(8, 8, 1))) __kernel void A(__global const float4* a, __global float8* b, int c, int d, int e, int f, int g, int h, float i) {
  const int j = get_global_id(0);
  const int k = get_global_id(1);

  __local float8 l[7][8][8];

  if (j > e || k > f)
    return;

  for (int m = 0; m < g; m += 7) {
    for (int n = 0; n < 7; n++) {
      l[n][get_local_id(1)][get_local_id(0)] = (float8)(0.0f);
    }

    barrier(1);

    for (int o = 0; o < h; o++)
      for (int p = 0; p < h; p++) {
        const int q = clamp(j * h - h / 2 + p, 0, c - 1);
        const int r = clamp(k * h - h / 2 + o, 0, d - 1);

        const float4 s = a[r * c + q];

        const int4 t = convert_int4(s * (1.0f / i) + 0.5f);

        int4 u = (t >= m & t < m + 7);

        if (u.x)
          l[t.x - m][get_local_id(1)][get_local_id(0)].s01 += (float2)(s, 1.0f);
        if (u.y)
          l[t.y - m][get_local_id(1)][get_local_id(0)].s23 += (float2)(s, 1.0f);
        if (u.z)
          l[t.z - m][get_local_id(1)][get_local_id(0)].s45 += (float2)(s, 1.0f);
        if (u.w)
          l[t.w - m][get_local_id(1)][get_local_id(0)].s67 += (float2)(s, 1.0f);

        barrier(1);
      }

    for (int v = m, w = m + min(7, g - m); v < w; v++) {
      b[j + e * (k + v * f)] = l[v - m][get_local_id(1)][get_local_id(0)];
    }
  }
}

__attribute__((reqd_work_group_size(16, 16, 1))) __kernel void B(__global const float8* a, __global float2* b, __global float2* c, __global float2* d, __global float2* e, int f, int g, int h) {
  const int i = get_global_id(0);
  const int j = get_global_id(1);

  const int k = get_local_id(0);
  const int l = get_local_id(1);

  float8 m = (float8)(0.0f);
  float8 n = (float8)(0.0f);
  float8 o = (float8)(0.0f);

  __local float8 p[16 + 2][16 + 2];

  for (int q = 0; q < h; q++) {
    for (int r = get_local_id(1) - 1; r < 16 + 1; r += get_local_size(1))
      for (int s = get_local_id(0) - 1; s < 16 + 1; s += get_local_size(0)) {
        int t = clamp((int)get_group_id(0) * 16 + s, 0, f - 1);
        int u = clamp((int)get_group_id(1) * 16 + r, 0, g - 1);

        p[r + 1][s + 1] = a[t + f * (u + q * g)];
      }

    barrier(1);

    p[l][k + 1] = (p[l][k] + 2.0f * p[l][k + 1] + p[l][k + 2]) / 4.0f;
    p[l + 1][k + 1] = (p[l + 1][k] + 2.0f * p[l + 1][k + 1] + p[l + 1][k + 2]) / 4.0f;
    p[l + 2][k + 1] = (p[l + 2][k] + 2.0f * p[l + 2][k + 1] + p[l + 2][k + 2]) / 4.0f;

    barrier(1);

    if (q == 0) {
      o = (p[l][k + 1] + 2.0f * p[l + 1][k + 1] + p[l + 2][k + 1]) / 4.0f;
      m = o;
      n = o;
    } else {
      m = n;
      n = o;

      o = (p[l][k + 1] + 2.0f * p[l + 1][k + 1] + p[l + 2][k + 1]) / 4.0f;

      float8 v = (m + 2.0f * n + o) / 4.0f;

      if (i < f && j < g) {
        b[i + f * (j + g * (q - 1))] = v.s01;
        c[i + f * (j + g * (q - 1))] = v.s23;
        d[i + f * (j + g * (q - 1))] = v.s45;
        e[i + f * (j + g * (q - 1))] = v.s67;
      }
    }
  }

  m = n;
  n = o;

  float8 v = (m + 2.0f * n + o) / 4.0f;

  if (i < f && j < g) {
    b[i + f * (j + g * (h - 1))] = v.s01;
    c[i + f * (j + g * (h - 1))] = v.s23;
    d[i + f * (j + g * (h - 1))] = v.s45;
    e[i + f * (j + g * (h - 1))] = v.s67;
  }
}

__kernel void C(__global const float4* a, __global const float2* b, __global const float2* c, __global const float2* d, __global const float2* e, __global float4* f, int g, int h, int i, int j, int k, float l) {
  const int m = get_global_id(0);
  const int n = get_global_id(1);

  const float o = (float)(m) / k;
  const float p = (float)(n) / k;
  const float4 q = a[n * g + m] / l;

  float8 r;

  int s = (int)o;
  int t = (int)p;
  int4 u = convert_int4(q);

  int v = min(s + 1, h - 1);
  int w = min(t + 1, i - 1);
  int4 x = min(u + 1, j - 1);

  float y = o - s;
  float z = p - t;
  float4 aa = q - __clc_floor(q);
  r.s04 = mix(mix(mix(b[s + h * (t + u.x * i)], b[v + h * (t + u.x * i)], y), mix(b[s + h * (w + u.x * i)], b[v + h * (w + u.x * i)], y), z), mix(mix(b[s + h * (t + x.x * i)], b[v + h * (t + x.x * i)], y), mix(b[s + h * (w + x.x * i)], b[v + h * (w + x.x * i)], y), z), aa.x);

  r.s15 = mix(mix(mix(c[s + h * (t + u.y * i)], c[v + h * (t + u.y * i)], y), mix(c[s + h * (w + u.y * i)], c[v + h * (w + u.y * i)], y), z), mix(mix(c[s + h * (t + x.y * i)], c[v + h * (t + x.y * i)], y), mix(c[s + h * (w + x.y * i)], c[v + h * (w + x.y * i)], y), z), aa.y);

  r.s26 = mix(mix(mix(d[s + h * (t + u.z * i)], d[v + h * (t + u.z * i)], y), mix(d[s + h * (w + u.z * i)], d[v + h * (w + u.z * i)], y), z), mix(mix(d[s + h * (t + x.z * i)], d[v + h * (t + x.z * i)], y), mix(d[s + h * (w + x.z * i)], d[v + h * (w + x.z * i)], y), z), aa.z);

  r.s37 = mix(mix(mix(e[s + h * (t + u.w * i)], e[v + h * (t + u.w * i)], y), mix(e[s + h * (w + u.w * i)], e[v + h * (w + u.w * i)], y), z), mix(mix(e[s + h * (t + x.w * i)], e[v + h * (t + x.w * i)], y), mix(e[s + h * (w + x.w * i)], e[v + h * (w + x.w * i)], y), z), aa.w);

  f[n * g + m] = r.s0123 / r.s4567;
}