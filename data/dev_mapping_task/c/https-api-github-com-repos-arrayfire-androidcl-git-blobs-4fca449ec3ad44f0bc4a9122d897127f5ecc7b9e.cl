uchar4 A(int a, int b, int c) {
  uchar4 d;
  a -= 16;
  b -= 128;
  c -= 128;
  int e = a + (int)(1.772f * b);
  int f = a - (int)(0.344f * b + 0.714f * c);
  int g = a + (int)(1.402f * c);
  d.x = g > 255 ? 255 : g < 0 ? 0 : g;
  d.y = f > 255 ? 255 : f < 0 ? 0 : f;
  d.z = e > 255 ? 255 : e < 0 ? 0 : e;
  d.w = 255;
  return d;
}

__kernel void B(__global uchar4* a, __global uchar* b, int c, int d) {
  __local uchar e[(2 * (16 / 2) * (16 / 2))];
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h = get_local_id(0);
  int i = get_local_id(1);
  int j = c * d;

  int k = g * c + f;
  int l = j + (g / 2) * c + (f & ~1);
  int m = h / 2;
  int n = i / 2;
  int o = 2 * (m + n * (16 / 2));
  if (f % 2 == 0 && g % 2 == 0) {
    e[o + 0] = b[l + 0];
    e[o + 1] = b[l + 1];
  }

  int p = (0xFF & ((int)b[k]));
  if (p < 16)
    p = 16;
  barrier(1);

  if (f >= c || g >= d)
    return;

  int q = (0xFF & ((int)e[o + 0]));
  int r = (0xFF & ((int)e[o + 1]));

  a[k] = A(p, r, q);
}
__kernel void C(__global uchar4* a, __global uchar4* b, int c, int d) {
  __local uchar4 e[((16 + (2 * 1)) * (16 + (2 * 1)))];

  int f = get_global_id(0);
  int g = get_global_id(1);

  int h = get_local_id(0);
  int i = get_local_id(1);

  int j = h + 16;
  int k = i + 16;
  int l = f + 16;
  int m = g + 16;
  int n = h + 1;
  int o = i + 1;

  int p = clamp((f - 1), 0, (int)c - 1);
  int q = clamp((g - 1), 0, (int)d - 1);
  e[((i) * (16 + (2 * 1)) + (h))] = b[((q)*c + (p))];
  ;
  if (h < (2 * 1)) {
    int p = clamp((l - 1), 0, (int)c - 1);
    int q = clamp((g - 1), 0, (int)d - 1);
    e[((i) * (16 + (2 * 1)) + (j))] = b[((q)*c + (p))];
    ;
  }
  if (i < (2 * 1)) {
    int p = clamp((f - 1), 0, (int)c - 1);
    int q = clamp((m - 1), 0, (int)d - 1);
    e[((k) * (16 + (2 * 1)) + (h))] = b[((q)*c + (p))];
    ;
  }
  if (h < (2 * 1) && i < (2 * 1)) {
    int p = clamp((l - 1), 0, (int)c - 1);
    int q = clamp((m - 1), 0, (int)d - 1);
    e[((k) * (16 + (2 * 1)) + (j))] = b[((q)*c + (p))];
    ;
  }
  barrier(1);
  float4 r = convert_float4(e[((o) * (16 + (2 * 1)) + (n))]);
  float4 s = convert_float4(e[((o - 1) * (16 + (2 * 1)) + (n))]);
  float4 t = convert_float4(e[((o - 1) * (16 + (2 * 1)) + (n - 1))]);
  float4 u = convert_float4(e[((o) * (16 + (2 * 1)) + (n - 1))]);
  float4 v = convert_float4(e[((o + 1) * (16 + (2 * 1)) + (n - 1))]);
  float4 w = convert_float4(e[((o + 1) * (16 + (2 * 1)) + (n))]);
  float4 x = convert_float4(e[((o + 1) * (16 + (2 * 1)) + (n + 1))]);
  float4 y = convert_float4(e[((o) * (16 + (2 * 1)) + (n + 1))]);
  float4 z = convert_float4(e[((o - 1) * (16 + (2 * 1)) + (n + 1))]);

  float4 aa = (float4)0.0f;
  aa = 8 * r - s - t - u - v - w - x - y - z;
  aa.w = 255.0f;

  if (f < c && g < d) {
    a[g * c + f] = convert_uchar4(aa);
  }
}