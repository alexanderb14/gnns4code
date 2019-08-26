const constant float Ga = 0.111111f; __kernel void A(__global uchar4* a, __global uchar4* b) {
  int c = (int)get_global_id(0);
  int d = (int)get_global_id(1);
  int e = (int)get_global_size(0);
  b[d * e + c] = a[d * e + c];
}

__kernel void B(__global ushort4* a, __global ushort4* b) {
  int c = (int)get_global_id(0);
  int d = (int)get_global_id(1);
  int e = (int)get_global_size(0);
  b[d * e + c] = a[d * e + c];
}

__kernel void C(__global uint4* a, __global uint4* b) {
  int c = (int)get_global_id(0);
  int d = (int)get_global_id(1);
  int e = (int)get_global_size(0);
  b[d * e + c] = a[d * e + c];
}

__kernel void D(__global uchar4* a, __global uchar4* b) {
  float4 c;
  int d = (int)get_global_id(0);
  int e = (int)get_global_id(1);
  int f = (int)get_global_size(0);
  int g = (int)get_global_size(1);

  int h = d - 1;
  int i = d + 1;
  int j = e - 1;
  int k = e + 1;
  int l = (h > 0) ? h : d;
  int m = (i > f - 1) ? d : i;
  int n = (j > 0) ? j : e;
  int o = (k > g - 1) ? e : k;

  c = convert_float4(a[n * f + l]) + convert_float4(a[n * f + d]) + convert_float4(a[n * f + m]) + convert_float4(a[e * f + l]) + convert_float4(a[e * f + d]) + convert_float4(a[e * f + m]) + convert_float4(a[o * f + l]) + convert_float4(a[o * f + d]) + convert_float4(a[o * f + m]);

  b[e * f + d] = convert_uchar4(c * Ga);
}

__kernel void E(__global ushort4* a, __global ushort4* b) {
  float4 c;
  int d = (int)get_global_id(0);
  int e = (int)get_global_id(1);
  int f = (int)get_global_size(0);
  int g = (int)get_global_size(1);

  int h = d - 1;
  int i = d + 1;
  int j = e - 1;
  int k = e + 1;
  int l = (h > 0) ? h : d;
  int m = (i > f - 1) ? d : i;
  int n = (j > 0) ? j : e;
  int o = (k > g - 1) ? e : k;

  c = convert_float4(a[n * f + l]) + convert_float4(a[n * f + d]) + convert_float4(a[n * f + m]) + convert_float4(a[e * f + l]) + convert_float4(a[e * f + d]) + convert_float4(a[e * f + m]) + convert_float4(a[o * f + l]) + convert_float4(a[o * f + d]) + convert_float4(a[o * f + m]);

  b[e * f + d] = convert_ushort4(c * Ga);
}

__kernel void F(__global uint4* a, __global uint4* b) {
  float4 c;
  int d = (int)get_global_id(0);
  int e = (int)get_global_id(1);
  int f = (int)get_global_size(0);
  int g = (int)get_global_size(1);

  int h = d - 1;
  int i = d + 1;
  int j = e - 1;
  int k = e + 1;
  int l = (h > 0) ? h : d;
  int m = (i > f - 1) ? d : i;
  int n = (j > 0) ? j : e;
  int o = (k > g - 1) ? e : k;

  c = convert_float4(a[n * f + l]) + convert_float4(a[n * f + d]) + convert_float4(a[n * f + m]) + convert_float4(a[e * f + l]) + convert_float4(a[e * f + d]) + convert_float4(a[e * f + m]) + convert_float4(a[o * f + l]) + convert_float4(a[o * f + d]) + convert_float4(a[o * f + m]);

  b[e * f + d] = convert_uint4(c * Ga);
}