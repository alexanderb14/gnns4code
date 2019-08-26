__kernel void A(__global float* a, const int b, const float c, const ulong d) {
  const int e = get_global_id(0);

  if (e < b) {
    ulong f = d + e;
    f = (f * 0x5DEECE66DL + 0xBL) & ((1L << 48) - 1);
    uint g = f >> 16;
    for (int h = 0; h < 6; ++h) {
      f = g;
      f = (f * 0x5DEECE66DL + 0xBL) & ((1L << 48) - 1);
      g = f >> 16;
    }
    float i = (float)g / (float)4294967295;

    if (i > c)
      a[e] = 0.0F;
    else
      a[e] /= c;
  }
}