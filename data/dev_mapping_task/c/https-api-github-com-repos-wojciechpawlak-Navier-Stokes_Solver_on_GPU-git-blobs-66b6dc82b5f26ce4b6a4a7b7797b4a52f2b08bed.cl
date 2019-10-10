struct particle {
  float x;
  float y;
  struct particle* next;
};

struct particleline {
  int length;
  struct particle* Particles;
};

struct particle* A(float a, float b);
__kernel void B(__global float* a, __global float* b, __global float* c, __global float* d, __global int* e, int f, int g, float h, float i, float j, float k, float l, float m) {
  float n, o, p;

  f = f + 2;
  g = g + 2;

  int q = get_global_id(1);
  int r = get_global_id(0);

  if ((q > 0 && q < f - 1) && (r > 0 && r < g - 1)) {
    if ((e[q * g + r] & 0x0010) && (e[q * g + r] < 0x1000)) {
      n = (c[(q + 1) * g + r] - 2.0 * c[q * g + r] + c[(q - 1) * g + r]) * (1. / i / i) + (c[q * g + r + 1] - 2.0 * c[q * g + r] + c[q * g + r - 1]) * (1. / j / j);
      o = ((a[q * g + r] * 0.5 * (c[q * g + r] + c[(q + 1) * g + r]) - a[(q - 1) * g + r] * 0.5 * (c[(q - 1) * g + r] + c[q * g + r])) + k * (__clc_fabs(a[q * g + r]) * 0.5 * (c[q * g + r] - c[(q + 1) * g + r]) - __clc_fabs(a[(q - 1) * g + r]) * 0.5 * (c[(q - 1) * g + r] - c[q * g + r]))) / i;
      p = ((b[q * g + r] * 0.5 * (c[q * g + r] + c[q * g + r + 1]) - b[q * g + r - 1] * 0.5 * (c[q * g + r - 1] + c[q * g + r])) + k * (__clc_fabs(b[q * g + r]) * 0.5 * (c[q * g + r] - c[q * g + r + 1]) - __clc_fabs(b[q * g + r - 1]) * 0.5 * (c[q * g + r - 1] - c[q * g + r]))) / j;

      d[q * g + r] = c[q * g + r] + h * (n / l / m - o - p);
    }
  }
}

__kernel void C(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, __global int* f, int g, int h, float i, float j, float k, float l, float m, float n, float o, float p) {
  float q, r, s, t, u, v;

  g = g + 2;
  h = h + 2;

  int w = get_global_id(1);
  int x = get_global_id(0);

  if ((w > 0 && w < g - 1) && (x > 0 && x < h - 1)) {
    if (((f[w * h + x] & 0x0010) && (f[w * h + x] < 0x1000)) && ((f[(w + 1) * h + x] & 0x0010) && (f[(w + 1) * h + x] < 0x1000))) {
      q = ((a[w * h + x] + a[(w + 1) * h + x]) * (a[w * h + x] + a[(w + 1) * h + x]) + n * __clc_fabs(a[w * h + x] + a[(w + 1) * h + x]) * (a[w * h + x] - a[(w + 1) * h + x]) - (a[(w - 1) * h + x] + a[w * h + x]) * (a[(w - 1) * h + x] + a[w * h + x]) - n * __clc_fabs(a[(w - 1) * h + x] + a[w * h + x]) * (a[(w - 1) * h + x] - a[w * h + x])) / (4.0 * j);
      r = ((b[w * h + x] + b[(w + 1) * h + x]) * (a[w * h + x] + a[w * h + (x + 1)]) + n * __clc_fabs(b[w * h + x] + b[(w + 1) * h + x]) * (a[w * h + x] - a[w * h + (x + 1)]) - (b[w * h + (x - 1)] + b[(w + 1) * h + (x - 1)]) * (a[w * h + (x - 1)] + a[w * h + x]) - n * __clc_fabs(b[w * h + (x - 1)] + b[(w + 1) * h + (x - 1)]) * (a[w * h + (x - 1)] - a[w * h + x])) / (4.0 * k);
      u = (a[(w + 1) * h + x] - 2.0 * a[w * h + x] + a[(w - 1) * h + x]) / j / j + (a[w * h + (x + 1)] - 2.0 * a[w * h + x] + a[w * h + (x - 1)]) / k / k;

      d[w * h + x] = a[w * h + x] + i * (u / o - q - r + l) - i * p * l * (c[w * h + x] + c[(w + 1) * h + x]) / 2;
    } else {
      d[w * h + x] = a[w * h + x];
    }

    if (((f[w * h + x] & 0x0010) && (f[w * h + x] < 0x1000)) && ((f[w * h + (x + 1)] & 0x0010) && (f[w * h + (x + 1)] < 0x1000))) {
      s = ((a[w * h + x] + a[w * h + (x + 1)]) * (b[w * h + x] + b[(w + 1) * h + x]) + n * __clc_fabs(a[w * h + x] + a[w * h + (x + 1)]) * (b[w * h + x] - b[(w + 1) * h + x]) - (a[(w - 1) * h + x] + a[(w - 1) * h + (x + 1)]) * (b[(w - 1) * h + x] + b[w * h + x]) - n * __clc_fabs(a[(w - 1) * h + x] + a[(w - 1) * h + (x + 1)]) * (b[(w - 1) * h + x] - b[w * h + x])) / (4.0 * j);
      t = ((b[w * h + x] + b[w * h + (x + 1)]) * (b[w * h + x] + b[w * h + (x + 1)]) + n * __clc_fabs(b[w * h + x] + b[w * h + (x + 1)]) * (b[w * h + x] - b[w * h + (x + 1)]) - (b[w * h + (x - 1)] + b[w * h + x]) * (b[w * h + (x - 1)] + b[w * h + x]) - n * __clc_fabs(b[w * h + (x - 1)] + b[w * h + x]) * (b[w * h + (x - 1)] - b[w * h + x])) / (4.0 * k);

      v = (b[(w + 1) * h + x] - 2.0 * b[w * h + x] + b[(w - 1) * h + x]) / j / j + (b[w * h + (x + 1)] - 2.0 * b[w * h + x] + b[w * h + (x - 1)]) / k / k;

      e[w * h + x] = b[w * h + x] + i * (v / o - s - t + m) - i * p * m * (c[w * h + x] + c[w * h + (x + 1)]) / 2;
      ;
    } else {
      e[w * h + x] = b[w * h + x];
    }

  } else if ((w == 0) && (x > 0 && x < h - 1)) {
    d[x] = a[x];

  } else if ((x == 0) && (w > 0 && w < g - 1)) {
    e[w * h] = b[w * h];
  }
}

__kernel void D(__global float* a, __global float* b, __global float* c, __global int* d, int e, int f, float g, float h, float i) {
  e = e + 2;
  f = f + 2;

  int j = get_global_id(1);
  int k = get_global_id(0);

  if ((j > 0 && j < e - 1) && (k > 0 && k < f - 1)) {
    if ((d[j * f + k] & 0x0010) && (d[j * f + k] < 0x0100)) {
      c[j * f + k] = ((a[j * f + k] - a[(j - 1) * f + k]) / h + (b[j * f + k] - b[j * f + k - 1]) / i) / g;
    }
  }
}

__kernel void E(__global float* a, __global int* b, int c, int d, __global float* e, __local float* f) {
  c = c + 2;
  d = d + 2;

  unsigned int g = get_global_id(0);
  unsigned int h = get_local_id(0);

  int i = g / c;
  int j = g % d;

  if ((i > 0 && i < c - 1) && (j > 0 && j < d - 1)) {
    if (b[i * d + j] & 0x0010) {
      f[h] = a[i * d + j] * a[i * d + j];
    } else {
      f[h] = 0.0;
    }
  } else {
    f[h] = 0.0;
  }

  barrier(1);

  for (unsigned int k = 1; k < get_local_size(0); k *= 2) {
    if ((h % (2 * k)) == 0) {
      f[h] += f[h + k];
    }
    barrier(1);
  }

  if (h == 0) {
    e[get_group_id(0) * get_num_groups(1) + get_group_id(1)] = f[0];
  }
}

__kernel void F(__global float* a, __global float* b, __global int* c, int d, int e, float f, float g, float h) {
}

__kernel void G(__global float* a, __global float* b, __global int* c, int d, int e, float f, float g, __global float* h) {
}

__kernel void H(__global float* a, __global int* b, int c, int d) {
  c = c + 2;
  d = d + 2;

  int e = get_global_id(1);
  int f = get_global_id(0);

  if ((f == 0) && (e > 0 && e < c - 1)) {
    a[e * d] = a[e * d + 1];
    a[e * d + (d - 1)] = a[e * d + (d - 2)];
  } else if ((e == 0) && (f > 0 && f < d - 1)) {
    a[f] = a[d + f];
    a[(c - 1) * d + f] = a[(c - 2) * d + f];
  }

  else if ((e > 0 && e < c - 1) && (f > 0 && f < d - 1)) {
    if (b[e * d + f] >= 0x0001 && b[e * d + f] <= 0x000a) {
      switch (b[e * d + f]) {
        case 0x0001: {
          a[e * d + f] = a[e * d + f + 1];
          break;
        }
        case 0x0008: {
          a[e * d + f] = a[(e + 1) * d + f];
          break;
        }
        case 0x0002: {
          a[e * d + f] = a[e * d + f - 1];
          break;
        }
        case 0x0004: {
          a[e * d + f] = a[(e - 1) * d + f];
          break;
        }
        case 0x0009: {
          a[e * d + f] = 0.5 * (a[e * d + f + 1] + a[(e + 1) * d + f]);
          break;
        }
        case 0x000a: {
          a[e * d + f] = 0.5 * (a[e * d + f - 1] + a[(e + 1) * d + f]);
          break;
        }
        case 0x0006: {
          a[e * d + f] = 0.5 * (a[e * d + f - 1] + a[(e - 1) * d + f]);
          break;
        }
        case 0x0005: {
          a[e * d + f] = 0.5 * (a[e * d + f + 1] + a[(e - 1) * d + f]);
          break;
        }
        default:
          break;
      }
    }
  }
}

__kernel void I(__global float* a, __global float* b, __global int* c, int d, int e, float f, float g, float h, float i) {
  d = d + 2;
  e = e + 2;

  unsigned int j = get_global_id(0);

  int k, l;

  for (k = 1; k <= d - 2; k++) {
    for (l = 1; l <= e - 2; l++) {
      if ((c[k * e + l] & 0x0010) && (c[k * e + l] < 0x0100)) {
        a[k * e + l] = (1. - i) * a[k * e + l] - h * ((a[(k + 1) * e + l] + a[(k - 1) * e + l]) * f + (a[k * e + l + 1] + a[k * e + l - 1]) * g - b[k * e + l]);
      }
    }
  }
}
__kernel void J(__global float* a, __global float* b, __global int* c, int d, int e, float f, float g, __global float* h, __local float* i) {
  d = d + 2;
  e = e + 2;

  unsigned int j = get_global_id(0);
  unsigned int k = get_local_id(0);

  int l = j & (d - 1);
  int m = j >> (int)log2((float)e);

  float n;

  if ((l > 0 && l < d - 1) && (m > 0 && m < e - 1)) {
    if ((c[l * e + m] & 0x0010) && (c[l * e + m] < 0x0100)) {
      n = (a[(l + 1) * e + m] - 2 * a[l * e + m] + a[(l - 1) * e + m]) * f + (a[l * e + m + 1] - 2 * a[l * e + m] + a[l * e + m - 1]) * g - b[l * e + m];

      i[k] = n * n;
    } else {
      i[k] = 0.0;
    }
  } else {
    i[k] = 0.0;
  }

  barrier(1);
  for (int o = get_local_size(0) / 2; o > 0; o >>= 1) {
    if (k < o) {
      i[k] += i[k + o];
    }
    barrier(1);
  }

  if (k == 0) {
    h[get_group_id(0)] = i[0];
  }
}
__kernel void K(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, __global int* f, int g, int h, float i, float j, float k) {
  g = g + 2;
  h = h + 2;

  int l = get_global_id(1);
  int m = get_global_id(0);

  if ((l > 0 && l < g - 2) && (m > 0 && m < h - 1)) {
    if (((f[l * h + m] & 0x0010) && (f[l * h + m] < 0x1000)) && ((f[(l + 1) * h + m] & 0x0010) && (f[(l + 1) * h + m] < 0x1000))) {
      a[l * h + m] = c[l * h + m] - (e[(l + 1) * h + m] - e[l * h + m]) * i / j;
    }
  }

  if ((l > 0 && l < g - 1) && (m > 0 && m < h - 2)) {
    if (((f[l * h + m] & 0x0010) && (f[l * h + m] < 0x1000)) && ((f[l * h + m + 1] & 0x0010) && (f[l * h + m + 1] < 0x1000))) {
      b[l * h + m] = d[l * h + m] - (e[l * h + m + 1] - e[l * h + m]) * i / k;
    }
  }
}

__kernel void L(__global float* a, __global float* b, __global float* c, __global float* d, int e, int f, int g, int h, int i, int j) {
  e = e + 2;
  f = f + 2;

  int k = get_global_id(1);
  int l = get_global_id(0);

  if ((k >= 0 && k <= e - 1) && (l >= 0 && l <= f - 1)) {
    if (g == 1) {
      a[0 * f + l] = 0.0;
      b[0 * f + l] = b[1 * f + l];
    }
    if (g == 2) {
      a[0 * f + l] = 0.0;
      b[0 * f + l] = (-1.0) * b[1 * f + l];
    }
    if (g == 3) {
      a[0 * f + l] = a[1 * f + l];
      b[0 * f + l] = b[1 * f + l];
    }
    if (g == 4) {
      a[0 * f + l] = a[(e - 2) * f + l];
      b[0 * f + l] = b[(e - 2) * f + l];
      b[1 * f + l] = b[(e - 2) * f + l];
      c[1 * f + l] = c[(e - 2) * f + l];
    }

    d[0 * f + l] = d[1 * f + l];

    if (h == 1) {
      a[(e - 2) * f + l] = 0.0;
      b[(e - 1) * f + l] = b[(e - 2) * f + l];
    }
    if (h == 2) {
      a[(e - 2) * f + l] = 0.0;
      b[(e - 1) * f + l] = (-1.0) * b[(e - 2) * f + l];
    }
    if (h == 3) {
      a[(e - 2) * f + l] = a[(e - 3) * f + l];
      b[(e - 1) * f + l] = b[(e - 2) * f + l];
    }
    if (h == 4) {
      a[(e - 2) * f + l] = a[1 * f + l];
      b[(e - 1) * f + l] = b[2 * f + l];
    }

    d[(e - 1) * f + l] = d[(e - 2) * f + l];

    if (i == 1) {
      b[k * f + (f - 2)] = 0.0;
      a[k * f + (f - 1)] = a[k * f + (f - 2)];
    }
    if (i == 2) {
      b[k * f + (f - 2)] = 0.0;
      a[k * f + (f - 1)] = (-1.0) * a[k * f + (f - 2)];
    }
    if (i == 3) {
      b[k * f + (f - 2)] = b[k * f + (f - 3)];
      a[k * f + (f - 1)] = a[k * f + (f - 2)];
    }
    if (i == 4) {
      b[k * f + (f - 2)] = b[k * f + 1];
      a[k * f + (f - 1)] = a[k * f + 2];
    }

    d[k * f + 0] = d[k * f + 1];

    if (j == 1) {
      b[k * f + 0] = 0.0;
      a[k * f + 0] = a[k * f + 1];
    }
    if (j == 2) {
      b[k * f + 0] = 0.0;
      a[k * f + 0] = (-1.0) * a[k * f + 1];
    }
    if (j == 3) {
      b[k * f + 0] = b[k * f + 1];
      a[k * f + 0] = a[k * f + 1];
    }
    if (j == 4) {
      b[k * f + 0] = b[k * f + (f - 3)];
      a[k * f + 0] = a[k * f + (f - 3)];
      a[k * f + 1] = a[k * f + (f - 2)];
      c[k * f + 1] = c[k * f + (f - 2)];
    }

    d[k * f + (f - 1)] = d[k * f + (f - 2)];
  }
}

__kernel void M(__global float* a, __global float* b, __global float* c, __global int* d, int e, int f) {
  e = e + 2;
  f = f + 2;

  int g = get_global_id(1);
  int h = get_global_id(0);

  if ((g > 0 && g < e - 1) && (h > 0 && h < f - 1)) {
    if (d[g * f + h] & 0x000f) {
      switch (d[g * f + h]) {
        case 0x0001: {
          b[g * f + h] = 0.0;
          a[g * f + h] = -a[g * f + (h + 1)];
          a[(g - 1) * f + h] = -a[(g - 1) * f + (h + 1)];
          c[g * f + h] = c[g * f + (h + 1)];
          break;
        }
        case 0x0008: {
          a[g * f + h] = 0.0;
          b[g * f + h] = -b[(g + 1) * f + h];
          b[g * f + (h - 1)] = -b[(g + 1) * f + (h - 1)];
          c[g * f + h] = c[(g + 1) * f + h];
          break;
        }
        case 0x0002: {
          b[g * f + (h - 1)] = 0.0;
          a[g * f + h] = -a[g * f + (h - 1)];
          a[(g - 1) * f + h] = -a[(g - 1) * f + (h - 1)];
          c[g * f + h] = c[g * f + (h - 1)];
          break;
        }
        case 0x0004: {
          a[(g - 1) * f + h] = 0.0;
          b[g * f + h] = -b[(g - 1) * f + h];
          b[g * f + (h - 1)] = -b[(g - 1) * f + (h - 1)];
          c[g * f + h] = c[(g - 1) * f + h];
          break;
        }
        case 0x0009: {
          b[g * f + h] = 0.0;
          a[g * f + h] = 0.0;
          b[g * f + (h - 1)] = -b[(g + 1) * f + (h - 1)];
          a[(g - 1) * f + h] = -a[(g - 1) * f + (h + 1)];
          c[g * f + h] = 0.5 * (c[g * f + (h + 1)] + c[(g + 1) * f + h]);
          break;
        }
        case 0x000a: {
          b[g * f + (h - 1)] = 0.0;
          a[g * f + h] = 0.0;
          b[g * f + h] = -b[(g + 1) * f + h];
          a[(g - 1) * f + h] = -a[(g - 1) * f + (h - 1)];
          c[g * f + h] = 0.5 * (c[g * f + (h - 1)] + c[(g + 1) * f + h]);
          break;
        }
        case 0x0006: {
          b[g * f + (h - 1)] = 0.0;
          a[(g - 1) * f + h] = 0.0;
          b[g * f + h] = -b[(g - 1) * f + h];
          a[g * f + h] = -a[g * f + (h - 1)];
          c[g * f + h] = 0.5 * (c[g * f + (h - 1)] + c[(g - 1) * f + h]);
          break;
        }
        case 0x0005: {
          b[g * f + h] = 0.0;
          a[(g - 1) * f + h] = 0.0;
          b[g * f + (h - 1)] = -b[(g - 1) * f + (h - 1)];
          a[g * f + h] = -a[g * f + (h + 1)];
          c[g * f + h] = 0.5 * (c[g * f + (h + 1)] + c[(g - 1) * f + h]);
          break;
        }
        default:
          break;
      }
    }
  }
}

__kernel void N(__global float* a, __global float* b, __global float* c, __global float* d, int e, int f, float g, float h) {
  e = e + 2;
  f = f + 2;

  int i = get_global_id(1);
  int j = get_global_id(0);
  if ((i >= 0 && i <= e - 2)) {
    a[i * f + (f - 1)] = 2.0 - a[i * f + (f - 2)];
  }
}