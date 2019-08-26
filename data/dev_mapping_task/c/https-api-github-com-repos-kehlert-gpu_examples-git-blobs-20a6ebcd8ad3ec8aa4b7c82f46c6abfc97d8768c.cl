__kernel void A(const uint a, const uint b, __global int* c, uint d, uint e, __local uint* f, __global uint* g) {
  uint h = get_global_id(0);
  uint i = get_local_id(0);

  if (i == 0) {
    for (uint j = 0; j < e; ++j) {
      f[j] = 0;
    }
  }

  barrier(1);

  for (uint j = h; j < d; j += get_global_size(0)) {
    atomic_add(&f[c[j] - a], 1);
  }

  barrier(1);

  for (uint j = i; j < e; j += get_local_size(0)) {
    g[get_group_id(0) * e + j] = f[j];
  }
}