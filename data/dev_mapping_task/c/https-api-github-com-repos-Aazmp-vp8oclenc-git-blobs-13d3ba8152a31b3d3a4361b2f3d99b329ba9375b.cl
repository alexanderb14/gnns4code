typedef short int16_t; typedef int int32_t; typedef unsigned int uint32_t; typedef unsigned char uint8_t; typedef signed char int8_t; typedef unsigned short uint16_t; typedef uint8_t Prob; typedef int8_t tree_index; typedef const tree_index Tree[]; typedef enum { are16x16 = 0, are8x8 = 1, are4x4 = 2 } partition_mode;

typedef enum { intra_segment = 0, UQ_segment = 0, HQ_segment = 1, AQ_segment = 2, LQ_segment = 3 } segment_ids;

typedef enum { LAST = 0, GOLDEN = 1, ALTREF = 2 } ref_frame;

typedef struct { short coeff[16]; } block_t;

typedef struct { block_t block[25]; } macroblock_coeffs_t;

typedef struct {
  short x;
  short y;
} vector_t;

typedef struct { vector_t vector[4]; } macroblock_vectors_t;

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

void A(vp8_bool_encoder* const restrict a, __global uint8_t* const restrict b) {
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

void C(vp8_bool_encoder* const restrict a, const int b, const int c) {
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

void D(vp8_bool_encoder* const restrict a, const int b) {
  C(a, 128, (b) ? 1 : 0);
}
void E(vp8_bool_encoder* const restrict a) {
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

void F(vp8_bool_encoder* const restrict a, __global const uint* const restrict b, token* const restrict c, const int d, uchar e) {
  int f;
  tree_index g;

  int h = ((d == 0) ? 1 : 0);
  int i = 0;

  for (; h < 16; ++h) {
    f = Gh[h];

    if (i) {
      g = 2;
      --(c[h].size);
    } else
      g = 0;

    do {
      const int j = (c[h].bits >> (--(c[h].size))) & 1;
      C(a, (uchar)b[(((d << 3) + f) * 3 + e) * 11 + (g >> 1)], j);
      g = Ga[g + j];
    } while (c[h].size);

    if (c[h].bits == 0)
      return;

    if (c[h].extra_size > 0) {
      int k = 1 << (c[h].extra_size - 1);
      int l = 0;
      while (c[h].pcat[l]) {
        C(a, c[h].pcat[l], (c[h].extra_bits & k) ? 1 : 0);
        ++l;
        k >>= 1;
      }
    }

    e = 2;
    if (c[h].bits == 6)
      e = 1;
    if (c[h].bits == 2) {
      i = 1;
      e = 0;
    } else {
      C(a, 128, c[h].sign);
      i = 0;
    }
  }

  return;
}

void G(__global const macroblock_coeffs_t* const restrict a, const int b, const int c, token d[16]) {
  int e = 0;
  int f;
  for (f = 15; f >= 0; --f) {
    int g = (int)a[b].block[c].coeff[f];
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

__kernel void H(__global const macroblock_coeffs_t* const restrict a, __global const int* const restrict b, __global const int* const restrict c, __global uchar* const restrict d, __global int* const restrict e, __global const uchar* const restrict f, __global const uint* const restrict g, const int h, const int i, const int j, const int k) {
  int l = get_global_id(0);
  int m, n, o, p;
  int q;
  vp8_bool_encoder r[1];

  token s[16];

  A(r, d + k * l);

  for (m = l; m < h; m += j) {
    for (o = 0; o < i; ++o) {
      n = o + m * i;
      if (b[n] == 0)
        continue;
      if (c[n] == are16x16) {
        q = 1;
        G(a, n, 24, s);
        F(r, g, s, q, *(f + n * 25 + 24));
        q = 0;
      } else {
        q = 3;
      }

      for (p = 0; p < 16; ++p) {
        G(a, n, p, s);
        F(r, g, s, q, *(f + n * 25 + p));
      }

      q = 2;
      for (p = 16; p < 20; ++p) {
        G(a, n, p, s);
        F(r, g, s, q, *(f + n * 25 + p));
      }

      for (p = 20; p < 24; ++p) {
        G(a, n, p, s);
        F(r, g, s, q, *(f + n * 25 + p));
      }
    }
  }
  E(r);
  e[l] = r->count;

  return;
}

void I(__global const macroblock_coeffs_t* const restrict a, const int b, const int c, token d[16]) {
  int e = 0;
  int f;
  for (f = 15; f >= 0; --f) {
    int g = (int)a[b].block[c].coeff[f];
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

void J(__global uint* const restrict a, __global uint* const restrict b, const int c, const int d, const int e, token* const restrict f, const int g, const int h) {
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

__kernel void K(__global const macroblock_coeffs_t* const restrict a, __global const int* const restrict b, __global const int* const restrict c, __global uint* const restrict d, __global uint* const restrict e, __global uchar* const restrict f, const int g, const int h, const int i, const int j) {
  int k = get_global_id(0);
  int l, m, n, o;
  int p, q;
  int r;
  int s, t;
  token u[16];

  {
    int v, w, x, y;
    for (v = 0; v < 4; ++v)
      for (w = 0; w < 8; ++w)
        for (x = 0; x < 3; ++x)
          for (y = 0; y < 11; ++y) {
            d[((((k << 5) + (v << 3)) + w) * 3 + x) * 11 + y] = 0;
            e[((((k << 5) + (v << 3)) + w) * 3 + x) * 11 + y] = 1;
          }
  }

  for (l = k; l < g; l += i) {
    for (n = 0; n < h; ++n) {
      m = n + l * h;
      if (b[m] == 0)
        continue;
      if (c[m] == are16x16) {
        s = 1;
        *(f + m * 25 + 24) = 0;
        if (l > 0) {
          p = m - h;
          while (p >= 0) {
            if (c[p] == are16x16)
              break;
            p -= h;
          }
          if (p >= 0)
            for (r = 0; r < 16; ++r) {
              if (a[p].block[24].coeff[r] != 0) {
                ++(*(f + m * 25 + 24));
                break;
              }
            }
        }
        if (n > 0) {
          p = m - 1;
          while (p >= (l * h)) {
            if (c[p] == are16x16)
              break;
            --p;
          }
          if (p >= (l * h))
            for (r = 0; r < 16; ++r) {
              if (a[p].block[24].coeff[r] != 0) {
                ++(*(f + m * 25 + 24));
                break;
              }
            }
        }
        I(a, m, 24, u);
        J(d, e, k, m, 24, u, s, *(f + m * 25 + 24));
        s = 0;
      } else
        s = 3;

      for (o = 0; o < 16; ++o) {
        *(f + m * 25 + o) = 0;

        p = -1;
        if ((o >> 2) > 0) {
          p = m;
          q = o - 4;
        } else if (l > 0) {
          p = m - h;
          q = o + 12;
        }
        if (p >= 0) {
          t = (c[p] == are16x16) ? 1 : 0;
          for (r = t; r < 16; ++r) {
            if (a[p].block[q].coeff[r] != 0) {
              ++(*(f + m * 25 + o));
              break;
            }
          }
        }

        p = -1;
        if ((o & 3) > 0) {
          p = m;
          q = o - 1;
        } else if (n > 0) {
          p = m - 1;
          q = o + 3;
        }
        if (p >= 0) {
          t = (c[p] == are16x16) ? 1 : 0;
          for (r = t; r < 16; ++r) {
            if (a[p].block[q].coeff[r] != 0) {
              ++(*(f + m * 25 + o));
              break;
            }
          }
        }
        I(a, m, o, u);
        J(d, e, k, m, o, u, s, *(f + m * 25 + o));
      }

      s = 2;
      for (o = 16; o < 20; ++o) {
        *(f + m * 25 + o) = 0;

        p = -1;
        if (((o - 16) >> 1) > 0) {
          p = m;
          q = o - 2;
        } else if (l > 0) {
          p = m - h;
          q = o + 2;
        }
        if (p >= 0) {
          for (r = 0; r < 16; ++r) {
            if (a[p].block[q].coeff[r] != 0) {
              ++(*(f + m * 25 + o));
              break;
            }
          }
        }

        p = -1;
        if (((o - 16) & 1) > 0) {
          p = m;
          q = o - 1;
        } else if (n > 0) {
          p = m - 1;
          q = o + 1;
        }
        if (p >= 0) {
          for (r = 0; r < 16; ++r) {
            if (a[p].block[q].coeff[r] != 0) {
              ++(*(f + m * 25 + o));
              break;
            }
          }
        }
        I(a, m, o, u);
        J(d, e, k, m, o, u, s, *(f + m * 25 + o));
      }

      for (o = 20; o < 24; ++o) {
        *(f + m * 25 + o) = 0;

        p = -1;
        if (((o - 20) >> 1) > 0) {
          p = m;
          q = o - 2;
        } else if (l > 0) {
          p = m - h;
          q = o + 2;
        }
        if (p >= 0) {
          for (r = 0; r < 16; ++r) {
            if (a[p].block[q].coeff[r] != 0) {
              ++(*(f + m * 25 + o));
              break;
            }
          }
        }

        p = -1;
        if (((o - 20) & 1) > 0) {
          p = m;
          q = o - 1;
        } else if (n > 0) {
          p = m - 1;
          q = o + 1;
        }
        if (p >= 0) {
          for (r = 0; r < 16; ++r) {
            if (a[p].block[q].coeff[r] != 0) {
              ++(*(f + m * 25 + o));
              break;
            }
          }
        }
        I(a, m, o, u);
        J(d, e, k, m, o, u, s, *(f + m * 25 + o));
      }
    }
  }

  return;
}

__kernel void L(__global uint* const restrict a, __global const uint* const restrict b, const int c) {
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