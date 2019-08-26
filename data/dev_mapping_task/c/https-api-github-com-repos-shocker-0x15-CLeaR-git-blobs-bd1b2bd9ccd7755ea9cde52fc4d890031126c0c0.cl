kernel void A(global uint* a, uint b, global uint* c) {
  const uint d = get_local_id(0);
  const uint e = get_global_id(0);

  local uint f[128];

  if (e < b)
    f[d] = a[e];
  else
    f[d] = 0;
  barrier(1);

  for (uint g = 2; g <= 128; g <<= 1) {
    uint h = (d + 1) * g - 1;
    if (h < 128)
      f[h] += f[h - (g >> 1)];
    barrier(1);
  }

  if (d == 0) {
    c[(get_global_offset(0) / 128) + get_group_id(0)] = f[128 - 1];
    f[128 - 1] = 0;
  }
  barrier(1);
  for (uint g = 128; g >= 2; g >>= 1) {
    uint i = (d + 1) * g - 1;
    if (i < 128) {
      uint j = i - (g >> 1);
      uint k = f[j];
      f[j] = f[i];
      f[i] += k;
    }
    barrier(1);
  }

  if (e < b)
    a[e] = f[d];
}

kernel void B(const global uint* a, global uint* b, uint c) {
  const uint d = get_global_id(0);

  if (d < c)
    b[d] += a[(get_global_offset(0) / 128) + get_group_id(0)];
}