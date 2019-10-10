__kernel void A(__global float* a, __global float* b, int c, int d, int e, int f) {
  int g = get_global_id(0);
  int h = g / (d * e * f);
  if (h < c) {
    int i = g - h * (d * e * f);
    b[i * c + h] = a[g];
  }
}

__kernel void B(__global float* a, __global float* b, int c, int d, int e, int f) {
  int g = get_global_id(0);
  int h = g / (d * e * f);
  if (h < c) {
    int i = g - h * (d * e * f);
    b[g] = a[i * c + h];
  }
}
__kernel void C(__global float* a, __global float* b, __global float* c, __global float* d, int e, int f, int g, int h, int i, int j, int k, int l, int m, int n, int o, int p, int q, int r, int s, int t, int u, int v, int w, int x) {
  int y = get_group_id(0);
  int z = y / (n * o * p);
  int aa = y - z * (n * o * p);
  int ab = aa / (o * p);
  int ac = aa - ab * (o * p);
  int ad = ac / (p);
  int ae = ac - ad * (p);

  int af = get_local_id(0);
  int ag = af & 15;
  int ah = (af & 0x70) >> 4;
  int ai = ah - (f & 7 ? 8 - (f & 7) : 0);
  z = (z << r) + ((af & q) >> s);
  ab = (ab << u) + ((af & t) >> v);
  int aj = (z << 1) - l, ak = (ab << 1) - l;
  int al = ((get_group_id(2) * o + ad) << x) + (af & w);
  int am = ((get_group_id(1) * p + ae) << 4) + ag;

  __local float an[2 * 8 * 16 * 16];
  __local float* ao = an + (af & 0xf0) + (af & 0x3);
  __local float* ap = an + 8 * 16 * 16 + (af & 0xf0) + ((af & 0xc) >> 2);

  float aq[4][4], ar[4], as[4];
  for (int at = 0; at < 4; ++at) {
    for (int au = 0; au < 4; ++au) {
      aq[at][au] = 0;
    }
  }

  if (af < 128) {
    float av[4][4], aw[4][4], ax[4][4];

    bool ay[4][4];
    for (int at = 0; at < 4; ++at) {
      for (int au = 0; au < 4; ++au) {
        ay[at][au] = al < e && 0 <= aj + at && aj + at < g && 0 <= ak + au && ak + au < h;
      }
    }

    __global float* az = a + ((ai * g + aj) * h + ak) * e + al;
    for (int at = 0; at < 4; ++at) {
      for (int au = 0; au < 4; ++au) {
        av[at][au] = ai >= 0 && ay[at][au] ? az[(at * h + au) * e] : 0;
      }
    }

    __local float* ba = an + ah * 16 * 16 + ag;
    while (true) {
      aw[0][0] = av[0][0] - av[2][0];
      aw[0][1] = av[0][1] - av[2][1];
      aw[0][2] = av[0][2] - av[2][2];
      aw[0][3] = av[0][3] - av[2][3];

      aw[3][0] = av[1][0] - av[3][0];
      aw[3][1] = av[1][1] - av[3][1];
      aw[3][2] = av[1][2] - av[3][2];
      aw[3][3] = av[1][3] - av[3][3];

      aw[1][0] = av[1][0] + av[2][0];
      aw[1][1] = av[1][1] + av[2][1];
      aw[1][2] = av[1][2] + av[2][2];
      aw[1][3] = av[1][3] + av[2][3];

      aw[2][0] = av[2][0] - av[1][0];
      aw[2][1] = av[2][1] - av[1][1];
      aw[2][2] = av[2][2] - av[1][2];
      aw[2][3] = av[2][3] - av[1][3];

      ax[0][0] = aw[0][0] - aw[0][2];
      ax[0][3] = aw[0][1] - aw[0][3];
      ax[3][0] = aw[3][0] - aw[3][2];
      ax[3][3] = aw[3][1] - aw[3][3];

      ax[1][0] = aw[1][0] - aw[1][2];
      ax[2][0] = aw[2][0] - aw[2][2];
      ax[1][3] = aw[1][1] - aw[1][3];
      ax[2][3] = aw[2][1] - aw[2][3];

      ax[2][1] = aw[2][1] + aw[2][2];
      ax[2][2] = aw[2][2] - aw[2][1];

      ax[0][1] = aw[0][1] + aw[0][2];
      ax[0][2] = aw[0][2] - aw[0][1];
      ax[1][1] = aw[1][1] + aw[1][2];
      ax[1][2] = aw[1][2] - aw[1][1];
      ax[3][1] = aw[3][1] + aw[3][2];
      ax[3][2] = aw[3][2] - aw[3][1];

      for (int at = 0; at < 4; ++at) {
        for (int au = 0; au < 4; ++au) {
          ba[(at * 4 + au) * 16] = ax[at][au];
        }
      }

      barrier(1);

      for (int bb = 0; bb < 8; ++bb) {
        for (int at = 0; at < 4; ++at) {
          ar[at] = ap[bb * 16 * 16 + at * 4];
          as[at] = ao[bb * 16 * 16 + at * 4];
        }
        for (int at = 0; at < 4; ++at) {
          for (int au = 0; au < 4; ++au) {
            aq[at][au] += ar[at] * as[au];
          }
        }
      }

      barrier(1);

      ai += 8;
      if (ai >= f)
        break;
      az += 8 * g * h * e;

      for (int at = 0; at < 4; ++at) {
        for (int au = 0; au < 4; ++au) {
          av[at][au] = ay[at][au] ? az[(at * h + au) * e] : 0;
        }
      }
    }
  } else {
    float bc[3][3], bd[4][3], be[3], bf[4], bg[4][4];

    bool bh = am < i;

    __global float* bi = c + ai * 3 * 3 * i + am;
    for (int at = 0; at < 3; ++at) {
      for (int au = 0; au < 3; ++au) {
        bc[at][au] = ai >= 0 && bh ? bi[(at * 3 + au) * i] : 0;
      }
    }

    __local float* bj = an + (ah + 8) * 16 * 16 + ag;
    while (true) {
      be[0] = (bc[0][0] + bc[2][0]) * 0.5;
      be[1] = (bc[0][1] + bc[2][1]) * 0.5;
      be[2] = (bc[0][2] + bc[2][2]) * 0.5;
      bd[0][0] = bc[0][0];
      bd[0][1] = bc[0][1];
      bd[0][2] = bc[0][2];
      bd[3][0] = bc[2][0];
      bd[3][1] = bc[2][1];
      bd[3][2] = bc[2][2];
      bd[1][0] = be[0] + bc[1][0] * 0.5;
      bd[2][0] = be[0] - bc[1][0] * 0.5;
      bd[1][1] = be[1] + bc[1][1] * 0.5;
      bd[2][1] = be[1] - bc[1][1] * 0.5;
      bd[1][2] = be[2] + bc[1][2] * 0.5;
      bd[2][2] = be[2] - bc[1][2] * 0.5;
      bf[0] = (bd[0][0] + bd[0][2]) * 0.5;
      bf[1] = (bd[1][0] + bd[1][2]) * 0.5;
      bf[2] = (bd[2][0] + bd[2][2]) * 0.5;
      bf[3] = (bd[3][0] + bd[3][2]) * 0.5;
      bg[0][0] = bd[0][0];
      bg[0][3] = bd[0][2];
      bg[3][0] = bd[3][0];
      bg[3][3] = bd[3][2];
      bg[1][0] = bd[1][0];
      bg[2][0] = bd[2][0];
      bg[1][3] = bd[1][2];
      bg[2][3] = bd[2][2];
      bg[1][1] = bf[1] + bd[1][1] * 0.5;
      bg[1][2] = bf[1] - bd[1][1] * 0.5;
      bg[2][1] = bf[2] + bd[2][1] * 0.5;
      bg[2][2] = bf[2] - bd[2][1] * 0.5;
      bg[0][1] = bf[0] + bd[0][1] * 0.5;
      bg[0][2] = bf[0] - bd[0][1] * 0.5;
      bg[3][1] = bf[3] + bd[3][1] * 0.5;
      bg[3][2] = bf[3] - bd[3][1] * 0.5;

      for (int at = 0; at < 4; ++at) {
        for (int au = 0; au < 4; ++au) {
          bj[(at * 4 + au) * 16] = bg[at][au];
        }
      }

      barrier(1);

      for (int bb = 0; bb < 8; ++bb) {
        for (int at = 0; at < 4; ++at) {
          ar[at] = ap[bb * 16 * 16 + at * 4];
          as[at] = ao[bb * 16 * 16 + at * 4];
        }
        for (int at = 0; at < 4; ++at) {
          for (int au = 0; au < 4; ++au) {
            aq[at][au] += ar[at] * as[au];
          }
        }
      }

      barrier(1);

      ai += 8;
      if (ai >= f)
        break;
      bi += 8 * 3 * 3 * i;

      for (int at = 0; at < 3; ++at) {
        for (int au = 0; au < 3; ++au) {
          bc[at][au] = bh ? bi[(at * 3 + au) * i] : 0;
        }
      }
    }
  }

  {
    __local float* bk = an + ((af & 0x0c) << 6) + ((af & 0xf0) << 0) + (af & 0x03);
    __local float* bl = an + ((af & 0xf0) << 4) + ag;
    int bm = aj + l, bn = ak + l, bo = al;
    int bp = am - ag + ((af & 0xf0) >> 4);
    __global float* bq = b + ((bp * j + bm) * k + bn) * e + bo;

    bool ay[2][2];
    for (int at = 0; at < 2; ++at) {
      for (int au = 0; au < 2; ++au) {
        ay[at][au] = bo < e && 0 <= bm + at && bm + at < j && 0 <= bn + au && bn + au < k;
      }
    }

    {
      for (int at = 0; at < 4; ++at) {
        for (int au = 0; au < 4; ++au) {
          bk[(at << 10) + (au << 2)] = aq[at][au];
        }
      }

      barrier(1);

      float br[4][4], bs[4][2], bt[2][2];
      for (int at = 0; at < 4; ++at) {
        for (int au = 0; au < 4; ++au) {
          br[at][au] = bl[(at * 4 + au) * 16];
        }
      }

      barrier(1);

      bs[0][0] = br[0][0] + br[0][1] + br[0][2];
      bs[0][1] = br[0][1] - br[0][2] - br[0][3];
      bs[1][0] = br[1][0] + br[1][1] + br[1][2];
      bs[1][1] = br[1][1] - br[1][2] - br[1][3];
      bs[2][0] = br[2][0] + br[2][1] + br[2][2];
      bs[2][1] = br[2][1] - br[2][2] - br[2][3];
      bs[3][0] = br[3][0] + br[3][1] + br[3][2];
      bs[3][1] = br[3][1] - br[3][2] - br[3][3];

      bt[0][0] = bs[0][0] + bs[1][0] + bs[2][0];
      bt[0][1] = bs[0][1] + bs[1][1] + bs[2][1];
      bt[1][0] = bs[1][0] - bs[2][0] - bs[3][0];
      bt[1][1] = bs[1][1] - bs[2][1] - bs[3][1];

      for (int at = 0; at < 2; ++at) {
        for (int au = 0; au < 2; ++au) {
          if (bp < i && ay[at][au]) {
            bq[(at * k + au) * e] = bt[at][au] + d[bp];
          }
        }
      }
    }
  }
}
__kernel void D(__global float* a, __global float* b, __global float* c, __global float* d, int e, int f, int g, int h, int i, int j, int k, int l, int m, int n, int o, int p, int q, int r, int s, int t, int u, int v, int w, int x) {
  int y = get_group_id(0);
  int z = y / (n * o * p);
  int aa = y - z * (n * o * p);
  int ab = aa / (o * p);
  int ac = aa - ab * (o * p);
  int ad = ac / (p);
  int ae = ac - ad * (p);

  int af = get_local_id(0);
  int ag = af & 31;
  int ah = (af & 0x60) >> 5;
  int ai = ah - (f & 3 ? 4 - (f & 3) : 0);
  z = (z << r) + ((af & q) >> s);
  ab = (ab << u) + ((af & t) >> v);
  int aj = (z << 1) - l, ak = (ab << 1) - l;
  int al = ((get_group_id(2) * o + ad) << x) + (af & w);
  int am = ((get_group_id(1) * p + ae) << 5) + ag;

  __local float an[8 * 16 * 32];
  __local float* ao = an + ((af & 0xf0) << 1) + (af & 0x3);
  __local float* ap = an + 4 * 16 * 32 + ((af & 0xf0) << 1) + ((af & 0xc) >> 2);

  float aq[8][8], ar[8], as[8];
  for (int at = 0; at < 8; ++at) {
    for (int au = 0; au < 8; ++au) {
      aq[at][au] = 0;
    }
  }

  if (af < 128) {
    float av[4][4], aw[4][4], ax[4][4];

    bool ay[4][4];
    for (int at = 0; at < 4; ++at) {
      for (int au = 0; au < 4; ++au) {
        ay[at][au] = al < e && 0 <= aj + at && aj + at < g && 0 <= ak + au && ak + au < h;
      }
    }

    __global float* az = a + ((ai * g + aj) * h + ak) * e + al;
    for (int at = 0; at < 4; ++at) {
      for (int au = 0; au < 4; ++au) {
        av[at][au] = ai >= 0 && ay[at][au] ? az[(at * h + au) * e] : 0;
      }
    }

    __local float* ba = an + ah * 16 * 32 + ag;
    while (true) {
      aw[0][0] = av[0][0] - av[2][0];
      aw[0][1] = av[0][1] - av[2][1];
      aw[0][2] = av[0][2] - av[2][2];
      aw[0][3] = av[0][3] - av[2][3];

      aw[3][0] = av[1][0] - av[3][0];
      aw[3][1] = av[1][1] - av[3][1];
      aw[3][2] = av[1][2] - av[3][2];
      aw[3][3] = av[1][3] - av[3][3];

      aw[1][0] = av[1][0] + av[2][0];
      aw[1][1] = av[1][1] + av[2][1];
      aw[1][2] = av[1][2] + av[2][2];
      aw[1][3] = av[1][3] + av[2][3];

      aw[2][0] = av[2][0] - av[1][0];
      aw[2][1] = av[2][1] - av[1][1];
      aw[2][2] = av[2][2] - av[1][2];
      aw[2][3] = av[2][3] - av[1][3];

      ax[0][0] = aw[0][0] - aw[0][2];
      ax[0][3] = aw[0][1] - aw[0][3];
      ax[3][0] = aw[3][0] - aw[3][2];
      ax[3][3] = aw[3][1] - aw[3][3];

      ax[1][0] = aw[1][0] - aw[1][2];
      ax[2][0] = aw[2][0] - aw[2][2];
      ax[1][3] = aw[1][1] - aw[1][3];
      ax[2][3] = aw[2][1] - aw[2][3];

      ax[2][1] = aw[2][1] + aw[2][2];
      ax[2][2] = aw[2][2] - aw[2][1];

      ax[0][1] = aw[0][1] + aw[0][2];
      ax[0][2] = aw[0][2] - aw[0][1];
      ax[1][1] = aw[1][1] + aw[1][2];
      ax[1][2] = aw[1][2] - aw[1][1];
      ax[3][1] = aw[3][1] + aw[3][2];
      ax[3][2] = aw[3][2] - aw[3][1];

      for (int at = 0; at < 4; ++at) {
        for (int au = 0; au < 4; ++au) {
          ba[(at * 4 + au) * 32] = ax[at][au];
        }
      }

      barrier(1);

      for (int bb = 0; bb < 4; ++bb) {
        for (int at = 0; at < 8; ++at) {
          ar[at] = ap[bb * 512 + at * 4];
          as[at] = ao[bb * 512 + at * 4];
        }
        for (int at = 0; at < 8; ++at) {
          for (int au = 0; au < 8; ++au) {
            aq[at][au] += ar[at] * as[au];
          }
        }
      }

      barrier(1);

      ai += 4;
      if (ai >= f)
        break;
      az += 4 * g * h * e;

      for (int at = 0; at < 4; ++at) {
        for (int au = 0; au < 4; ++au) {
          av[at][au] = ay[at][au] ? az[(at * h + au) * e] : 0;
        }
      }
    }
  } else {
    float bc[3][3], bd[4][3], be[3], bf[4], bg[4][4];

    bool bh = am < i;

    __global float* bi = c + ai * 3 * 3 * i + am;
    for (int at = 0; at < 3; ++at) {
      for (int au = 0; au < 3; ++au) {
        bc[at][au] = ai >= 0 && bh ? bi[(at * 3 + au) * i] : 0;
      }
    }

    __local float* bj = an + (ah + 4) * 16 * 32 + ag;
    while (true) {
      be[0] = (bc[0][0] + bc[2][0]) * 0.5;
      be[1] = (bc[0][1] + bc[2][1]) * 0.5;
      be[2] = (bc[0][2] + bc[2][2]) * 0.5;
      bd[0][0] = bc[0][0];
      bd[0][1] = bc[0][1];
      bd[0][2] = bc[0][2];
      bd[3][0] = bc[2][0];
      bd[3][1] = bc[2][1];
      bd[3][2] = bc[2][2];
      bd[1][0] = be[0] + bc[1][0] * 0.5;
      bd[2][0] = be[0] - bc[1][0] * 0.5;
      bd[1][1] = be[1] + bc[1][1] * 0.5;
      bd[2][1] = be[1] - bc[1][1] * 0.5;
      bd[1][2] = be[2] + bc[1][2] * 0.5;
      bd[2][2] = be[2] - bc[1][2] * 0.5;
      bf[0] = (bd[0][0] + bd[0][2]) * 0.5;
      bf[1] = (bd[1][0] + bd[1][2]) * 0.5;
      bf[2] = (bd[2][0] + bd[2][2]) * 0.5;
      bf[3] = (bd[3][0] + bd[3][2]) * 0.5;
      bg[0][0] = bd[0][0];
      bg[0][3] = bd[0][2];
      bg[3][0] = bd[3][0];
      bg[3][3] = bd[3][2];
      bg[1][0] = bd[1][0];
      bg[2][0] = bd[2][0];
      bg[1][3] = bd[1][2];
      bg[2][3] = bd[2][2];
      bg[1][1] = bf[1] + bd[1][1] * 0.5;
      bg[1][2] = bf[1] - bd[1][1] * 0.5;
      bg[2][1] = bf[2] + bd[2][1] * 0.5;
      bg[2][2] = bf[2] - bd[2][1] * 0.5;
      bg[0][1] = bf[0] + bd[0][1] * 0.5;
      bg[0][2] = bf[0] - bd[0][1] * 0.5;
      bg[3][1] = bf[3] + bd[3][1] * 0.5;
      bg[3][2] = bf[3] - bd[3][1] * 0.5;

      for (int at = 0; at < 4; ++at) {
        for (int au = 0; au < 4; ++au) {
          bj[(at * 4 + au) * 32] = bg[at][au];
        }
      }

      barrier(1);

      for (int bb = 0; bb < 4; ++bb) {
        for (int at = 0; at < 8; ++at) {
          ar[at] = ap[bb * 512 + at * 4];
          as[at] = ao[bb * 512 + at * 4];
        }
        for (int at = 0; at < 8; ++at) {
          for (int au = 0; au < 8; ++au) {
            aq[at][au] += ar[at] * as[au];
          }
        }
      }

      barrier(1);

      ai += 4;
      if (ai >= f)
        break;
      bi += 4 * 3 * 3 * i;

      for (int at = 0; at < 3; ++at) {
        for (int au = 0; au < 3; ++au) {
          bc[at][au] = bh ? bi[(at * 3 + au) * i] : 0;
        }
      }
    }
  }

  {
    __local float* bk = an + ((af & 0x0c) << 7) + ((af & 0xf0) << 1) + (af & 0x03);
    __local float* bl = an + ((af & 0xe0) << 4) + ag;
    int bm = aj + l, bn = ak + l, bo = al;
    int bp = am - ag + ((af & 0xe0) >> 5);
    __global float* bq = b + ((bp * j + bm) * k + bn) * e + bo;

    bool ay[2][2];
    for (int at = 0; at < 2; ++at) {
      for (int au = 0; au < 2; ++au) {
        ay[at][au] = bo < e && 0 <= bm + at && bm + at < j && 0 <= bn + au && bn + au < k;
      }
    }

    for (int bb = 0; bb < 4; ++bb) {
      for (int at = 0; at < 2; ++at) {
        for (int au = 0; au < 8; ++au) {
          bk[(at << 11) + (au << 2)] = aq[bb * 2 + at][au];
        }
      }

      barrier(1);

      float br[4][4], bs[4][2], bt[2][2];
      for (int at = 0; at < 4; ++at) {
        for (int au = 0; au < 4; ++au) {
          br[at][au] = bl[(at * 4 + au) * 32];
        }
      }

      barrier(1);

      bs[0][0] = br[0][0] + br[0][1] + br[0][2];
      bs[0][1] = br[0][1] - br[0][2] - br[0][3];
      bs[1][0] = br[1][0] + br[1][1] + br[1][2];
      bs[1][1] = br[1][1] - br[1][2] - br[1][3];
      bs[2][0] = br[2][0] + br[2][1] + br[2][2];
      bs[2][1] = br[2][1] - br[2][2] - br[2][3];
      bs[3][0] = br[3][0] + br[3][1] + br[3][2];
      bs[3][1] = br[3][1] - br[3][2] - br[3][3];

      bt[0][0] = bs[0][0] + bs[1][0] + bs[2][0];
      bt[0][1] = bs[0][1] + bs[1][1] + bs[2][1];
      bt[1][0] = bs[1][0] - bs[2][0] - bs[3][0];
      bt[1][1] = bs[1][1] - bs[2][1] - bs[3][1];

      for (int at = 0; at < 2; ++at) {
        for (int au = 0; au < 2; ++au) {
          if (bp < i && ay[at][au]) {
            bq[(at * k + au) * e] = bt[at][au] + d[bp];
          }
        }
      }
      bp += 8;
      bq += 8 * j * k * e;
    }
  }
}

typedef float NNType;
__kernel void E(__global NNType* a, __global NNType* b, __global NNType* c, __global NNType* d, uint e, uint f, uint g, uint h, uint i, uint j, uint k, uint l, uint m, uint n) {
  uint o = get_global_id(0) % e;
  uint p = get_global_id(0) / e;
  uint q = get_global_id(1);
  uint r = get_global_id(2);
  __global NNType* s = a + r * j * h * i;
  __global NNType* t = b + r * g * e * f;
  uint u = p * n;
  uint v = o * n;

  {
    NNType w = 0;
    for (uint x = 0; x < j; x++) {
      for (uint y = 0; y < l; y++) {
        for (uint z = 0; z < k; z++) {
          int aa = -m + u + y;
          int ab = -m + v + z;
          NNType ac = (aa >= 0 && aa < i && ab >= 0 && ab < h) ? s[x * h * i + aa * h + ab] : 0;
          NNType ad = c[(q * j + x) * (l * k) + y * k + z];
          w += ac * ad;
        }
      }
    }
    w += d[q];
    t[q * e * f + p * e + o] = w;
  }
}
__kernel void F(__global float* a, __global float* b, int c, int d, int e) {
  int f = get_global_id(0);
  int g = f / (e * 64), h = f - g * (e * 64);
  int i = h / 64, j = h % 64 + g * 64;
  b[f] = i < c ? a[j * c + i] : 0.0f;
}

__kernel void G(__global float* a, __global float* b, int c, int d, int e, int f) {
  int g = get_global_id(2), h = get_global_id(1), i = get_global_id(0);
  if (i < f) {
    b[(g * e + h) * f + i] = a[(g * c + h) * d + i];
  }
}

__kernel void H(__global float* a, __global float* b, __global float* c, __global float* d, int e, int f, int g, int h, int i, int j) {
  __local float k[16 + 1][64];
  __local float l[16 + 1][64];
  float m[4], n[4], o[4 * 4] = {0};
  int p = get_group_id(2);
  int q = get_group_id(1), r = get_group_id(0);
  int s = get_local_id(1), t = get_local_id(0);
  int u = s * 16 + t;

  int v = u >> 6, w = u & 63;
  int x = r * 64 + w, y = x < j * j;
  int z = x / j - 1, aa = x % j - 1;
  int ab = v, ac, ad, ae, af;
  a += (q * h + v) * 64 + w;
  b += p * i * j * j;

  k[v][w] = a[0];
  ac = (((ab)*5462) >> 14), ad = (((ac)*5462) >> 14), af = ab - ac * 3 + aa, ae = ac - ad * 3 + z;
  l[v][w] = y && ad < i && 0 <= ae && ae < j && 0 <= af && af < j ? b[(ad * j + ae) * j + af] : 0.0f, ab += 4;
  k[v + 4][w] = a[64 * 4];
  ac = (((ab)*5462) >> 14), ad = (((ac)*5462) >> 14), af = ab - ac * 3 + aa, ae = ac - ad * 3 + z;
  l[v + 4][w] = y && ad < i && 0 <= ae && ae < j && 0 <= af && af < j ? b[(ad * j + ae) * j + af] : 0.0f, ab += 4;
  for (;; --e) {
    barrier(1);

    k[v + 8][w] = a[64 * 8];
    ac = (((ab)*5462) >> 14), ad = (((ac)*5462) >> 14), af = ab - ac * 3 + aa, ae = ac - ad * 3 + z;
    l[v + 8][w] = y && ad < i && 0 <= ae && ae < j && 0 <= af && af < j ? b[(ad * j + ae) * j + af] : 0.0f, ab += 4;

    m[0] = k[0][s * 4];
    m[1] = k[0][s * 4 + 1];
    n[0] = l[0][t * 4];
    n[1] = l[0][t * 4 + 1];
    for (int ag = 0; ag < 4; ++ag) {
      n[2] = l[ag][t * 4 + 2];
      n[3] = l[ag][t * 4 + 3];
      o[0] += m[0] * n[0];
      o[1] += m[0] * n[1];
      o[4] += m[1] * n[0];
      o[5] += m[1] * n[1];
      m[2] = k[ag][s * 4 + 2];
      m[3] = k[ag][s * 4 + 3];
      o[2] += m[0] * n[2];
      o[3] += m[0] * n[3];
      o[6] += m[1] * n[2];
      o[7] += m[1] * n[3];
      m[0] = k[ag + 1][s * 4];
      m[1] = k[ag + 1][s * 4 + 1];
      o[8] += m[2] * n[0];
      o[9] += m[2] * n[1];
      o[12] += m[3] * n[0];
      o[13] += m[3] * n[1];
      n[0] = l[ag + 1][t * 4];
      n[1] = l[ag + 1][t * 4 + 1];
      o[10] += m[2] * n[2];
      o[11] += m[2] * n[3];
      o[14] += m[3] * n[2];
      o[15] += m[3] * n[3];
    };

    k[v + 12][w] = a[64 * 12];
    ac = (((ab)*5462) >> 14), ad = (((ac)*5462) >> 14), af = ab - ac * 3 + aa, ae = ac - ad * 3 + z;
    l[v + 12][w] = y && ad < i && 0 <= ae && ae < j && 0 <= af && af < j ? b[(ad * j + ae) * j + af] : 0.0f, ab += 4;
    a += 64 * 16;

    m[0] = k[4][s * 4];
    m[1] = k[4][s * 4 + 1];
    n[0] = l[4][t * 4];
    n[1] = l[4][t * 4 + 1];
    for (int ag = 4; ag < 8; ++ag) {
      n[2] = l[ag][t * 4 + 2];
      n[3] = l[ag][t * 4 + 3];
      o[0] += m[0] * n[0];
      o[1] += m[0] * n[1];
      o[4] += m[1] * n[0];
      o[5] += m[1] * n[1];
      m[2] = k[ag][s * 4 + 2];
      m[3] = k[ag][s * 4 + 3];
      o[2] += m[0] * n[2];
      o[3] += m[0] * n[3];
      o[6] += m[1] * n[2];
      o[7] += m[1] * n[3];
      m[0] = k[ag + 1][s * 4];
      m[1] = k[ag + 1][s * 4 + 1];
      o[8] += m[2] * n[0];
      o[9] += m[2] * n[1];
      o[12] += m[3] * n[0];
      o[13] += m[3] * n[1];
      n[0] = l[ag + 1][t * 4];
      n[1] = l[ag + 1][t * 4 + 1];
      o[10] += m[2] * n[2];
      o[11] += m[2] * n[3];
      o[14] += m[3] * n[2];
      o[15] += m[3] * n[3];
    };

    barrier(1);

    if (e > 1) {
      k[v][w] = a[0];
      ac = (((ab)*5462) >> 14), ad = (((ac)*5462) >> 14), af = ab - ac * 3 + aa, ae = ac - ad * 3 + z;
      l[v][w] = y && ad < i && 0 <= ae && ae < j && 0 <= af && af < j ? b[(ad * j + ae) * j + af] : 0.0f, ab += 4;
    }

    m[0] = k[8][s * 4];
    m[1] = k[8][s * 4 + 1];
    n[0] = l[8][t * 4];
    n[1] = l[8][t * 4 + 1];
    for (int ag = 8; ag < 12; ++ag) {
      n[2] = l[ag][t * 4 + 2];
      n[3] = l[ag][t * 4 + 3];
      o[0] += m[0] * n[0];
      o[1] += m[0] * n[1];
      o[4] += m[1] * n[0];
      o[5] += m[1] * n[1];
      m[2] = k[ag][s * 4 + 2];
      m[3] = k[ag][s * 4 + 3];
      o[2] += m[0] * n[2];
      o[3] += m[0] * n[3];
      o[6] += m[1] * n[2];
      o[7] += m[1] * n[3];
      m[0] = k[ag + 1][s * 4];
      m[1] = k[ag + 1][s * 4 + 1];
      o[8] += m[2] * n[0];
      o[9] += m[2] * n[1];
      o[12] += m[3] * n[0];
      o[13] += m[3] * n[1];
      n[0] = l[ag + 1][t * 4];
      n[1] = l[ag + 1][t * 4 + 1];
      o[10] += m[2] * n[2];
      o[11] += m[2] * n[3];
      o[14] += m[3] * n[2];
      o[15] += m[3] * n[3];
    };

    if (e > 1) {
      k[v + 4][w] = a[64 * 4];
      ac = (((ab)*5462) >> 14), ad = (((ac)*5462) >> 14), af = ab - ac * 3 + aa, ae = ac - ad * 3 + z;
      l[v + 4][w] = y && ad < i && 0 <= ae && ae < j && 0 <= af && af < j ? b[(ad * j + ae) * j + af] : 0.0f, ab += 4;
    }

    m[0] = k[12][s * 4];
    m[1] = k[12][s * 4 + 1];
    n[0] = l[12][t * 4];
    n[1] = l[12][t * 4 + 1];
    for (int ag = 12; ag < 16; ++ag) {
      n[2] = l[ag][t * 4 + 2];
      n[3] = l[ag][t * 4 + 3];
      o[0] += m[0] * n[0];
      o[1] += m[0] * n[1];
      o[4] += m[1] * n[0];
      o[5] += m[1] * n[1];
      m[2] = k[ag][s * 4 + 2];
      m[3] = k[ag][s * 4 + 3];
      o[2] += m[0] * n[2];
      o[3] += m[0] * n[3];
      o[6] += m[1] * n[2];
      o[7] += m[1] * n[3];
      m[0] = k[ag + 1][s * 4];
      m[1] = k[ag + 1][s * 4 + 1];
      o[8] += m[2] * n[0];
      o[9] += m[2] * n[1];
      o[12] += m[3] * n[0];
      o[13] += m[3] * n[1];
      n[0] = l[ag + 1][t * 4];
      n[1] = l[ag + 1][t * 4 + 1];
      o[10] += m[2] * n[2];
      o[11] += m[2] * n[3];
      o[14] += m[3] * n[2];
      o[15] += m[3] * n[3];
    };

    if (e == 1)
      break;
  }
  c += (p * f + q * 64 + s * 4) * g + r * 64 + t * 4;
  d += q * 64 + s * 4;
  c[0] = max(o[0] + d[0], 0.0f);
  c[1] = max(o[1] + d[0], 0.0f);
  c[2] = max(o[2] + d[0], 0.0f);
  c[3] = max(o[3] + d[0], 0.0f);
  c[g] = max(o[4] + d[1], 0.0f);
  c[g + 1] = max(o[5] + d[1], 0.0f);
  c[g + 2] = max(o[6] + d[1], 0.0f);
  c[g + 3] = max(o[7] + d[1], 0.0f);
  c[g * 2] = max(o[8] + d[2], 0.0f);
  c[g * 2 + 1] = max(o[9] + d[2], 0.0f);
  c[g * 2 + 2] = max(o[10] + d[2], 0.0f);
  c[g * 2 + 3] = max(o[11] + d[2], 0.0f);
  c[g * 3] = max(o[12] + d[3], 0.0f);
  c[g * 3 + 1] = max(o[13] + d[3], 0.0f);
  c[g * 3 + 2] = max(o[14] + d[3], 0.0f);
  c[g * 3 + 3] = max(o[15] + d[3], 0.0f);
}

__kernel void I(__global float* a, __global float* b, int c, int d, int e, int f, int g, int h, int i) {
  int j = get_global_id(0);
  int k = j / (d * h * i);
  if (k >= c)
    return;
  int l = j - k * (d * h * i);
  int m = l / (h * i);
  int n = l - m * (h * i);
  int o = n / (i);
  int p = n - o * (i);
  int q = o * 2 - g, r = p * 2 - g;
  float s[4][4], t[4][4], u[4][4];

  a += ((k * d + m) * e + q) * f + r;
  for (int v = 0; v < 4; ++v) {
    for (int w = 0; w < 4; ++w) {
      s[v][w] = 0 <= q + v && q + v < e && 0 <= r + w && r + w < f ? a[v * f + w] : 0;
    }
  }

  t[0][0] = s[0][0] - s[2][0];
  t[0][1] = s[0][1] - s[2][1];
  t[0][2] = s[0][2] - s[2][2];
  t[0][3] = s[0][3] - s[2][3];
  t[1][0] = s[1][0] + s[2][0];
  t[1][1] = s[1][1] + s[2][1];
  t[1][2] = s[1][2] + s[2][2];
  t[1][3] = s[1][3] + s[2][3];
  t[2][0] = s[2][0] - s[1][0];
  t[2][1] = s[2][1] - s[1][1];
  t[2][2] = s[2][2] - s[1][2];
  t[2][3] = s[2][3] - s[1][3];
  t[3][0] = s[1][0] - s[3][0];
  t[3][1] = s[1][1] - s[3][1];
  t[3][2] = s[1][2] - s[3][2];
  t[3][3] = s[1][3] - s[3][3];

  u[0][0] = t[0][0] - t[0][2];
  u[0][1] = t[0][1] + t[0][2];
  u[0][2] = t[0][2] - t[0][1];
  u[0][3] = t[0][1] - t[0][3];
  u[1][0] = t[1][0] - t[1][2];
  u[1][1] = t[1][1] + t[1][2];
  u[1][2] = t[1][2] - t[1][1];
  u[1][3] = t[1][1] - t[1][3];
  u[2][0] = t[2][0] - t[2][2];
  u[2][1] = t[2][1] + t[2][2];
  u[2][2] = t[2][2] - t[2][1];
  u[2][3] = t[2][1] - t[2][3];
  u[3][0] = t[3][0] - t[3][2];
  u[3][1] = t[3][1] + t[3][2];
  u[3][2] = t[3][2] - t[3][1];
  u[3][3] = t[3][1] - t[3][3];

  b += ((m * c + k) * h + o) * i + p;
  for (int v = 0; v < 4; ++v) {
    for (int w = 0; w < 4; ++w) {
      b[0] = u[v][w];
      b += d * c * h * i;
    }
  }
}

__kernel void J(__global float* a, __global float* b, int c, int d) {
  int e = get_global_id(0);
  int f = e / (d);
  if (f >= c)
    return;
  int g = e - f * (d);
  float h[3][3], i[4][3], j[3], k[4], l[4][4];

  a += (f * d + g) * 3 * 3;
  for (int m = 0; m < 3; ++m) {
    for (int n = 0; n < 3; ++n) {
      h[m][n] = a[m * 3 + n];
    }
  }

  j[0] = (h[0][0] + h[2][0]) * 0.5;
  j[1] = (h[0][1] + h[2][1]) * 0.5;
  j[2] = (h[0][2] + h[2][2]) * 0.5;
  i[0][0] = h[0][0];
  i[0][1] = h[0][1];
  i[0][2] = h[0][2];
  i[3][0] = h[2][0];
  i[3][1] = h[2][1];
  i[3][2] = h[2][2];
  i[1][0] = j[0] + h[1][0] * 0.5;
  i[2][0] = j[0] - h[1][0] * 0.5;
  i[1][1] = j[1] + h[1][1] * 0.5;
  i[2][1] = j[1] - h[1][1] * 0.5;
  i[1][2] = j[2] + h[1][2] * 0.5;
  i[2][2] = j[2] - h[1][2] * 0.5;
  k[0] = (i[0][0] + i[0][2]) * 0.5;
  k[1] = (i[1][0] + i[1][2]) * 0.5;
  k[2] = (i[2][0] + i[2][2]) * 0.5;
  k[3] = (i[3][0] + i[3][2]) * 0.5;
  l[0][0] = i[0][0];
  l[0][3] = i[0][2];
  l[1][0] = i[1][0];
  l[1][3] = i[1][2];
  l[2][0] = i[2][0];
  l[2][3] = i[2][2];
  l[3][0] = i[3][0];
  l[3][3] = i[3][2];
  l[0][1] = k[0] + i[0][1] * 0.5;
  l[0][2] = k[0] - i[0][1] * 0.5;
  l[1][1] = k[1] + i[1][1] * 0.5;
  l[1][2] = k[1] - i[1][1] * 0.5;
  l[2][1] = k[2] + i[2][1] * 0.5;
  l[2][2] = k[2] - i[2][1] * 0.5;
  l[3][1] = k[3] + i[3][1] * 0.5;
  l[3][2] = k[3] - i[3][1] * 0.5;

  b += f * d + g;
  for (int m = 0; m < 4; ++m) {
    for (int n = 0; n < 4; ++n) {
      b[0] = l[m][n];
      b += c * d;
    }
  }
}

__kernel void K(__global float* a, __global float* b, int c, int d, int e, int f, int g, int h) {
  int i = get_global_id(0);
  int j = i / (c * g * h);
  if (j >= d)
    return;
  int k = i - j * (c * g * h);
  int l = k / (g * h);
  int m = k - l * (g * h);
  int n = m / (h);
  int o = m - n * (h);
  int p = n * 2, q = o * 2;
  float r[4][4], s[4][2], t[2][2];

  a += ((j * c + l) * g + n) * h + o;
  for (int u = 0; u < 4; ++u) {
    for (int v = 0; v < 4; ++v) {
      r[u][v] = a[0];
      a += d * c * g * h;
    }
  }

  s[0][0] = r[0][0] + r[0][1] + r[0][2];
  s[0][1] = r[0][1] - r[0][2] - r[0][3];
  s[1][0] = r[1][0] + r[1][1] + r[1][2];
  s[1][1] = r[1][1] - r[1][2] - r[1][3];
  s[2][0] = r[2][0] + r[2][1] + r[2][2];
  s[2][1] = r[2][1] - r[2][2] - r[2][3];
  s[3][0] = r[3][0] + r[3][1] + r[3][2];
  s[3][1] = r[3][1] - r[3][2] - r[3][3];

  t[0][0] = s[0][0] + s[1][0] + s[2][0];
  t[0][1] = s[0][1] + s[1][1] + s[2][1];
  t[1][0] = s[1][0] - s[2][0] - s[3][0];
  t[1][1] = s[1][1] - s[2][1] - s[3][1];

  b += ((l * d + j) * e + p) * f + q;
  for (int u = 0; u < 2; ++u) {
    for (int v = 0; v < 2; ++v) {
      if (p + u < e && q + v < f) {
        b[u * f + v] = t[u][v];
      }
    }
  }
}

__kernel void L(__global float* a, __global float* b, int c, int d, int e, int f) {
  int g = get_global_id(0);
  int h = g / (d * e * f);
  if (h >= c)
    return;
  int i = g - h * (d * e * f);
  int j = i / (e * f);
  int k = i - j * (e * f);
  int l = k / (f);
  int m = k - l * (f);

  b[((j * c + h) * e + (e - l - 1)) * f + (f - m - 1)] = a[g];
}

__kernel void M(__global float* a, __global float* b, int c, int d, int e, int f, int g, int h, int i) {
  int j = get_global_id(0);
  int k = j / (d * h * i);
  if (k >= c)
    return;
  int l = j - k * (d * h * i);
  int m = l / (h * i);
  int n = l - m * (h * i);
  int o = n / (i);
  int p = n - o * (i);
  int q = o * 2 - g, r = p * 2 - g;
  float s[4][4], t[4][4], u[4][4];

  a += ((k * d + m) * e + q) * f + r;
  for (int v = 0; v < 4; ++v) {
    for (int w = 0; w < 4; ++w) {
      s[v][w] = 0 <= q + v && q + v < e && 0 <= r + w && r + w < f ? a[v * f + w] : 0;
    }
  }

  t[0][0] = s[0][0] - s[2][0];
  t[0][1] = s[0][1] - s[2][1];
  t[0][2] = s[0][2] - s[2][2];
  t[0][3] = s[0][3] - s[2][3];
  t[1][0] = s[1][0] + s[2][0];
  t[1][1] = s[1][1] + s[2][1];
  t[1][2] = s[1][2] + s[2][2];
  t[1][3] = s[1][3] + s[2][3];
  t[2][0] = s[2][0] - s[1][0];
  t[2][1] = s[2][1] - s[1][1];
  t[2][2] = s[2][2] - s[1][2];
  t[2][3] = s[2][3] - s[1][3];
  t[3][0] = s[3][0] - s[1][0];
  t[3][1] = s[3][1] - s[1][1];
  t[3][2] = s[3][2] - s[1][2];
  t[3][3] = s[3][3] - s[1][3];

  u[0][0] = t[0][0] - t[0][2];
  u[1][0] = t[1][0] - t[1][2];
  u[2][0] = t[2][0] - t[2][2];
  u[3][0] = t[3][0] - t[3][2];
  u[0][1] = t[0][1] + t[0][2];
  u[1][1] = t[1][1] + t[1][2];
  u[2][1] = t[2][1] + t[2][2];
  u[3][1] = t[3][1] + t[3][2];
  u[0][2] = t[0][2] - t[0][1];
  u[1][2] = t[1][2] - t[1][1];
  u[2][2] = t[2][2] - t[2][1];
  u[3][2] = t[3][2] - t[3][1];
  u[0][3] = t[0][3] - t[0][1];
  u[1][3] = t[1][3] - t[1][1];
  u[2][3] = t[2][3] - t[2][1];
  u[3][3] = t[3][3] - t[3][1];

  b += ((m * c + k) * h + o) * i + p;
  for (int v = 0; v < 4; ++v) {
    for (int w = 0; w < 4; ++w) {
      b[0] = u[v][w];
      b += d * c * h * i;
    }
  }
}

__kernel void N(__global float* a, __global float* b, int c, int d, int e, int f, int g, int h) {
  int i = get_global_id(0);
  int j = i / (d * g * h);
  if (j >= c)
    return;
  int k = i - j * (d * g * h);
  int l = k / (g * h);
  int m = k - l * (g * h);
  int n = m / (h);
  int o = m - n * (h);
  int p = n * 2, q = o * 2;
  float r[2][2], s[4][2], t[4][4];

  a += ((j * d + l) * e + p) * f + q;
  for (int u = 0; u < 2; ++u) {
    for (int v = 0; v < 2; ++v) {
      r[u][v] = 0 <= p + u && p + u < e && 0 <= q + v && q + v < f ? a[u * f + v] : 0;
    }
  }

  s[0][0] = r[0][0];
  s[0][1] = r[0][1];
  s[1][0] = (r[0][0] + r[1][0]) * 0.5;
  s[1][1] = (r[0][1] + r[1][1]) * 0.5;
  s[2][0] = (r[0][0] - r[1][0]) * 0.5;
  s[2][1] = (r[0][1] - r[1][1]) * 0.5;
  s[3][0] = r[1][0];
  s[3][1] = r[1][1];

  t[0][0] = s[0][0];
  t[1][0] = s[1][0];
  t[2][0] = s[2][0];
  t[3][0] = s[3][0];
  t[0][1] = (s[0][0] + s[0][1]) * 0.5;
  t[1][1] = (s[1][0] + s[1][1]) * 0.5;
  t[2][1] = (s[2][0] + s[2][1]) * 0.5;
  t[3][1] = (s[3][0] + s[3][1]) * 0.5;
  t[0][2] = (s[0][0] - s[0][1]) * 0.5;
  t[1][2] = (s[1][0] - s[1][1]) * 0.5;
  t[2][2] = (s[2][0] - s[2][1]) * 0.5;
  t[3][2] = (s[3][0] - s[3][1]) * 0.5;
  t[0][3] = s[0][1];
  t[1][3] = s[1][1];
  t[2][3] = s[2][1];
  t[3][3] = s[3][1];

  b += ((l * c + j) * g + n) * h + o;
  for (int u = 0; u < 4; ++u) {
    for (int v = 0; v < 4; ++v) {
      b[0] = t[u][v];
      b += d * c * g * h;
    }
  }
}

__kernel void O(__global float* a, __global float* b, int c, int d) {
  int e = get_global_id(0);
  int f = e / (d);
  if (f >= c)
    return;
  int g = e - f * (d);
  float h[4][4], i[3][4], j[3][3], k[4];

  a += f * d + g;
  for (int l = 0; l < 4; ++l) {
    for (int m = 0; m < 4; ++m) {
      h[l][m] = a[0];
      a += c * d;
    }
  }

  k[0] = h[1][0] + h[2][0];
  k[1] = h[1][1] + h[2][1];
  k[2] = h[1][2] + h[2][2];
  k[3] = h[1][3] + h[2][3];
  i[0][0] = k[0] + h[0][0];
  i[0][1] = k[1] + h[0][1];
  i[0][2] = k[2] + h[0][2];
  i[0][3] = k[3] + h[0][3];
  i[1][0] = h[1][0] - h[2][0];
  i[1][1] = h[1][1] - h[2][1];
  i[1][2] = h[1][2] - h[2][2];
  i[1][3] = h[1][3] - h[2][3];
  i[2][0] = k[0] + h[3][0];
  i[2][1] = k[1] + h[3][1];
  i[2][2] = k[2] + h[3][2];
  i[2][3] = k[3] + h[3][3];

  k[0] = i[0][1] + i[0][2];
  k[1] = i[1][1] + i[1][2];
  k[2] = i[2][1] + i[2][2];
  j[0][0] = k[0] + i[0][0];
  j[1][0] = k[1] + i[1][0];
  j[2][0] = k[2] + i[2][0];
  j[0][1] = i[0][1] - i[0][2];
  j[1][1] = i[1][1] - i[1][2];
  j[2][1] = i[2][1] - i[2][2];
  j[0][2] = k[0] + i[0][3];
  j[1][2] = k[1] + i[1][3];
  j[2][2] = k[2] + i[2][3];

  b += (f * d + g) * 3 * 3;
  for (int l = 0; l < 3; ++l) {
    for (int m = 0; m < 3; ++m) {
      b[l * 3 + m] = j[l][m];
    }
  }
}