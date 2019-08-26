typedef short int16_t; typedef int int32_t; typedef unsigned int uint32_t; typedef unsigned char uint8_t; typedef signed char int8_t; typedef unsigned short uint16_t; typedef uint8_t Prob; typedef int8_t tree_index; typedef const tree_index Tree[]; typedef enum { are16x16 = 0, are8x8 = 1, are4x4 = 2 } partition_mode;

typedef enum { intra_segment = 0, UQ_segment = 0, HQ_segment = 1, AQ_segment = 2, LQ_segment = 3 } segment_ids;

typedef enum { LAST = 0, GOLDEN = 1, ALTREF = 2 } ref_frame;

typedef struct {
  int16_t coeffs[25][16];
  int32_t vector_x[4];
  int32_t vector_y[4];
  float SSIM;
  int non_zero_coeffs;
  int parts;
  int reference_frame;
  segment_ids segment_id;
} macroblock;

typedef struct {
  int y_ac_i;
  int y_dc_idelta;
  int y2_dc_idelta;
  int y2_ac_idelta;
  int uv_dc_idelta;
  int uv_ac_idelta;
  int loop_filter_level;
  int mbedge_limit;
  int sub_bedge_limit;
  int interior_limit;
  int hev_threshold;
} segment_data;

typedef struct {
  __global uint8_t* output;
  uint32_t range;
  uint32_t bottom;
  int32_t bit_count;
  uint32_t count;
} vp8_bool_encoder;

void A(vp8_bool_encoder* a, __global uint8_t* b) {
  a->output = b;
  a->range = 255;
  a->bottom = 0;
  a->bit_count = 24;
  a->count = 0;
}

void B(__global uint8_t* a) {
  while (*--a == 255)
    *a = 0;
  ++*a;
}

void C(vp8_bool_encoder* a, int b, int c) {
  uint32_t d = 1 + (((a->range - 1) * b) >> 8);
  if (c) {
    a->bottom += d;
    a->range -= d;
  } else
    a->range = d;
  while (a->range < 128) {
    a->range <<= 1;
    if (a->bottom & ((uint32_t)1 << 31)) {
      B(a->output);
    }
    a->bottom <<= 1;
    if (!--a->bit_count) {
      *a->output++ = (uint8_t)(a->bottom >> 24);
      a->count++;
      a->bottom &= (1 << 24) - 1;
      a->bit_count = 8;
    }
  }
}

void D(vp8_bool_encoder* a, int b) {
  C(a, 128, (b) ? 1 : 0);
}

void E(vp8_bool_encoder* a, int b, int c) {
  int d = 1 << (c - 1);
  while (d) {
    D(a, !((b & d) == 0));
    d >>= 1;
  }
}

void F(vp8_bool_encoder* a) {
  int b = a->bit_count;
  uint32_t c = a->bottom;
  if (c & (1 << (32 - b)))
    B(a->output);
  c <<= b & 7;
  b >>= 3;
  while (--b >= 0)
    c <<= 8;
  b = 4;
  while (--b >= 0) {
    *a->output++ = (uint8_t)(c >> 24);
    a->count++;
    c <<= 8;
  }
}

typedef enum { DCT_0, DCT_1, DCT_2, DCT_3, DCT_4, dct_cat1, dct_cat2, dct_cat3, dct_cat4, dct_cat5, dct_cat6, dct_eob, num_dct_tokens } dct_token;
typedef struct {
  int sign;
  int bits;
  int size;
  int extra_bits;
  int extra_size;
  __constant Prob* pcat;
} token;

__constant tree_index Ga[2 * (num_dct_tokens - 1)] = {-dct_eob, 2, -DCT_0, 4, -DCT_1, 6, 8, 12, -DCT_2, 10, -DCT_3, -DCT_4, 14, 16, -dct_cat1, -dct_cat2, 18, 20, -dct_cat3, -dct_cat4, -dct_cat5, -dct_cat6};
__constant Prob Gb[] = {159, 0};
__constant Prob Gc[] = {165, 145, 0};
__constant Prob Gd[] = {173, 148, 140, 0};
__constant Prob Ge[] = {176, 155, 140, 135, 0};
__constant Prob Gf[] = {180, 157, 141, 134, 130, 0};
__constant Prob Gg[] = {254, 254, 243, 230, 196, 177, 153, 140, 133, 130, 129, 0};
__constant int Gh[16] = {0, 1, 2, 3, 6, 4, 5, 6, 6, 6, 6, 6, 6, 6, 6, 7};

void G(vp8_bool_encoder* a, __global uint* b, int c, int d, token* e, int f, uchar g) {
  int h;
  tree_index i;

  int j = ((f == 0) ? 1 : 0);
  int k = 0;

  for (; j < 16; ++j) {
    h = Gh[j];

    if (k) {
      i = 2;
      --(e[j].size);
    } else
      i = 0;

    do {
      const int l = (e[j].bits >> (--(e[j].size))) & 1;
      C(a, (uchar)b[(((f << 3) + h) * 3 + g) * 11 + (i >> 1)], l);
      i = Ga[i + l];
    } while (e[j].size);

    if (e[j].bits == 0)
      return;

    if (e[j].extra_size > 0) {
      int m = 1 << (e[j].extra_size - 1);
      int n = 0;
      while (e[j].pcat[n]) {
        C(a, e[j].pcat[n], (e[j].extra_bits & m) ? 1 : 0);
        ++n;
        m >>= 1;
      }
    }

    g = 2;
    if (e[j].bits == 6)
      g = 1;
    if (e[j].bits == 2) {
      k = 1;
      g = 0;
    } else {
      C(a, 128, e[j].sign);
      k = 0;
    }
  }

  return;
}

void H(__global macroblock* a, int b, int c, token d[16]) {
  int e = 0;
  int f;
  for (f = 15; f >= 0; --f) {
    int g = (int)a[b].coeffs[c][f];
    d[f].sign = (g < 0) ? 1 : 0;
    g = (g < 0) ? -g : g;
    d[f].extra_bits = 0;
    d[f].extra_size = 0;
    d[f].pcat = Gb;
    if (g == 0) {
      if (e == 0) {
        d[f].bits = 0;
        d[f].size = 1;
      } else {
        d[f].bits = 2;
        d[f].size = 2;
      }
    } else if (g == 1) {
      d[f].bits = 6;
      d[f].size = 3;
    } else if (g == 2) {
      d[f].bits = 28;
      d[f].size = 5;
    } else if (g == 3) {
      d[f].bits = 58;
      d[f].size = 6;
    } else if (g == 4) {
      d[f].bits = 59;
      d[f].size = 6;
    } else if (g <= 6) {
      d[f].bits = 60;
      d[f].size = 6;
      d[f].extra_bits = g - 5;
      d[f].extra_size = 1;

    } else if (g <= 10) {
      d[f].bits = 61;
      d[f].size = 6;
      d[f].extra_bits = g - 7;
      d[f].extra_size = 2;
      d[f].pcat = Gc;
    } else if (g <= 18) {
      d[f].bits = 124;
      d[f].size = 7;
      d[f].extra_bits = g - 11;
      d[f].extra_size = 3;
      d[f].pcat = Gd;
    } else if (g <= 34) {
      d[f].bits = 125;
      d[f].size = 7;
      d[f].extra_bits = g - 19;
      d[f].extra_size = 4;
      d[f].pcat = Ge;
    } else if (g <= 66) {
      d[f].bits = 126;
      d[f].size = 7;
      d[f].extra_bits = g - 35;
      d[f].extra_size = 5;
      d[f].pcat = Gf;
    } else {
      d[f].bits = 127;
      d[f].size = 7;
      d[f].extra_bits = g - 67;
      d[f].extra_size = 11;
      d[f].pcat = Gg;
    }
    e = d[f].bits;
  }
  return;
}

__kernel void I(__global macroblock* a, __global uchar* b, __global int* c, __global uchar* d, __global uint* e, __global uint* f, int g, int h, int i, int j, int k, int l) {
  int m = get_global_id(0);
  int n, o, p, q;
  int r;
  vp8_bool_encoder s[1];

  token t[16];

  A(s, b + k * m);

  for (n = m; n < g; n += i) {
    for (p = 0; p < h; ++p) {
      o = p + n * h;
      if (a[o].non_zero_coeffs == 0)
        continue;
      if (a[o].parts == are16x16) {
        r = 1;
        H(a, o, 24, t);
        G(s, e, o, 24, t, r, *(d + o * 25 + 24));
        r = 0;
      } else {
        r = 3;
      }

      for (q = 0; q < 16; ++q) {
        H(a, o, q, t);
        G(s, e, o, q, t, r, *(d + o * 25 + q));
      }

      r = 2;
      for (q = 16; q < 20; ++q) {
        H(a, o, q, t);
        G(s, e, o, q, t, r, *(d + o * 25 + q));
      }

      for (q = 20; q < 24; ++q) {
        H(a, o, q, t);
        G(s, e, o, q, t, r, *(d + o * 25 + q));
      }
    }
  }
  F(s);
  c[m] = s->count;

  return;
}

void J(__global macroblock* a, int b, int c, token d[16]) {
  int e = 0;
  int f;
  for (f = 15; f >= 0; --f) {
    int g = (int)a[b].coeffs[c][f];
    g = (g < 0) ? -g : g;
    if (g == 0) {
      if (e == 0) {
        d[f].bits = 0;
        d[f].size = 1;
      } else {
        d[f].bits = 2;
        d[f].size = 2;
      }
    } else if (g == 1) {
      d[f].bits = 6;
      d[f].size = 3;
    } else if (g == 2) {
      d[f].bits = 28;
      d[f].size = 5;
    } else if (g == 3) {
      d[f].bits = 58;
      d[f].size = 6;
    } else if (g == 4) {
      d[f].bits = 59;
      d[f].size = 6;
    } else if (g <= 6) {
      d[f].bits = 60;
      d[f].size = 6;
    } else if (g <= 10) {
      d[f].bits = 61;
      d[f].size = 6;
    } else if (g <= 18) {
      d[f].bits = 124;
      d[f].size = 7;
    } else if (g <= 34) {
      d[f].bits = 125;
      d[f].size = 7;
    } else if (g <= 66) {
      d[f].bits = 126;
      d[f].size = 7;
    } else {
      d[f].bits = 127;
      d[f].size = 7;
    }
    e = d[f].bits;
  }
  return;
}

void K(__global uint* const a, __global uint* const b, const int c, const int d, const int e, token* f, const int g, const int h) {
  int i;
  int j = h;
  tree_index k;

  int l = ((g == 0) ? 1 : 0);
  int m = 0;

  for (; l < 16; ++l) {
    i = Gh[l];

    if (m) {
      k = 2;
      --(f[l].size);
    } else
      k = 0;

    do {
      const uchar n = (f[l].bits >> (--(f[l].size))) & 1;
      a[((((c << 5) + (g << 3)) + i) * 3 + j) * 11 + (k >> 1)] += (1 - n);
      ++(b[((((c << 5) + (g << 3)) + i) * 3 + j) * 11 + (k >> 1)]);
      k = Ga[k + n];
    } while (f[l].size);

    j = 2;
    if (f[l].bits == 6)
      j = 1;
    if (f[l].bits == 2) {
      m = 1;
      j = 0;
    } else {
      m = 0;
    }
  }
  return;
}

__kernel void L(__global macroblock* a, __global uint* b, __global uint* c, __global uchar* d, int e, int f, int g, int h, int i) {
  int j = get_global_id(0);
  int k, l, m, n;
  int o, p;
  int q;
  int r, s;
  token t[16];

  {
    int u, v, w, x;
    for (u = 0; u < 4; ++u)
      for (v = 0; v < 8; ++v)
        for (w = 0; w < 3; ++w)
          for (x = 0; x < 11; ++x) {
            b[((((j << 5) + (u << 3)) + v) * 3 + w) * 11 + x] = 0;
            c[((((j << 5) + (u << 3)) + v) * 3 + w) * 11 + x] = 1;
          }
  }

  for (k = j; k < e; k += g) {
    for (m = 0; m < f; ++m) {
      l = m + k * f;
      if (a[l].non_zero_coeffs == 0)
        continue;
      if (a[l].parts == are16x16) {
        r = 1;
        *(d + l * 25 + 24) = 0;
        if (k > 0) {
          o = l - f;
          while (o >= 0) {
            if (a[o].parts == are16x16)
              break;
            o -= f;
          }
          if (o >= 0)
            for (q = 0; q < 16; ++q) {
              if (a[o].coeffs[24][q] != 0) {
                ++(*(d + l * 25 + 24));
                break;
              }
            }
        }
        if (m > 0) {
          o = l - 1;
          while (o >= (k * f)) {
            if (a[o].parts == are16x16)
              break;
            --o;
          }
          if (o >= (k * f))
            for (q = 0; q < 16; ++q) {
              if (a[o].coeffs[24][q] != 0) {
                ++(*(d + l * 25 + 24));
                break;
              }
            }
        }
        J(a, l, 24, t);
        K(b, c, j, l, 24, t, r, *(d + l * 25 + 24));
        r = 0;
      } else
        r = 3;

      for (n = 0; n < 16; ++n) {
        *(d + l * 25 + n) = 0;

        o = -1;
        if ((n >> 2) > 0) {
          o = l;
          p = n - 4;
        } else if (k > 0) {
          o = l - f;
          p = n + 12;
        }
        if (o >= 0) {
          s = (a[o].parts == are16x16) ? 1 : 0;
          for (q = s; q < 16; ++q) {
            if (a[o].coeffs[p][q] != 0) {
              ++(*(d + l * 25 + n));
              break;
            }
          }
        }

        o = -1;
        if ((n & 3) > 0) {
          o = l;
          p = n - 1;
        } else if (m > 0) {
          o = l - 1;
          p = n + 3;
        }
        if (o >= 0) {
          s = (a[o].parts == are16x16) ? 1 : 0;
          for (q = s; q < 16; ++q) {
            if (a[o].coeffs[p][q] != 0) {
              ++(*(d + l * 25 + n));
              break;
            }
          }
        }
        J(a, l, n, t);
        K(b, c, j, l, n, t, r, *(d + l * 25 + n));
      }

      r = 2;
      for (n = 16; n < 20; ++n) {
        *(d + l * 25 + n) = 0;

        o = -1;
        if (((n - 16) >> 1) > 0) {
          o = l;
          p = n - 2;
        } else if (k > 0) {
          o = l - f;
          p = n + 2;
        }
        if (o >= 0) {
          for (q = 0; q < 16; ++q) {
            if (a[o].coeffs[p][q] != 0) {
              ++(*(d + l * 25 + n));
              break;
            }
          }
        }

        o = -1;
        if (((n - 16) & 1) > 0) {
          o = l;
          p = n - 1;
        } else if (m > 0) {
          o = l - 1;
          p = n + 1;
        }
        if (o >= 0) {
          for (q = 0; q < 16; ++q) {
            if (a[o].coeffs[p][q] != 0) {
              ++(*(d + l * 25 + n));
              break;
            }
          }
        }
        J(a, l, n, t);
        K(b, c, j, l, n, t, r, *(d + l * 25 + n));
      }

      for (n = 20; n < 24; ++n) {
        *(d + l * 25 + n) = 0;

        o = -1;
        if (((n - 20) >> 1) > 0) {
          o = l;
          p = n - 2;
        } else if (k > 0) {
          o = l - f;
          p = n + 2;
        }
        if (o >= 0) {
          for (q = 0; q < 16; ++q) {
            if (a[o].coeffs[p][q] != 0) {
              ++(*(d + l * 25 + n));
              break;
            }
          }
        }

        o = -1;
        if (((n - 20) & 1) > 0) {
          o = l;
          p = n - 1;
        } else if (m > 0) {
          o = l - 1;
          p = n + 1;
        }
        if (o >= 0) {
          for (q = 0; q < 16; ++q) {
            if (a[o].coeffs[p][q] != 0) {
              ++(*(d + l * 25 + n));
              break;
            }
          }
        }
        J(a, l, n, t);
        K(b, c, j, l, n, t, r, *(d + l * 25 + n));
      }
    }
  }

  return;
}

__kernel void M(__global uint* a, __global uint* b, int c) {
  int d = get_global_id(0);
  int e, f, g, h, i;
  uint j, k;
  for (e = 0; e < 4; ++e)
    for (f = d; f < 8; f += c)
      for (g = 0; g < 3; ++g)
        for (h = 0; h < 11; ++h) {
          j = 0;
          k = 0;
          for (i = 0; i < c; ++i) {
            j += a[((((i << 5) + (e << 3)) + f) * 3 + g) * 11 + h];
            k += b[((((i << 5) + (e << 3)) + f) * 3 + g) * 11 + h];
          }
          j = (j << 8) / k;
          a[(((e << 3) + f) * 3 + g) * 11 + h] = (j > 255) ? 255 : ((j == 0) ? 1 : j);
        }
  return;
}