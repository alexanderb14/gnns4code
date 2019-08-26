__kernel void A(int a, int b, int c, int d, float e, __global float* f, int g, __global float* h, int i, float j, __global float* k, int l) {
  bool m = a == 1;
  bool n = b == 0;

  int o = get_global_id(0);
  int p = get_global_id(1);

  bool q = o < p;
  bool r = o > p;

  if (m && q)
    return;
  if (!m && r)
    return;

  float s = 0.f;

  if (n) {
    for (int t = 0; t < d; t++) {
      s += f[(t) * (g) + (o)] * h[(t) * (i) + (p)];
      s += h[(t) * (i) + (o)] * f[(t) * (g) + (p)];
    }
  } else {
    for (int t = 0; t < d; t++) {
      s += f[(o) * (g) + (t)] * h[(p) * (i) + (t)];
      s += h[(o) * (i) + (t)] * f[(p) * (g) + (t)];
    }
  }

  s *= e;
  k[(p) * (l) + (o)] = j * k[(p) * (l) + (o)] + s;
}