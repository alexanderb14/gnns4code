inline uint A(uint a) {
  const float b = (1.f + sqrt(5.f)) / 2.f;
  return __clc_floor(pown(b, a) / sqrt(5.f) + 0.5f);
}

__kernel void B(__global uint* a, const uint b) {
  uint c = get_local_id(0) + (32 * get_group_id(0));
  for (uint d = 0; d < 4; d++) {
    if (c < b) {
      a[c] = A((0 + c));
      c += 8;
    }
  }
}