uint A(uint, uint, uint); float B(float4); float2 C(float4); float2 D(float4); float4 E(float4, float4); float F(float4, float4); float G(float4, float4); float H(float4, float4); float I(float4, float4); float J(uint, __global uint2*, __global float*, uint, uint); uint A(uint a, uint b, uint c) {
  if (a < b)
    return a * (c - 1) - (a - 1) * ((a - 1) + 1) / 2 + b - a - 1;
  else if (b < a)
    return b * (c - 1) - (b - 1) * ((b - 1) + 1) / 2 + a - b - 1;
  else
    return 0;
}

float B(float4 a) {
 return distance((float2)(a a, (float2)(a a);
}

float2 C(float4 a) {
  float b = a.z - a.x;
  float c = a.w - a.y;

  return (float2)(a + b / 2.0f, a + c / 2.0f);
}

float2 D(float4 a) {
 return (float2)(a- a a- a;
}

float4 E(float4 a, float4 b) {
  float2 c = normalize(D(b));
  float2 d = (float2)(a - b, a - b);
  float2 e = (float2)(a - b, a - b);
  float2 f = c * dot(c, d);
  float2 g = c * dot(c, e);

  float2 h = (float2)(b, b) + f;
  float2 i = (float2)(b, b) + g;

 return (fli
float F(float4 a, float4 b) {
    float c = B(a);
    float d = B(b);

    if (c == 0.0f || d == 0.0f)
      return 0.0f;

    float e = dot(D(a), D(b)) / (c * d);
    return __clc_fabs(e);
}

float G(float4 a, float4 b) {
    float c = B(a);
    float d = B(b);

    float e = (c + d) / 2.0f;

    if (e == 0.0f)
      return 0.0f;

    return 2.0f / (e / min(c, d) + max(c, d) / e);
}

float H(float4 a, float4 b) {
    float c = (B(a) + B(b)) / 2.0f;

    if (c == 0.0f)
      return 0.0f;

    return c / (c + distance(C(a), C(b)));
}

float I(float4 a, float4 b) {
    float4 c = E(a, b);
    float4 d = E(b, a);

    float e = B(c), f = B(d);

    if (e == 0.0f || f == 0.0f)
      return 0.0f;

    float g = distance(C(b), C(c));
    float h = max(0.0f, 1.0f - (2.0f * g) / e);

    float i = distance(C(a), C(d));
    float j = max(0.0f, 1.0f - (2.0f * i) / f);

    return min(h, j);
}

float J(uint a, __global uint2 *b, __global float *c, uint d, uint e) {
    uint f = b[d].x;
    uint g = b[d].y;
    uint h = b[e].x;
    uint i = b[e].y;

    if (f == h || f == i || g == h || g == i)
      return 1.0f;

    float j = min(c[A(f, h, a)], min(c[A(f, i, a)], min(c[A(g, h, a)], c[A(g, i, a)])));

    return 1.0f / (j + 1.0f);
}

__kernel void K(
 float a,
 float b,
 float c,
 float d,
 uint e,
 __global float2 *f,
 __global float2 *g,
 __global float2 *h,
 __global float *i,
 __global float *j,
 __global float *k,
 int l,
 __global float *m,
 float n,
 float o,
    float p,
 float q,
 float r,
    int s,
    float t
 ) {

    uint u = get_global_id(0);
    uint v = get_global_size(0) / e;

    uint w = (uint)(u / e);
    float x = k[w];

    float y = x;

    uint z = u % e;

    float2 aa = f[u];
    float2 ab = g[u];
    float2 ac = h[u];

    float2 ad = (float2)a if (z <= 0 || z >= e - 1) {
      for (uint ae = 0; ae < v; ae++) {
        if (w == ae)
          continue;

        float af = j[A(w, ae, v)];
        float ag = k[ae];

        uint ah;
        if (af >= 0.0f)
          ah = ae * e + z;
        else
          ah = ae * e + e - 1 - z;

        float2 ai = f[ah];

        float2 aj = ai - aa;
        float ak = sqrt(aj.x * aj.x + aj.y * aj.y);

        float al = __clc_pow(x, q) * o;

        if (af >= 0.0f && (ak <= p || ak <= al))
          y += ag;
      }

      m[u] = y;

      return;
    }

    ab += ac * ad / 2.0f;
    ab *= n;
    aa += ab * ad;
    f[u] = aa;

    ac = (float2)(0.0f, 0.0f);

    float2 am = f[u - 1];
    float2 aj = am - aa;
    float ak = sqrt(aj.x * aj.x + aj.y * aj.y);
    float an = b / 1000.0f * (e - 1) * ak * x;
    ac += an * normalize(aj);

    am = f[u + 1];
    aj = am - aa;
    ak = sqrt(aj.x * aj.x + aj.y * aj.y);
    an = b / 1000.0f * (e - 1) * ak * x;
    ac += an * normalize(aj);

    c /= sqrt((float)v);

    for (uint ae = 0; ae < v; ae++) {
      if (w == ae)
        continue;

      float ao = i[A(w, ae, v)];
      if (l && ao <= 0.05)
        continue;

      float af = j[A(w, ae, v)];
      float ag = k[ae];

      uint ah;
      if (af >= 0.0f)
        ah = ae * e + z;
      else
        ah = ae * e + e - 1 - z;

      float2 ai;

      if (af >= 0.0f)
        ai = f[ah];

      else {
        float2 ap = normalize(f[ah + 1] - f[ah - 1]);
   float2 aq = (float2)(-aap   ai = f[ah] + aq * d;
      }

      aj = ai - aa;
      ak = sqrt(aj.x * aj.x + aj.y * aj.y);

      float al = __clc_pow(x, q) * o;

      if (af >= 0.0f && (ak <= p || ak <= al))
        y += ag;

      if (!s)
        an = c * 30.0f / (e - 1) / (ak + 0.01f);

      else
        an = 4.0f * 10000.0f / (e - 1) * t * c * ak / (3.1415926f * pown(t * t + ak * ak, 2));
      an *= ag;

      if (l)
        an *= ao;

      ac += an * normalize(aj);
    }

    ab += ac * ad / 2.0f;
    g[u] = ab;
    h[u] = ac;

    m[u] = y;
}

__kernel void L(
 __global float4 *a,
 __global float *b,
 __global float *c,
 __global uint2 *d,
 __global float *e,
 uint f,
 uint g
 ) {
    uint h = get_global_id(0);
    uint i = get_global_size(0);

    float4 j = a[h];
    float2 k = normalize(D(j));

    for (uint l = h + 1; l < i; l++) {
      float4 m = a[l];

      float n = 1.0f;
      n *= F(j, m);
      n *= G(j, m);
      n *= H(j, m);
      n *= I(j, m);

      if (g)
        n *= J(f, d, e, h, l);

      float o = dot(k, normalize(D(m)));

      b[A(h, l, i)] = n;
      c[A(h, l, i)] = o;
    }
}

__kernel void M(
 __global uint2 *a,
 uint b,
 __global float *c
 ) {

    uint d = get_global_id(0);
    uint e = get_global_size(0);

    for (uint f = d + 1; f < e; f++)
      c[A(d, f, e)] = __builtin_inff();

    for (uint f = 0; f < e; f++) {
      for (uint g = 0; g < b; g++) {
        uint h = a[g].x;
        uint i = a[g].y;

        if (i == d)
          continue;

        float j = 1.0f;
        if (d != h)
          j = c[A(d, h, e)] + 1.0f;

        if (j < c[A(d, i, e)])
          c[A(d, i, e)] = j;
      }
    }
}

__kernel void N(
  uint a,
    __global float2 *b,
 __global float2 *c
 ) {

    const uint d = 3;

    const float e[] = {0.10468, 0.139936, 0.166874, 0.177019, 0.166874, 0.139936, 0.10468};

    uint f = get_global_id(0);

    uint g = f % a;
    if (g <= 0 || g >= a - 1) {
      c[f] = b[f];
      return;
    }

    float2 h = (float2)(0.0f, 0.0f);

    for (uint i = 0; i <= d * 2 + 1; i++) {
      int j = (int)g + (int)i - (int)d;
      if (j < 0)
        j = 0;
      else if ((uint)j >= a)
        j = a - 1;

      uint k = f - g + j;

      h += e[i] * b[k];
    }

    c[f] = h;
}