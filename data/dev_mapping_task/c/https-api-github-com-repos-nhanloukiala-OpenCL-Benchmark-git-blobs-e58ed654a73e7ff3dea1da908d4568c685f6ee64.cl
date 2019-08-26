__kernel void A(__global float* a, __global float* b) {
  size_t c = get_group_id(0) * get_local_size(0) + get_local_id(0);
  size_t d = 16;
  size_t e = c;

  prefetch(a + (get_local_id(0) * 16), 16);

  barrier(1);

  float16 f = vload16(e, a);
  float g[16];
  g[0] = f.s0;
  g[1] = f.s1;
  g[2] = f.s2;
  g[3] = f.s3;
  g[4] = f.s4;
  g[5] = f.s5;
  g[6] = f.s6;
  g[7] = f.s7;
  g[8] = f.s8;
  g[9] = f.s9;
  g[10] = f.sa;
  g[11] = f.sb;
  g[12] = f.sc;
  g[13] = f.sd;
  g[14] = f.se;
  g[15] = f.sf;

  for (int h = 0; h < 16; ++h) {
    b[e * d + h] = g[h];
  }
}