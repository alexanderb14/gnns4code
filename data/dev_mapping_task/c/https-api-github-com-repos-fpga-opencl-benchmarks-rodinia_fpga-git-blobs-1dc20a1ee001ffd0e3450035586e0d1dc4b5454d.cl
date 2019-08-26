__kernel void A(__global float* a, __local float* b, int c, int d) {
  int e, f;
  int g = get_local_id(0);

  int h = d * c + d;
  for (e = 0; e < 64; e++) {
    b[e * 64 + g] = a[h + g];
    h += c;
  }

  barrier(1);

  for (e = 0; e < 64 - 1; e++) {
    if (g > e) {
      for (f = 0; f < e; f++) {
        b[g * 64 + e] -= b[g * 64 + f] * b[f * 64 + e];
      }
      b[g * 64 + e] /= b[e * 64 + e];
    }

    barrier(1);

    if (g > e) {
      for (f = 0; f < e + 1; f++) {
        b[(e + 1) * 64 + g] -= b[(e + 1) * 64 + f] * b[f * 64 + g];
      }
    }

    barrier(1);
  }

  h = (d + 1) * c + d;
  for (e = 1; e < 64; e++) {
    a[h + g] = b[e * 64 + g];
    h += c;
  }
}

__kernel void B(__global float* a, __local float* b, __local float* c, __local float* d, int e, int f) {
  int g, h, i;
  int j;

  int k = get_group_id(0);
  int l = get_local_id(0);

  if (l < 64) {
    j = l;
    i = f * e + f;
    for (g = 0; g < 64 / 2; g++) {
      b[g * 64 + j] = a[i + j];
      i += e;
    }

    i = f * e + f;
    for (g = 0; g < 64; g++) {
      c[g * 64 + j] = a[i + (k + 1) * 64 + j];
      i += e;
    }
  } else {
    j = l - 64;
    i = (f + 64 / 2) * e + f;
    for (g = 64 / 2; g < 64; g++) {
      b[g * 64 + j] = a[i + j];
      i += e;
    }

    i = (f + (k + 1) * 64) * e + f;
    for (g = 0; g < 64; g++) {
      d[g * 64 + j] = a[i + j];
      i += e;
    }
  }
  barrier(1);

  if (l < 64) {
    j = l;
    for (g = 1; g < 64; g++) {
      for (h = 0; h < g; h++) {
        c[g * 64 + j] -= b[g * 64 + h] * c[h * 64 + j];
      }
    }
  } else {
    j = l - 64;
    for (g = 0; g < 64; g++) {
      for (h = 0; h < g; h++) {
        d[j * 64 + g] -= b[h * 64 + g] * d[j * 64 + h];
      }
      d[j * 64 + g] /= b[g * 64 + g];
    }
  }
  barrier(1);

  if (l < 64) {
    j = l;
    i = (f + 1) * e + f;
    for (g = 1; g < 64; g++) {
      a[i + (k + 1) * 64 + j] = c[g * 64 + j];
      i += e;
    }
  } else {
    j = l - 64;
    i = (f + (k + 1) * 64) * e + f;
    for (g = 0; g < 64; g++) {
      a[i + j] = d[g * 64 + j];
      i += e;
    }
  }
}

__kernel void C(__global float* a, __local float* b, __local float* c, int d, int e) {
  int f = get_group_id(0);
  int g = get_group_id(1);

  int h = get_local_id(0);
  int i = get_local_id(1);

  int j;
  float k;

  int l = e + (g + 1) * 64;
  int m = e + (f + 1) * 64;

  b[i * 64 + h] = a[(e + i) * d + m + h];
  c[i * 64 + h] = a[(l + i) * d + e + h];

  barrier(1);

  k = 0;
  for (j = 0; j < 64; j++) {
    k += c[i * 64 + j] * b[j * 64 + h];
  }
  a[(l + i) * d + m + h] -= k;
}