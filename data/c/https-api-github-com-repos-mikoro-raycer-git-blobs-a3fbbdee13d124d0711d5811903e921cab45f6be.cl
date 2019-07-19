uint A(global uint2* a) {
  enum { A = 4294883355U };
  uint b = (*a).x;
  uint c = (*a).y;
  uint d = b ^ c;
  uint e = mul_hi(b, A);
  b = b * A + c;
  c = e + (b < c);
  *a = (uint2)(b, c);

  return d;
}

float B(global uint2* a) {
  return (float)A(a) / (float)0xFFFFFFFF;
}