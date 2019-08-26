float A(int a, __local int* b) {
  int c;
  int d;
  int e = 0;

  int f = get_local_id(0);

  for (c = 4; c >= 0; c--) {
    d = a / 127773;
    a = 16807 * (a - d * 127773) - 2836 * d;

    if (a < 0)
      a += 2147483647;

    if (c < 4)
      b[4 * f + c] = a;
  }
  e = b[0];

  d = a / 127773;
  a = 16807 * (a - d * 127773) - 2836 * d;

  if (a < 0)
    a += 2147483647;

  c = e / (1 + (2147483647 - 1) / 4);
  e = b[4 * f + c];
  return ((1.0 / 2147483647) * e);
}

float2 B(float2 a) {
  float b = sqrt(-2 * log(a.x));
  float c = 2 * 3.14 * a.y;
  return (float2)(b * sin(b * cos(c
}

__kernel void C(__global uchar4* a, __global uchar4* b, int c) {
  int d = get_global_id(0) + 2 * get_global_size(0) * get_global_id(1);

  float4 e = convert_float4(a[d]);
  float4 f = convert_float4(a[d + get_global_size(0)]);

  float g = (e.x + e.y + e.z + e.w) / 4;
  float h = (f.x + f.y + f.z + f.w) / 4;

  __local int i[4 * 256];
  __local int j[4 * 256];

  float k = A(-g, i);
  float l = A(-h, j);

 float2 m = B((float2)(l


 b[d] = convert_uchar4_sat(e + (float4)(m.x * c));
 b[d + get_global_size(0)] = convert_uchar4_sat(f + (float4)(m.y * c));
}