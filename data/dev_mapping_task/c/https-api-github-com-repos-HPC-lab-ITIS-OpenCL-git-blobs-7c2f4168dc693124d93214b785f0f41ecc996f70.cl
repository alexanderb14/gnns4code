__kernel void A(__global float* a, __local float* b, __global float* c, const int d) {
  int e = get_global_id(0);
  int f = get_local_id(0);
  float16 g = (float16)(0.);

  while (e < d / 16) {
    g += ((__global float16*)a)[e];
    e += get_global_size(0);
  }

  b[f] = g.s0 + g.s1 + g.s2 + g.s3 + g.s4 + g.s5 + g.s6 + g.s7 + g.s8 + g.s9 + g.sa + g.sb + g.sc + g.sd + g.se + g.sf;

  barrier(1);

  for (int h = get_local_size(0) / 2; h > 0; h >>= 1) {
    if (f < h)
      b[f] += b[f + h];
    barrier(1);
  }

  if (f == 0)
    c[get_group_id(0)] = b[0];
}