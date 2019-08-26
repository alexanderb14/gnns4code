__kernel void A(__global int* a, const uint b) {
  uint c = get_local_id(0) + (32 * get_group_id(0));
  for (uint d = 0; d < 4; d++) {
    if (c < b) {
      a[2 + (c)] = (-5 + c);
      c += 8;
    }
  }
}

__kernel void B(__global int* a, const uint b) {
  uint c = get_local_id(0) + (32 * get_group_id(0));
  for (uint d = 0; d < 4; d++) {
    if (c < b) {
      a[c] = (4 + c);
      c += 8;
    }
  }
}