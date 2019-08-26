__kernel void A(__global int* a, __global int* b, int c) {
  int d = get_group_id(0);
  int e = get_group_id(1);
  int f = get_num_groups(0);
  int g = get_local_id(0);
  int h = get_local_id(1);
  int i, j;

  if ((g | h) == 0)
    atomic_add(a, 1);

  for (i = 1; i < 10000; i++)
    ;
  barrier(2);
  j = a[0];
  barrier(2);
  for (i = 1; i < 10000; i++)
    ;

  if ((g | h) == 0)
    b[e * f + d] = j;
}