__kernel void A(int a, __global float* b, int c, __global float* d) {
  const int e = get_local_id(0);
  const int f = get_group_id(0);
  const int g = get_num_groups(0);
  const int h = get_global_id(0);
  const int i = get_local_size(0);

  __local float j[256];

  j[e] = __clc_fabs(b[h * c]);

  if (f == g - 1 && h + 256 < a) {
    j[e] += __clc_fabs(b[(h + 256) * c]);
  }

  barrier(1);
  int k = i;
  for (int l = (i + 1) >> 1; k > 1; k = l, l = (l + 1) >> 1) {
    if (e < l && k - e - 1 != e)
      j[e] += j[k - e - 1];
    barrier(1);
  }
  if (e == 0)
    d[f] = j[0];
}