__kernel void A(int a, int b, int c, int d, int e, int f, float g, __global float* h, int i, __global float* j, int k) {
  bool l = a == 0;
  bool m = b == 1;
  bool n = c == 0;
  bool o = d == 0;

  if (l) {
    if (m) {
      if (n) {
        for (int p = 0; p < e; p++) {
          for (int q = 0; q < f; q++) {
            float r = j[(q) * (k) + (p)];
            if (o)
              r /= h[(p) * (i) + (p)];
            for (int s = p + 1; s < e; s++) {
              j[(q) * (k) + (s)] -= h[(p) * (i) + (s)] * r;
            }
            j[(q) * (k) + (p)] = r * g;
          }
        }
      } else {
        for (int p = e - 1; p >= 0; p--) {
          for (int q = 0; q < f; q++) {
            float r = j[(q) * (k) + (p)];
            if (o)
              r /= h[(p) * (i) + (p)];
            for (int s = 0; s < p; s++) {
              j[(q) * (k) + (s)] -= h[(s) * (i) + (p)] * r;
            }
            j[(q) * (k) + (p)] = r * g;
          }
        }
      }
    } else {
      if (n) {
        for (int p = e - 1; p >= 0; p--) {
          for (int q = 0; q < f; q++) {
            float r = j[(q) * (k) + (p)];
            if (o)
              r /= h[(p) * (i) + (p)];
            for (int s = 0; s < p; s++) {
              j[(q) * (k) + (s)] -= h[(p) * (i) + (s)] * r;
            }
            j[(q) * (k) + (p)] = r * g;
          }
        }
      } else {
        for (int p = 0; p < e; p++) {
          for (int q = 0; q < f; q++) {
            float r = j[(q) * (k) + (p)];
            if (o)
              r /= h[(p) * (i) + (p)];
            for (int s = p + 1; s < e; s++) {
              j[(q) * (k) + (s)] -= h[(s) * (i) + (p)] * r;
            }
            j[(q) * (k) + (p)] = r * g;
          }
        }
      }
    }
  } else {
    if (m) {
      if (n) {
        for (int p = f - 1; p >= 0; p--) {
          for (int q = 0; q < e; q++) {
            float r = j[(p) * (k) + (q)];
            if (o)
              r /= h[(p) * (i) + (p)];
            for (int s = 0; s < p; s++) {
              j[(s) * (k) + (q)] -= h[(s) * (i) + (p)] * r;
            }
            j[(p) * (k) + (q)] = r * g;
          }
        }
      } else {
        for (int p = 0; p < f; p++) {
          for (int q = 0; q < e; q++) {
            float r = j[(p) * (k) + (q)];
            if (o)
              r /= h[(p) * (i) + (p)];
            for (int s = p + 1; s < f; s++) {
              j[(s) * (k) + (q)] -= h[(p) * (i) + (s)] * r;
            }
            j[(p) * (k) + (q)] = r * g;
          }
        }
      }
    } else {
      if (n) {
        for (int p = 0; p < f; p++) {
          for (int q = 0; q < e; q++) {
            float r = j[(p) * (k) + (q)];
            if (o)
              r /= h[(p) * (i) + (p)];
            for (int s = p + 1; s < f; s++) {
              j[(s) * (k) + (q)] -= h[(s) * (i) + (p)] * r;
            }
            j[(p) * (k) + (q)] = r * g;
          }
        }
      } else {
        for (int p = f - 1; p >= 0; p--) {
          for (int q = 0; q < e; q++) {
            float r = j[(p) * (k) + (q)];
            if (o)
              r /= h[(p) * (i) + (p)];
            for (int s = 0; s < p; s++) {
              j[(s) * (k) + (q)] -= h[(p) * (i) + (s)] * r;
            }
            j[(p) * (k) + (q)] = r * g;
          }
        }
      }
    }
  }
}