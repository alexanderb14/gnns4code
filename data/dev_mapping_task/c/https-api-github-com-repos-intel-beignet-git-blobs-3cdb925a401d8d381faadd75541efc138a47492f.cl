__kernel void A() {
  float a = 1.23456789f;
  float b;

  b = (float)a;
  b = convert_float(a);
  b = __builtin_astype(a, float);

  b = convert_float_rte(a);
  b = convert_float_rtz(a);
  b = convert_float_rtp(a);
  b = convert_float_rtn(a);

  b = convert_float_sat_rte(a);
  b = convert_float_sat_rtz(a);
  b = convert_float_sat_rtp(a);
  b = convert_float_sat_rtn(a);
}