__kernel void A(int a, __global float* b, __global float* c) {
  int d, e, f, g;

  e = get_local_id(0);
  int h = get_local_size(0);
  int i = get_num_groups(0);
  int j = get_group_id(0);

  f = i * h;
  g = h * j;

  for (d = g + e; d < a; d += f) {
    c[d] = b[d];
  }
}