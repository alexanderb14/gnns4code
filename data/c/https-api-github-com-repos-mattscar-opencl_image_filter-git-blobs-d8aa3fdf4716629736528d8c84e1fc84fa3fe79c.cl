__kernel void A(__global int* a, __global int* b, int c, int d) {
  int e, f, g, h;
  int i = get_global_id(0) / c;
  int j = get_global_id(0) - i * c;
  int4 k[3], l;

  int4 m = (int4)(-1, -1, 0, 0);
  int4 n = (int4)(-1, 0, 1, 0);
  int4 o = (int4)(0, 1, 1, 0);

  int p = 1;

  if ((i > 0) && (j > 0) && (j < c - 2) && (i < d - 1)) {
    e = (i - 1) * c + (j - 1);
    k[0] = vload4(0, a + e);
    k[1] = vload4(0, a + e + c);
    k[2] = vload4(0, a + e + 2 * c);

    l = ((k[0] & 0x00ff0000) >> 16) * m + ((k[1] & 0x00ff0000) >> 16) * n + ((k[2] & 0x00ff0000) >> 16) * o;
    f = clamp((l.s0 + l.s1 + l.s2) / p, 0, 255);

    l = ((k[0] & 0x0000ff00) >> 8) * m + ((k[1] & 0x0000ff00) >> 8) * n + ((k[2] & 0x0000ff00) >> 8) * o;
    g = clamp((l.s0 + l.s1 + l.s2) / p, 0, 255);

    l = (k[0] & 0x000000ff) * m + (k[1] & 0x000000ff) * n + (k[2] & 0x000000ff) * o;
    h = clamp((l.s0 + l.s1 + l.s2) / p, 0, 255);

    b[get_global_id(0)] = 0xff000000 + (f << 16) + (g << 8) + h;
  } else {
    b[get_global_id(0)] = a[get_global_id(0)];
  }
}