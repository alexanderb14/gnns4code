__kernel void A(int a, int b, int c, int d, int e, __global float* f, __global float* g, int h) {
  bool i = (a == 0);
  bool j = (c == 1);
  bool k = (b == 0);

  if (i && k) {
    for (int l = 0; l < d; l++) {
      g[l * h] = j ? g[l * h] : f[(l) * (e) + (l)] * g[l * h];

      for (int m = l + 1; m < d; m++) {
        g[l * h] += f[(m) * (e) + (l)] * g[m * h];
      }
    }
  }

  if (i && !k) {
    for (int l = d - 1; l >= 0; l--) {
      g[l * h] = j ? g[l * h] : f[(l) * (e) + (l)] * g[l * h];

      for (int m = 0; m < l; m++) {
        g[l * h] += f[(l) * (e) + (m)] * g[m * h];
      }
    }
  }

  if (!i && k) {
    for (int l = d - 1; l >= 0; l--) {
      g[l * h] = j ? g[l * h] : f[(l) * (e) + (l)] * g[l * h];

      for (int m = 0; m < l; m++) {
        g[l * h] += f[(m) * (e) + (l)] * g[m * h];
      }
    }
  }

  if (!i && !k) {
    for (int l = 0; l < d; l++) {
      g[l * h] = j ? g[l * h] : f[(l) * (e) + (l)] * g[l * h];

      for (int m = l + 1; m < d; m++) {
        g[l * h] += f[(l) * (e) + (m)] * g[m * h];
      }
    }
  }
}