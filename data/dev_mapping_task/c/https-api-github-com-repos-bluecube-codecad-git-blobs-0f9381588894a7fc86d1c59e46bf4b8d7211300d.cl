float3 A(float4 a, float3 b) {
  float3 c = __builtin_astype(a, float3);
  return (c * dot(c, b) + cross(c, b) * a.w) * 2 + b * (a.w * a.w - dot(c, c));
}

float B(float4 a) {
  return dot(a, a);
}

float4 C(float4 a, float4 b) {
  if (a.w > 0 && b.w > 0) {
    float c = hypot(a.w, b.w);

    float d = a.w / c;
    float e = b.w / c;

        return (float4)(a* d+ b* e
                        c
  } else if (a.w > b.w)
    return a;
  else
    return b;
}

float4 D(float a, float4 b) {
    return (float4)(copysign(1.0f, b 0, 0, __clc_fabs(b- aloat4 E(float a, float4 b) {
    return (float4)(0, copysign(1.0f, b 0, __clc_fabs(b- aloat4 F(float a, float4 b) {
    return (float4)(0, 0, copysign(1.0f, b __clc_fabs(b- aloat4 G(float a, float4 b, float4 c) {

        if (a >= 0) {
          float d = dot(__builtin_astype(b, float3), __builtin_astype(c, float3));
          float e = a - b.w;
          float f = a - c.w;

          if (d * e < f && d * f < e) {
            float g = a - sqrt((e * e + f * f - 2 * d * e * f) / (1 - d * d));
            return (float4)(0, 0, 0, g);
          }
        }

        if (b.w < c.w)
          return b;
        else
          return c;
}

float4 H(float a, float4 b, float4 c) {
        return G(a, b, c);
}

float4 I(float a, float4 b, float4 c) {
        return -G(a, -b, -c);
}

float4 J(float a, float4 b, float4 c) {
        return -G(a, -b, c);
}

float4 K(float a, float b, float c, float d,
                                    float e, float f, float g,
                                    float3 h) {
    float4 i = (float4)(a b c d;
    float3 j = (float3)(e f g;

    float3 k = A(i, h) + j;

    return __builtin_astype(k, float4);
}

float4 L(float a, float b, float c, float d,
                            float e, float f, float g,
                            float4 h) {
    float4 i = (float4)(a b c d;
    float3 j = (float3)(e f g;

    float3 k = A(i, h.xyz) + j;

    return __builtin_astype(k, float4);
}

float4 M(float a, float b, float c, float d,
                              float4 e) {
    float4 f = (float4)(a b c d;

    float g = B(f);

    float4 h;
    h.xyz = A(f, e.xyz) / g;
    h.w = e.w * g;
    return h;
}

float4 N(float4 a) {
    return (float4)(-aaaa
}

float4 O(float4 a) {
    return (float4)(__clc_fabs(a a);
}

float4 P(float4 a, float4 b) {
    return (float4)(b 0 ? -a aa);
}

float4 Q(float a, float4 b) {
    return (float4)(bbbb aloat4 R(float a, float4 b) {
          float4 c = (b.w >= 0) ? b : -b;
          return Q(a, c);
}