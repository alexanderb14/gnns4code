__kernel void A(int a, int b, int c, int d, int e, int f, float g, __global float* h, int i, __global float* j, int k, __global float* l, int m) {
  if (e == 0 || f == 0)
    return;

  int n;
  int o;

  const int p = get_global_id(0);
  const int q = get_global_id(1);

  if (a == 0) {
    int r = e;

    if (b == 0) {
      if (q >= p) {
        if (c == 0) {
          float s = 0.0f;
          for (int t = 0; t < r; t++) {
            if (t == p && d == 1)
              s += g * 1 * j[q * r + t];
            else
              s += g * h[t * e + p] * j[q * r + t];
          }

          l[q * e + p] = s;
        }

        else if (c == 1) {
          float s = 0.0f;
          for (int t = 0; t < r; t++) {
            if (t == q && d == 1)
              s += g * 1 * j[q * r + t];
            else
              s += g * h[p * e + t] * j[q * r + t];
          }

          l[q * e + p] = s;
        }

        else if (c == 2) {
          float s = 0.0f;
          for (int t = 0; t < r; t++) {
            s += g * h[q * r + t] * j[q * r + t];
          }

          l[q * e + p] = s;
        }
      }
    }

    else {
      if (p >= q) {
        if (c == 0) {
          float s = 0.0f;
          for (int t = 0; t < r; t++) {
            if (t == p && d == 1)
              s += g * 1 * j[q * e + t];
            else
              s += g * h[t * e + p] * j[q * e + t];
          }

          l[q * e + p] = s;
        } else if (c == 1) {
          float s = 0.0f;
          for (int t = 0; t < r; t++) {
            if (t == p && q == p && d == 1)
              s += g * 1 * j[q * e + t];
            else
              s += g * h[p * e + t] * j[q * e + t];
          }

          l[q * e + p] = s;
        } else if (c == 2) {
          float s = 0.0f;
          for (int t = 0; t < r; t++) {
            if (t == p && q == p && d == 1)
              s += g * 1 * j[q * e + t];
            else
              s += g * h[p * e + t] * j[q * e + t];
          }

          l[q * e + p] = s;
        }
      }
    }
  }

  else {
    int r = f;

    if (b == 0) {
      if (q >= p) {
        if (c == 0) {
          float s = 0.0f;
          for (int t = 0; t < r; t++) {
            if (t == q && d == 1)
              s += g * j[t * e + p] * 1;
            else
              s += g * j[t * e + p] * h[q * r + t];
          }

          l[q * e + p] = s;
        } else if (c == 1) {
          float s = 0.0f;
          for (int t = 0; t < r; t++) {
            if (t == q && d == 1)
              s += g * j[t * e + p] * 1;
            else
              s += g * j[t * e + p] * h[t * r + q];
          }

          l[q * e + p] = s;
        } else if (c == 2) {
          float s = 0.0f;
          for (int t = 0; t < r; t++) {
            if (t == q && d == 1)
              s += g * j[t * e + p] * 1;
            else
              s += g * j[t * e + p] * h[t * r + q];
          }

          l[q * e + p] = s;
        }
      }
    } else {
      if (p >= q) {
        if (c == 0) {
          float s = 0.0f;
          for (int t = 0; t < r; t++) {
            if (t == q && d == 1)
              s += g * j[t * e + p] * 1;
            else
              s += g * j[t * e + p] * h[q * r + t];
          }

          l[q * e + p] = s;
        } else if (c == 1) {
          float s = 0.0f;
          for (int t = 0; t < r; t++) {
            if (t == q && d == 1)
              s += g * j[t * e + p] * 1;
            else
              s += g * j[t * e + p] * h[t * r + q];
          }

          l[q * e + p] = s;
        } else if (c == 2) {
          float s = 0.0f;
          for (int t = 0; t < r; t++) {
            if (t == q && d == 1)
              s += g * j[t * e + p] * 1;
            else
              s += g * j[t * e + p] * h[t * r + q];
          }

          l[q * e + p] = s;
        }
      }
    }
  }
}