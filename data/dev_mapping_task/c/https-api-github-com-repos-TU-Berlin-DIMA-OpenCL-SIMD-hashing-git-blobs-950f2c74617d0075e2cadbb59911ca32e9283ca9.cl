kernel void A(global uint* a, const ulong b, const uint c, global ulong* d) {
  ulong e = 0;
  ulong f = 0;

  for (; f < b; ++f) {
    if (a[f] != c) {
      e += a[f];
    }
  }

  d[0] = e;
}