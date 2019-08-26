typedef short word; typedef long longword; word A(word a, word b) {
  longword c;
  c = (longword)a + (longword)b;
  return ((c) < ((-32767) - 1) ? ((-32767) - 1) : (c) > (32767) ? (32767) : (c));
}

word B(word a, word b) {
  if (a == ((-32767) - 1) && b == ((-32767) - 1))
    return (32767);
  else
    return (((longword)a * (longword)b) >> (15));
}

word C(word a, word b) {
  longword c;
  if (b == ((-32767) - 1) && a == ((-32767) - 1))
    return (32767);
  else {
    c = (longword)a * (longword)b + 16384;
    c >>= 15;
    return c & 0xFFFF;
  }
}

word D(word a) {
  return a < 0 ? (a == ((-32767) - 1) ? (32767) : -a) : a;
}

__constant unsigned char Ga[256] = {8, 7, 6, 6, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

word E(longword a) {
  if (a < 0) {
    if (a <= -1073741824)
      return 0;
    a = ~a;
  }

  return a & 0xffff0000 ? (a & 0xff000000 ? -1 + Ga[0xFF & (a >> 24)] : 7 + Ga[0xFF & (a >> 16)]) : (a & 0xff00 ? 15 + Ga[0xFF & (a >> 8)] : 23 + Ga[0xFF & a]);
}

word F(word a, word b) {
  longword c;
  longword d;
  word e;
  int f;

  c = a;
  d = b;
  e = 0;
  f = 15;

  if (a == 0)
    return 0;

  while (f--) {
    e <<= 1;
    c <<= 1;

    if (c >= d) {
      c -= d;
      e++;
    }
  }

  return e;
}
void G(word* a, longword* b)

{
  int c, d;

  word e;
  word f;
  word g, h;
  word* i;
  word j;

  f = 0;
  for (c = 0; c <= 159; c++) {
    e = D(a[c]);
    if (e > f)
      f = e;
  }

  if (f == 0)
    g = 0;
  else
    g = 4 - E((longword)f << 16);

  if (g > 0 && g <= 4) {
    h = g;
    for (c = 0; c <= 159; c++)
      a[c] = C(a[c], 16384 >> (h - 1));
  }

  {
    i = a;
    j = *i;

    for (c = 8; c >= 0; c--)
      b[c] = 0;

    b[0] += ((longword)j * i[-(0)]);
    ;
    j = *++i;
    b[0] += ((longword)j * i[-(0)]);
    ;
    b[1] += ((longword)j * i[-(1)]);
    ;
    j = *++i;
    b[0] += ((longword)j * i[-(0)]);
    ;
    b[1] += ((longword)j * i[-(1)]);
    ;
    b[2] += ((longword)j * i[-(2)]);
    ;
    j = *++i;
    b[0] += ((longword)j * i[-(0)]);
    ;
    b[1] += ((longword)j * i[-(1)]);
    ;
    b[2] += ((longword)j * i[-(2)]);
    ;
    b[3] += ((longword)j * i[-(3)]);
    ;
    j = *++i;
    b[0] += ((longword)j * i[-(0)]);
    ;
    b[1] += ((longword)j * i[-(1)]);
    ;
    b[2] += ((longword)j * i[-(2)]);
    ;
    b[3] += ((longword)j * i[-(3)]);
    ;
    b[4] += ((longword)j * i[-(4)]);
    ;
    j = *++i;
    b[0] += ((longword)j * i[-(0)]);
    ;
    b[1] += ((longword)j * i[-(1)]);
    ;
    b[2] += ((longword)j * i[-(2)]);
    ;
    b[3] += ((longword)j * i[-(3)]);
    ;
    b[4] += ((longword)j * i[-(4)]);
    ;
    b[5] += ((longword)j * i[-(5)]);
    ;
    j = *++i;
    b[0] += ((longword)j * i[-(0)]);
    ;
    b[1] += ((longword)j * i[-(1)]);
    ;
    b[2] += ((longword)j * i[-(2)]);
    ;
    b[3] += ((longword)j * i[-(3)]);
    ;
    b[4] += ((longword)j * i[-(4)]);
    ;
    b[5] += ((longword)j * i[-(5)]);
    ;
    b[6] += ((longword)j * i[-(6)]);
    ;
    j = *++i;
    b[0] += ((longword)j * i[-(0)]);
    ;
    b[1] += ((longword)j * i[-(1)]);
    ;
    b[2] += ((longword)j * i[-(2)]);
    ;
    b[3] += ((longword)j * i[-(3)]);
    ;
    b[4] += ((longword)j * i[-(4)]);
    ;
    b[5] += ((longword)j * i[-(5)]);
    ;
    b[6] += ((longword)j * i[-(6)]);
    ;
    b[7] += ((longword)j * i[-(7)]);
    ;

    for (d = 8; d <= 159; d++) {
      j = *++i;

      b[0] += ((longword)j * i[-(0)]);
      ;
      b[1] += ((longword)j * i[-(1)]);
      ;
      b[2] += ((longword)j * i[-(2)]);
      ;
      b[3] += ((longword)j * i[-(3)]);
      ;
      b[4] += ((longword)j * i[-(4)]);
      ;
      b[5] += ((longword)j * i[-(5)]);
      ;
      b[6] += ((longword)j * i[-(6)]);
      ;
      b[7] += ((longword)j * i[-(7)]);
      ;
      b[8] += ((longword)j * i[-(8)]);
      ;
    }

    for (c = 8; c >= 0; c--)
      b[c] <<= 1;
  }

  if (g > 0)
    for (c = 159; c >= 0; c--)
      *a++ <<= g;
}

void H(longword* a, word* b) {
  int c, d, e;
  word f;
  word g[9];
  word h[9];
  word i[9];

  if (a[0] == 0) {
    for (c = 8; c > 0; c--)
      *b++ = 0;
    return;
  }

  f = E(a[0]);
  for (c = 0; c <= 8; c++)
    g[c] = ((a[c] << f) >> (16));

  for (c = 1; c <= 7; c++)
    i[c] = g[c];
  for (c = 0; c <= 8; c++)
    h[c] = g[c];

  for (e = 1; e <= 8; e++, b++) {
    f = h[1];
    f = D(f);
    if (h[0] < f) {
      for (c = e; c <= 8; c++)
        *b++ = 0;
      return;
    }

    *b = F(f, h[0]);

    if (h[1] > 0)
      *b = -*b;
    if (e == 8)
      return;

    f = C(h[1], *b);
    h[0] = A(h[0], f);

    for (d = 1; d <= 8 - e; d++) {
      f = C(i[d], *b);
      h[d] = A(h[d + 1], f);

      f = C(h[d + 1], *b);
      i[d] = A(i[d], f);
    }
  }
}

void I(word* a)

{
  word b;
  int c;

  for (c = 1; c <= 8; c++, a++) {
    b = *a;
    b = D(b);

    if (b < 22118) {
      b >>= 1;
    } else if (b < 31130) {
      b -= 11059;
    } else {
      b -= 26112;
      b <<= 2;
    }

    *a = *a < 0 ? -b : b;
  }
}

void J(word* a) {
  word b;
  b = B(20480, *a);
  b = A(b, 0);
  b = A(b, 256);
  b = ((b) >> (9));
  *a = b > 31 ? 31 - -32 : (b < -32 ? 0 : b - -32);
  a++;
  ;
  b = B(20480, *a);
  b = A(b, 0);
  b = A(b, 256);
  b = ((b) >> (9));
  *a = b > 31 ? 31 - -32 : (b < -32 ? 0 : b - -32);
  a++;
  ;
  b = B(20480, *a);
  b = A(b, 2048);
  b = A(b, 256);
  b = ((b) >> (9));
  *a = b > 15 ? 15 - -16 : (b < -16 ? 0 : b - -16);
  a++;
  ;
  b = B(20480, *a);
  b = A(b, -2560);
  b = A(b, 256);
  b = ((b) >> (9));
  *a = b > 15 ? 15 - -16 : (b < -16 ? 0 : b - -16);
  a++;
  ;

  b = B(13964, *a);
  b = A(b, 94);
  b = A(b, 256);
  b = ((b) >> (9));
  *a = b > 7 ? 7 - -8 : (b < -8 ? 0 : b - -8);
  a++;
  ;
  b = B(15360, *a);
  b = A(b, -1792);
  b = A(b, 256);
  b = ((b) >> (9));
  *a = b > 7 ? 7 - -8 : (b < -8 ? 0 : b - -8);
  a++;
  ;
  b = B(8534, *a);
  b = A(b, -341);
  b = A(b, 256);
  b = ((b) >> (9));
  *a = b > 3 ? 3 - -4 : (b < -4 ? 0 : b - -4);
  a++;
  ;
  b = B(9036, *a);
  b = A(b, -1144);
  b = A(b, 256);
  b = ((b) >> (9));
  *a = b > 3 ? 3 - -4 : (b < -4 ? 0 : b - -4);
  a++;
  ;
}

void K(word* a, word* b) {
  longword c[9];

  G(a, c);
  H(c, b);
  I(b);
  J(b);
}

__kernel

    __attribute__((reqd_work_group_size(1, 1, 1))) void
    L(__global unsigned short* restrict a, __global short* restrict b, __global short* restrict c) {
  word d[160];
  word e[8];
  for (int f = 0; f < 160; f++) {
    d[f] = a[f];
  }

  K(d, e);

  for (int f = 0; f < 160; f++) {
    b[f] = d[f];
  }
  for (int f = 0; f < 8; f++) {
    c[f] = e[f];
  }
}