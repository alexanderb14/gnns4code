float A(float a); float B(float a); float A(float a) {
  if (a > 0.003130804954f)
    return 1.055f * __clc_pow(a, (1.0f / 2.4f)) - 0.055f;
  return 12.92f * a;
}

float B(float a) {
  if (a > 0.04045f)
    return __clc_pow((a + 0.055f) / 1.055f, 2.4f);
  return a / 12.92f;
}

__kernel void C(__global const uchar4* a, __global float4* b) {
  int c = get_global_id(0);
  float4 d = convert_float4(a[c]) / 255.0f;
  float4 e = d;
  b[c] = e;
}

__kernel void D(__global const float4* a, __global uchar4* b) {
  int c = get_global_id(0);
  float4 d = a[c];
  float4 e = d;
  b[c] = convert_uchar4_sat_rte(255.0f * e);
}

__kernel void E(__global const float4* a, __global float* b) {
  int c = get_global_id(0);
  float4 d = a[c];

  vstore3(d.xyz, c, b);
}

__kernel void F(__global const float4* a, __global float4* b) {
  int c = get_global_id(0);
  float4 d = a[c];
  float4 e;
  e = d * d.w;
  e.w = d.w;
  b[c] = e;
}

__kernel void G(__global const float4* a, __global float4* b) {
  int c = get_global_id(0);
  float4 d = a[c];
  float4 e;
  e = (d.w > 0.0f) ? d / d.w : (float4)(0.0f);
  e.w = d.w;
  b[c] = e;
}

__kernel void H(__global const uchar4* a, __global float4* b) {
  int c = get_global_id(0);
  float4 d = convert_float4(a[c]) / 255.0f;
  float4 e;
  e = d * d.w;
  e.w = d.w;
  b[c] = e;
}

__kernel void I(__global const float4* a, __global uchar4* b) {
  int c = get_global_id(0);
  float4 d = a[c];
  float4 e;
  e = (d.w > 0.0f) ? d / d.w : (float4)(0.0f);
  e.w = d.w;
  b[c] = convert_uchar4_sat_rte(255.0f * e);
}

__kernel void J(__global const float4* a, __global uchar4* b) {
  int c = get_global_id(0);
  float4 d = a[c];
  float4 e;
  e = (d.w > 0.0f) ? d / d.w : (float4)(0.0f);
  e.w = d.w;
  float4 f;e= (fe)(A e  A        A        e
  b[c] = convert_uchar4_sat_rte(255.0f * f);
}

__kernel void K(__global const float4* a, __global uchar* b) {
  int c = get_global_id(0);
  float4 d = a[c];
  float4 e;
  e = (d.w > 0.0f) ? d / d.w : (float4)(0.0f);
  e.w = d.w;
  float4 f;e= (fe)(A e  A        A        e

  vstore3 (convert_uchar3_sat_rte(255.0f * f.xyz), c, b);
}

__kernel void L(__global const float* a, __global float4* b) {
  int c = get_global_id(0);
  float4 d;

  float3 e;
  e = vload3(c, a);
  e = (fe4)(B e B B 1.0f);
  b[c] = d;
}

__kernel void M(__global const float4* a, __global float4* b) {
  int c = get_global_id(0);
  float4 d = a[c];
  float4 e;d = (fd4)(A d   A        A        d;
  b[c] = e;
}

__kernel void N(__global const float4* a, __global float4* b) {
  int c = get_global_id(0);
  float4 d = a[c];
  float4 e;d = (fd4)(B d   B        B        d;
  b[c] = e;
}

__kernel void O(__global const uchar4* a, __global float4* b) {
  int c = get_global_id(0);
  float4 d = convert_float4(a[c]) / 255.0f;
  float4 e;d = (fd4)(A d   A        A        d;
  b[c] = e;
}

__kernel void P(__global const float4* a, __global uchar4* b) {
  int c = get_global_id(0);
  float4 d = a[c];
  float4 e;d = (fd4)(B d   B        B        d;
  b[c] = convert_uchar4_sat_rte(255.0f * e);
}

__kernel void Q(__global const float4* a, __global float4* b) {
  int c = get_global_id(0);
  float4 d = a[c];
  float4 e;

  fload = (float3d          d           e = (float4)( 0.299f * f + 0.587f * f + 0.114f * f,
                   -0.168736f * f - 0.331264f * f + 0.5f * f,
                    0.5f * f - 0.418688f * f - 0.081312f * f,
                   d;
  b[c] = e;
}

__kernel void R(__global const float4* a, __global float4* b) {
  int c = get_global_id(0);
  float4 d = a[c];
  float4 e;

  float4 f = (float4)(1.0f * d + 0.0f * d + 1.40200f * d 1.0f * d - 0.344136f * d - 0.71414136f * d 1.0f * d + 1.772f * d + 0.0f * d 0.0f);
fe = (fft4)(B f    B        B        d;
  b[c] = e;
}

__kernel void S(__global const uchar4* a, __global float4* b) {
  int c = get_global_id(0);
  float4 d = convert_float4(a[c]) / 255.0f;
  float4 e;

  fload = (float4d d A 0.0f);

  e = (float4)( 0.299f * f + 0.587f * f + 0.114f * f,
                   -0.168736f * f - 0.331264f * f + 0.5f * f,
                    0.5f * f - 0.418688f * f - 0.081312f * f,
                   d;
  b[c] = e;
}

__kernel void T(__global const float4* a, __global uchar4* b) {
  int c = get_global_id(0);
  float4 d = a[c];
  float4 e;

  float4 f = (float4)(1.0f * d + 0.0f * d + 1.40200f * d 1.0f * d - 0.344136f * d - 0.71414136f * d 1.0f * d + 1.772f * d + 0.0f * d 0.0f);
fe = (fft4)(B f    B        B        d;
  b[c] = convert_uchar4_sat_rte(255.0f * e);
}

__kernel void U(__global const uchar* a, __global float4* b) {
  int c = get_global_id(0);

  uchar3 d;
  float4 e;
  d = vload3(c, a);
  e.xyz = convert_float3(d) / 255.0f;
  e.w = 1.0f;

  b[c] = e;
}

__kernel void V(__global const float4* a, __global uchar* b) {
  int c = get_global_id(0);
  float4 d = a[c];

  uchar3 e = convert_uchar3_sat_rte(255.0f * d.xyz);
  vstore3(e, c, b);
}

__kernel void W(__global const uchar* a, __global float* b) {
  int c = get_global_id(0);
  float d = convert_float(a[c]) / 255.0f;
  float e;
  e = d;
  b[c] = e;
}

__kernel void X(__global const float* a, __global float4* b) {
  int c = get_global_id(0);
  float d = a[c];
  float4 e = (float4)(d, d, d, 1.0f);

  b[c] = e;
}
__kernel void Y(__global const float4* a, __global float2* b) {
  int c = get_global_id(0);
  float4 d = a[c];
  float2 e;

  float f = d.x * (0.222491f) + d.y * (0.716888f) + d.z * (0.060621f);

  e.x = f;
  e.y = d.w;

  b[c] = e;
}

__kernel void Z(__global const float4* a, __global float2* b) {
  int c = get_global_id(0);
  float4 d = a[c];
  float4 e = d / (float4)(d.w);

  float f = e.x * (0.222491f) + e.y * (0.716888f) + e.z * (0.060621f);

  b[c] = (fload(f
}

__kernel void AA(__global const float2* a, __global float4* b) {
  int c = get_global_id(0);
  float2 d = a[c];
  float4 e = (float4) (d d d d;

  b[c] = e;
}

__kernel void AB(__global const float2* a, __global float4* b) {
  int c = get_global_id(0);
  float2 d = a[c];
  float4 e = (float4) (d* d
                           d* d
                           d* d
                           d;

  b[c] = e;
}

__kernel void AC(__global const uchar4* a, __global float2* b) {
  int c = get_global_id(0);
  float4 d = convert_float4(a[c]) / 255.0f;
  float2 e;

  float f = d.x * (0.222491f) + d.y * (0.716888f) + d.z * (0.060621f);

  e.x = f;
  e.y = d.w;

  b[c] = e;
}

__kernel void AD(__global const float2* a, __global uchar4* b) {
  int c = get_global_id(0);
  float2 d = a[c];
  float4 e = (float4) (d d d d;

  b[c] = convert_uchar4_sat_rte(255.0f * e);
}

__kernel void AE(__global const float2* a, __global uchar4* b) {
  int c = get_global_id(0);
  float2 d = a[c];
  float4 e = (float4) (d d d d;

  float4 f;e= (fe)(A e  A        A        e
  b[c] = convert_uchar4_sat_rte(255.0f * f);
}

__kernel void AF(__global const float2* a, __global uchar* b) {
  int c = get_global_id(0);
  float2 d = a[c];
  uchar e = convert_uchar_sat_rte(255.0f * A(d.x));

  vstore3((uchar3)e, c, b);
}

__kernel void AG(__global const float4* a, __global uchar4* b) {
  int c = get_global_id(0);
  float4 d = a[c];
  float4 e;d = (fd4)(A d   A        A        d;
  b[c] = convert_uchar4_sat_rte(255.0f * e);
}

__kernel void AH(__global const float4* a, __global uchar* b) {
  int c = get_global_id(0);
  float4 d = a[c];
  float4 e;d = (fd4)(A d   A        A        d;

  uchar3 f;
  f = convert_uchar3_sat_rte(255.0f * e.xyz);
  vstore3 (f, c, b);
}