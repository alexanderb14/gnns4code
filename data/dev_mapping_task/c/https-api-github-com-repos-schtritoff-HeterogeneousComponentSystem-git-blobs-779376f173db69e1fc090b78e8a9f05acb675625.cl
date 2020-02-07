__kernel void A(__global uchar4* a, __global uchar4* b) {
  uint c = get_global_id(0);
  uint d = get_global_id(1);

  uint e = get_global_size(0);
  uint f = get_global_size(1);

  int g = c + d * e;

  float4 h[9];

  if (c >= 1 && c < (e - 1) && d >= 1 && d < f - 1) {
    h[0] = convert_float4(a[g - 1 - e]);
    h[1] = convert_float4(a[g - e]);
    h[2] = convert_float4(a[g + 1 - e]);
    h[3] = convert_float4(a[g - 1]);
    h[4] = convert_float4(a[g]);
    h[5] = convert_float4(a[g + 1]);
    h[6] = convert_float4(a[g - 1 + e]);
    h[7] = convert_float4(a[g + e]);
    h[8] = convert_float4(a[g + 1 + e]);

    float4 i = (float4)(255);

    for (int j = 0; j < 9; j++) {
      i = min(i, h[j]);
    }

    b[g] = convert_uchar4(i);
  }
}