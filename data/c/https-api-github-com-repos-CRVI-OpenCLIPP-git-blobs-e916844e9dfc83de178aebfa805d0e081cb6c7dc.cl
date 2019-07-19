kernel void A(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 3 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void B(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 5 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void C(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 7 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void D(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 9 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void E(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 11 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void F(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 13 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void G(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 15 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void H(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 17 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void I(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 19 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void J(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 21 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void K(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 23 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void L(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 25 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void M(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 27 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void N(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 29 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void O(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 31 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void P(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 33 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void Q(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 35 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void R(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 37 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void S(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 39 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void T(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 41 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void U(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 43 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void V(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 45 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void W(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 47 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void X(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 49 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void Y(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 51 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void Z(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 53 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void AA(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 55 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void AB(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 57 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void AC(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 59 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void AD(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 61 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void AE(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 63 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = min(n, i);
    }
  }
  b[h * d + g] = i;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AF(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 3 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AG(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 5 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AH(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 7 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AI(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 9 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AJ(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 11 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AK(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 13 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AL(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 15 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AM(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 17 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AN(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 19 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AO(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 21 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AP(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 23 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AQ(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 25 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AR(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 27 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AS(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 29 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AT(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 31 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AU(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 33 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AV(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 35 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AW(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 37 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AX(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 39 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AY(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 41 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AZ(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 43 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void BA(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 45 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void BB(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 47 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void BC(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 49 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void BD(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 51 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void BE(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 53 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void BF(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 55 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void BG(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 57 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void BH(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 59 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void BI(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 61 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void BJ(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 63 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = min(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = min(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
kernel void BK(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 3 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void BL(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 5 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void BM(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 7 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void BN(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 9 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void BO(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 11 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void BP(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 13 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void BQ(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 15 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void BR(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 17 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void BS(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 19 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void BT(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 21 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void BU(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 23 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void BV(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 25 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void BW(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 27 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void BX(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 29 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void BY(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 31 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void BZ(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 33 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void CA(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 35 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void CB(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 37 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void CC(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 39 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void CD(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 41 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void CE(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 43 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void CF(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 45 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void CG(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 47 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void CH(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 49 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void CI(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 51 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void CJ(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 53 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void CK(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 55 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void CL(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 57 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void CM(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 59 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void CN(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 61 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
kernel void CO(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = a[h * c + g];
  const int j = 63 / 2;
  if (h - j < 0 || h + j >= f || g - j < 0 || g + j >= e) {
    b[h * d + g] = i;
    return;
  }
  for (int k = -j; k <= j; k++) {
    int l = h + k;
    for (int m = -j; m <= j; m++) {
      uchar n = a[l * c + g + m];
      i = max(n, i);
    }
  }
  b[h * d + g] = i;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void CP(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 3 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void CQ(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 5 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void CR(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 7 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void CS(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 9 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void CT(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 11 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void CU(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 13 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void CV(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 15 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void CW(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 17 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void CX(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 19 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void CY(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 21 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void CZ(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 23 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void DA(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 25 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void DB(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 27 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void DC(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 29 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void DD(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 31 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void DE(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 33 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void DF(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 35 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void DG(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 37 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void DH(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 39 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void DI(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 41 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void DJ(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 43 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void DK(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 45 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void DL(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 47 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void DM(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 49 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void DN(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 51 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void DO(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 53 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void DP(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 55 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void DQ(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 57 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void DR(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 59 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void DS(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 61 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void DT(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const int i = get_local_id(1) * get_local_size(0) + get_local_id(0);
  uchar j = a[h * c + g];
  local uchar k[16 * 16];
  k[i] = j;
  barrier(1);
  int l = 16 - 1;
  int m = g - (g & l);
  int n = m + 16;
  int o = h - (h & l);
  int p = o + 16;
  const int q = 63 / 2;
  if (h - q < 0 || h + q >= f || g - q < 0 || g + q >= e) {
    b[h * d + g] = j;
    return;
  }
  for (int r = -q; r <= q; r++) {
    int s = h + r;
    if (s < o || s >= p) {
      for (int t = -q; t <= q; t++) {
        uchar u = a[s * c + g + t];
        j = max(u, j);
      }
    } else {
      for (int t = -q; t <= q; t++) {
        int v = g + t;
        uchar u;
        if (v < m || v >= n)
          u = a[s * c + v];
        else {
          int w = s - o;
          int x = v - m;
          u = k[w * 16 + x];
        }
        j = max(u, j);
      }
    }
  }
  b[h * d + g] = j;
}