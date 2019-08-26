__kernel void A(__global float* a, int b) {
  int c, d, e, f;
  int g, h, i, j, k;
  int l, m, n, o;
  float p[8 + 1], q[8 + 1];
  float r, s;
  float t[8 * 8], u[8 * 8], v[8 * 8];

  for (g = 0; g < b; g = g + 8) {
    h = g * b + g;

    for (c = 0; c < 8; c++) {
      for (d = 0; d < 8; d++) {
        t[(c << 3) + d] = a[h + c * b + d];
      }
    }

    for (c = 0; c < 8; c++) {
      for (d = 0; d < 8; d++) {
        for (f = 0; f < 8 + 1; f++) {
          p[f] = 0;
        }

        for (e = 0; e < 8; e++) {
          if (d >= c && e < c) {
            p[8] = p[0] - t[(c << 3) + e] * t[(e << 3) + d] * 1.0;
          } else {
            p[8] = p[0] - t[(c << 3) + e] * t[(e << 3) + d] * 0;
          }

          for (f = 0; f < 8; f++) {
            p[f] = p[f + 1];
          }
        }

        for (f = 0; f < 8; f++) {
          t[(c << 3) + d] = t[(c << 3) + d] + p[f];
        }
      }

      s = t[(c << 3) + c];
      for (d = 0; d < 8; d++) {
        for (f = 0; f < 8 + 1; f++) {
          p[f] = 0;
        }

        for (e = 0; e < 8; e++) {
          if (d >= c + 1 && e < c) {
            p[8] = p[0] - t[(d << 3) + e] * t[(e << 3) + c] * 1.0;
          } else {
            p[8] = p[0] - t[(d << 3) + e] * t[(e << 3) + c] * 0;
          }

          for (f = 0; f < 8; f++) {
            p[f] = p[f + 1];
          }
        }

        r = 0;
        for (f = 0; f < 8; f++) {
          r = r + p[f];
        }

        if (d >= c + 1) {
          t[(d << 3) + c] = (t[(d << 3) + c] + r) / s;
        } else {
          t[(d << 3) + c] = (t[(d << 3) + c] + r) / 1.0;
        }
      }
    }

    for (c = 1; c < 8; c++) {
      for (d = 0; d < 8; d++) {
        a[h + c * b + d] = t[(c << 3) + d];
      }
    }
    o = ((b - g) >> 3) - 1;
    for (l = 0; l < o; l++) {
      i = h + ((l + 1) << 3);
      j = h + ((l + 1) << 3) * b;

      for (c = 0; c < 8; c++) {
        for (d = 0; d < 8; d++) {
          u[(c << 3) + d] = a[i + c * b + d];
        }
        for (d = 0; d < 8; d++) {
          v[(c << 3) + d] = a[j + c * b + d];
        }
      }

      s = t[(0 << 3) + 0];
      for (d = 0; d < 8; d++) {
        v[(d << 3) + 0] = v[(d << 3) + 0] / s;
      }

      for (c = 1; c < 8; c++) {
        s = t[(c << 3) + c];
        for (d = 0; d < 8; d++) {
          for (f = 0; f < 8 + 1; f++) {
            p[f] = 0;
            q[f] = 0;
          }

          for (e = 0; e < 8; e++) {
            if (e < c) {
              p[8] = p[0] - t[(c << 3) + e] * u[(e << 3) + d] * 1.0;
              q[8] = q[0] - t[(e << 3) + c] * v[(d << 3) + e] * 1.0;
            } else {
              p[8] = p[0] - t[(c << 3) + e] * u[(e << 3) + d] * 0;
              q[8] = q[0] - t[(e << 3) + c] * v[(d << 3) + e] * 0;
            }

            for (f = 0; f < 8; f++) {
              p[f] = p[f + 1];
              q[f] = q[f + 1];
            }
          }

          r = 0;
          for (f = 0; f < 8; f++) {
            u[(c << 3) + d] = u[(c << 3) + d] + p[f];
            r = r + q[f];
          }
          v[(d << 3) + c] = (v[(d << 3) + c] + r) / s;
        }
      }

      for (c = 1; c < 8; c++) {
        for (d = 0; d < 8; d++) {
          a[i + c * b + d] = u[(c << 3) + d];
        }
      }
      for (c = 0; c < 8; c++) {
        for (d = 0; d < 8; d++) {
          a[j + c * b + d] = v[(c << 3) + d];
        }
      }
    }
    for (n = 0; n < o; n++) {
      j = h + ((n + 1) << 3) * b;

      for (c = 0; c < 8; c++) {
        for (d = 0; d < 8; d++) {
          v[(c << 3) + d] = a[j + c * b + d];
        }
      }

      for (m = 0; m < o; m++) {
        i = h + ((m + 1) << 3);
        k = h + ((n + 1) << 3) * b + ((m + 1) << 3);

        for (c = 0; c < 8; c++) {
          for (d = 0; d < 8; d++) {
            u[(c << 3) + d] = a[i + c * b + d];
          }
          for (d = 0; d < 8; d++) {
            t[(c << 3) + d] = a[k + c * b + d];
          }
        }

        for (c = 0; c < 8; c++) {
          for (d = 0; d < 8; d++) {
            for (e = 0; e < 8; e++) {
              t[(c << 3) + d] = t[(c << 3) + d] - v[(c << 3) + e] * u[(e << 3) + d];
            }
          }
        }

        for (c = 0; c < 8; c++) {
          for (d = 0; d < 8; d++) {
            a[k + c * b + d] = t[(c << 3) + d];
          }
        }
      }
    }
  }
}