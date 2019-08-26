__kernel void A(__global uint* a, __local uint* b, const uint c, const uint d, const uint e, __global uint* f, __global uint* g) {
  const uint h = get_global_id(0);
  const uint i = get_local_id(0);
  if (h < d) {
    const uint j = (h == 0) ? e : 0;
    if (i == 0) {
      b[i] = j;
    } else {
      b[i] = f[h - 1];
    }
  } else {
    b[i] = 0;
  }
  barrier(1);
  for (uint k = 1; k < c; k <<= 1) {
    const uint l = i >= k ? b[i - k] : 0;
    barrier(1);
    if (i >= k) {
      b[i] = ((b[i]) + (l));
    }
    barrier(1);
  }
  if (h < d) {
    g[h] = b[i];
  }
  if (i == c - 1) {
    a[get_group_id(0)] = ((f[h]) + (b[i]));
  }
}