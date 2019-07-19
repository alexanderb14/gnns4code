__kernel void A(const __global uint* a, __global uint* b, const __global uint* c, __local uint* d, uint e) {
  uint f = get_local_id(0);
  uint g = get_global_id(0);
  uint h = get_global_size(0);
  uint i, j, k, l, m, n, o, p;
  uint q, r, s, t, u, v, w, x;
  __private uint y[64];
  uint z = 64 / get_local_size(0);
  if (z == 0)
    z = 1;

  b += g * 8;

  if (f < 64) {
    uint aa = z * f;
    for (uint ab = 0; ab < z; ab++)
      d[aa + ab] = c[aa + ab];
  }
  barrier(1);
  i = b[0];
  j = b[1];
  k = b[2];
  l = b[3];
  m = b[4];
  n = b[5];
  o = b[6];
  p = b[7];

  for (uint ab = 0; ab < e; ab++) {
    for (uint ac = 0; ac < 16; ac++) {
      uint ad = a[(h * ab + g) * 16 + ac];
      y[ac] = (ad >> 24) | ((ad >> 8) & 0xff00) | ((ad << 8) & 0xff0000) | (ad << 24);
    }
    for (uint ac = 16; ac < 64; ac++) {
      uint ae = y[ac - 15];
      ae = (((ae >> 7) | (ae << 25)) ^ ((ae >> 18) | (ae << 14)) ^ (ae >> 3));
      uint af = y[ac - 2];
      af = (((af >> 17) | (af << 15)) ^ ((af >> 19) | (af << 13)) ^ (af >> 10));
      y[ac] = af + y[ac - 7] + ae + y[ac - 16];
    }
    q = i;
    r = j;
    s = k;
    t = l;
    u = m;
    v = n;
    w = o;
    x = p;
    for (uint ac = 0; ac < 64; ac++) {
      uint ae = x + (((u >> 6) | (u << 26)) ^ ((u >> 11) | (u << 21)) ^ ((u >> 25) | (u << 7))) + ((u & v) ^ (~u & w)) + d[ac] + y[ac];
      uint af = (((q >> 2) | (q << 30)) ^ ((q >> 13) | (q << 19)) ^ ((q >> 22) | (q << 10)));
      af = af + ((q & r) ^ (q & s) ^ (r & s));
      x = w;
      w = v;
      v = u;
      u = t + ae;
      t = s;
      s = r;
      r = q;
      q = ae + af;
    }
    i += q;
    j += r;
    k += s;
    l += t;
    m += u;
    n += v;
    o += w;
    p += x;
  }

  b[0] = i;
  b[1] = j;
  b[2] = k;
  b[3] = l;
  b[4] = m;
  b[5] = n;
  b[6] = o;
  b[7] = p;
}