__kernel void A(__global uchar4* a, __global uchar4* b) {
  uint c = get_global_id(0);
  uint d = get_global_id(1);

  uint e = get_global_size(0);
  uint f = get_global_size(1);

  float4 g = (float4)(0);
  float4 h = g;

  int i = c + d * e;

  if (c >= 1 && c < (e - 1) && d >= 1 && d < f - 1) {
    float4 j = convert_float4(a[i - 1 - e]);
    float4 k = convert_float4(a[i - e]);
    float4 l = convert_float4(a[i + 1 - e]);
    float4 m = convert_float4(a[i - 1]);
    float4 n = convert_float4(a[i]);
    float4 o = convert_float4(a[i + 1]);
    float4 p = convert_float4(a[i - 1 + e]);
    float4 q = convert_float4(a[i + e]);
    float4 r = convert_float4(a[i + 1 + e]);

    g = j + (float4)(2) * k + l - p - (float4)(2) * q - r;

    h = j - l + (float4)(2) * m - (float4)(2) * o + p - r;

    b[i] = convert_uchar4(hypot(g, h) / (float4)(2));
  }
}