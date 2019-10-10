uint* A(const uint* a, uint b, uint c[]) {
  uint d = (1 << 8) - 1;
  b *= 8;
  for (uint e = 0; e < b; e += 8) {
    c[e >> 5] |= (a[e / 8] & d) << (32 - 8 - e % 32);
  }
  return c;
}

uint* B(const uint a[], uint* b) {
  const uint c[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
  for (uint d = 0; d < (8 * 4); ++d) {
    b[2 * d] = c[(a[d >> 2] >> ((3 - d % 4) * 8 + 4)) & 0xF];
    b[2 * d + 1] = c[(a[d >> 2] >> ((3 - d % 4) * 8)) & 0xF];
  }
  b[64] = 0;
  return b;
}

uint C(uint a, int b) {
  if (b < 32)
    return (a >> b) | (a << (32 - b));
  return a;
}

uint D(uint a, uint b, uint c) {
  return (a & b) ^ (~a & c);
}

uint E(uint a, uint b, uint c) {
  return (a & b) ^ (a & c) ^ (b & c);
}

uint F(uint a) {
  return C(a, 2) ^ C(a, 13) ^ C(a, 22);
}

uint G(uint a) {
  return C(a, 6) ^ C(a, 11) ^ C(a, 25);
}

uint H(uint a) {
  return C(a, 7) ^ C(a, 18) ^ (a >> 3);
}

uint I(uint a) {
  return C(a, 17) ^ C(a, 19) ^ (a >> 10);
}

void J(uint a[], uint b, uint c[]) {
  uint d[] = {0x428A2F98, 0x71374491, 0xB5C0FBCF, 0xE9B5DBA5, 0x3956C25B, 0x59F111F1, 0x923F82A4, 0xAB1C5ED5, 0xD807AA98, 0x12835B01, 0x243185BE, 0x550C7DC3, 0x72BE5D74, 0x80DEB1FE, 0x9BDC06A7, 0xC19BF174, 0xE49B69C1, 0xEFBE4786, 0x0FC19DC6, 0x240CA1CC, 0x2DE92C6F, 0x4A7484AA, 0x5CB0A9DC, 0x76F988DA, 0x983E5152, 0xA831C66D, 0xB00327C8, 0xBF597FC7, 0xC6E00BF3, 0xD5A79147, 0x06CA6351, 0x14292967,
              0x27B70A85, 0x2E1B2138, 0x4D2C6DFC, 0x53380D13, 0x650A7354, 0x766A0ABB, 0x81C2C92E, 0x92722C85, 0xA2BFE8A1, 0xA81A664B, 0xC24B8B70, 0xC76C51A3, 0xD192E819, 0xD6990624, 0xF40E3585, 0x106AA070, 0x19A4C116, 0x1E376C08, 0x2748774C, 0x34B0BCB5, 0x391C0CB3, 0x4ED8AA4A, 0x5B9CCA4F, 0x682E6FF3, 0x748F82EE, 0x78A5636F, 0x84C87814, 0x8CC70208, 0x90BEFFFA, 0xA4506CEB, 0xBEF9A3F7, 0xC67178F2};
  c[0] = 0x6A09E667;
  c[1] = 0xBB67AE85;
  c[2] = 0x3C6EF372;
  c[3] = 0xA54FF53A;
  c[4] = 0x510E527F;
  c[5] = 0x9B05688C;
  c[6] = 0x1F83D9AB;
  c[7] = 0x5BE0CD19;
  uint e[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  uint f, g, h, i, j, k, l, m;
  uint n, o;
  const uint p = 16;
  a[b >> 5] |= 0x80 << (24 - b % 32);
  a[p - 1] = b;
  for (uint q = 0; q < p; q += 16) {
    f = c[0];
    g = c[1];
    h = c[2];
    i = c[3];
    j = c[4];
    k = c[5];
    l = c[6];
    m = c[7];
    for (uint r = 0; r < 64; r++) {
      if (r < 16)
        e[r] = a[r + q];
      else
        e[r] = I(e[r - 2]) + e[r - 7] + H(e[r - 15]) + e[r - 16];
      n = m + G(j) + D(j, k, l) + d[r] + e[r];
      o = F(f) + E(f, g, h);
      m = l;
      l = k;
      k = j;
      j = i + n;
      i = h;
      h = g;
      g = f;
      f = n + o;
    }
    c[0] += f;
    c[1] += g;
    c[2] += h;
    c[3] += i;
    c[4] += j;
    c[5] += k;
    c[6] += l;
    c[7] += m;
  }
}

uint* K(const uint* a, uint b, uint* c) {
  uint d[8];
  uint e[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

  J(A(a, b, e), b * 8, d);
  return B(d, c);
}

__kernel void L(__global char* a, uint b, uint c, __global char* d, int e, uint f, __global char* g) {
  uint h[65];
  uint i[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  int j, k, l, m, n;
  size_t o = get_global_id(0) + f;
  int p = o == 0 ? 0 : (__clc_floor(log((float)o) / log((float)e)) + 1);
  if (p > c)
    p = c;
  int q = 2 * c - p - 1;

  for (j = 0; j < c - p; ++j)
    i[j] = d[0];

  for (m = o; m && j < c; ++j) {
    i[q - j] = d[m % e];
    m /= e;
  }

  l = c - (p > b ? p : b);
  for (j = 0; j <= l; ++j) {
    n = 1;

    K(i + j, c - j, h);
    for (k = 0; k < 64; ++k) {
      if (a[k] != h[k]) {
        n = 0;
        break;
      }
    }

    if (n)
      for (k = 0; k < c - j; ++k)
        g[k] = i[j + k];
  }
}