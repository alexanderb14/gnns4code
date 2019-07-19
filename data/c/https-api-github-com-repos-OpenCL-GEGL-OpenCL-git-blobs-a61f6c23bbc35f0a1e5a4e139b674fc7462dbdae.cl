void A(float4 a, float4 b, float4 c, float4 d, float4 e, float4* f, float4* g) {
    float16 h = (float16)(a b c d;


    float8 i = fmin(h.hi, h.lo);
    float8 j = fmax(h.hi, h.lo);


    float4 k = fmin(i.hi, i.lo);
    float4 l = fmax(j.hi, j.lo);


    *f = fmin(k, e);
    *g = fmax(l, e);
}

kernel void B(const global float4* a, global float4* b) {
  int c = get_global_id(0);
  int d = get_global_id(1);
  int e = get_global_size(0) + 2;
  int f = get_global_size(1) + 2;

  int g = c + 1, h = d + 1;

  float4 i = a[(g - 1) + (h - 1) * e];
  float4 j = a[(g - 0) + (h - 1) * e];
  float4 k = a[(g + 1) + (h - 1) * e];
  float4 l = a[(g - 1) + (h - 0) * e];
  float4 m = a[(g - 0) + (h - 0) * e];
  float4 n = a[(g + 1) + (h - 0) * e];
  float4 o = a[(g - 1) + (h + 1) * e];
  float4 p = a[(g - 0) + (h + 1) * e];
  float4 q = a[(g + 1) + (h + 1) * e];

  float4 r, s;
  A(j, p, l, n, m, &r, &s);
  float4 t = fmax((s - m), (m - r)) * (((i + j + k + p - 8.0f * m + q + l + n + o) < 1e-5f) ? ((float4)-0.5f) : ((float4)0.5f));

  t.w = m.w;

  b[c + d * get_global_size(0)] = t;
}

kernel void C(const global float4* a, global float4* b) {
  int c = get_global_id(0);
  int d = get_global_id(1);

  int e = get_global_size(0) + 2;
  int f = get_global_size(1) + 2;

  int g = c + 1, h = d + 1;

  float4 i = a[(g - 1) + (h - 1) * e];
  float4 j = a[(g - 0) + (h - 1) * e];
  float4 k = a[(g + 1) + (h - 1) * e];
  float4 l = a[(g - 1) + (h - 0) * e];
  float4 m = a[(g - 0) + (h - 0) * e];
  float4 n = a[(g + 1) + (h - 0) * e];
  float4 o = a[(g - 1) + (h + 1) * e];
  float4 p = a[(g - 0) + (h + 1) * e];
  float4 q = a[(g + 1) + (h + 1) * e];

  float4 r = (((m > 0.0f) && (i < 0.0f || j < 0.0f || k < 0.0f || l < 0.0f || n < 0.0f || o < 0.0f || p < 0.0f || q < 0.0f)) ? (m) : (0.0f));

  r.w = m.w;

  b[c + d * get_global_size(0)] = r;
}