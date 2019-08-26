__kernel void A(__global float* a, __attribute__((local_mem_size(64 * 64 * 4))) __local float* b, int c, int d) {
  int e, f, g, h;
  int i;
  float j[8 + 1];

  i = d * c + d;
  for (e = 0; e < 64; e++) {
    for (f = 0; f < 64; f++) {
      b[e * 64 + f] = a[i + f];
    }
    i += c;
  }

  for (e = 0; e < 64 - 1; e++) {
    for (f = e + 1; f < 64; f++) {
      for (h = 0; h < 8 + 1; h++) {
        j[h] = 0;
      }

      for (g = 0; g < e; g++) {
        j[8] = j[0] - b[f * 64 + g] * b[g * 64 + e];

        for (h = 0; h < 8; h++) {
          j[h] = j[h + 1];
        }
      }

      for (h = 0; h < 8; h++) {
        b[f * 64 + e] += j[h];
      }
      b[f * 64 + e] /= b[e * 64 + e];
    }

    for (f = e + 1; f < 64; f++) {
      for (h = 0; h < 8 + 1; h++) {
        j[h] = 0;
      }

      for (g = 0; g < e + 1; g++) {
        j[8] = j[0] - b[(e + 1) * 64 + g] * b[g * 64 + f];

        for (h = 0; h < 8; h++) {
          j[h] = j[h + 1];
        }
      }

      for (h = 0; h < 8; h++) {
        b[(e + 1) * 64 + f] += j[h];
      }
    }
  }

  i = (d + 1) * c + d;
  for (e = 1; e < 64; e++) {
    for (f = 0; f < 64; f++) {
      a[i + f] = b[e * 64 + f];
    }
    i += c;
  }
}

__kernel void B(__global float* a, __attribute__((local_mem_size(64 * 64 * 4))) __local float* b, __attribute__((local_mem_size(64 * 64 * 4))) __local float* c, __attribute__((local_mem_size(64 * 64 * 4))) __local float* d, int e, int f) {
  int g, h, i, j;
  int k, l;
  int m, n;
  float o[8 + 1];

  n = ((e - f) / 64) - 1;
  k = f * e + f;

  for (m = 0; m < n; m++) {
    l = k;
    for (g = 0; g < 64; g++) {
      for (h = 0; h < 64; h++) {
        b[g * 64 + h] = a[l + h];
      }
      l += e;
    }

    l = k + (m + 1) * 64;
    for (g = 0; g < 64; g++) {
      for (h = 0; h < 64; h++) {
        c[g * 64 + h] = a[l + h];
      }
      l += e;
    }

    l = k + (m + 1) * 64 * e;
    for (g = 0; g < 64; g++) {
      for (h = 0; h < 64; h++) {
        d[g * 64 + h] = a[l + h];
      }
      l += e;
    }

    for (g = 1; g < 64; g++) {
      for (h = 0; h < 64; h++) {
        for (j = 0; j < 8 + 1; j++) {
          o[j] = 0;
        }

        for (i = 0; i < g; i++) {
          o[8] = o[0] - b[g * 64 + i] * c[i * 64 + h];

          for (j = 0; j < 8; j++) {
            o[j] = o[j + 1];
          }
        }

        for (j = 0; j < 8; j++) {
          c[g * 64 + h] += o[j];
        }
      }
    }

    for (g = 0; g < 64; g++) {
      for (h = 0; h < 64; h++) {
        for (j = 0; j < 8 + 1; j++) {
          o[j] = 0;
        }

        for (i = 0; i < g; i++) {
          o[8] = o[0] - b[i * 64 + g] * d[h * 64 + i];

          for (j = 0; j < 8; j++) {
            o[j] = o[j + 1];
          }
        }

        for (j = 0; j < 8; j++) {
          d[h * 64 + g] += o[j];
        }
        d[h * 64 + g] /= b[g * 64 + g];
      }
    }

    l = k + (m + 1) * 64 + e;
    for (g = 1; g < 64; g++) {
      for (h = 0; h < 64; h++) {
        a[l + h] = c[g * 64 + h];
      }
      l += e;
    }

    l = k + (m + 1) * 64 * e;
    for (g = 0; g < 64; g++) {
      for (h = 0; h < 64; h++) {
        a[l + h] = d[g * 64 + h];
      }
      l += e;
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