inline double4 A(uint4 a) {
  double4 b;
  b.x = (double)a.x;
  b.y = (double)a.y;
  b.z = (double)a.z;
  b.w = (double)a.w;

  return b;
}

inline double B(uint a, uint b, uint c, uint d, double e) {
  double f = (a + e * b - (c + e * d)) / ((d - c) * (1.0 - e));
  return f;
}

inline double4 C(uint4 a, uint4 b, uint c, uint d, double e) {
  double4 f;
  double4 g = A(a);
  double4 h = A(b);
  double i = (c + e * d);
  double j = ((d - c) * (1.0 - e));
  f.x = (g.x + e * h.x - i) / j;
  f.y = (g.y + e * h.y - i) / j;
  f.z = (g.z + e * h.z - i) / j;
  f.w = (g.w + e * h.w - i) / j;
  return f;
}

inline double D(float a, float b, double c, double d, double e) {
  double f = (d - c);
  double g = __clc_trunc((f - 2.0 * e) / e) + f;
  return (__clc_trunc((a - c - e) / e) + b - c) / g * (1.0 - e * e);
}

inline double2 E(float4 a, double b, double c, double d) {
  double2 e;
  double f = (c - b);
  double g = __clc_trunc((f - 2.0 * d) / d) + f;
  e.x = (__clc_trunc((a.x - b - d) / d) + a.y - b) / g * (1.0 - d * d);
  e.y = (__clc_trunc((a.z - b - d) / d) + a.w - b) / g * (1.0 - d * d);
  return e;
}

inline double4 F(float4 a, float4 b, double c, double d, double e) {
  double4 f;
  double g = (d - c);
  double h = __clc_trunc((g - 2.0 * e) / e) + g;
  f.x = (__clc_trunc((a.x - c - e) / e) + b.x - c) / h * (1.0 - e * e);
  f.y = (__clc_trunc((a.y - c - e) / e) + b.y - c) / h * (1.0 - e * e);
  f.z = (__clc_trunc((a.z - c - e) / e) + b.z - c) / h * (1.0 - e * e);
  f.w = (__clc_trunc((a.w - c - e) / e) + b.w - c) / h * (1.0 - e * e);
  return f;
}
inline float4 G(uint4 a) {
  float4 b;
  b.x = (float)a.x;
  b.y = (float)a.y;
  b.z = (float)a.z;
  b.w = (float)a.w;

  return b;
}

typedef union _Uint_and_Float {
  uint uint_value;
  float float_value;
} Uint_and_Float;
__attribute__((always_inline)) int4 H(int a) {
  int4 b;
  int c = a / 53668;
  a = 40014 * (a - c * 53668) - c * 12211;
  if (a < 0) {
    a = a + 2147483563;
  }
  b.x = a;

  c = a / 53668;
  a = 40014 * (a - c * 53668) - c * 12211;
  if (a < 0) {
    a = a + 2147483563;
  }
  b.y = a;

  c = a / 53668;
  a = 40014 * (a - c * 53668) - c * 12211;
  if (a < 0) {
    a = a + 2147483563;
  }
  b.z = a;

  c = a / 53668;
  a = 40014 * (a - c * 53668) - c * 12211;
  if (a < 0) {
    a = a + 2147483563;
  }
  b.w = a;

  return b;
}

__attribute__((always_inline)) float4 I(int4 a) {
  float4 b;
  float4 c = (float4)(0.000000059604644775390625f, 0.000000059604644775390625f, 0.000000059604644775390625f, 0.000000059604644775390625f);
  b.x = ((float)(a.x % 16777216));
  b.y = ((float)(a.y % 16777216));
  b.z = ((float)(a.z % 16777216));
  b.w = ((float)(a.w % 16777216));
  b = b * c;
  return b;
}

__kernel void J(const __global uint* a, __global float4* b) {
  int c = (int)a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1))];
  int4 d = H(c);
  b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 0 * (get_global_size(0) * get_global_size(1) * get_global_size(2))] = I(d);
  d = H(d.w);
  b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 1 * (get_global_size(0) * get_global_size(1) * get_global_size(2))] = I(d);
  d = H(d.w);
  b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 2 * (get_global_size(0) * get_global_size(1) * get_global_size(2))] = I(d);
  d = H(d.w);
  b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 3 * (get_global_size(0) * get_global_size(1) * get_global_size(2))] = I(d);
  d = H(d.w);
  b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 4 * (get_global_size(0) * get_global_size(1) * get_global_size(2))] = I(d);
  d = H(d.w);
  float4 e = I(d);
  b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 5 * (get_global_size(0) * get_global_size(1) * get_global_size(2))] = e;
  float4 f = (float4)(23.0f, 9.0f, 6.0f, 0.0f);
  if (e.w == 0) {
    f.w = 0.000000059604644775390625f;
  }
  b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 6 * (get_global_size(0) * get_global_size(1) * get_global_size(2))] = f;
}

__attribute__((always_inline)) float4 K(float4* a, const float4 b, const float c, float* d) {
  float e = *d;
  float4 f = b - (*a).wzyx;
  f.x = f.x - e;
  if (f.x < 0.0f) {
    f.x = f.x + 1.0f;
    e = 0.000000059604644775390625f;
  } else {
    e = 0.0f;
  }
  f.y = f.y - e;
  if (f.y < 0.0f) {
    f.y = f.y + 1.0f;
    e = 0.000000059604644775390625f;
  } else {
    e = 0.0f;
  }
  f.z = f.z - e;
  if (f.z < 0.0f) {
    f.z = f.z + 1.0f;
    e = 0.000000059604644775390625f;
  } else {
    e = 0.0f;
  }
  f.w = f.w - e;
  if (f.w < 0.0f) {
    f.w = f.w + 1.0f;
    e = 0.000000059604644775390625f;
  } else {
    e = 0.0f;
  }

  *a = f.wzyx;

  float4 g = b.yzwx;
  g.w = c;

  float4 h = ((f < (float4)0.000244140625f) ? ((f + 0.000000059604644775390625f * g)) : (f));
  f = ((h == (float4)0.0f) ? (0.000000059604644775390625f * 0.000000059604644775390625f) : (h));

  *d = e;
  return f;
}

__attribute__((always_inline)) void L(float4* a, const float4 b, float* c) {
  float d = *c;
  float4 e = b - (*a).wzyx;
  e.x = e.x - d;
  if (e.x < 0.0f) {
    e.x = e.x + 1.0f;
    d = 0.000000059604644775390625f;
  } else {
    d = 0.0f;
  }
  e.y = e.y - d;
  if (e.y < 0.0f) {
    e.y = e.y + 1.0f;
    d = 0.000000059604644775390625f;
  } else {
    d = 0.0f;
  }
  e.z = e.z - d;
  if (e.z < 0.0f) {
    e.z = e.z + 1.0f;
    d = 0.000000059604644775390625f;
  } else {
    d = 0.0f;
  }
  e.w = e.w - d;
  if (e.w < 0.0f) {
    e.w = e.w + 1.0f;
    d = 0.000000059604644775390625f;
  } else {
    d = 0.0f;
  }

  *a = e.wzyx;
  *c = d;
}

__attribute__((always_inline)) float4 M(float4* a, float4* b, float4* c, float4* d, float4* e, float4* f, float4* g) {
  float4 h, i, j, k;
  float l = (*g).w;
  if ((*g).z >= 6.0f) {
    for (int m = 0; m < (223 / 24); m++) {
      h.xy = (*c).yx;
      h.zw = (*b).wz;
      L(f, h, &l);
      h.xy = (*b).yx;
      h.zw = (*a).wz;
      L(e, h, &l);
      h.xy = (*a).yx;
      h.zw = (*f).wz;
      L(d, h, &l);
      h.xy = (*f).yx;
      h.zw = (*e).wz;
      L(c, h, &l);
      h.xy = (*e).yx;
      h.zw = (*d).wz;
      L(b, h, &l);
      h.xy = (*d).yx;
      h.zw = (*c).wz;
      L(a, h, &l);
    }
    h.xy = (*c).yx;
    h.zw = (*b).wz;
    L(f, h, &l);
    float4 n;
    n.xy = (*b).yx - (*e).wz;
    n.z = (*a).w - (*e).y;
    n.x = n.x - l;
    if (n.x < 0.0f) {
      n.x = n.x + 1.0f;
      l = 0.000000059604644775390625f;
    } else {
      l = 0.0f;
    }
    n.y = n.y - l;
    if (n.y < 0.0f) {
      n.y = n.y + 1.0f;
      l = 0.000000059604644775390625f;
    } else {
      l = 0.0f;
    }
    n.z = n.z - l;
    if (n.z < 0.0f) {
      n.z = n.z + 1.0f;
      l = 0.000000059604644775390625f;
    } else {
      l = 0.0f;
    }

    j.xyz = n.zyx;
    j.w = (*f).x;
    k.xyz = (*f).yzw;
    k.w = (*a).x;

    (*f).w = (*e).x;
    (*f).xyz = (*d).yzw;
    (*e).w = (*d).x;
    (*e).xyz = (*c).yzw;
    (*d).w = (*c).x;
    (*d).xyz = (*b).yzw;
    (*c).w = (*b).x;
    (*c).xyz = (*a).yzw;
    (*b) = k;
    (*a) = j;
    (*g).z = 0.0f;
  }
  if ((*g).z < 1.0f) {
    h.xy = (*c).yx;
    h.zw = (*b).wz;
    i = K(f, h, (*b).y, &l);
    (*g).z = 1.0f;
  } else if ((*g).z == 1.0f) {
    h.xy = (*b).yx;
    h.zw = (*a).wz;
    i = K(e, h, (*a).y, &l);
    (*g).z = 2.0f;
  } else if ((*g).z == 2.0f) {
    h.xy = (*a).yx;
    h.zw = (*f).wz;
    i = K(d, h, (*f).y, &l);
    (*g).z = 3.0f;
  } else if ((*g).z == 3.0f) {
    h.xy = (*f).yx;
    h.zw = (*e).wz;
    i = K(c, h, (*e).y, &l);
    (*g).z = 4.0f;
  } else if ((*g).z == 4.0f) {
    h.xy = (*e).yx;
    h.zw = (*d).wz;
    i = K(b, h, (*d).y, &l);
    (*g).z = 5.0f;
  } else if ((*g).z == 5.0f) {
    h.xy = (*d).yx;
    h.zw = (*c).wz;
    i = K(a, h, (*c).y, &l);
    (*g).z = 6.0f;
  }
  (*g).w = l;
  return i;
}
__kernel void N(__global float4* a, __global float4* b, const uint c) {
  uint d = (get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1));
  float4 e = a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 0 * (get_global_size(0) * get_global_size(1) * get_global_size(2))];
  float4 f = a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 1 * (get_global_size(0) * get_global_size(1) * get_global_size(2))];
  float4 g = a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 2 * (get_global_size(0) * get_global_size(1) * get_global_size(2))];
  float4 h = a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 3 * (get_global_size(0) * get_global_size(1) * get_global_size(2))];
  float4 i = a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 4 * (get_global_size(0) * get_global_size(1) * get_global_size(2))];
  float4 j = a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 5 * (get_global_size(0) * get_global_size(1) * get_global_size(2))];
  float4 k = a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 6 * (get_global_size(0) * get_global_size(1) * get_global_size(2))];

  for (int l = 0; l < c; l++) {
    float4 m = M(&e, &f, &g, &h, &i, &j, &k);
    b[d] = m;

    d += (get_global_size(0) * get_global_size(1) * get_global_size(2));
  }

  a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 0 * (get_global_size(0) * get_global_size(1) * get_global_size(2))] = e;
  a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 1 * (get_global_size(0) * get_global_size(1) * get_global_size(2))] = f;
  a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 2 * (get_global_size(0) * get_global_size(1) * get_global_size(2))] = g;
  a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 3 * (get_global_size(0) * get_global_size(1) * get_global_size(2))] = h;
  a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 4 * (get_global_size(0) * get_global_size(1) * get_global_size(2))] = i;
  a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 5 * (get_global_size(0) * get_global_size(1) * get_global_size(2))] = j;
  a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + 6 * (get_global_size(0) * get_global_size(1) * get_global_size(2))] = k;
}