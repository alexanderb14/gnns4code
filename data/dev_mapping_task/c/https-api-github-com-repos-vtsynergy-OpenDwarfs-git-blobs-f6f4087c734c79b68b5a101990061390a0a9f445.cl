inline int A(unsigned int a) {
  int b = 0;
  b |= (a & 0xaaaaaaaa) ? 1 : 0;
  b |= (a & 0xcccccccc) ? 2 : 0;
  b |= (a & 0xf0f0f0f0) ? 4 : 0;
  b |= (a & 0xff00ff00) ? 8 : 0;
  b |= (a & 0xffff0000) ? 16 : 0;
  return b;
}
__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void B(int a, int b, int c, int d, __global uint* e, __global uint* f, __constant uint* g)

{
  int h = get_global_id(0);
  int i = get_local_id(0);

  int j[32];

  uint k;
  uint l[12];

  uint m = 0;
  uint n = 0;
  int o;
  int p;

  uint q = e[h];
  uint r = e[h + d];
  uint s = e[h + d * 2];
  uint t = e[h + d * 3];
  uint u = (1 << a) - 1;
  uint v = 0;
  uint w = 0;

  f[h + d * 2] = e[h];

  for (p = 0; p < a - b; p++) {
    j[p] = A(e[h + d * (4 + p)]);
  }
  o = 0;

  k = q | r | s | g[0];
  l[0] = ((k + 1) & ~k);

  for (;;) {
    if (o >= 0) {
      if ((l[o] & u) != 0) {
        q |= l[o];
        v = (v << 1) | (r >> 31);
        r = (r | l[o]) << 1;
        w = (w >> 1) | (s << 31);
        s = (s | l[o]) >> 1;
        k = q | r | s | g[o + 1];
        l[o + 1] = ((k + 1) & ~k);
        o++;
      } else {
        if (o == b) {
          int x = 8;
          bool y = true;

          bool z = (((t) < a - b ? e[h + d * (4 + (t))] : l[(t)-a + b]) == (1 << (a - 1)));
          bool aa = (((a - t - 1) < a - b ? e[h + d * (4 + (a - t - 1))] : l[(a - t - 1) - a + b]) == 1);
          bool ab = (l[b - 1] == (1 << (a - t - 1)));

          if (z || aa || ab) {
            for (p = 0; p < b; p++) {
              j[p + a - b] = A(l[p]);
            }

            int ac = a;
            int ad = 0;

            if (z) {
              y = true;
              ad = 0;
              for (p = 0; p < a; p++) {
                int ae = a - j[p] - 1;
                bool af = (j[ae] != p);
                y = y && !af;
                af = af && (ac > ae);
                ad = af ? j[ae] - p : ad;
                ac = af ? ae : ac;
              }

              x = y ? 2 : x;
            }

            if (ad >= 0 && aa) {
              y = true;
              ac = a;
              ad = 0;
              for (p = 0; p < a; p++) {
                int ae = j[p];
                bool af = (j[ae] != a - p - 1);
                y = y && !af;
                af = af && (ac > ae);
                ad = af ? j[ae] - (a - p - 1) : ad;
                ac = af ? ae : ac;
              }

              x = y ? 2 : x;
            }

            if (ad >= 0 && x == 8 && ab) {
              y = true;
              ac = a;
              ad = 0;
              for (p = a - 1; p >= a / 2; p--) {
                if (j[a - p - 1] != a - j[p] - 1) {
                  y = false;
                  ad = j[a - p - 1] - (a - j[p] - 1);
                  break;
                }
              }
              x = y ? 4 : x;
            }

            m += (ad >= 0) ? x : 0;
            n += (ad >= 0) ? 1 : 0;

          } else {
            m += 8;
            n++;
          }
        }

        o--;
        if (o >= 0) {
          q &= ~l[o];
          r = ((r >> 1) | (v << 31)) & ~l[o];
          v >>= 1;
          s = ((s << 1) | (w >> 31)) & ~l[o];
          w <<= 1;
          k = q | r | s | l[o] | g[o];
          l[o] = ((k + l[o]) & ~k);
        }
      }
    } else {
      f[h] = m;
      f[h + d] = n;
      f[h + d * 3] = e[h];
      break;
    }
  }
}

__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void C(int a, int b, int c, int d, __global uint* e, __global uint* f, __constant uint* g)

{
  int h = get_global_id(0);
  int i = get_local_id(0);

  uint j;
  uint k[12];

  uint l = e[h];
  uint m = e[h + d];
  uint n = e[h + d * 2];
  int o = e[h + d * 3];
  uint p = (1 << a) - 1;
  uint q = 0;
  uint r = 0;
  uint s = 0;
  int t = 0;

  j = l | m | n | (t < o ? 2 : 0);
  k[0] = ((j + 1) & ~j);

  f[h + d * 2] = e[h];

  for (;;) {
    if (t >= 0) {
      if ((k[t] & p) != 0) {
        l |= k[t];
        q = (q << 1) | (m >> 31);
        m = (m | k[t]) << 1;
        r = (r >> 1) | (n << 31);
        n = (n | k[t]) >> 1;
        j = l | m | n | (t + 1 < o ? 2 : 0);
        k[t + 1] = ((j + 1) & ~j);
        t++;
      } else {
        if (t == b) {
          s++;
        }

        t--;
        if (t >= 0) {
          l &= ~k[t];
          m = ((m >> 1) | (q << 31)) & ~k[t];
          q >>= 1;
          n = ((n << 1) | (r >> 31)) & ~k[t];
          r <<= 1;
          j = l | m | n | k[t] | (t < o ? 2 : 0);
          k[t] = ((j + k[t]) & ~j);
        }
      }
    } else {
      f[h] = s * 8;
      f[h + d] = s;
      f[h + d * 3] = e[h];
      break;
    }
  }
}