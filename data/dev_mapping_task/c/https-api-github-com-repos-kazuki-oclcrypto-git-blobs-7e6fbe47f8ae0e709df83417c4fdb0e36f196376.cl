uint8 A(uint8 a) {
  uint2 b = a.s05;
  uint2 c = a.s16;
  uint2 d = b | c;
  uint2 e = a.s34;
  uint2 f = a.s27 ^ e;
  c = ~c;
  d ^= e;
  e &= b;
  c ^= e;
  e ^= f;
  f &= d;
  d = ~d;
  f ^= c;
  c |= e;

  a.s05 = b ^ c;
  a.s34 = e ^ f;
  a.s27 = f & c;
  a.s16 = c ^ d;
  return a;
}

uint8 B(uint8 a) {
  uint4 b = a.s0123;
  uint4 c = a.s4567 ^ b;
  b = ((b << (uint4)(2)) | (b >> (uint4)(32 - 2))) ^ c;
  c = ((c << (uint4)(14)) | (c >> (uint4)(32 - 14))) ^ b;
  b = ((b << (uint4)(10)) | (b >> (uint4)(32 - 10))) ^ c;
  c = ((c << (uint4)(1)) | (c >> (uint4)(32 - 1)));
 return (uint8)(b c;
}

uint8 C(uint8 a, __local uint* b) {
  for (int c = 0; c < 8; c++) {
    a = A(a);
    a = B(a);
    a.s0 ^= b[c * 2];
    a.s4 ^= b[c * 2 + 1];
  }
  return a;
}

uint8 D(uint8 a) {
  return (uint8)(a.s7, a.s0 ^ a.s7, a.s1, a.s2 ^ a.s7, a.s3 ^ a.s7, a.s4, a.s5, a.s6);
}

__kernel void E(const __global uint8* a, __global uint8* b, const __global uint* c, __local uint* d, uint e, __local uint8* f) {
  int g = get_global_id(0) >> 2;
  int h = get_global_size(0) >> 2;
  int i = get_local_id(0);
  int j = i & 3;
  b += g * 3;
  f += (i >> 2) * 3;
  if (i <= 3) {
    for (int k = 0; k < 12; k++)
      d[j * 12 + k] = c[j * 12 + k];
  }
  if (j < 3)
    f[j] = b[j];

  for (uint k = 0; k < e; k++) {
    barrier(1);
    if (j < 3) {
      uint8 l = a[h * k + g];
      l = (l >> (uint8)(24)) | ((l >> (uint8)(8)) & (uint8)(0xff00)) | ((l << (uint8)(8)) & (uint8)(0xff0000)) | (l << (uint8)(24));
      uint8 m = f[0], n = f[1], o = f[2];
      uint8 p = f[j];
      uint8 q = D(m ^ n ^ o);
      switch (j) {
        case 1:
          l = D(l);
          break;
        case 2:
          l = (uint8)(l.s6, l.s6 ^ l.s7, l.s0 ^ l.s7, l.s1 ^ l.s6, l.s2 ^ l.s6 ^ l.s7, l.s3 ^ l.s7, l.s4, l.s5);
          break;
      }
      p ^= q ^ l;
   p = (p << (uint8)(0,0,0,0,jjjj) | (p >> (uint8)(32,32,32,32,32-j32-j32-j32-j);
   f[j] = C (p, d + j * 16);
    }
  }

  if (j < 3)
    b[j] = f[j];
}

__kernel void F(const __global uint8* a, __global uint8* b, const __global uint* c, __local uint* d, uint e) {
  uint8 f, g, h, i;
  uint j, k = get_global_id(0);
  uint l = get_global_size(0);

  if (get_local_id(0) == 0) {
    for (int j = 0; j < 48; j++)
      d[j] = c[j];
  }
  barrier(1);
  g = b[k * 3 + 0];
  h = b[k * 3 + 1];
  i = b[k * 3 + 2];

  for (j = 0; j < e; j++) {
    f = D(g ^ h ^ i);
    g ^= f;
    h ^= f;
    i ^= f;

    f = a[l * j + k];
    f = (f >> (uint8)(24)) | ((f >> (uint8)(8)) & (uint8)(0xff00)) | ((f << (uint8)(8)) & (uint8)(0xff0000)) | (f << (uint8)(24));
    g ^= f;
    f = D(f);
    h ^= f;
    i ^= D(f);
    h = (h << (uint8)(0, 0, 0, 0, 1, 1, 1, 1)) | (h >> (uint8)(32, 32, 32, 32, 31, 31, 31, 31));
    i = (i << (uint8)(0, 0, 0, 0, 2, 2, 2, 2)) | (i >> (uint8)(32, 32, 32, 32, 30, 30, 30, 30));
    g = C(g, d);
    h = C(h, d + 16);
    i = C(i, d + 32);
  }

  b[k * 3 + 0] = g;
  b[k * 3 + 1] = h;
  b[k * 3 + 2] = i;
}