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
__attribute__((always_inline)) void H(uint4* a)

{
  uint4 b, c;

  b = ((uint)16807) * ((*a) % 127773);
  c = ((uint)2836) * ((*a) / 127773);

  if (b.x > c.x)
    (*a).x = b.x - c.x;
  else
    (*a).x = b.x - c.x + (uint)2147483647;
  if (b.y > c.y)
    (*a).y = b.y - c.y;
  else
    (*a).y = b.y - c.y + (uint)2147483647;
  if (b.z > c.z)
    (*a).z = b.z - c.z;
  else
    (*a).z = b.z - c.z + (uint)2147483647;
  if (b.w > c.w)
    (*a).w = b.w - c.w;
  else
    (*a).w = b.w - c.w + (uint)2147483647;
}

__kernel void I(__global uint4* a, __global float4* b, const uint c) {
  uint d = (get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1));

  float4 e = (float4)(2147483647.0);

  uint4 f = a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1))];
  for (uint g = 0; g < c; g++) {
    H(&f);
    b[d] = G(f) / e;

    d += (get_global_size(0) * get_global_size(1) * get_global_size(2));
  }
  a[(get_global_id(0) + get_global_id(1) * get_global_size(0) + get_global_id(2) * get_global_size(0) * get_global_size(1))] = f;
}