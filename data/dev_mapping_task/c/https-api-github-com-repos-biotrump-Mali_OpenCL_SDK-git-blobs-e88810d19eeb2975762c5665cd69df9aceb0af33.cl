__kernel void A(__global const uchar* restrict a, const int b, __global char* restrict c, __global char* restrict d) {
  const int e = get_global_id(0);
  const int f = get_global_id(1);

  const int g = f * b + e;

  uchar h = *(a + (g + 0));
  uchar i = *(a + (g + 1));
  uchar j = *(a + (g + 2));
  short k = convert_short(h);
  short l = convert_short(i);
  short m = convert_short(j);
  short n = m - k;
  short o = m + k + l * (short)2;

  h = *(a + (g + b * 1 + 0));
  j = *(a + (g + b * 1 + 2));

  k = convert_short(h);
  m = convert_short(j);

  n += (m - k) * (short)2;

  h = *(a + (g + b * 2 + 0));
  i = *(a + (g + b * 2 + 1));
  j = *(a + (g + b * 2 + 2));

  k = convert_short(h);
  l = convert_short(i);
  m = convert_short(j);

  n += m - k;
  o -= m + k + l * (short)2;
  *(c + g + b + 1) = convert_char(n >> 3);
  *(d + g + b + 1) = convert_char(o >> 3);
}