int A(int a, int b) {
  return a < 0 ? ((a + 1) / b - 1) : (a / b);
}

__kernel void B(__global float4* a, __global float4* b, int c, int d, int e, int f, int4 g, int h, int i) {
  int j = get_global_id(0);
  int k = get_global_id(1);

  int l = A(e, c) + j;
  int m = A(f, d) + k;

  int n = max(g.s0, l * c) - e + c;
  int o = max(g.s1, m * d) - f + d;

  int p = min(g.s2, l * c + c) - e + c;
  int q = min(g.s3, m * d + d) - f + d;

  int r, s;

  float4 t = (float4)(0.0f, 0.0f, 0.0f, 0.0f);

  int u = p - n;
  int v = q - o;

  float w = 1.0f / (u * v);

  for (s = o; s < q; ++s) {
    for (r = n; r < p; ++r) {
      t += a[s * h + r];
    }
  }
  b[k * i + j] = t * w;
}

__kernel void C(__global float4* a, __global float4* b, int c, int d, float e, float f, int g, int h, float4 i, int j, int k) {
  int l = get_global_id(0);
  int m = get_global_id(1);

  int n = get_global_size(0);
  int o = A(l + g, c) - A(g, c);
  int p = A(m + h, d) - A(h, d);

  float4 q = a[o + p * k];
  float4 r = i;

  int s = l + g;
  int t = m + h;

  int u = __clc_ceil(c * e);
  int v = __clc_ceil(d * f);

  int w = __clc_floor((c - e * c) / 2.0f);
  int x = __clc_floor((d - f * d) / 2.0f);

  int y = A(s, c) * c - g;
  int z = A(t, d) * d - h;

  float aa = u * v;

  float ab = y + w + (float)(u) / 2.0f;
  float ac = z + x + (float)(v) / 2.0f;

  if (j == 0 && (__clc_fabs(l - ab) * v + __clc_fabs(m - ac) * u < aa))
    r = q;

  if (j == 1 && (((l - ab) / (float)u) * ((l - ab) / (float)u)) + (((m - ac) / (float)v) * ((m - ac) / (float)v)) <= 1.0f)
    r = q;

  if (j == 2 && (l >= y + w && m >= z + x && l < y + w + u && m < z + x + v))
    r = q;

  b[l + m * n] = r;
}