__kernel void A(int a, int b, int c, int d, float e, __global float* f, int g, __global float* h, int i, float j, __global float* k, int l) {
  bool m = a == 0;
  bool n = b == 1;

  int o = get_global_id(0);
  int p = get_global_id(1);

  if (n) {
    if (m) {
      float q = 0.f;
      for (int r = 0; r < c; r++) {
        if (r > o) {
          q += f[(o) * (g) + (r)] * h[(p) * (i) + (r)];
        } else {
          q += f[(r) * (g) + (o)] * h[(p) * (i) + (r)];
        }
      }
      q *= e;
      k[(p) * (l) + (o)] = j * k[(p) * (l) + (o)] + q;
    } else {
      float q = 0.f;
      for (int r = 0; r < d; r++) {
        if (r < p) {
          q += f[(r) * (g) + (p)] * h[(r) * (i) + (o)];
        } else {
          q += f[(p) * (g) + (r)] * h[(r) * (i) + (o)];
        }
      }
      q *= e;
      k[(p) * (l) + (o)] = j * k[(p) * (l) + (o)] + q;
    }
  } else {
    if (m) {
      float q = 0.f;
      for (int r = 0; r < c; r++) {
        if (r < o) {
          q += f[(o) * (g) + (r)] * h[(p) * (i) + (r)];
        } else {
          q += f[(r) * (g) + (o)] * h[(p) * (i) + (r)];
        }
      }
      q *= e;
      k[(p) * (l) + (o)] = j * k[(p) * (l) + (o)] + q;
    } else {
      float q = 0.f;
      for (int r = 0; r < d; r++) {
        if (r > p) {
          q += f[(r) * (g) + (p)] * h[(r) * (i) + (o)];
        } else {
          q += f[(p) * (g) + (r)] * h[(r) * (i) + (o)];
        }
      }
      q *= e;
      k[(p) * (l) + (o)] = j * k[(p) * (l) + (o)] + q;
    }
  }
}