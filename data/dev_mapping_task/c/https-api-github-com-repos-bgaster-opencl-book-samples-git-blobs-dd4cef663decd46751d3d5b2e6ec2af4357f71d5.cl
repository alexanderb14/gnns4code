__kernel void A(__read_only image2d_t a, __read_only image2d_t b, __read_only image2d_t c, __read_only image2d_t d, __read_only image2d_t e, __global float2* f, int g, __global float2* h, int i, int j, int k) {
  __local int l[2 * 4 + 8][2 * 4 + 16];
  __local int m[2 * 4 + 8][2 * 4 + 16];
  __local int n[2 * 4 + 8][2 * 4 + 16];

  sampler_t o = 0x0000 | 0x0002 | 0x0010;
  sampler_t p = 0x0000 | 0x0002 | 0x0000;

  int2 q = {get_global_id(0), get_global_id(1)};
  float2 r = {get_global_id(0) + 0.5, get_global_id(1) + 0.5};

  int2 s = {get_local_id(0), get_local_id(1)};
  l[s.y][s.x] = read_imageui(a, p, r + (float2)(-4, -4)).x;
  m[s.y][s.x] = read_imageui(c, p, r + (float2)(-4, -4)).x;
  n[s.y][s.x] = read_imageui(b, p, r + (float2)(-4, -4)).x;

  if (s.x < 2 * 4) {
    l[s.y][s.x + 16] = read_imageui(a, p, r + (float2)(16 - 4, -4)).x;
    m[s.y][s.x + 16] = read_imageui(c, p, r + (float2)(16 - 4, -4)).x;
    n[s.y][s.x + 16] = read_imageui(b, p, r + (float2)(16 - 4, -4)).x;
  }

  if (s.y < 2 * 4) {
    l[s.y + 8][s.x] = read_imageui(a, p, r + (float2)(-4, 8 - 4)).x;
    m[s.y + 8][s.x] = read_imageui(c, p, r + (float2)(-4, 8 - 4)).x;
    n[s.y + 8][s.x] = read_imageui(b, p, r + (float2)(-4, 8 - 4)).x;
  }

  if (s.x < 2 * 4 && s.y < 2 * 4) {
    l[s.y + 8][s.x + 16] = read_imageui(a, p, r + (float2)(16 - 4, 8 - 4)).x;
    m[s.y + 8][s.x + 16] = read_imageui(c, p, r + (float2)(16 - 4, 8 - 4)).x;
    n[s.y + 8][s.x + 16] = read_imageui(b, p, r + (float2)(16 - 4, 8 - 4)).x;
  }
  barrier(1);
  float2 t = {0, 0};

  if (k != 0) {
    int u = q.x / 2;
    int v = q.y / 2;
    float2 w = f[v * g + u];

    t.x = w.x * 2;
    t.y = w.y * 2;
  }
  float2 x = {0, 0};

  int4 y = read_imagei(d, p, q);
  float z = (float)y.s0 * (float)y.s3 - (float)y.s1 * (float)y.s2;

  if (z == 0.0f)
    z = 0.0000001f;
  ;
  float4 aa = {
    y / y / yy / z

        float ab = 4.f;
  for (int ac = 0; ac < 8; ac++) {
    float2 ad = {r + t.x + x.x, r + t.y + x.y};
    float2 ae = {0, 0};
    float2 af = {0, 0};

    for (int ag = -4; ag <= 4; ag++) {
      for (int ah = -4; ah <= 4; ah++) {
        int ai = l[s.y + 4 + ag][s.x + 4 + ah];

        float aj = read_imagef(e, o, ad + (float2)(ahh, agg)).x;
        float ak = (float)ai - aj;
        int al, am;
        al = n[s.y + 4 + ag][s.x + 4 + ah];
        am = m[s.y + 4 + ag][s.x + 4 + ah];

                ae += (float2)( akal*abakam*ab;
      }
    }

    af = (float2)(aa0 * aee.s0 + aa1 * aee.s1, aa2 * aee.s0 + aa3 * aee.s1);

    if (__clc_fabs(z) < 1000)
      af = (float2)(0, 0);

    if (length(af) < 0.004)
      break;

    x = x + af;
  }
  int2 an = {get_global_id(0), get_global_id(1)};

  if (r.x < i && r.y < j) {
    h[an.y * i + an.x] = (float2)(x.x + t.x, x.y + t.y);
  }
}