__kernel void A(volatile __global uint4* a, volatile __global uint* b, uint c, uint d, uint e) {
  if (e == 0)
    return;

  uint f = 0;
  __local uint g;
  uint h, i;

  if (get_local_id(0) == 0)
    g = 0;

  barrier(1);

  for (int j = 0; j < e; j++)
    for (h = 0, i = get_global_id(0); h < c; h++, i += get_global_size(0)) {
      if (a[i].x == d)
        f++;
      if (a[i].y == d)
        f++;
      if (a[i].z == d)
        f++;
      if (a[i].w == d)
        f++;
    }

  (void)atomic_add(&g, f);

  barrier(1);

  if (get_local_id(0) == 0)
    b[get_group_id(0)] = g / e;
}

__kernel void B(volatile __global uint* a, volatile __global uint4* b, uint c, uint d, uint e) {
  if (e == 0)
    return;

  uint f, g;
   uint4 h = (uint4) (dddd

   for(int i=0; i<e; i++)
      for( f=0, g=get_global_id(0); f<c; f++, g+=get_global_size(0) )
      {
    b[g] = h;
      }
}