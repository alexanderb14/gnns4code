typedef struct {
  unsigned int matrix_a;
  unsigned int mask_b;
  unsigned int mask_c;
  unsigned int seed;
} mt_struct_stripped;
__kernel void A(__global float* a, __global mt_struct_stripped* b, int c) {
  int d = get_global_id(0);

  int e, f, g, h;
  unsigned int i, j, k, l;
  unsigned int m[19], n, o, p;

  n = b[d].matrix_a;
  o = b[d].mask_b;
  p = b[d].mask_c;

  m[0] = b[d].seed;
  for (e = 1; e < 19; e++)
    m[e] = (1812433253U * (m[e - 1] ^ (m[e - 1] >> 30)) + e) & 0xFFFFFFFFU;

  e = 0;
  j = m[0];
  for (h = 0; h < c; h++) {
    f = e + 1;
    g = e + 9;
    if (f >= 19)
      f -= 19;
    if (g >= 19)
      g -= 19;
    i = j;
    j = m[f];
    k = m[g];

    l = (i & 0xFFFFFFFEU) | (j & 0x1U);
    l = k ^ (l >> 1) ^ ((l & 1) ? n : 0);

    m[e] = l;
    e = f;

    l ^= (l >> 12);
    l ^= (l << 7) & o;
    l ^= (l << 15) & p;
    l ^= (l >> 18);

    a[d + h * 4096] = ((float)l + 1.0f) / 4294967296.0f;
  }
}