int A(int a, int b, int c, int d, int e) {
  int f, g, h, i;
  i = a % d;
  a = a / d;
  h = a % c;
  a = a / c;
  g = a % b;
  a = a / b;
  f = a;
  i = i / e;
  h = h / e;
  c /= e;
  d /= e;
  return (((f * b + g) * c) + h) * d + i;
}
int B(int a, int b, int c, int d, int e, int f, int g) {
  int h, i, j, k;
  k = a % d;
  a = a / d;
  j = a % c;
  a = a / c;
  i = a % b;
  a = a / b;
  h = a;
  k = k * e + f;
  j = j * e + g;
  c *= e;
  d *= e;
  return (((h * b + i) * c) + j) * d + k;
}

kernel void C(global float* a, int b, global float* c, int d, int e, int f, int g, int h, int i) {
  global float* j = a + b;
  global float* k = c + d;

  long l = get_local_id(0) + get_local_size(0) * get_group_id(0);
  l += get_local_id(1) + get_local_size(1) * (get_local_size(0) * get_num_groups(0)) * get_group_id(1);
  if (l >= e)
    return;
  int m = A(l, g, h, i, f);
  k[l] = j[m];
}

kernel void D(global float* a, int b, global float* c, int d, int e, int f, int g, int h, int i) {
  global float* j = a + b;
  global float* k = c + d;

  long l = get_local_id(0) + get_local_size(0) * get_group_id(0);
  l += get_local_id(1) + get_local_size(1) * (get_local_size(0) * get_num_groups(0)) * get_group_id(1);
  if (l >= e)
    return;
  for (int m = 0; m < f; m++) {
    for (int n = 0; n < f; n++) {
      int o = B(l, g, h, i, f, m, n);
      j[l] += k[o];
    }
  }
}