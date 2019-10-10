__kernel void A(__global float* a, __local float* b, int c, int d) {
  int e = get_local_id(0);
  int f = d * c + d;

  for (int g = 0; g < 64; ++g) {
    b[g * 64 + e] = a[f + e];
    f += c;
  }

  barrier(1);

  for (int g = 0; g < 64 - 1; ++g) {
    if (e > g) {
      for (int h = 0; h < g; ++h) {
        b[e * 64 + g] -= b[e * 64 + h] * b[h * 64 + g];
      }
      b[e * 64 + g] /= b[g * 64 + g];
    }

    barrier(1);

    if (e > g) {
      for (int h = 0; h < g + 1; ++h) {
        b[(g + 1) * 64 + e] -= b[(g + 1) * 64 + h] * b[h * 64 + e];
      }
    }
    barrier(1);
  }

  f = (d + 1) * c + d;
  for (int g = 1; g < 64; ++g) {
    a[f + e] = b[g * 64 + e];
    f += c;
  }
}

__kernel void B(__global float* a, __local float* b, __local float* c, __local float* d, int e, int f) {
  int g = get_group_id(0);
  int h = get_local_id(0);

  if (h < 64) {
    int i = h;
    int j = f * e + f;
    for (int k = 0; k < 64 / 2; ++k) {
      b[k * 64 + i] = a[j + i];
      j += e;
    }
    j = f * e + f;
    for (int k = 0; k < 64; ++k) {
      c[k * 64 + i] = a[j + (g + 1) * 64 + i];
      j += e;
    }
  } else {
    int i = h - 64;
    int j = (f + 64 / 2) * e + f;
    for (int k = 64 / 2; k < 64; ++k) {
      b[k * 64 + i] = a[j + i];
      j += e;
    }
    j = (f + (g + 1) * 64) * e + f;
    for (int k = 0; k < 64; ++k) {
      d[k * 64 + i] = a[j + i];
      j += e;
    }
  }

  barrier(1);

  if (h < 64) {
    int i = h;
    for (int k = 1; k < 64; ++k) {
      for (int l = 0; l < k; ++l) {
        c[k * 64 + i] -= b[k * 64 + l] * c[l * 64 + i];
      }
    }
  } else {
    int i = h - 64;
    for (int k = 0; k < 64; ++k) {
      for (int l = 0; l < k; ++l) {
        d[i * 64 + k] -= d[i * 64 + l] * b[l * 64 + k];
      }
      d[i * 64 + k] /= b[k * 64 + k];
    }
  }

  barrier(1);

  if (h < 64) {
    int i = h;
    int j = (f + 1) * e + f;
    for (int k = 1; k < 64; ++k) {
      a[j + (g + 1) * 64 + i] = c[k * 64 + i];
      j += e;
    }
  } else {
    int i = h - 64;
    int j = (f + (g + 1) * 64) * e + f;
    for (int k = 0; k < 64; ++k) {
      a[j + i] = d[k * 64 + i];
      j += e;
    }
  }
}

__kernel void C(__global float* a, __local float* b, __local float* c, int d, int e) {
  int f = get_group_id(0);
  int g = get_group_id(1);
  int h = get_local_id(0);
  int i = get_local_id(1);
  int j = e + (g + 1) * 64;
  int k = e + (f + 1) * 64;

  b[i * 64 + h] = a[(e + i) * d + k + h];
  c[i * 64 + h] = a[(j + i) * d + e + h];

  barrier(1);

  float l = 0;
  for (int m = 0; m < 64; ++m) {
    l += c[i * 64 + m] * b[m * 64 + h];
  }
  a[(j + i) * d + k + h] -= l;
}