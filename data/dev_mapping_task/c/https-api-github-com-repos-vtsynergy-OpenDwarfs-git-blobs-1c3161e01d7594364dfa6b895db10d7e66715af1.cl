__kernel void A(__global float* a, __global float* b, int c, int d) {
  int e = get_local_id(0) + get_local_size(0) * get_group_id(0);
  int f;

  if (e < c) {
    for (f = 0; f < d; f++)
      b[e + c * f] = a[e * d + f];
  }
  return;
}
__kernel void B(__global float* a, __global float* b, int c, int d, int e, __global int* f, __constant float* g

                ) {
  const unsigned int h = get_num_groups(0) * get_group_id(1) + get_group_id(0);

  const unsigned int i = h * get_local_size(0) * get_local_size(1) + get_local_id(0);

  int j = -1;

  if (i < d) {
    int k, l;
    float m = 0x1.fffffep127f;
    float n;

    for (k = 0; k < e; k++) {
      int o = k * c;
      float p = 0.0;

      for (l = 0; l < c; l++) {
        int q = i + l * d;
        float r = (a[q] - g[o + l]);
        p += r * r;
      }
      n = p;

      if (n < m) {
        m = n;
        j = k;
      }
    }
  }
  if (i < d) {
    f[i] = j;
  }
}