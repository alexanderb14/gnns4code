struct TsdfParams {
  float resolution[3];
  float volume[3];
  float mu;
};
bool A(float3 a) {
  return isnan(a.x) || isnan(a.y) || isnan(a.z);
}

bool B(float4 a) {
  return isnan(a.x) || isnan(a.y) || isnan(a.z) || isnan(a.w);
}

bool C(float2 a) {
  return isnan(a.x) || isnan(a.y);
}

void D(float a, float b, __global short2* c, int d) {
 short2 e = {convert_short(a convert_float(32766)), convert_short(b66};
 c[d] = e;
}

float2 E(short2 a) {
 float2 b = {convert_float(a / convert_float(32766), convert_float(a+convert_float(32766)};
 return b;
}

float4 F(float4 a[4], float4 b) {
  float4 c = {a[0].x * b.x + a[1].x * b.y + a[2].x * b.z + a[3].x * b.w, a[0].y * b.x + a[1].y * b.y + a[2].y * b.z + a[3].y * b.w, a[0].z * b.x + a[1].z * b.y + a[2].z * b.z + a[3].z * b.w, a[0].w * b.x + a[1].w * b.y + a[2].w * b.z + a[3].w * b.w};
  return c;
}

float3 G(float4 a[4], float3 b) {
  float3 c = {a[0].x * b.x + a[1].x * b.y + a[2].x * b.z + a[3].x * 1.0f, a[0].y * b.x + a[1].y * b.y + a[2].y * b.z + a[3].y * 1.0f, a[0].z * b.x + a[1].z * b.y + a[2].z * b.z + a[3].z * 1.0f};
  return c;
}

float4 H(float a, float b, float c, float3 d) {
 float4 e = {(af) *bf) *cf) * df };
 return e;
}

bool I(float3 a) {
  return a.x == 0 && a.y == 0 && a.z == 0;
}
int3 J(float4 a, struct TsdfParams b) {
  int3 c = {convert_int(a.x * blution[0] / bme[0] + blution[0] / 2.0f), convert_int(a.y * blution[1] / bme[1] + blution[1] / 2.0f), convert_int(a.z * blution[2] / bme[2])};

  return c;
}

float3 K(float3 a, float3 b) {
  return a - 2.0f * dot(a, b) * b;
}

float L(__global short2* a, int3 b, int3 c, int d, int e, int f) {
  int g = (c.x + d);
  int h = (c.y + e);
  int i = (c.z + f);

  int j = g * b.z + h * b.x * b.z + i;
  if (g < 0 || g >= b.x || h < 0 || h >= b.y || i < 0 || i >= b.z)
    return __builtin_nanf("");

  return E(a[j]).x;
}

float M(__global short2* a, float4 b, int3 c, float3 d, struct TsdfParams e) {
  int3 f = {convert_int(elution[0]), convert_int(elution[1]), convert_int(elution[2])};

  if (c.x <= 0 || c.x >= f.x - 1)
    return __builtin_nanf("");

  if (c.y <= 0 || c.y >= f.y - 1)
    return __builtin_nanf("");

  if (c.z <= 0 || c.z >= f.z - 1)
    return __builtin_nanf("");

  float g = ((float)c.x + 0.5f) * d.x - e.volume[0] / 2.0f;
  float h = ((float)c.y + 0.5f) * d.y - e.volume[1] / 2.0f;
  float i = ((float)c.z + 0.5f) * d.z;

  c.x = (b.x < g) ? (c.x - 1) : c.x;
  c.y = (b.y < h) ? (c.y - 1) : c.y;
  c.z = (b.z < i) ? (c.z - 1) : c.z;

  float j = (b.x - ((convert_float(c.x) + 0.5f) * d.x - e.volume[0] / 2.0f)) / d.x;
  float k = (b.y - ((convert_float(c.y) + 0.5f) * d.y - e.volume[1] / 2.0f)) / d.y;
  float l = (b.z - (convert_float(c.z) + 0.5f) * d.z) / d.z;

  float m = L(a, f, c, 0, 0, 0);
  float n = L(a, f, c, 0, 0, 1);
  float o = L(a, f, c, 0, 1, 0);
  float p = L(a, f, c, 0, 1, 1);
  float q = L(a, f, c, 1, 0, 0);
  float r = L(a, f, c, 1, 0, 1);
  float s = L(a, f, c, 1, 1, 0);
  float t = L(a, f, c, 1, 1, 1);

  if (isnan(m) || isnan(n) || isnan(o) || isnan(p) || isnan(q) || isnan(r) || isnan(s) || isnan(t))
    return __builtin_nanf("");

  float u = m * (1.0f - j) * (1.0f - k) * (1.0f - l) + n * (1.0f - j) * (1.0f - k) * l + o * (1.0f - j) * k * (1.0f - l) + p * (1.0f - j) * k * l + q * j * (1.0f - k) * (1.0f - l) + r * j * (1.0f - k) * l + s * j * k * (1.0f - l) + t * j * k * l;
  return u;
}

__kernel void N(__global short2* a, __global const int* b, __global const int* c, __global const float4* d, __global const float* e, __global const float2* f, __global float3* g, __global float3* h,

                __constant struct TsdfParams* i) {
  const int j = get_global_id(0);
  const int k = get_global_id(1);

  int l = *b;
  int m = *c;

  float4 n[4] = {
    d

    float o = 0.0f;
  float p = *e;

  float4 q = { convert_float(j - l / 2.0f) / ploat(k - m / 2.0f) / p;
  q = F(n, q);
  float4 r = q;

  float4 s = normalize(r - n[3]);

  struct TsdfParams t = *i;

  int u = l * k + j;

  float v = t.mu * 0.8f;

  float4 w = s * v;

  float3 x = {t[0] / ttion[0], t[1] / ttion[1], t[2] / ttion[2]};

  float y = __builtin_nanf("");
  int z = 0;
  float aa;

  int3 ab = {convert_int(ttion[0]), convert_int(ttion[1]), convert_int(ttion[2])};
  while (o < t.volume[0]) {
    r += w;
    o += v;
    int3 ac = J(r, t);

    if (ac.z < 0 || ac.z >= ab.z || ac.y < 0 || ac.y >= ab.y || ac.x < 0 || ac.x >= ab.x) {
      continue;
    }

    int ad = ac.z + ac.x * ab.z + ac.y * ab.x * ab.z;

    if (ad == z)
      continue;
    z = ad;

    aa = y;
    y = a[z].x;

    if (isnan(y) || isnan(aa))
      continue;

    if (aa < 0.0f && y > 0.0f)
      break;

    if (aa >= 0.0f && y <= 0.0f) {
      float ae = M(a, r, ac, x, t);
      if (isnan(ae))
        break;

      float4 af = r - w;
      int3 ag = J(af, t);

      float ah = M(a, af, ag, x, t);
      if (isnan(ah))
        break;

      if (ae > 0.0f && ah > 0.0f)
        continue;
      if (ae < 0.0f && ah < 0.0f)
        break;

      float ai = (o - v) - v * ah / (ae - ah);

      float4 aj = q + s * ai;

      g[u].x = aj.x;
      g[u].y = aj.y;
      g[u].z = aj.z;

      float4 ak;
      float3 al;

      ak = aj;
      ak.x += x.x;
      float am = M(a, ak, J(ak, t), x, t);

      if (isnan(am))
        break;

      ak = aj;
      ak.x -= x.x;
      float an = M(a, ak, J(ak, t), x, t);

      if (isnan(an))
        break;

      al.x = (an - am);

      ak = aj;
      ak.y += x.y;
      float ao = M(a, ak, J(ak, t), x, t);

      if (isnan(ao))
        break;

      ak = aj;
      ak.y -= x.y;
      float ap = M(a, ak, J(ak, t), x, t);

      if (isnan(ap))
        break;

      al.y = (ap - ao);

      ak = aj;
      ak.z += x.z;
      float aq = M(a, ak, J(ak, t), x, t);

      if (isnan(aq))
        break;

      ak = aj;
      ak.z -= x.z;
      float ar = M(a, ak, J(ak, t), x, t);

      if (isnan(ar))
        break;

      al.z = (ar - aq);

      al = normalize(al);

      h[u] = al;
      return;
    }
  }

  g[u] = __builtin_nanf("");
  h[u] = __builtin_nanf("");
}