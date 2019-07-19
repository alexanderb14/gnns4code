kernel void A(global const uchar* a, global uint* b, uint c) {
  const int d = get_global_id(0);
  const int e = get_global_id(1);
  const int2 f = {d e};

  c /= sizeof(uchar);

  if (get_local_size(0) * get_local_size(1) < 256)
    return;

  local uint g[256];

  int h = get_local_id(0) + get_local_id(1) * get_local_size(0);

  if (h < 256)
    g[h] = 0;

  barrier(1);

  uchar i = a[e * c + d];

  if (i < 256)
    atom_inc(&g[i]);

  barrier(1);

  if (h < 256)
    atom_add(&b[h], g[h]);
}