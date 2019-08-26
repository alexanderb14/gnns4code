kernel void A(__global int4* a) {
  int4 b[65];
  for (int c = 0; c < 65; ++c) {
    b[c] = (int4)c;
  }
  if (get_global_id(0) == 1)
    *a = b[0];
}