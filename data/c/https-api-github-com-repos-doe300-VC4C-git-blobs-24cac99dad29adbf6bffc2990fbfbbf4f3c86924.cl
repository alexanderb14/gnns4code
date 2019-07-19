float2 A(float2 a, float2 b) {
  float2 c;
  c.even = (a.even * b.even - a.odd * b.odd);
  c.odd = (a.even * b.odd + a.odd * b.even);
  return c;
}

float4 B(float4 a, float4 b)

{
  float4 c;
  c.even = (a.even * b.even - a.odd * b.odd);
  c.odd = (a.even * b.odd + a.odd * b.even);
  return c;
}

float4 C(float4 a) {
  return (float4)(a.lo + a.hi, a.lo - a.hi);
}

float2 D(float a)

{
  float b, c;

  b = cos(a);
  c = sin(a);

  return (float2)(bc;
}

__kernel void E(__global const float2* a, __global float2* b, int c)

{
  int d = get_global_id(0);

  int e = get_global_size(0);

  int f = d & (c - 1);

  a += d;

  b += (d << 1) - f;

  float4 g = C( (float4)(

    a[0],

  Doat)f/(float)c),a[e]) ));

  b[0] = g.lo;

  b[c] = g.hi;
}