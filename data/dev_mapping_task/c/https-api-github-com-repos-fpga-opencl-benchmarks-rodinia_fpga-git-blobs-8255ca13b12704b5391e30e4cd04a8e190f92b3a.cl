__kernel void A(__global float* a, __attribute__((local_mem_size(64 * 64 * 4))) __local float* b, int c, int d) {
  int e, f, g;
  int h;

  h = d * c + d;
  for (e = 0; e < 64; e++) {
    for (f = 0; f < 64; f++) {
      b[e * 64 + f] = a[h + f];
    }
    h += c;
  }

  for (e = 0; e < 64 - 1; e++) {
    for (f = e + 1; f < 64; f++) {
      for (g = 0; g < e; g++) {
        b[f * 64 + e] -= b[f * 64 + g] * b[g * 64 + e];
      }
      b[f * 64 + e] /= b[e * 64 + e];
    }

    for (f = e + 1; f < 64; f++) {
      for (g = 0; g < e + 1; g++) {
        b[(e + 1) * 64 + f] -= b[(e + 1) * 64 + g] * b[g * 64 + f];
      }
    }
  }

  h = (d + 1) * c + d;
  for (e = 1; e < 64; e++) {
    for (f = 0; f < 64; f++) {
      a[h + f] = b[e * 64 + f];
    }
    h += c;
  }
}

__kernel void B(__global float* a, __attribute__((local_mem_size(64 * 64 * 4))) __local float* b, __attribute__((local_mem_size(64 * 64 * 4))) __local float* c, __attribute__((local_mem_size(64 * 64 * 4))) __local float* d, int e, int f) {
  int g, h, i;
  int j, k;
  int l, m;

  m = ((e - f) / 64) - 1;
  j = f * e + f;

  for (l = 0; l < m; l++) {
    k = j;
    for (g = 0; g < 64; g++) {
      for (h = 0; h < 64; h++) {
        b[g * 64 + h] = a[k + h];
      }
      k += e;
    }

    k = j + (l + 1) * 64;
    for (g = 0; g < 64; g++) {
      for (h = 0; h < 64; h++) {
        c[g * 64 + h] = a[k + h];
      }
      k += e;
    }

    k = j + (l + 1) * 64 * e;
    for (g = 0; g < 64; g++) {
      for (h = 0; h < 64; h++) {
        d[g * 64 + h] = a[k + h];
      }
      k += e;
    }

    for (g = 1; g < 64; g++) {
      for (h = 0; h < 64; h++) {
        for (i = 0; i < g; i++) {
          c[g * 64 + h] -= b[g * 64 + i] * c[i * 64 + h];
        }
      }
    }

    for (g = 0; g < 64; g++) {
      for (h = 0; h < 64; h++) {
        for (i = 0; i < g; i++) {
          d[h * 64 + g] -= b[i * 64 + g] * d[h * 64 + i];
        }
        d[h * 64 + g] /= b[g * 64 + g];
      }
    }

    k = j + (l + 1) * 64 + e;
    for (g = 1; g < 64; g++) {
      for (h = 0; h < 64; h++) {
        a[k + h] = c[g * 64 + h];
      }
      k += e;
    }

    k = j + (l + 1) * 64 * e;
    for (g = 0; g < 64; g++) {
      for (h = 0; h < 64; h++) {
        a[k + h] = d[g * 64 + h];
      }
      k += e;
    }
  }
}

__kernel void C(__global float* a, __attribute__((local_mem_size(64 * 64 * 4))) __local float* b, __attribute__((local_mem_size(64 * 64 * 4))) __local float* c, int d, int e) {
  int f, g, h, i, j, k;
  int l, m, n, o;
  float p;

  k = ((d - e) / 64) - 1;
  l = e * d + e;

  for (j = 0; j < k; j++) {
    o = l + (j + 1) * 64 * d;

    for (f = 0; f < 64; f++) {
      for (g = 0; g < 64; g++) {
        c[f * 64 + g] = a[o + g];
      }
      o += d;
    }

    for (i = 0; i < k; i++) {
      n = l + (i + 1) * 64;
      m = l + (j + 1) * 64 * d + (i + 1) * 64;

      for (f = 0; f < 64; f++) {
        for (g = 0; g < 64; g++) {
          b[f * 64 + g] = a[n + g];
        }
        n += d;
      }

      for (f = 0; f < 64; f++) {
        for (g = 0; g < 64; g++) {
          p = 0;
          for (h = 0; h < 64; h++) {
            p += c[f * 64 + h] * b[h * 64 + g];
          }
          a[m + g] -= p;
        }
        m += d;
      }
    }
  }
}