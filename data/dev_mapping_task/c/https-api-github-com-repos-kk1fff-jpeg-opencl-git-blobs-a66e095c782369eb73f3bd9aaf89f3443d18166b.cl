struct upsample_info {
  int max_v_samp_factor;
};

typedef unsigned char JSAMPLE;

__kernel void A(__global JSAMPLE* a, __global JSAMPLE* b) {
  __global JSAMPLE* c;
  __global JSAMPLE* d;

  __global JSAMPLE* e;
  __global JSAMPLE* f;
  int g;
  int h = get_global_id(0);
  int i = get_global_size(0);
  int j = get_global_id(1);
  int k = get_global_size(1);
  int l = ((h >> 1) * k) + j;

  c = a + l;
  if (h == 0) {
    d = c;
  } else if (h == (i - 1)) {
    d = c;
  } else if (!(h & 1)) {
    d = c - k;
  } else {
    d = c + k;
  }
  f = b + (((h * k) + j) << 1);

  if (j == 0) {
    unsigned int m = ((int)(c[0]) & 0xFF) * 3 + ((int)(d[0]) & 0xFF);
    unsigned int n = ((int)(c[1]) & 0xFF) * 3 + ((int)(d[1]) & 0xFF);
    f[0] = (JSAMPLE)((m * 4 + 8) >> 4);
    f[1] = (JSAMPLE)((m * 3 + n + 7) >> 4);
  } else if (j == (k - 1)) {
    unsigned int m = ((int)(c[0]) & 0xFF) * 3 + ((int)(d[0]) & 0xFF);
    unsigned int o = ((int)(c[-1]) & 0xFF) * 3 + ((int)(d[-1]) & 0xFF);
    f[0] = (JSAMPLE)((m * 3 + o + 8) >> 4);
    f[1] = (JSAMPLE)((m * 4 + 7) >> 4);
  } else {
    unsigned int o = ((int)(c[-1]) & 0xFF) * 3 + ((int)(d[-1]) & 0xFF);
    unsigned int m = ((int)(c[0]) & 0xFF) * 3 + ((int)(d[0]) & 0xFF);
    unsigned int n = ((int)(c[1]) & 0xFF) * 3 + ((int)(d[1]) & 0xFF);
    f[0] = (JSAMPLE)((m * 3 + o + 8) >> 4);
    f[1] = (JSAMPLE)((m * 3 + n + 7) >> 4);
  }
}