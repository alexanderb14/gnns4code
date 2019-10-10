__kernel void A(global float* a) {
  local float b[4][4];

  int c = get_local_id(0);
  int d = get_local_id(1);

  int e = get_group_id(0);
  int f = get_group_id(1);

  b[c][d] = b[d][c];

  barrier(2);

  a[((c + (f * 4)) * (10 * 4)) + (d + (e * 4))] = b[c][d];
}