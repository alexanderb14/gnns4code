bool A(int2 a, int b, int c, int d, int e, int f) {
  if (a.x < f || a.y < f)
    return true;

  if (a.x >= d - f || a.y >= e - f)
    return true;

  return false;
}
float B(float a, float b) {
  return sqrt(a * a + b * b);
}

float C(global const uchar* a, int b, int c, int d, int e, constant const float* f, private int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  const int2 j = {h i};
  b /= sizeof(uchar);

  const int k = g / 2;

  if (A(j, b, c, d, e, k))
    return 0;

  float l = 0;
  int m = 0;

  switch (k) {
    case 1: {
      for (int n = -1; n <= 1; n++)
        for (int o = -1; o <= 1; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 2: {
      for (int n = -2; n <= 2; n++)
        for (int o = -2; o <= 2; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 3: {
      for (int n = -3; n <= 3; n++)
        for (int o = -3; o <= 3; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 4: {
      for (int n = -4; n <= 4; n++)
        for (int o = -4; o <= 4; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 5: {
      for (int n = -5; n <= 5; n++)
        for (int o = -5; o <= 5; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 6: {
      for (int n = -6; n <= 6; n++)
        for (int o = -6; o <= 6; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 7: {
      for (int n = -7; n <= 7; n++)
        for (int o = -7; o <= 7; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 8: {
      for (int n = -8; n <= 8; n++)
        for (int o = -8; o <= 8; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 9: {
      for (int n = -9; n <= 9; n++)
        for (int o = -9; o <= 9; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 10: {
      for (int n = -10; n <= 10; n++)
        for (int o = -10; o <= 10; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 11: {
      for (int n = -11; n <= 11; n++)
        for (int o = -11; o <= 11; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 12: {
      for (int n = -12; n <= 12; n++)
        for (int o = -12; o <= 12; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 13: {
      for (int n = -13; n <= 13; n++)
        for (int o = -13; o <= 13; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 14: {
      for (int n = -14; n <= 14; n++)
        for (int o = -14; o <= 14; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 15: {
      for (int n = -15; n <= 15; n++)
        for (int o = -15; o <= 15; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 16: {
      for (int n = -16; n <= 16; n++)
        for (int o = -16; o <= 16; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 17: {
      for (int n = -17; n <= 17; n++)
        for (int o = -17; o <= 17; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 18: {
      for (int n = -18; n <= 18; n++)
        for (int o = -18; o <= 18; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 19: {
      for (int n = -19; n <= 19; n++)
        for (int o = -19; o <= 19; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 20: {
      for (int n = -20; n <= 20; n++)
        for (int o = -20; o <= 20; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 21: {
      for (int n = -21; n <= 21; n++)
        for (int o = -21; o <= 21; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 22: {
      for (int n = -22; n <= 22; n++)
        for (int o = -22; o <= 22; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 23: {
      for (int n = -23; n <= 23; n++)
        for (int o = -23; o <= 23; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 24: {
      for (int n = -24; n <= 24; n++)
        for (int o = -24; o <= 24; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 25: {
      for (int n = -25; n <= 25; n++)
        for (int o = -25; o <= 25; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 26: {
      for (int n = -26; n <= 26; n++)
        for (int o = -26; o <= 26; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 27: {
      for (int n = -27; n <= 27; n++)
        for (int o = -27; o <= 27; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 28: {
      for (int n = -28; n <= 28; n++)
        for (int o = -28; o <= 28; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 29: {
      for (int n = -29; n <= 29; n++)
        for (int o = -29; o <= 29; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 30: {
      for (int n = -30; n <= 30; n++)
        for (int o = -30; o <= 30; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
    case 31: {
      for (int n = -31; n <= 31; n++)
        for (int o = -31; o <= 31; o++)
          l += f[m++] * convert_float(a[(j + (int2)(o, n)).y * b + (j + (int2)(o, n)).x]);
    } break;
  }

  return l;
}

void D(global const uchar* a, global uchar* b, int c, int d, int e, int f, constant const float* g, private int h) {
  float i = C(a, c, d, e, f, g, h);

  b[get_global_id(1) * d / sizeof(uchar) + get_global_id(0)] = convert_uchar_sat(i);
}

kernel void E(global const uchar* a, global uchar* b, int c, int d, int e, int f, constant const float* g, private int h) {
  const int i = get_global_id(0);
  const int j = get_global_id(1);
  const int2 k = {i j};
  c /= sizeof(uchar);

  if (A(k, c, d, e, f, h))
    return;

 private
  float l = 0;
  int m = 0;

  switch (h) {
    case 1: {
      for (int n = -1; n <= 1; n++)
        for (int o = -1; o <= 1; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 2: {
      for (int n = -2; n <= 2; n++)
        for (int o = -2; o <= 2; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 3: {
      for (int n = -3; n <= 3; n++)
        for (int o = -3; o <= 3; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 4: {
      for (int n = -4; n <= 4; n++)
        for (int o = -4; o <= 4; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 5: {
      for (int n = -5; n <= 5; n++)
        for (int o = -5; o <= 5; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 6: {
      for (int n = -6; n <= 6; n++)
        for (int o = -6; o <= 6; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 7: {
      for (int n = -7; n <= 7; n++)
        for (int o = -7; o <= 7; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 8: {
      for (int n = -8; n <= 8; n++)
        for (int o = -8; o <= 8; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 9: {
      for (int n = -9; n <= 9; n++)
        for (int o = -9; o <= 9; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 10: {
      for (int n = -10; n <= 10; n++)
        for (int o = -10; o <= 10; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 11: {
      for (int n = -11; n <= 11; n++)
        for (int o = -11; o <= 11; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 12: {
      for (int n = -12; n <= 12; n++)
        for (int o = -12; o <= 12; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 13: {
      for (int n = -13; n <= 13; n++)
        for (int o = -13; o <= 13; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 14: {
      for (int n = -14; n <= 14; n++)
        for (int o = -14; o <= 14; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 15: {
      for (int n = -15; n <= 15; n++)
        for (int o = -15; o <= 15; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 16: {
      for (int n = -16; n <= 16; n++)
        for (int o = -16; o <= 16; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 17: {
      for (int n = -17; n <= 17; n++)
        for (int o = -17; o <= 17; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 18: {
      for (int n = -18; n <= 18; n++)
        for (int o = -18; o <= 18; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 19: {
      for (int n = -19; n <= 19; n++)
        for (int o = -19; o <= 19; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 20: {
      for (int n = -20; n <= 20; n++)
        for (int o = -20; o <= 20; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 21: {
      for (int n = -21; n <= 21; n++)
        for (int o = -21; o <= 21; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 22: {
      for (int n = -22; n <= 22; n++)
        for (int o = -22; o <= 22; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 23: {
      for (int n = -23; n <= 23; n++)
        for (int o = -23; o <= 23; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 24: {
      for (int n = -24; n <= 24; n++)
        for (int o = -24; o <= 24; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 25: {
      for (int n = -25; n <= 25; n++)
        for (int o = -25; o <= 25; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 26: {
      for (int n = -26; n <= 26; n++)
        for (int o = -26; o <= 26; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 27: {
      for (int n = -27; n <= 27; n++)
        for (int o = -27; o <= 27; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 28: {
      for (int n = -28; n <= 28; n++)
        for (int o = -28; o <= 28; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 29: {
      for (int n = -29; n <= 29; n++)
        for (int o = -29; o <= 29; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 30: {
      for (int n = -30; n <= 30; n++)
        for (int o = -30; o <= 30; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
    case 31: {
      for (int n = -31; n <= 31; n++)
        for (int o = -31; o <= 31; o++)
          l += g[m++] * convert_float(a[(k + (int2)(o, n)).y * c + (k + (int2)(o, n)).x]);
    } break;
  }

  b[get_global_id(1) * d / sizeof(uchar) + get_global_id(0)] = convert_uchar_sat(l);
}

kernel void F(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  constant const float g[9] = {1.f / 16, 2.f / 16, 1.f / 16, 2.f / 16, 4.f / 16, 2.f / 16, 1.f / 16, 2.f / 16, 1.f / 16};

  D(a, b, c, d, e, f, g, 3);
}

kernel void G(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  constant const float g[25] = {2.f / 571, 7.f / 571, 12.f / 571, 7.f / 571, 2.f / 571, 7.f / 571, 31.f / 571, 52.f / 571, 31.f / 571, 7.f / 571, 12.f / 571, 52.f / 571, 127.f / 571, 52.f / 571, 12.f / 571, 7.f / 571, 31.f / 571, 52.f / 571, 31.f / 571, 7.f / 571, 2.f / 571, 7.f / 571, 12.f / 571, 7.f / 571, 2.f / 571};

  D(a, b, c, d, e, f, g, 5);
}

kernel void H(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  constant const float g[9] = {-1, -2, -1, 0, 0, 0, 1, 2, 1};

  D(a, b, c, d, e, f, g, 3);
}

kernel void I(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  constant const float g[9] = {1, 0, -1, 2, 0, -2, 1, 0, -1};

  D(a, b, c, d, e, f, g, 3);
}

kernel void J(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  constant const float g[25] = {-1, -4, -6, -4, -1, -2, -8, -12, -8, -2, 0, 0, 0, 0, 0, 2, 8, 12, 8, 2, 1, 4, 6, 4, 1};

  D(a, b, c, d, e, f, g, 5);
}

kernel void K(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  constant const float g[25] = {1, 2, 0, -2, -1, 4, 8, 0, -8, -4, 6, 12, 0, -12, -6, 4, 8, 0, -8, -4, 1, 2, 0, -2, -1};

  D(a, b, c, d, e, f, g, 5);
}

kernel void L(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  constant const float g[9] = {-1, 0, 1, 0, 0, 0, 1, 0, -1};

  D(a, b, c, d, e, f, g, 3);
}

kernel void M(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  constant const float g[25] = {-1, -2, 0, 2, 1, -2, -4, 0, 4, 2, 0, 0, 0, 0, 0, 2, 4, 0, -4, -2, 1, 2, 0, -2, -1};

  D(a, b, c, d, e, f, g, 5);
}

kernel void N(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  constant const float g[9] = {-1, -2, -1, 0, 0, 0, 1, 2, 1};

  constant const float h[9] = {1, 0, -1, 2, 0, -2, 1, 0, -1};

  float i = C(a, c, d, e, f, g, 3);
  float j = C(a, c, d, e, f, h, 3);

  float k = B(i, j);

  b[get_global_id(1) * d / sizeof(uchar) + get_global_id(0)] = convert_uchar_sat(k);
}

kernel void O(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  constant const float g[25] = {-1, -4, -6, -4, -1, -2, -8, -12, -8, -2, 0, 0, 0, 0, 0, 2, 8, 12, 8, 2, 1, 4, 6, 4, 1};

  constant const float h[25] = {1, 2, 0, -2, -1, 4, 8, 0, -8, -4, 6, 12, 0, -12, -6, 4, 8, 0, -8, -4, 1, 2, 0, -2, -1};

  float i = C(a, c, d, e, f, g, 5);
  float j = C(a, c, d, e, f, h, 5);

  b[get_global_id(1) * d / sizeof(uchar) + get_global_id(0)] = convert_uchar_sat(B(i, j));
}

kernel void P(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  constant const float g[9] = {-1, -1, -1, 0, 0, 0, 1, 1, 1};

  D(a, b, c, d, e, f, g, 3);
}

kernel void Q(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  constant const float g[9] = {1, 0, -1, 1, 0, -1, 1, 0, -1};

  D(a, b, c, d, e, f, g, 3);
}

kernel void R(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  constant const float g[9] = {-1, -1, -1, 0, 0, 0, 1, 1, 1};

  constant const float h[9] = {1, 0, -1, 1, 0, -1, 1, 0, -1};

  float i = C(a, c, d, e, f, g, 3);
  float j = C(a, c, d, e, f, h, 3);

  b[get_global_id(1) * d / sizeof(uchar) + get_global_id(0)] = convert_uchar_sat(B(i, j));
}

kernel void S(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  constant const float g[9] = {-3, -10, -3, 0, 0, 0, 3, 10, 3};

  D(a, b, c, d, e, f, g, 3);
}

kernel void T(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  constant const float g[9] = {-3, 0, 3, -10, 0, 10, -3, 0, 3};

  D(a, b, c, d, e, f, g, 3);
}

kernel void U(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  constant const float g[9] = {-3, -10, -3, 0, 0, 0, 3, 10, 3};

  constant const float h[9] = {-3, 0, 3, -10, 0, 10, -3, 0, 3};

  float i = C(a, c, d, e, f, g, 3);
  float j = C(a, c, d, e, f, h, 3);

  b[get_global_id(1) * d / sizeof(uchar) + get_global_id(0)] = convert_uchar_sat(B(i, j));
}

kernel void V(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  constant const float g[9] = {-1, -1, -1, -1, 8, -1, -1, -1, -1};

  D(a, b, c, d, e, f, g, 3);
}

kernel void W(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  constant const float g[25] = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 24, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};

  D(a, b, c, d, e, f, g, 5);
}

kernel void X(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  constant const float g[9] = {-1, -1, -1, -1, 8, -1, -1, -1, -1};

  D(a, b, c, d, e, f, g, 3);
}

kernel void Y(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  constant const float g[25] = {-1, -3, -4, -3, -1, -3, 0, 6, 0, -3, -4, 6, 20, 6, -4, -3, 0, 6, 0, -3, -1, -3, -4, -3, -1};

  D(a, b, c, d, e, f, g, 5);
}

kernel void Z(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  constant const float g[9] = {-1.f / 8, -1.f / 8, -1.f / 8, -1.f / 8, 16.f / 8, -1.f / 8, -1.f / 8, -1.f / 8, -1.f / 8};

  D(a, b, c, d, e, f, g, 3);
}
kernel void AA(global const uchar* a, global uchar* b, int c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  const int2 j = {h i};
  c /= sizeof(uchar);

  const int k = g / 2;
  float l = 0;
  float m = 1.f / (g * g);

  if (A(j, c, d, e, f, k))
    return;

  switch (k) {
    case 1: {
      for (int n = -1; n <= 1; n++)
        for (int o = -1; o <= 1; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 2: {
      for (int n = -2; n <= 2; n++)
        for (int o = -2; o <= 2; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 3: {
      for (int n = -3; n <= 3; n++)
        for (int o = -3; o <= 3; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 4: {
      for (int n = -4; n <= 4; n++)
        for (int o = -4; o <= 4; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 5: {
      for (int n = -5; n <= 5; n++)
        for (int o = -5; o <= 5; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 6: {
      for (int n = -6; n <= 6; n++)
        for (int o = -6; o <= 6; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 7: {
      for (int n = -7; n <= 7; n++)
        for (int o = -7; o <= 7; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 8: {
      for (int n = -8; n <= 8; n++)
        for (int o = -8; o <= 8; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 9: {
      for (int n = -9; n <= 9; n++)
        for (int o = -9; o <= 9; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 10: {
      for (int n = -10; n <= 10; n++)
        for (int o = -10; o <= 10; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 11: {
      for (int n = -11; n <= 11; n++)
        for (int o = -11; o <= 11; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 12: {
      for (int n = -12; n <= 12; n++)
        for (int o = -12; o <= 12; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 13: {
      for (int n = -13; n <= 13; n++)
        for (int o = -13; o <= 13; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 14: {
      for (int n = -14; n <= 14; n++)
        for (int o = -14; o <= 14; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 15: {
      for (int n = -15; n <= 15; n++)
        for (int o = -15; o <= 15; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 16: {
      for (int n = -16; n <= 16; n++)
        for (int o = -16; o <= 16; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 17: {
      for (int n = -17; n <= 17; n++)
        for (int o = -17; o <= 17; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 18: {
      for (int n = -18; n <= 18; n++)
        for (int o = -18; o <= 18; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 19: {
      for (int n = -19; n <= 19; n++)
        for (int o = -19; o <= 19; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 20: {
      for (int n = -20; n <= 20; n++)
        for (int o = -20; o <= 20; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 21: {
      for (int n = -21; n <= 21; n++)
        for (int o = -21; o <= 21; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 22: {
      for (int n = -22; n <= 22; n++)
        for (int o = -22; o <= 22; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 23: {
      for (int n = -23; n <= 23; n++)
        for (int o = -23; o <= 23; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 24: {
      for (int n = -24; n <= 24; n++)
        for (int o = -24; o <= 24; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 25: {
      for (int n = -25; n <= 25; n++)
        for (int o = -25; o <= 25; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 26: {
      for (int n = -26; n <= 26; n++)
        for (int o = -26; o <= 26; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 27: {
      for (int n = -27; n <= 27; n++)
        for (int o = -27; o <= 27; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 28: {
      for (int n = -28; n <= 28; n++)
        for (int o = -28; o <= 28; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 29: {
      for (int n = -29; n <= 29; n++)
        for (int o = -29; o <= 29; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 30: {
      for (int n = -30; n <= 30; n++)
        for (int o = -30; o <= 30; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
    case 31: {
      for (int n = -31; n <= 31; n++)
        for (int o = -31; o <= 31; o++)
          l += m * convert_float(a[(j + (int2)(o, n)).y * c + (j + (int2)(o, n)).x]);
    } break;
  }

  b[get_global_id(1) * d / sizeof(uchar) + get_global_id(0)] = convert_uchar_sat(l);
}

float AB(float* a) {
  float b;

  b = a[0];
  a[0] = min(a[0], a[3]);
  a[3] = max(b, a[3]);
  ;
  b = a[1];
  a[1] = min(a[1], a[4]);
  a[4] = max(b, a[4]);
  ;
  b = a[2];
  a[2] = min(a[2], a[5]);
  a[5] = max(b, a[5]);
  ;
  b = a[0];
  a[0] = min(a[0], a[1]);
  a[1] = max(b, a[1]);
  ;
  b = a[0];
  a[0] = min(a[0], a[2]);
  a[2] = max(b, a[2]);
  ;
  ;
  b = a[4];
  a[4] = min(a[4], a[5]);
  a[5] = max(b, a[5]);
  ;
  b = a[3];
  a[3] = min(a[3], a[5]);
  a[5] = max(b, a[5]);
  ;
  ;
  ;
  b = a[1];
  a[1] = min(a[1], a[2]);
  a[2] = max(b, a[2]);
  ;
  b = a[3];
  a[3] = min(a[3], a[4]);
  a[4] = max(b, a[4]);
  ;
  b = a[1];
  a[1] = min(a[1], a[3]);
  a[3] = max(b, a[3]);
  ;
  b = a[1];
  a[1] = min(a[1], a[6]);
  a[6] = max(b, a[6]);
  ;
  ;
  b = a[4];
  a[4] = min(a[4], a[6]);
  a[6] = max(b, a[6]);
  ;
  b = a[2];
  a[2] = min(a[2], a[6]);
  a[6] = max(b, a[6]);
  ;
  ;
  ;
  b = a[2];
  a[2] = min(a[2], a[3]);
  a[3] = max(b, a[3]);
  ;
  b = a[4];
  a[4] = min(a[4], a[7]);
  a[7] = max(b, a[7]);
  ;
  b = a[2];
  a[2] = min(a[2], a[4]);
  a[4] = max(b, a[4]);
  ;
  b = a[3];
  a[3] = min(a[3], a[7]);
  a[7] = max(b, a[7]);
  ;
  ;
  b = a[4];
  a[4] = min(a[4], a[8]);
  a[8] = max(b, a[8]);
  ;
  b = a[3];
  a[3] = min(a[3], a[8]);
  a[8] = max(b, a[8]);
  ;
  ;
  b = a[3];
  a[3] = min(a[3], a[4]);
  a[4] = max(b, a[4]);
  ;
  ;

  return a[4];
}

float AC(float* a) {
  float b;

  b = a[0];
  a[0] = min(a[0], a[7]);
  a[7] = max(b, a[7]);
  ;
  b = a[1];
  a[1] = min(a[1], a[8]);
  a[8] = max(b, a[8]);
  ;
  b = a[2];
  a[2] = min(a[2], a[9]);
  a[9] = max(b, a[9]);
  ;
  b = a[3];
  a[3] = min(a[3], a[10]);
  a[10] = max(b, a[10]);
  ;
  b = a[4];
  a[4] = min(a[4], a[11]);
  a[11] = max(b, a[11]);
  ;
  b = a[5];
  a[5] = min(a[5], a[12]);
  a[12] = max(b, a[12]);
  ;
  b = a[6];
  a[6] = min(a[6], a[13]);
  a[13] = max(b, a[13]);
  ;
  b = a[4];
  a[4] = min(a[4], a[5]);
  a[5] = max(b, a[5]);
  ;
  b = a[4];
  a[4] = min(a[4], a[6]);
  a[6] = max(b, a[6]);
  ;
  ;
  b = a[3];
  a[3] = min(a[3], a[4]);
  a[4] = max(b, a[4]);
  ;
  ;
  b = a[2];
  a[2] = min(a[2], a[3]);
  a[3] = max(b, a[3]);
  ;
  ;
  b = a[1];
  a[1] = min(a[1], a[2]);
  a[2] = max(b, a[2]);
  ;
  ;
  b = a[0];
  a[0] = min(a[0], a[1]);
  a[1] = max(b, a[1]);
  ;
  ;
  b = a[8];
  a[8] = min(a[8], a[9]);
  a[9] = max(b, a[9]);
  ;
  b = a[7];
  a[7] = min(a[7], a[9]);
  a[9] = max(b, a[9]);
  ;
  ;
  b = a[9];
  a[9] = min(a[9], a[10]);
  a[10] = max(b, a[10]);
  ;
  ;
  b = a[10];
  a[10] = min(a[10], a[11]);
  a[11] = max(b, a[11]);
  ;
  ;
  b = a[11];
  a[11] = min(a[11], a[12]);
  a[12] = max(b, a[12]);
  ;
  ;
  b = a[12];
  a[12] = min(a[12], a[13]);
  a[13] = max(b, a[13]);
  ;
  ;
  ;
  b = a[7];
  a[7] = min(a[7], a[14]);
  a[14] = max(b, a[14]);
  ;
  b = a[1];
  a[1] = min(a[1], a[8]);
  a[8] = max(b, a[8]);
  ;
  b = a[2];
  a[2] = min(a[2], a[9]);
  a[9] = max(b, a[9]);
  ;
  b = a[3];
  a[3] = min(a[3], a[10]);
  a[10] = max(b, a[10]);
  ;
  b = a[4];
  a[4] = min(a[4], a[11]);
  a[11] = max(b, a[11]);
  ;
  b = a[5];
  a[5] = min(a[5], a[12]);
  a[12] = max(b, a[12]);
  ;
  b = a[6];
  a[6] = min(a[6], a[14]);
  a[14] = max(b, a[14]);
  ;
  b = a[5];
  a[5] = min(a[5], a[6]);
  a[6] = max(b, a[6]);
  ;
  b = a[5];
  a[5] = min(a[5], a[7]);
  a[7] = max(b, a[7]);
  ;
  ;
  b = a[4];
  a[4] = min(a[4], a[5]);
  a[5] = max(b, a[5]);
  ;
  ;
  b = a[3];
  a[3] = min(a[3], a[4]);
  a[4] = max(b, a[4]);
  ;
  ;
  b = a[2];
  a[2] = min(a[2], a[3]);
  a[3] = max(b, a[3]);
  ;
  ;
  b = a[1];
  a[1] = min(a[1], a[2]);
  a[2] = max(b, a[2]);
  ;
  ;
  b = a[9];
  a[9] = min(a[9], a[10]);
  a[10] = max(b, a[10]);
  ;
  b = a[8];
  a[8] = min(a[8], a[10]);
  a[10] = max(b, a[10]);
  ;
  ;
  b = a[10];
  a[10] = min(a[10], a[11]);
  a[11] = max(b, a[11]);
  ;
  ;
  b = a[11];
  a[11] = min(a[11], a[12]);
  a[12] = max(b, a[12]);
  ;
  ;
  b = a[12];
  a[12] = min(a[12], a[14]);
  a[14] = max(b, a[14]);
  ;
  ;
  ;
  b = a[2];
  a[2] = min(a[2], a[8]);
  a[8] = max(b, a[8]);
  ;
  b = a[3];
  a[3] = min(a[3], a[9]);
  a[9] = max(b, a[9]);
  ;
  b = a[4];
  a[4] = min(a[4], a[10]);
  a[10] = max(b, a[10]);
  ;
  b = a[5];
  a[5] = min(a[5], a[11]);
  a[11] = max(b, a[11]);
  ;
  b = a[6];
  a[6] = min(a[6], a[12]);
  a[12] = max(b, a[12]);
  ;
  b = a[7];
  a[7] = min(a[7], a[15]);
  a[15] = max(b, a[15]);
  ;
  b = a[5];
  a[5] = min(a[5], a[6]);
  a[6] = max(b, a[6]);
  ;
  b = a[5];
  a[5] = min(a[5], a[7]);
  a[7] = max(b, a[7]);
  ;
  ;
  b = a[4];
  a[4] = min(a[4], a[5]);
  a[5] = max(b, a[5]);
  ;
  ;
  b = a[3];
  a[3] = min(a[3], a[4]);
  a[4] = max(b, a[4]);
  ;
  ;
  b = a[2];
  a[2] = min(a[2], a[3]);
  a[3] = max(b, a[3]);
  ;
  ;
  b = a[9];
  a[9] = min(a[9], a[10]);
  a[10] = max(b, a[10]);
  ;
  b = a[8];
  a[8] = min(a[8], a[10]);
  a[10] = max(b, a[10]);
  ;
  ;
  b = a[10];
  a[10] = min(a[10], a[11]);
  a[11] = max(b, a[11]);
  ;
  ;
  b = a[11];
  a[11] = min(a[11], a[12]);
  a[12] = max(b, a[12]);
  ;
  ;
  b = a[12];
  a[12] = min(a[12], a[15]);
  a[15] = max(b, a[15]);
  ;
  ;
  ;
  b = a[8];
  a[8] = min(a[8], a[16]);
  a[16] = max(b, a[16]);
  ;
  b = a[3];
  a[3] = min(a[3], a[9]);
  a[9] = max(b, a[9]);
  ;
  b = a[4];
  a[4] = min(a[4], a[10]);
  a[10] = max(b, a[10]);
  ;
  b = a[5];
  a[5] = min(a[5], a[11]);
  a[11] = max(b, a[11]);
  ;
  b = a[6];
  a[6] = min(a[6], a[12]);
  a[12] = max(b, a[12]);
  ;
  b = a[7];
  a[7] = min(a[7], a[16]);
  a[16] = max(b, a[16]);
  ;
  b = a[6];
  a[6] = min(a[6], a[7]);
  a[7] = max(b, a[7]);
  ;
  b = a[6];
  a[6] = min(a[6], a[8]);
  a[8] = max(b, a[8]);
  ;
  ;
  b = a[5];
  a[5] = min(a[5], a[6]);
  a[6] = max(b, a[6]);
  ;
  ;
  b = a[4];
  a[4] = min(a[4], a[5]);
  a[5] = max(b, a[5]);
  ;
  ;
  b = a[3];
  a[3] = min(a[3], a[4]);
  a[4] = max(b, a[4]);
  ;
  ;
  b = a[10];
  a[10] = min(a[10], a[11]);
  a[11] = max(b, a[11]);
  ;
  b = a[9];
  a[9] = min(a[9], a[11]);
  a[11] = max(b, a[11]);
  ;
  ;
  b = a[11];
  a[11] = min(a[11], a[12]);
  a[12] = max(b, a[12]);
  ;
  ;
  b = a[12];
  a[12] = min(a[12], a[16]);
  a[16] = max(b, a[16]);
  ;
  ;
  ;
  b = a[4];
  a[4] = min(a[4], a[9]);
  a[9] = max(b, a[9]);
  ;
  b = a[5];
  a[5] = min(a[5], a[10]);
  a[10] = max(b, a[10]);
  ;
  b = a[6];
  a[6] = min(a[6], a[11]);
  a[11] = max(b, a[11]);
  ;
  b = a[7];
  a[7] = min(a[7], a[12]);
  a[12] = max(b, a[12]);
  ;
  b = a[8];
  a[8] = min(a[8], a[17]);
  a[17] = max(b, a[17]);
  ;
  b = a[6];
  a[6] = min(a[6], a[7]);
  a[7] = max(b, a[7]);
  ;
  b = a[6];
  a[6] = min(a[6], a[8]);
  a[8] = max(b, a[8]);
  ;
  ;
  b = a[5];
  a[5] = min(a[5], a[6]);
  a[6] = max(b, a[6]);
  ;
  ;
  b = a[4];
  a[4] = min(a[4], a[5]);
  a[5] = max(b, a[5]);
  ;
  ;
  b = a[10];
  a[10] = min(a[10], a[11]);
  a[11] = max(b, a[11]);
  ;
  b = a[9];
  a[9] = min(a[9], a[11]);
  a[11] = max(b, a[11]);
  ;
  ;
  b = a[11];
  a[11] = min(a[11], a[12]);
  a[12] = max(b, a[12]);
  ;
  ;
  b = a[12];
  a[12] = min(a[12], a[17]);
  a[17] = max(b, a[17]);
  ;
  ;
  ;
  b = a[9];
  a[9] = min(a[9], a[18]);
  a[18] = max(b, a[18]);
  ;
  b = a[5];
  a[5] = min(a[5], a[10]);
  a[10] = max(b, a[10]);
  ;
  b = a[6];
  a[6] = min(a[6], a[11]);
  a[11] = max(b, a[11]);
  ;
  b = a[7];
  a[7] = min(a[7], a[12]);
  a[12] = max(b, a[12]);
  ;
  b = a[8];
  a[8] = min(a[8], a[18]);
  a[18] = max(b, a[18]);
  ;
  b = a[7];
  a[7] = min(a[7], a[8]);
  a[8] = max(b, a[8]);
  ;
  b = a[7];
  a[7] = min(a[7], a[9]);
  a[9] = max(b, a[9]);
  ;
  ;
  b = a[6];
  a[6] = min(a[6], a[7]);
  a[7] = max(b, a[7]);
  ;
  ;
  b = a[5];
  a[5] = min(a[5], a[6]);
  a[6] = max(b, a[6]);
  ;
  ;
  b = a[11];
  a[11] = min(a[11], a[12]);
  a[12] = max(b, a[12]);
  ;
  b = a[10];
  a[10] = min(a[10], a[12]);
  a[12] = max(b, a[12]);
  ;
  ;
  b = a[12];
  a[12] = min(a[12], a[18]);
  a[18] = max(b, a[18]);
  ;
  ;
  ;
  b = a[6];
  a[6] = min(a[6], a[10]);
  a[10] = max(b, a[10]);
  ;
  b = a[7];
  a[7] = min(a[7], a[11]);
  a[11] = max(b, a[11]);
  ;
  b = a[8];
  a[8] = min(a[8], a[12]);
  a[12] = max(b, a[12]);
  ;
  b = a[9];
  a[9] = min(a[9], a[19]);
  a[19] = max(b, a[19]);
  ;
  b = a[7];
  a[7] = min(a[7], a[8]);
  a[8] = max(b, a[8]);
  ;
  b = a[7];
  a[7] = min(a[7], a[9]);
  a[9] = max(b, a[9]);
  ;
  ;
  b = a[6];
  a[6] = min(a[6], a[7]);
  a[7] = max(b, a[7]);
  ;
  ;
  b = a[11];
  a[11] = min(a[11], a[12]);
  a[12] = max(b, a[12]);
  ;
  b = a[10];
  a[10] = min(a[10], a[12]);
  a[12] = max(b, a[12]);
  ;
  ;
  b = a[12];
  a[12] = min(a[12], a[19]);
  a[19] = max(b, a[19]);
  ;
  ;
  ;
  b = a[10];
  a[10] = min(a[10], a[20]);
  a[20] = max(b, a[20]);
  ;
  b = a[7];
  a[7] = min(a[7], a[11]);
  a[11] = max(b, a[11]);
  ;
  b = a[8];
  a[8] = min(a[8], a[12]);
  a[12] = max(b, a[12]);
  ;
  b = a[9];
  a[9] = min(a[9], a[20]);
  a[20] = max(b, a[20]);
  ;
  b = a[8];
  a[8] = min(a[8], a[9]);
  a[9] = max(b, a[9]);
  ;
  b = a[8];
  a[8] = min(a[8], a[10]);
  a[10] = max(b, a[10]);
  ;
  ;
  b = a[7];
  a[7] = min(a[7], a[8]);
  a[8] = max(b, a[8]);
  ;
  ;
  b = a[12];
  a[12] = min(a[12], a[20]);
  a[20] = max(b, a[20]);
  ;
  b = a[11];
  a[11] = min(a[11], a[20]);
  a[20] = max(b, a[20]);
  ;
  ;
  ;
  b = a[8];
  a[8] = min(a[8], a[11]);
  a[11] = max(b, a[11]);
  ;
  b = a[9];
  a[9] = min(a[9], a[12]);
  a[12] = max(b, a[12]);
  ;
  b = a[10];
  a[10] = min(a[10], a[21]);
  a[21] = max(b, a[21]);
  ;
  b = a[8];
  a[8] = min(a[8], a[9]);
  a[9] = max(b, a[9]);
  ;
  b = a[8];
  a[8] = min(a[8], a[10]);
  a[10] = max(b, a[10]);
  ;
  ;
  b = a[12];
  a[12] = min(a[12], a[21]);
  a[21] = max(b, a[21]);
  ;
  b = a[11];
  a[11] = min(a[11], a[21]);
  a[21] = max(b, a[21]);
  ;
  ;
  ;
  b = a[9];
  a[9] = min(a[9], a[10]);
  a[10] = max(b, a[10]);
  ;
  b = a[11];
  a[11] = min(a[11], a[12]);
  a[12] = max(b, a[12]);
  ;
  b = a[9];
  a[9] = min(a[9], a[11]);
  a[11] = max(b, a[11]);
  ;
  b = a[9];
  a[9] = min(a[9], a[22]);
  a[22] = max(b, a[22]);
  ;
  ;
  b = a[12];
  a[12] = min(a[12], a[22]);
  a[22] = max(b, a[22]);
  ;
  b = a[10];
  a[10] = min(a[10], a[22]);
  a[22] = max(b, a[22]);
  ;
  ;
  ;
  b = a[10];
  a[10] = min(a[10], a[11]);
  a[11] = max(b, a[11]);
  ;
  b = a[12];
  a[12] = min(a[12], a[23]);
  a[23] = max(b, a[23]);
  ;
  b = a[10];
  a[10] = min(a[10], a[12]);
  a[12] = max(b, a[12]);
  ;
  b = a[11];
  a[11] = min(a[11], a[23]);
  a[23] = max(b, a[23]);
  ;
  ;
  b = a[12];
  a[12] = min(a[12], a[24]);
  a[24] = max(b, a[24]);
  ;
  b = a[11];
  a[11] = min(a[11], a[24]);
  a[24] = max(b, a[24]);
  ;
  ;
  b = a[11];
  a[11] = min(a[11], a[12]);
  a[12] = max(b, a[12]);
  ;
  ;

  return a[12];
}

__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AD(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  const int2 i = {g h};
  c /= sizeof(uchar);

  const int j = get_local_id(1) * get_local_size(0) + get_local_id(0);

  local float k[16 * 16];
  k[j] = convert_float(a[(i).y * c + (i).x]);
  barrier(1);

  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;

  const int q = 3;
  const int r = q / 2;

  if (A(i, c, d, e, f, r))
    return;

  float s[3 * 3];

  int t = 0;
  for (int u = -r; u <= r; u++) {
    int v = h + u;
    if (v < o || v >= p) {
      for (int w = -r; w <= r; w++)
        s[t++] = convert_float(a[(i + (int2)(w, u)).y * c + (i + (int2)(w, u)).x]);
    } else {
      for (int w = -r; w <= r; w++) {
        int x = g + w;
        if (x < m || x >= n)
               s[t++] = convert_float (a[((int2)(x v).y * c + ((int2)(x v).x]);
            else
            {

            int y = v - o;
            int z = x - m;
            s[t++] = k[y * 16 + z];
            }
      }
    }
  }

  float aa = AB(s);

  b[get_global_id(1) * d / sizeof(uchar) + get_global_id(0)] = convert_uchar_sat(aa);
}

kernel void AE(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  const int2 i = {g h};
  c /= sizeof(uchar);

  const int j = 3;
  const int k = j / 2;

  if (A(i, c, d, e, f, k))
    return;

  float l[3 * 3];

  int m = 0;
  for (int n = -k; n <= k; n++)
    for (int o = -k; o <= k; o++)
      l[m++] = convert_float(a[(i + (int2)(o, n)).y * c + (i + (int2)(o, n)).x]);

  float p = AB(l);

  b[get_global_id(1) * d / sizeof(uchar) + get_global_id(0)] = convert_uchar_sat(p);
}

kernel void AF(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  const int2 i = {g h};
  c /= sizeof(uchar);

  const int j = 5;
  const int k = j / 2;

  if (A(i, c, d, e, f, k))
    return;

  float l[5 * 5];

  int m = 0;
  for (int n = -k; n <= k; n++)
    for (int o = -k; o <= k; o++)
      l[m++] = convert_float(a[(i + (int2)(o, n)).y * c + (i + (int2)(o, n)).x]);

  float p = AC(l);

  b[get_global_id(1) * d / sizeof(uchar) + get_global_id(0)] = convert_uchar_sat(p);
}