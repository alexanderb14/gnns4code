__kernel void A(__global const uchar* restrict a, const int b, __global char* restrict c, __global char* restrict d) {
  const int e = get_global_id(0) * 16;
  const int f = get_global_id(1) * 1;

  const int g = f * b + e;
  uchar16 h = vload16(0, a + (g + 0));
  uchar16 i = vload16(0, a + (g + 1));
  uchar16 j = vload16(0, a + (g + 2));
  short16 k = convert_short16(h);
  short16 l = convert_short16(i);
  short16 m = convert_short16(j);
  short16 n = m - k;
  short16 o = m + k + l * (short)2;

  h = vload16(0, a + (g + b * 1 + 0));
  j = vload16(0, a + (g + b * 1 + 2));

  k = convert_short16(h);
  m = convert_short16(j);

  n += (m - k) * (short)2;

  h = vload16(0, a + (g + b * 2 + 0));
  i = vload16(0, a + (g + b * 2 + 1));
  j = vload16(0, a + (g + b * 2 + 2));

  k = convert_short16(h);
  l = convert_short16(i);
  m = convert_short16(j);

  n += m - k;
  o -= m + k + l * (short)2;
  vstore16(convert_char16(n >> 3), 0, c + g + b + 1);
  vstore16(convert_char16(o >> 3), 0, d + g + b + 1);
}