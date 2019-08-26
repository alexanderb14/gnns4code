__kernel void A(__global float8* a, __global float* b, int c, __local float* d, __global double* e, __global int* f, float g, float h) {
  const int i = 8;
  const int j = get_group_id(0);
  const int k = get_local_id(0) * i;

  const int l = get_global_id(0);
  float8 m = a[l];

  float n = m.s0 + m.s1 + m.s2 + m.s3 + m.s4 + m.s5 + m.s6 + m.s7;

  float o = m.s0 * (1 + k - h) + m.s1 * (2 + k - h) + m.s2 * (3 + k - h) + m.s3 * (4 + k - h) + m.s4 * (5 + k - h) + m.s5 * (6 + k - h) + m.s6 * (7 + k - h) + m.s7 * (8 + k - h);

  float p = m.s0 * (1 + k - h) * (1 + k - h) + m.s1 * (2 + k - h) * (2 + k - h) + m.s2 * (3 + k - h) * (3 + k - h) + m.s3 * (4 + k - h) * (4 + k - h) + m.s4 * (5 + k - h) * (5 + k - h) + m.s5 * (6 + k - h) * (6 + k - h) + m.s6 * (7 + k - h) * (7 + k - h) + m.s7 * (8 + k - h) * (8 + k - h);

  float q = m.s0 * (1 + k - h) * (1 + k - h) * (1 + k - h) + m.s1 * (2 + k - h) * (2 + k - h) * (2 + k - h) + m.s2 * (3 + k - h) * (3 + k - h) * (3 + k - h) + m.s3 * (4 + k - h) * (4 + k - h) * (4 + k - h) + m.s4 * (5 + k - h) * (5 + k - h) * (5 + k - h) + m.s5 * (6 + k - h) * (6 + k - h) * (6 + k - h) + m.s6 * (7 + k - h) * (7 + k - h) * (7 + k - h) + m.s7 * (8 + k - h) * (8 + k - h) * (8 + k - h);

  d[get_local_id(0) + get_local_size(0) * 0] = n;
  d[get_local_id(0) + get_local_size(0) * 1] = o;
  d[get_local_id(0) + get_local_size(0) * 2] = p;
  d[get_local_id(0) + get_local_size(0) * 3] = q;

  barrier(1);
  float r = 0;
  float s = 0, t = 0, u = 0, v = 0;

  if (get_local_id(0) == 0) {
    for (int w = 0; w < get_local_size(0); w++) {
      s += d[w + get_local_size(0) * 0];
      t += d[w + get_local_size(0) * 1];
      u += d[w + get_local_size(0) * 2];
      v += d[w + get_local_size(0) * 3];
    }

    b[0 + 4 * j] = s;
    b[1 + 4 * j] = t;
    b[2 + 4 * j] = u;
    b[3 + 4 * j] = v;

    atomic_sub(f, 1);

    if (0 == *f) {
      const int x = get_global_size(0) / get_local_size(0);
      const int y = 4;
      float z = 0.0, aa = 0.0, ab = 0, ac = 0, ad = 0, ae = 0, af = 0;

      for (int w = 0; w < x; w++) {
        ad += b[2 + w * y];
        ac += b[3 + w * y];
        z += (w + 1 - g) * b[1 + w * y];
        aa += (w + 1 - g) * b[2 + w * y];
        af += (w + 1 - g) * (w + 1 - g) * b[1 + w * y];
        ae += (w + 1 - g) * (w + 1 - g) * b[0 + w * y];
        ab += (w + 1 - g) * (w + 1 - g) * (w + 1 - g) * b[0 + w * y];
      }

      e[0] = ad;
      e[1] = ac;
      e[2] = z;
      e[3] = aa;
      e[4] = ae;
      e[5] = af;
      e[6] = ab;
    }
  }
}