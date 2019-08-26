__kernel void A(int a, int b, int c, int d, float e, __global float* f, int g, float h, __global float* i, int j) {
  bool k = a == 1;
  bool l = b == 0;

  int m = get_global_id(0);
  int n = get_global_id(1);

  bool o = m < n;
  bool p = m > n;

  if (k && o)
    return;
  if (!k && p)
    return;

  float q = 0.f;

  if (l) {
    for (int r = 0; r < d; r++) {
      q += f[(r) * (g) + (m)] * f[(r) * (g) + (n)];
    }
  } else {
    for (int r = 0; r < d; r++) {
      q += f[(m) * (g) + (r)] * f[(n) * (g) + (r)];
    }
  }

  q *= e;
  i[(n) * (j) + (m)] = h * i[(n) * (j) + (m)] + q;
}