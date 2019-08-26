kernel void A(global float8* a, global float* b, global uchar* c) {
  uint d = get_global_id(0);

  float8 e = a[d];
  vstore3(e.s012 * 0.001f, d, b);
  vstore3(convert_uchar3(e.s456 * 255.f), d, c);
}