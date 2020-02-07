__constant sampler_t Ga = 0x0000 | 0x0006 | 0x0001; float A(const float a) {
  return a * a * a * (a * (a * 6.f - 15.f) + 10.f);
}

void B(const float3 a, float3* b, float3* c) {
  float3 d;

  float2 e = step(a.yz, a.xx);
  d.x = dot(e, (float2)(1.f));
  d.yz = 1.f - e;

  float f = step(a.z, a.y);
  d.y += f;
  d.z += 1.f - f;
  *c = clamp(d, 0.f, 1.f);

  *b = clamp(d - 1.f, 0.f, 1.f);
}

float C(const float2 a, read_only image2d_t b) {
  float c = (a.x + a.y) * 0.366025403784f;
  float2 d = __clc_floor(a + c);
  float e = (d.x + d.y) * 0.211324865405f;
  float2 f = d - e;
  d = d * 0.00390625f + 0.001953125f;

  float2 g = a - f;

  float2 h;
  if (g.x > g.y)
    h = (float2)(1.f, 0.f);
  else
    h = (float2)(0.f, 1.f);

  float2 i = read_imagef(b, Ga, d).xy * 4.f - 1.f;
  float j = 0.5 - dot(g, g);
  float k;
  if (j < 0.f)
    k = 0.f;
  else {
    j *= j;
    k = j * j * dot(i, g);
  }

  float2 l = g - h + 0.211324865405f;
  float2 m = read_imagef(b, Ga, d + h * 0.00390625f).xy * 4.f - 1.f;
  float n = 0.5 - dot(l, l);
  float o;
  if (n < 0.f)
    o = 0.f;
  else {
    n *= n;
    o = n * n * dot(m, l);
  }

  float2 p = g - (float2)(1.f - 2.f * 0.211324865405f);
  float2 q = read_imagef(b, Ga, d + (float2)(0.00390625f, 0.00390625f)).xy * 4.f - 1.f;
  float r = 0.5 - dot(p, p);
  float s;
  if (r < 0.f)
    s = 0.f;
  else {
    r *= r;
    s = r * r * dot(q, p);
  }

  return 70.f * (k + o + s);
}

float D(const float3 a, read_only image2d_t b) {
  float c = (a.x + a.y + a.z) * 0.333333333333f;
  float3 d = __clc_floor(a + c);
  float e = (d.x + d.y + d.z) * 0.166666666667f;
  float3 f = d - e;
  d = d * 0.00390625f + 0.001953125f;

  float3 g = a - f;

  float3 h;
  float3 i;
  B(g, &h, &i);

  float j = read_imagef(b, Ga, d.xy).w;
 float3 k = read_imagef(b, Ga, (float2)dz)).xyz * 4.f - 1.f;
 float l = 0.6 - dot(g, g);
 float m;
 if (l < 0.f)
   m = 0.f;
 else {
   l *= l;
   m = l * l * dot(k, g);
 }

 float3 n = g - h + 0.166666666667f;
 float o = read_imagef(b, Ga, d.xy + h.xy * 0.00390625f).w;
 float3 p = read_imagef(b, Ga, (float2)dz + hz*0.00390625f)).xyz * 4.f - 1.f;
 float q = 0.6 - dot(n, n);
 float r;
 if (q < 0.f)
   r = 0.f;
 else {
   q *= q;
   r = q * q * dot(p, n);
 }

 float3 s = g - i + 2.f * 0.166666666667f;
 float t = read_imagef(b, Ga, d.xy + i.xy * 0.00390625f).w;
 float3 u = read_imagef(b, Ga, (float2)dz + iz*0.00390625f)).xyz * 4.f - 1.f;
 float v = 0.6 - dot(s, s);
 float w;
 if (v < 0.f)
   w = 0.f;
 else {
   v *= v;
   w = v * v * dot(u, s);
 }

 float3 x = g - (float3)(1.f - 3.f * 0.166666666667f);
 float y = read_imagef(b, Ga, d.xy + (float2)(0.00390625f, 0.00390625f)).w;
 float3 z = read_imagef(b, Ga, (float2)dz + 0.00390625f)).xyz * 4.f - 1.f;
 float aa = 0.6 - dot(x, x);
 float ab;
 if (aa < 0.f)
   ab = 0.f;
 else {
   aa *= aa;
   ab = aa * aa * dot(z, x);
 }

 return 32.f * (m + r + w + ab);
}