const __constant ulong Ga[80] = {0x428A2F98D728AE22UL, 0x7137449123EF65CDUL, 0xB5C0FBCFEC4D3B2FUL, 0xE9B5DBA58189DBBCUL, 0x3956C25BF348B538UL, 0x59F111F1B605D019UL, 0x923F82A4AF194F9BUL, 0xAB1C5ED5DA6D8118UL, 0xD807AA98A3030242UL, 0x12835B0145706FBEUL, 0x243185BE4EE4B28CUL, 0x550C7DC3D5FFB4E2UL, 0x72BE5D74F27B896FUL, 0x80DEB1FE3B1696B1UL, 0x9BDC06A725C71235UL, 0xC19BF174CF692694UL, 0xE49B69C19EF14AD2UL, 0xEFBE4786384F25E3UL, 0x0FC19DC68B8CD5B5UL, 0x240CA1CC77AC9C65UL,
                                 0x2DE92C6F592B0275UL, 0x4A7484AA6EA6E483UL, 0x5CB0A9DCBD41FBD4UL, 0x76F988DA831153B5UL, 0x983E5152EE66DFABUL, 0xA831C66D2DB43210UL, 0xB00327C898FB213FUL, 0xBF597FC7BEEF0EE4UL, 0xC6E00BF33DA88FC2UL, 0xD5A79147930AA725UL, 0x06CA6351E003826FUL, 0x142929670A0E6E70UL, 0x27B70A8546D22FFCUL, 0x2E1B21385C26C926UL, 0x4D2C6DFC5AC42AEDUL, 0x53380D139D95B3DFUL, 0x650A73548BAF63DEUL, 0x766A0ABB3C77B2A8UL, 0x81C2C92E47EDAEE6UL, 0x92722C851482353BUL,
                                 0xA2BFE8A14CF10364UL, 0xA81A664BBC423001UL, 0xC24B8B70D0F89791UL, 0xC76C51A30654BE30UL, 0xD192E819D6EF5218UL, 0xD69906245565A910UL, 0xF40E35855771202AUL, 0x106AA07032BBD1B8UL, 0x19A4C116B8D2D0C8UL, 0x1E376C085141AB53UL, 0x2748774CDF8EEB99UL, 0x34B0BCB5E19B48A8UL, 0x391C0CB3C5C95A63UL, 0x4ED8AA4AE3418ACBUL, 0x5B9CCA4F7763E373UL, 0x682E6FF3D6B2B8A3UL, 0x748F82EE5DEFB2FCUL, 0x78A5636F43172F60UL, 0x84C87814A1F0AB72UL, 0x8CC702081A6439ECUL,
                                 0x90BEFFFA23631E28UL, 0xA4506CEBDE82BDE9UL, 0xBEF9A3F7B2C67915UL, 0xC67178F2E372532BUL, 0xCA273ECEEA26619CUL, 0xD186B8C721C0C207UL, 0xEADA7DD6CDE0EB1EUL, 0xF57D4F7FEE6ED178UL, 0x06F067AA72176FBAUL, 0x0A637DC5A2C898A6UL, 0x113F9804BEF90DAEUL, 0x1B710B35131C471BUL, 0x28DB77F523047D84UL, 0x32CAAB7B40C72493UL, 0x3C9EBE0A15C9BEBCUL, 0x431D67C49C100D4CUL, 0x4CC5D4BECB3E42B6UL, 0x597F299CFC657E2AUL, 0x5FCB6FAB3AD6FAECUL, 0x6C44198C4A475817UL};

const __constant ulong Gb[8] = {0x6A09E667F3BCC908UL, 0xBB67AE8584CAA73BUL, 0x3C6EF372FE94F82BUL, 0xA54FF53A5F1D36F1UL, 0x510E527FADE682D1UL, 0x9B05688C2B3E6C1FUL, 0x1F83D9ABFB41BD6BUL, 0x5BE0CD19137E2179UL};
uint A(uint a, uint b, uint c) {
  return (uint)(((((long)a) << 32) | (long)b) >> (c & 31));
}
uint2 B(uint2 a, uint2 b, uint c) {
  return (uint2){(uint)(((((long)a) << 32) | (long)b) >> (c31)), (uint)(((((long)a) << 32) | (long)b) >> (c31))};
}

ulong C(const uint2 a, const uint b) {
  return (__builtin_astype(B(a.s10, a, b), ulong));
}
ulong D(const uint2 a, const uint b) {
  return (__builtin_astype(B(a, a.s10, (b - 32)), ulong));
}
void E(const ulong* a, uint b, ulong* c, int d) {
  ulong e;
  int f = 8 - b;

  ulong g = c[f & 7], h = c[(f + 1) & 7], i = c[(f + 2) & 7], j = c[(f + 3) & 7];
  ulong k = c[(f + 4) & 7], l = c[(f + 5) & 7], m = c[(f + 6) & 7], n = c[(f + 7) & 7];

  e = n + (C(__builtin_astype(k, uint2), 14) ^ C(__builtin_astype(k, uint2), 18) ^ D(__builtin_astype(k, uint2), 41)) + bitselect(m, l, k) + a[d] + Ga[d];
  c[(3 + f) & 7] = j + e;
  c[(7 + f) & 7] = e + (C(__builtin_astype(g, uint2), 28) ^ D(__builtin_astype(g, uint2), 34) ^ D(__builtin_astype(g, uint2), 39)) + bitselect(i, h, (g ^ i));
}

void F(ulong* a, ulong* b) {
  ulong c[80], d[8];

  for (int e = 0; e < 8; ++e)
    d[e] = b[e];

  for (int e = 0; e < 16; ++e)
    c[e] = a[e];

  for (int e = 16; e < 80; ++e)
    c[e] = (C(__builtin_astype(c[e - 2], uint2), 19) ^ D(__builtin_astype(c[e - 2], uint2), 61) ^ ((c[e - 2]) >> 6)) + c[e - 7] + (C(__builtin_astype(c[e - 15], uint2), 1) ^ C(__builtin_astype(c[e - 15], uint2), 8) ^ ((c[e - 15]) >> 7)) + c[e - 16];

  for (int e = 0; e < 80; e += 8) {
    for (int f = 0; f < 8; ++f) {
      E(c, f, d, e + f);
    }
  }

  for (int e = 0; e < 8; ++e)
    b[e] += d[e];
}