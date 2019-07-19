__kernel void A() {
  int a = 0, b = -1, c = -2;
  unsigned d = 1, e = 2, f = 3;
  a = 127;
  a = abs(d);
  a = abs_diff(e, f);
  a = add_sat(b, c);
  a = hadd(b, c);
  a = rhadd(b, c);
  a = clz(a);
  a = clamp(a, b, c);
  a = (mul_hi((a), (b)) + (c));
  a = mad_sat(a, b, c);
  a = max(b, c);
  a = min(b, c);
  a = mul_hi(b, c);
  a = rotate(b, c);
  a = sub_sat(b, c);
  long g = upsample(a, d);
  a = mad24(a, b, c);
  a = mul24(b, c);
}