void A(__local float*, __global float*); __kernel void B(const int a, const float b, __local float* c, __global float* d) {
  int e = get_local_size(0);
  int f = get_local_id(0);
  int g = get_group_id(0);

  float h, i = 0.0f;
  int j, k, l;

  k = (g * e + f) * a;
  l = k + a;

  for (j = k; j < l; j++) {
    h = (j + 0.5f) * b;
    i += 4.0f / (1.0f + h * h);
  }

  c[f] = i;
  barrier(1);

  A(c, d);
}
void A(__local float* a, __global float* b) {
  int c = get_local_size(0);
  int d = get_local_id(0);
  int e = get_group_id(0);

  float f;
  int g;

  if (d == 0) {
    f = 0.0f;

    for (g = 0; g < c; g++) {
      f += a[g];
    }

    b[e] = f;
  }
}