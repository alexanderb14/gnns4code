inline float3 A(const float16 a, const float3 b) {
  return (float3)(dot(a.s048, b) + a.sc, dot(a.s159, b) + a.sd, dot(a.s26a, b) + a.se);
}
inline float4 B(const float16 a, const float4 b) {
  return (float4)(dot(a.s048c, b), dot(a.s159d, b), dot(a.s26ae, b), dot(a.s37bf, b));
}

inline float3 C(const float16 a, const float3 b) {
  return A(a, b) / (dot(a.s37b, b) + a.sf);
}

inline float4 D(const float16 a, const float4 b) {
  float4 c = B(a, b);
  c /= c.w;
  return c;
}

inline float3 E(const float16 a, const float3 b) {
  return (float3)(dot(a.s048, b), dot(a.s159, b), dot(a.s26a, b));
}

inline float3 F(const float16 a, const float3 b) {
  return b + a.scde;
}

float3 G(float3 a, float3 b) {
  return 0.5f * b + a * (1.f - b);
}
float2 H(float2 a, float2 b) {
  return 0.5f * b + a * (1.f - b);
}
float I(float a, float b) {
  return 0.5f * b + a * (1.f - b);
}
float2 J(float3 a) {
  float b = atan2(a.y, a.x);

  float c = acos(clamp(a.z, -1.f, 1.f));

  return (float2)b
}

float3 K(float2 a) {
  float2 b = cos(a);
  float2 c = sin(a);
    return (floab        c            bloat3 L(float3 a) {
    float b = a.x;
    float c = a.y;
    float d = a.z;
    float e = 0.f, f = 0.f, g = 0.f;
    if (c < 1.e-8) {
      e = d;
      f = d;
      g = d;
      return (float3)(e, f, g);
      ;
    }

    b *= 360.f;

    int h = convert_int(__clc_floor(b / 60.f)) % 6;
    float i = b / 60.f - __clc_floor(b / 60.f);
    float j = d * (1.f - c);
    float k = d * (1.f - i * c);
    float l = d * (1.f - (1.f - i) * c);

    switch (h) {
      case 0:
        e = d;
        f = l;
        g = j;
        break;
      case 1:
        e = k;
        f = d;
        g = j;
        break;
      case 2:
        e = j;
        f = d;
        g = l;
        break;
      case 3:
        e = j;
        f = k;
        g = d;
        break;
      case 4:
        e = l;
        f = j;
        g = d;
        break;
      case 5:
        e = d;
        f = j;
        g = k;
        break;
    }
    return (float3)(e, f, g);
}
float3 M(float3 a) {
    float b = max(max(a.x, a.y), a.z);
    float c = min(min(a.x, a.y), a.z);
    float d = b - c;

    bool e = (__clc_fabs(d) > 1.e-8);
    float f = 0.f;

    if (e) {
      if (a.z == b)
        f = 2.f / 3.f + (1.f / 6.f) * (a.x - a.y) / d;
      else if (a.y == b)
        f = 1.f / 3.f + (1.f / 6.f) * (a.z - a.x) / d;
      else if (a.x == b)
        f = (1.f / 6.f) * (a.y - a.z) / d;
    }

    if (f < 0.0) {
      f += 1.0;
    }
    if (e) {
      c = 1.0 - c / b;
    } else {
      c = 0.0;
    }
    return (float3)(fcb
}

float3 N(float3 a, float3 b ) {
    const float c = 0.008856f;
    const float d = 903.3f;
    float3 e;
    float3 f = a / b;
    float3 g;
    g.x = f.x > c ? __clc_pow(f.x, 1.f / 3.f) : (d * f.x + 16.f) / 116.f;
    g.x = f.y > c ? __clc_pow(f.y, 1.f / 3.f) : (d * f.y + 16.f) / 116.f;
    g.z = f.z > c ? __clc_pow(f.z, 1.f / 3.f) : (d * f.z + 16.f) / 116.f;

    e.x = 116.f * g.y - 16.f;
    e.y = 500.f * (g.x - g.y);
    e.z = 200.f * (g.y - g.z);
    return e;
}

float3 O(float3 a, float3 b ) {

    float3 c = (float3)((1.f / 116.f) * (a.x + 16.f));
    c.y += (1.f / 500.f) * a.y;
    c.z -= (1.f / 200.f) * a.z;
    float3 d;
    const float e = 6.f / 29.f;
    d.x = c.x > e ? __clc_pow(c.x, 3.f) : 3.f * e * e * (c.x - 4.f / 29.f);
    d.y = c.y > e ? __clc_pow(c.y, 3.f) : 3.f * e * e * (c.y - 4.f / 29.f);
    d.z = c.z > e ? __clc_pow(c.z, 3.f) : 3.f * e * e * (c.z - 4.f / 29.f);
    float3 f;
    f.x = b.x * d.y;
    f.y = b.y * d.x;
    f.z = b.z * d.z;
    return f;
}

float3 P(float3 a) {

    float16 b = (float16)(0.4124564f, 0.2126729f, 0.0193339f, 0.f, 0.3575761f, 0.7151522f, 0.1191920f, 0.f, 0.1804375f, 0.0721750f, 0.9503041f, 0.f, (float4)(0.f));

    float3 c;
    c.x = a.x > 0.04045f ? __clc_pow((a.x + 0.055f) / 1.055f, 2.4f) : a.x / 12.92f;
    c.y = a.y > 0.04045f ? __clc_pow((a.y + 0.055f) / 1.055f, 2.4f) : a.y / 12.92f;
    c.z = a.z > 0.04045f ? __clc_pow((a.z + 0.055f) / 1.055f, 2.4f) : a.z / 12.92f;

    return E(b, c);
}

float3 Q(float3 a) {

    float16 b = (float16)(3.2404542f, -0.9692660f, 0.0556434, 0.f, -1.5371385f, 1.8760108f, -0.2040259f, 0.f, -0.4985314f, 0.0415560f, 1.0572252f, 0.f, (float4)(0.f));
    float3 c = E(b, a);

    float3 d;
    d.x = c.x > 0.0031308f ? __clc_pow(c.x, 1.f / 2.4f) * 1.055f - 0.055f : c.x * 12.92f;
    d.y = c.y > 0.0031308f ? __clc_pow(c.y, 1.f / 2.4f) * 1.055f - 0.055f : c.y * 12.92f;
    d.z = c.z > 0.0031308f ? __clc_pow(c.z, 1.f / 2.4f) * 1.055f - 0.055f : c.z * 12.92f;

    return d;

}

float3 R(float3 a) {
    float3 b = P(a);

    return N(b, (float3)(0.95047f, 1.f, 1.08883f));
}

float3 S(float3 a) {
    float3 b = O(a, (float3)(0.95047f, 1.f, 1.08883f));

    return Q(b);
}
float T(float3 a) {
    return 0.2989f * a.x + 0.5870f * a.y + 0.1140f * a.z;
}