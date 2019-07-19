__kernel void A(char8 a, uchar8 b, short8 c, ushort8 d, int8 e, uint8 f, float8 g, __global float8* h) {
  h[0] = convert_float8(a);
  h[1] = convert_float8(b);
  h[2] = convert_float8(c);
  h[3] = convert_float8(d);
  h[4] = convert_float8(e);
  h[5] = convert_float8(f);
  h[6] = g;
}