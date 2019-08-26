__kernel void A(global float* restrict a, global float* restrict b) {
  int c, d, e;

  for (c = 0; c < 20; c++) {
    for (d = 0; d < (c + 1); d++) {
      double f = 0;
      for (e = 0; e < d; e++)
        f += b[c * 20 + e] * b[d * 20 + e];

      b[c * 20 + d] = (c == d) ? sqrt(a[c * 20 + c] - f) : (1.0 / b[d * 20 + d] * (a[c * 20 + d] - f));
    }
  }
}

__kernel void B(global float* restrict a, global float* restrict b, global float* restrict c) {
  int d, e;

  for (d = 0; d < 20; d++) {
    c[d] = 1.0;
    for (e = 0; e < d; e++) {
      c[d] -= a[d * 20 + e] * c[e];
    }
    c[d] /= a[d * 20 + d];
  }

  for (d = 20 - 1; d >= 0; d--) {
    b[d] = c[d];
    for (e = d + 1; e < 20; e++) {
      b[d] -= a[e * 20 + d] * b[e];
    }
    b[d] /= a[d * 20 + d];
  }
}