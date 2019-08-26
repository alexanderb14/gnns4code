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
__kernel void H(const __global uint4* a, __global float4* b) {
  float4 c;

  uint4 d = a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1))];
  uint4 e = a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + (get_global_size(0) * get_global_size(1) * get_global_size(2))];

  uint4 f = ((d / 177) % 177) + 2;
  uint4 g = (d % 177) + 2;
  uint4 h = ((e / 169) % 178) + 1;
  uint4 i = (e % 169);
  for (int j = 0; j < 97; j++) {
    uint4 k = (uint4)0;
    uint l = 8388608;
    for (int m = 0; m < 24; m++) {
      uint4 n = (f * g) % 179;
      n = (n * h) % 179;
      f = g;
      g = h;
      h = n;
      i = (53 * i + 1) % 169;
      uint4 o = (i * n) % 64;

      if (o.x >= 32)
        k.x += l;
      if (o.y >= 32)
        k.y += l;
      if (o.z >= 32)
        k.z += l;
      if (o.w >= 32)
        k.w += l;
      l = l >> 1;
    }
    c.x = ((float)k.x);
    c.y = ((float)k.y);
    c.z = ((float)k.z);
    c.w = ((float)k.w);
    b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + (get_global_size(0) * get_global_size(1) * get_global_size(2)) * j] = c / ((float4)16777216.0f);
  }
  Uint_and_Float p, q;
  p.uint_value = 96;
  q.uint_value = 32;
  float4 r;
  r.x = p.float_value;
  r.y = q.float_value;
  r.z = (362436.0f / 16777216.0f);
  r.w = 0.0f;

  b[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + (get_global_size(0) * get_global_size(1) * get_global_size(2)) * 97] = r;
}

__attribute__((always_inline)) float4 I(__global float4* a, uint* b, uint* c, float* d) {
  float4 e;
  e = a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + (get_global_size(0) * get_global_size(1) * get_global_size(2)) * (*b)] - a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + (get_global_size(0) * get_global_size(1) * get_global_size(2)) * (*c)];
  e = ((e < (float4)0.0f) ? ((e + 1.0f)) : (e));
  a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + (get_global_size(0) * get_global_size(1) * get_global_size(2)) * (*b)] = e;

  if ((*b) == 0)
    (*b) = 97;
  if ((*c) == 0)
    (*c) = 97;
  (*b)--;
  (*c)--;

  (*d) -= (7654321.0f / 16777216.0f);
  if ((*d) < 0.0) {
    (*d) += (16777213.0f / 16777216.0f);
  }
  e -= (*d);
  e = ((e < (float4)0.0f) ? ((e + 1.0f)) : (e));
  return e;
}
__kernel void J(__global float4* a, __global float4* b, const uint c) {
  uint d = (get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1));
  float4 e = (float4)0.0;
  Uint_and_Float f, g;
  float4 h = a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + (get_global_size(0) * get_global_size(1) * get_global_size(2)) * 97];
  f.float_value = h.x;
  g.float_value = h.y;
  uint i = f.uint_value;
  uint j = g.uint_value;
  float k = h.z;
  for (uint l = 0; l < c; l++) {
    e = I(a, &i, &j, &k);
    b[d] = e;

    d += (get_global_size(0) * get_global_size(1) * get_global_size(2));
  }

  f.uint_value = i;
  g.uint_value = j;
  h.z = k;
  h.x = f.float_value;
  h.y = g.float_value;
  a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1)) + (get_global_size(0) * get_global_size(1) * get_global_size(2)) * 97] = h;
}