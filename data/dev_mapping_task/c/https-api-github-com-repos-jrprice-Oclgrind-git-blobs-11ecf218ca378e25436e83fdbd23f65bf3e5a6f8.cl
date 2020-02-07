struct S0 {
  uchar a;
  ulong b[2][3][1];
};

kernel void A(global ulong* a) {
  struct S0 b = {
      1UL, {{{1L}, {1L}, {1L}}, {{1L}, {1L}, {1L}}},
  };

  ulong c = 0UL;
  for (int d = 0; d < 2; d++)
    for (int e = 0; e < 3; e++)
      for (int f = 0; f < 1; f++)
        c += b.b[d][e][f];

  *a = c;
}