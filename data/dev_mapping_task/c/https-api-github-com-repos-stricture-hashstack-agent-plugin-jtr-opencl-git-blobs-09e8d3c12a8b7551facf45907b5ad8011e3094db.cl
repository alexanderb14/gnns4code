typedef struct {
  union {
    char c[16];
    unsigned int w[16 / 4];
  } v;
  int l;
} lotus5_key;
inline void A(__private unsigned int* a, __private unsigned int* b, __local unsigned int* c) {
  unsigned int d;
  int e;

  d = 0x00;
  for (e = 0; e < 4; e++) {
    d = b[e] = c[((a[e] & 0xff) ^ d) & 0xff];
    d = c[(((a[e] & 0x0000ff00) >> 8) ^ d) & 0xff];
    b[e] |= d << 8;
    d = c[(((a[e] & 0x00ff0000) >> 16) ^ d) & 0xff];
    b[e] |= d << 16;
    d = c[(((a[e] & 0xff000000) >> 24) ^ d) & 0xff];
    b[e] |= d << 24;
  }
}

inline void B(__private unsigned int* a, __local unsigned int* b) {
  int c, d, e;
  unsigned int f;

  f = 0;

  for (c = 18; c > 0; c--) {
    e = 0;
    for (d = 48; d > 0;) {
      f = (a[e] & 0xff) ^ b[((d-- + f) & 0xff) & 0xff];
      a[e] = (a[e] & 0xffffff00) | f;
      f = ((a[e] & 0x0000ff00) >> 8) ^ b[((d-- + f) & 0xff) & 0xff];
      a[e] = (a[e] & 0xffff00ff) | (f << 8);
      f = ((a[e] & 0x00ff0000) >> 16) ^ b[((d-- + f) & 0xff) & 0xff];
      a[e] = (a[e] & 0xff00ffff) | (f << 16);
      f = ((a[e] & 0xff000000) >> 24) ^ b[((d-- + f) & 0xff) & 0xff];
      a[e] = (a[e] & 0x00ffffff) | (f << 24);
      e++;
      f = (a[e] & 0xff) ^ b[((d-- + f) & 0xff) & 0xff];
      a[e] = (a[e] & 0xffffff00) | f;
      f = ((a[e] & 0x0000ff00) >> 8) ^ b[((d-- + f) & 0xff) & 0xff];
      a[e] = (a[e] & 0xffff00ff) | (f << 8);
      f = ((a[e] & 0x00ff0000) >> 16) ^ b[((d-- + f) & 0xff) & 0xff];
      a[e] = (a[e] & 0xff00ffff) | (f << 16);
      f = ((a[e] & 0xff000000) >> 24) ^ b[((d-- + f) & 0xff) & 0xff];
      a[e] = (a[e] & 0x00ffffff) | (f << 24);
      e++;
      f = (a[e] & 0xff) ^ b[((d-- + f) & 0xff) & 0xff];
      a[e] = (a[e] & 0xffffff00) | f;
      f = ((a[e] & 0x0000ff00) >> 8) ^ b[((d-- + f) & 0xff) & 0xff];
      a[e] = (a[e] & 0xffff00ff) | (f << 8);
      f = ((a[e] & 0x00ff0000) >> 16) ^ b[((d-- + f) & 0xff) & 0xff];
      a[e] = (a[e] & 0xff00ffff) | (f << 16);
      f = ((a[e] & 0xff000000) >> 24) ^ b[((d-- + f) & 0xff) & 0xff];
      a[e] = (a[e] & 0x00ffffff) | (f << 24);
      e++;
      f = (a[e] & 0xff) ^ b[((d-- + f) & 0xff) & 0xff];
      a[e] = (a[e] & 0xffffff00) | f;
      f = ((a[e] & 0x0000ff00) >> 8) ^ b[((d-- + f) & 0xff) & 0xff];
      a[e] = (a[e] & 0xffff00ff) | (f << 8);
      f = ((a[e] & 0x00ff0000) >> 16) ^ b[((d-- + f) & 0xff) & 0xff];
      a[e] = (a[e] & 0xff00ffff) | (f << 16);
      f = ((a[e] & 0xff000000) >> 24) ^ b[((d-- + f) & 0xff) & 0xff];
      a[e] = (a[e] & 0x00ffffff) | (f << 24);
      e++;
    }
  }
}

__kernel void C(__global lotus5_key* a, __constant unsigned int* b

                ,
                __global unsigned int* c) {
  unsigned int d = get_global_id(0);
  unsigned int e[16];
  int f;

  __local unsigned int g[256];

  {
    size_t h = get_local_size(0);
    unsigned int i = get_local_id(0);
    size_t j;

    for (j = i; j < 256; j += h)
      g[j & 255] = b[j & 255];

    barrier(1);
  }

  e[0] = e[1] = e[2] = e[3] = 0;
  e[4] = e[5] = e[6] = e[7] = 0;

  f = a[d].l;

  {
    int k, l;

    l = f % 4;
    k = f / 4;

    for (; l < 4; l++)
      e[4 + k] |= (16 - f) << (l * 8);

    for (l = k + 1; l < 4; l++)
      e[4 + l] = (16 - f) | (16 - f) << 8 | (16 - f) << 16 | (16 - f) << 24;
  }

  e[8] = e[4] ^= a[d].v.w[0];
  e[9] = e[5] ^= a[d].v.w[1];
  e[10] = e[6] ^= a[d].v.w[2];
  e[11] = e[7] ^= a[d].v.w[3];

  A(e + 4, e + 12,

    g

    );

  B(e,

    g

    );

  e[4] = e[12];
  e[5] = e[13];
  e[6] = e[14];
  e[7] = e[15];

  e[8] = e[0] ^ e[4];
  e[9] = e[1] ^ e[5];
  e[10] = e[2] ^ e[6];
  e[11] = e[3] ^ e[7];

  B(e,

    g

    );

  c[d * (16 >> 2)] = e[0];
  c[d * (16 >> 2) + 1] = e[1];
  c[d * (16 >> 2) + 2] = e[2];
  c[d * (16 >> 2) + 3] = e[3];
}