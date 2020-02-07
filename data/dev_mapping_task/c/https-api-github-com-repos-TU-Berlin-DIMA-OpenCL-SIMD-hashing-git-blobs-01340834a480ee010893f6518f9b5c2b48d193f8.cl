kernel void A(global uint* a, const ulong b, const uint c) {
  for (uint d = 0; d < b; ++d) {
    a[d] = c;
  }
}