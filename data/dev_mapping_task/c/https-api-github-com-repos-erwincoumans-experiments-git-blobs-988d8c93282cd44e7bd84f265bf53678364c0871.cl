typedef unsigned int u32; typedef unsigned short u16; typedef unsigned char u8; typedef struct {
  float4 m_worldPos[4];
  float4 m_worldNormal;
  u32 m_coeffs;
  int m_batchIdx;

  int m_bodyA;
  int m_bodyB;
} Contact4;

typedef struct {
  int m_n;
  int m_start;
  int m_staticIdx;
  int m_paddings[1];
} ConstBuffer;

typedef struct {
  int m_a;
  int m_b;
  u32 m_idx;
} Elem;
u32 A(__local u32* a, int b) {
  b = b % (32 * (64));
  int c = b % 32;
  int d = b / 32;
  return a[d] & (1 << c);
}

void B(__local u32* a, int b) {
  b = b % (32 * (64));
  int c = b % 32;
  int d = b / 32;

  atom_or(&a[d], (1 << c));
}

u32 C(__local u32* a, int b) {
  b = b % (32 * (64));
  int c = b % 32;
  int d = b / 32;
  u32 e = (u32)atom_or(&a[d], (1 << c));
  return ((e >> c) & 1) == 0;
}

__kernel void D(__global const Contact4* a, __global Contact4* b, __global const u32* c, __global const u32* d, int e) {
  __local u32 f[(64 * 10)];
  __local u32 g;
  __local Elem h[1024];
  __local u32 i;
  __local u32 j;
  __local u32 k[(64)];
  __local u32 l[(64)];
  __local u32 m;
  __local u32 n;

  int o = get_group_id(0);
  int p = get_local_id(0);

  const int q = c[o];
  const int r = d[o];

  if (p == 0) {
    i = 0;
    m = 0;
    g = 0;
    n = r;
  }

  for (int s = 0; s < 50; s++) {
    l[p] = 0;

    for (int t = 0; t < 4; t++) {
      int u = (1024 - i);

      if (m < q) {
        while (u > 64) {
          if (m >= q)
            break;
          if (p < u - 64) {
            int v;
            v = atom_inc(&(m));
            if (v < q) {
              int w;
              w = atom_inc(&(i));

              int x = a[r + v].m_bodyA;
              int y = a[r + v].m_bodyB;
              h[w].m_a = (x > y) ? y : x;
              h[w].m_b = (x > y) ? x : y;
              h[w].m_idx = v;
            }
          }
          u = (1024 - i);
        }
      }

      barrier(1);

      __local Elem* z = h;
      if (p == 0)
        j = 0;

      int v = p;
      int aa = i;

      {
        for (int ab = 0; ab < aa; ab += 64, v += 64) {
          Elem ac;
          if (v < aa)
            ac = h[v];
          bool ad = (v < aa) ? false : true;

          for (int ae = p; ae < (64); ae += 64)
            k[p] = 0;

          if (!ad) {
            int af = A(l, abs(ac.m_a));
            int ag = A(l, abs(ac.m_b));

            if (af == 0 && ag == 0) {
              int ah;
              int ai;
              int aj = abs(ac.m_a);
              int ak = abs(ac.m_b);

              ah = C(k, aj);
              ai = C(k, ak);

              ah = (ac.m_a < 0) ? 1 : ah;
              ai = (ac.m_b < 0) ? 1 : ai;

              ah = (ac.m_a == e) ? 1 : ah;
              ai = (ac.m_b == e) ? 1 : ai;

              bool al = (ah && ai);
              if (al) {
                B(l, aj);
                B(l, ak);
              }
              ad = al;
            }
          }

          if (v < aa) {
            if (ad) {
              int w;
              w = atom_inc(&(g));
              if (w < (64 * 10))
                f[w] = ac.m_idx;
              else {
                ad = false;
                atom_add(&(g), -1);
              }
            }
            if (!ad) {
              int w;
              w = atom_inc(&(j));
              z[w] = ac;
            }
          }

          if (g == (64 * 10)) {
            for (int ae = p; ae < (64 * 10); ae += 64) {
              int am = r + f[ae];
              int w;
              w = atom_inc(&(n));
              b[w] = a[am];
              b[w].m_batchIdx = s;
            }
            if (p == 0)
              g = 0;

            l[p] = 0;
          }
        }
      }

      if (p == 0)
        i = j;
    }

    barrier(1);

    for (int ae = p; ae < g; ae += 64) {
      int am = r + f[ae];
      int w;
      w = atom_inc(&(n));
      b[w] = a[am];
      b[w].m_batchIdx = s;
    }

    if (g == 0) {
      for (int ae = p; ae < i; ae += 64) {
        int am = r + h[ae].m_idx;
        int w;
        w = atom_inc(&(n));
        b[w] = a[am];
        b[w].m_batchIdx = 100 + ae;
      }
      barrier(1);
      if (p == 0)
        i = 0;
    }

    if (p == 0)
      g = 0;

    barrier(1);

    if (m == q && i == 0)
      break;
  }
}