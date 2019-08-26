kernel void A(uint a, global uint* b, global uint* c, local uint* d) {
  uint e = get_global_id(0);
  uint f = get_local_id(0);
  uint g = get_global_size(0);
  uint h = get_local_size(0);
  uint i = get_group_id(0);

  uint j = 0;
  for (uint k = e; k < a; k += g) {
    j += b[k];
  }

  d[f] = j;
  for (uint l = h / 2; l > 0; l /= 2) {
    barrier(1);
    if (f < l) {
      d[f] += d[f + l];
    }
  }

  if (f == 0) {
    c[i] = d[f];
  }
}