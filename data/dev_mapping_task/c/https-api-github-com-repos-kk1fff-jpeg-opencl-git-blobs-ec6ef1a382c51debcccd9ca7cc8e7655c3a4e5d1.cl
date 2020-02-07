struct upsample_info {
  int max_v_samp_factor;
};

typedef unsigned char JSAMPLE;

__kernel void A(__global JSAMPLE* a, __global JSAMPLE* b) {
  __global JSAMPLE* c;
  __global JSAMPLE* d;
  int e, f;
  int g = get_global_id(0);
  int h = get_global_size(0);
  int i = get_global_id(1);
  int j = get_global_size(1);

  c = a + (g * j) + i;
  d = b + (((g * j) + i) << 1);
  e = ((int)(c[0]) & 0xFF);
  if (i == 0) {
    f = ((int)(c[1]) & 0xFF);
    d[0] = e;
    d[1] = (JSAMPLE)((e * 3 + f + 2) >> 2);
  } else if (i == (j - 1)) {
    f = ((int)(c[-1]) & 0xFF);
    d[0] = (JSAMPLE)((e * 3 + f + 1) >> 2);
    d[1] = (JSAMPLE)e;
  } else {
    f = ((int)(c[-1]) & 0xFF);
    d[0] = (JSAMPLE)((e * 3 + f + 1) >> 2);
    f = ((int)(c[1]) & 0xFF);
    d[1] = (JSAMPLE)((e * 3 + f + 2) >> 2);
  }
}