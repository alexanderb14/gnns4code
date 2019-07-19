unsigned int A(__global const unsigned int* a, unsigned int b) {
  unsigned short c, d, e, f;
  unsigned int g;

  f = (unsigned short)(b & 0xFF);
  b >>= 8;
  e = (unsigned short)(b & 0xFF);
  b >>= 8;
  d = (unsigned short)(b & 0xFF);
  b >>= 8;
  c = (unsigned short)(b & 0xFF);
  g = a[0 * 256 + c] + a[1 * 256 + d];
  g = g ^ a[2 * 256 + e];
  g = g + a[3 * 256 + f];

  return (g);
}

__kernel void B(__global const unsigned char* a, __global const unsigned int* b, __global const unsigned int* c, __global unsigned char* d, unsigned long int e, unsigned long int f) {
  unsigned long int g = get_global_id(0);

  uchar h[8] = {' '};
  uchar i[8] = {' '};

  if (g < e / 8) {
    unsigned long int j = g * 8;

    for (int k = 0; k < 8; ++k) {
      h[k] = a[j + k];
    }

    unsigned int l, m, n;
    short o;
    { (l) = ((unsigned int)(h)[(0)] << 24) | ((unsigned int)(h)[(0) + 1] << 16) | ((unsigned int)(h)[(0) + 2] << 8) | ((unsigned int)(h)[(0) + 3]); };
    { (m) = ((unsigned int)(h)[(4)] << 24) | ((unsigned int)(h)[(4) + 1] << 16) | ((unsigned int)(h)[(4) + 2] << 8) | ((unsigned int)(h)[(4) + 3]); };

    for (o = 0; o < 16; ++o) {
      l = l ^ b[o];
      m = A(c, l) ^ m;
      n = l;
      l = m;
      m = n;
    }

    n = l;
    l = m;
    m = n;
    m = m ^ b[16];
    l = l ^ b[16 + 1];
    {
      (i)[(0)] = (unsigned char)((l) >> 24);
      (i)[(0) + 1] = (unsigned char)((l) >> 16);
      (i)[(0) + 2] = (unsigned char)((l) >> 8);
      (i)[(0) + 3] = (unsigned char)((l));
    };
    {
      (i)[(4)] = (unsigned char)((m) >> 24);
      (i)[(4) + 1] = (unsigned char)((m) >> 16);
      (i)[(4) + 2] = (unsigned char)((m) >> 8);
      (i)[(4) + 3] = (unsigned char)((m));
    };

    for (int k = 0; k < 8; ++k) {
      d[j + k] = i[k];
    }
  }
}