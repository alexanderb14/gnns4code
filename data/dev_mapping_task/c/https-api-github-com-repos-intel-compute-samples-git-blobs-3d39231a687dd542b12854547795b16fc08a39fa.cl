kernel void A(global uint* a, const uint b) {
  const uint c = get_global_id(0);
  const uint d = get_global_size(0);
  const ulong e = 1000000;
  for (uint f = 0; f < e; ++f) {
    a[b * d + c]++;
  }
}