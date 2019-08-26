kernel void A(global int* a, int b, int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);
  if (d >= b || e >= c) {
    return;
  }

  int f = b * e + d;
  if (a[f] == 1) {
    a[f] = f + 2;
  }
}

kernel void B(global int* a, int b, int c, global char* d) {
  int e = get_global_id(0);
  int f = get_global_id(1);
  if (e >= b || f >= c) {
    return;
  }

  int g = a[b * f + e];
  int h = g;
  int i = 0;

  if (h == 0) {
    return;
  }

  if (f + 1 < c) {
    i = a[b * (f + 1) + (e)];
    if (i && i < h) {
      h = i;
    }
  }
  if (f - 1 >= 0) {
    i = a[b * (f - 1) + (e)];
    if (i && i < h) {
      h = i;
    }
  }
  if (e + 1 < b) {
    i = a[b * (f) + (e + 1)];
    if (i && i < h) {
      h = i;
    }
  }
  if (e - 1 >= 0) {
    i = a[b * (f) + (e - 1)];
    if (i && i < h) {
      h = i;
    }
  }

  if (h < g) {
    *d = 1;
    a[b * f + e] = h;
  }
}

kernel void C(global int* a, int b, int c, global char* d) {
  int e = get_global_id(0);
  int f = get_global_id(1);
  if (e >= b || f >= c) {
    return;
  }

  int g = a[b * f + e];
  int h = g;
  int i = 0;
  int j;

  if (h == 0) {
    return;
  }

  j = 1;
  while (true) {
    if (f + j < 0 || f + j >= c) {
      break;
    }
    i = a[b * (f + j) + (e)];
    if (i == 0) {
      break;
    }
    if (i < h) {
      h = i;
    }
    ++j;
  }
  j = 1;
  while (true) {
    if (f - j < 0 || f - j >= c) {
      break;
    }
    i = a[b * (f - j) + (e)];
    if (i == 0) {
      break;
    }
    if (i < h) {
      h = i;
    }
    ++j;
  }
  j = 1;
  while (true) {
    if (e + j < 0 || e + j >= b) {
      break;
    }
    i = a[b * f + (e + j)];
    if (i == 0) {
      break;
    }
    if (i < h) {
      h = i;
    }
    ++j;
  }
  j = 1;
  while (true) {
    if (e - j < 0 || e - j >= b) {
      break;
    }
    i = a[b * f + (e - j)];
    if (i == 0) {
      break;
    }
    if (i < h) {
      h = i;
    }
    ++j;
  }

  if (h < g) {
    *d = 1;
    a[b * f + e] = h;
  }
}

int D(global int* a, int b) {
  while (b != a[b] - 2) {
    b = a[b] - 2;
  }
  return b;
}

kernel void E(global int* a, int b, int c, global char* d) {
  int e = get_global_id(0);
  int f = get_global_id(1);
  if (e >= b || f >= c) {
    return;
  }

  int g = a[b * f + e];
  int h = g;

  if (g == 0) {
    return;
  }

  bool i = f - 1 >= 0 && a[b * (f - 1) + (e)];
  bool j = e + 1 < b && a[b * (f) + (e + 1)];
  bool k = f + 1 < c && a[b * (f + 1) + (e)];
  bool l = e - 1 >= 0 && a[b * (f) + (e - 1)];
  int m;
  int n;
  int o;
  int p;

  if (i) {
    m = D(a, b * (f - 1) + (e));
    if (m + 2 < h) {
      h = m + 2;
    }
  }
  if (j) {
    n = D(a, b * (f) + (e + 1));
    if (n + 2 < h) {
      h = n + 2;
    }
  }
  if (k) {
    o = D(a, b * (f + 1) + (e));
    if (o + 2 < h) {
      h = o + 2;
    }
  }
  if (l) {
    p = D(a, b * (f) + (e - 1));
    if (p + 2 < h) {
      h = p + 2;
    }
  }

  if (h < g) {
    *d = 1;
    a[b * f + e] = h;
    if (i && m + 2 > h) {
      a[m] = h;
    }
    if (j && n + 2 > h) {
      a[n] = h;
    }
    if (k && o + 2 > h) {
      a[o] = h;
    }
    if (l && p + 2 > h) {
      a[p] = h;
    }
  }
}

kernel void F(global int* a, int b, int c, global char* d) {
  int e = 0;
  int f = get_global_id(0);
  int g = 1 << 30;

  if (f >= c) {
    return;
  }

  while (e < b) {
    int h = a[b * f + e];

    if (h == 0) {
      g = 1 << 30;
    } else {
      if (h < g) {
        g = h;
      } else if (h > g) {
        a[b * f + e] = g;
        *d = 1;
      }
    }

    ++e;
  }
}

kernel void G(global int* a, int b, int c, global char* d) {
  int e = b - 1;
  int f = get_global_id(0);
  int g = 1 << 30;

  if (f >= c) {
    return;
  }

  while (e >= 0) {
    int h = a[b * f + e];

    if (h == 0) {
      g = 1 << 30;
    } else {
      if (h < g) {
        g = h;
      } else if (h > g) {
        a[b * f + e] = g;
        *d = 1;
      }
    }

    --e;
  }
}

kernel void H(global int* a, int b, int c, global char* d) {
  int e = get_global_id(0);
  int f = 0;
  int g = 1 << 30;

  if (e >= b) {
    return;
  }

  while (f < c) {
    int h = a[b * f + e];

    if (h == 0) {
      g = 1 << 30;
    } else {
      if (h < g) {
        g = h;
      } else if (h > g) {
        a[b * f + e] = g;
        *d = 1;
      }
    }

    ++f;
  }
}

kernel void I(global int* a, int b, int c, global char* d) {
  int e = get_global_id(0);
  int f = c - 1;
  int g = 1 << 30;

  if (e >= b) {
    return;
  }

  while (f >= 0) {
    int h = a[b * f + e];

    if (h == 0) {
      g = 1 << 30;
    } else {
      if (h < g) {
        g = h;
      } else if (h > g) {
        a[b * f + e] = g;
        *d = 1;
      }
    }

    --f;
  }
}

kernel void J(global int* a, int b, int c, global char* d) {
  int e = get_global_id(0);
  int f = 0;
  char g = 0;

  if (e >= b) {
    return;
  }

  while (f < c) {
    if (!a[b * f + e]) {
      ++f;
      continue;
    }
    int h = f;
    int i = a[b * f + e];
    int j = i;

    while (h < c && (j = a[b * h + e])) {
      if (j != i) {
        g = 1;
      }
      if (j < i) {
        i = j;
      }
      ++h;
    }

    while (f != h) {
      a[b * f + e] = i;
      ++f;
    }
  }

  if (g) {
    *d = g;
  }
}

kernel void K(global int* a, int b, int c, global char* d) {
  int e = 0;
  int f = get_global_id(0);
  char g = 0;

  if (f >= c) {
    return;
  }

  while (e < b) {
    if (!a[b * f + e]) {
      ++e;
      continue;
    }
    int h = e;
    int i = a[b * f + e];
    int j = i;

    while (h < b && (j = a[b * f + h])) {
      if (j != i) {
        g = 1;
      }
      if (j < i) {
        i = j;
      }
      ++h;
    }

    while (e != h) {
      a[b * f + e] = i;
      ++e;
    }
  }

  if (g) {
    *d = g;
  }
}

kernel void L(global int* a, int b) {
  unsigned int c = get_global_id(0);
  unsigned int d = get_global_id(1);

  int e = b * d + c;
  a[e] = a[e];
}

kernel void M(global int* a, int b, int c) {
  int d = get_local_id(0);
  int e = get_local_id(1);
  int f = get_global_id(0);
  int g = get_global_id(1);

  char h = 1;
  local int i[8 * 8];
  local char j;

  if (g >= c || f >= b) {
    h = 0;
  }
  i[8 * e + d] = h ? a[b * g + f] : 0;
  j = 1;

  while (j) {
    barrier(1);
    j = 0;
    barrier(1);

    if (h) {
      int k = 1 << 30;
      int l;
      if (d > 0) {
        l = i[8 * (e) + (d - 1)];
        if (l && l < k) {
          k = l;
        }
      }
      if (d < 8 - 1) {
        l = i[8 * (e) + (d + 1)];
        if (l && l < k) {
          k = l;
        }
      }
      if (e > 0) {
        l = i[8 * (e - 1) + (d)];
        if (l && l < k) {
          k = l;
        }
      }
      if (e < 8 - 1) {
        l = i[8 * (e + 1) + (d)];
        if (l && l < k) {
          k = l;
        }
      }
      if (k < i[8 * e + d]) {
        j = 1;
        i[8 * e + d] = k;
      }
    }

    barrier(1);
  }

  if (h) {
    a[b * g + f] = i[8 * e + d];
  }
}

kernel void N(global int* a, int b, int c) {
  int d = get_local_id(0);
  int e = get_local_id(1);
  int f = get_global_id(0);
  int g = get_global_id(1);

  char h = 1;
  int i;
  local int j[8 * 8];
  local char k;

  if (g >= c || f >= b) {
    h = 0;
  }
  j[8 * e + d] = h ? a[b * g + f] : 0;
  k = 1;

  while (k) {
    barrier(1);
    k = 0;
    barrier(1);

    if (h) {
      int l = 1 << 30;
      int m;

      i = 1;
      while (d - i >= 0) {
        m = j[8 * (e) + (d - i)];
        if (!m) {
          break;
        }
        if (m < l) {
          l = m;
        }
        ++i;
      }

      i = 1;
      while (d + i < 8) {
        m = j[8 * (e) + (d + i)];
        if (!m) {
          break;
        }
        if (m < l) {
          l = m;
        }
        ++i;
      }

      i = 1;
      while (e - i >= 0) {
        m = j[8 * (e - i) + (d)];
        if (!m) {
          break;
        }
        if (m < l) {
          l = m;
        }
        ++i;
      }

      i = 1;
      while (e + i < 8) {
        m = j[8 * (e + i) + (d)];
        if (!m) {
          break;
        }
        if (m < l) {
          l = m;
        }
        ++i;
      }
      if (l < j[8 * e + d]) {
        k = 1;
        j[8 * e + d] = l;
      }
    }

    barrier(1);
  }

  if (h) {
    a[b * g + f] = j[8 * e + d];
  }
}
kernel void O(global int* a, int b, int c, global char* d) {
  int e, f;
  int g = get_local_id(0);
  int h = get_local_id(1);
  int i, j;
  char k;

  local int l[1];
  local int m[512];
  local int n[512];
  local int o[1];
  int p;

  while (1) {
    e = get_global_id(0);
    f = get_global_id(1);
    k = 0;

    if (g == 0 && h == 0) {
      *l = 1 << 30;
      *o = 0;
    }

    barrier(1);

    if ((e < b && f < c) && (j = a[(b * f + e)])) {
      if ((f > 0) && a[(b * (f - 1) + (e))] > j) {
        k = 1;
      }
      if ((e < b - 1) && a[(b * (f) + (e + 1))] > j) {
        k = 1;
      }
      if ((f < c - 1) && a[(b * (f + 1) + (e))] > j) {
        k = 1;
      }
      if ((e > 0) && a[(b * (f) + (e - 1))] > j) {
        k = 1;
      }

      if (k) {
        atomic_min(l, j);
      }
    }

    barrier(1);
    if (*l == 1 << 30) {
      return;
    } else if (g == 0 && h == 0) {
      *d = 1;
    }

    if ((e < b && f < c) && j == *l) {
      if ((f > 0)) {
        if (a[(b * (f - 1) + (e))] > j) {
          a[(b * (f - 1) + (e))] = j;
          p = atomic_add(o, 1);
          m[p] = e;
          n[p] = f - 1;
        }
      }
      if ((e < b - 1)) {
        if (a[(b * (f) + (e + 1))] > j) {
          a[(b * (f) + (e + 1))] = j;
          p = atomic_add(o, 1);
          m[p] = e + 1;
          n[p] = f;
        }
      }
      if ((f < c - 1)) {
        if (a[(b * (f + 1) + (e))] > j) {
          a[(b * (f + 1) + (e))] = j;
          p = atomic_add(o, 1);
          m[p] = e;
          n[p] = f + 1;
        }
      }
      if ((e > 0)) {
        if (a[(b * (f) + (e - 1))] > j) {
          a[(b * (f) + (e - 1))] = j;
          p = atomic_add(o, 1);
          m[p] = e - 1;
          n[p] = f;
        }
      }
    }

    j = *l;

    while (1) {
      barrier(1);
      if (*o == 0) {
        break;
      }

      barrier(1);
      p = atomic_sub(o, 1) - 1;
      if (p < 0) {
        atomic_add(o, 1);
      } else {
        e = m[p];
        f = n[p];
      }

      barrier(1);

      if (p >= 0) {
        if ((f > 0)) {
          if (a[(b * (f - 1) + (e))] > j) {
            a[(b * (f - 1) + (e))] = j;
            p = atomic_add(o, 1);
            if (p >= 512) {
              atomic_sub(o, 1);
            } else {
              m[p] = e;
              n[p] = f - 1;
            }
          }
        }
        if ((e < b - 1)) {
          if (a[(b * (f) + (e + 1))] > j) {
            a[(b * (f) + (e + 1))] = j;
            p = atomic_add(o, 1);
            if (p >= 512) {
              atomic_sub(o, 1);
            } else {
              m[p] = e + 1;
              n[p] = f;
            }
          }
        }
        if ((f < c - 1)) {
          if (a[(b * (f + 1) + (e))] > j) {
            a[(b * (f + 1) + (e))] = j;
            p = atomic_add(o, 1);
            if (p >= 512) {
              atomic_sub(o, 1);
            } else {
              m[p] = e;
              n[p] = f + 1;
            }
          }
        }
        if ((e > 0)) {
          if (a[(b * (f) + (e - 1))] > j) {
            a[(b * (f) + (e - 1))] = j;
            p = atomic_add(o, 1);
            if (p >= 512) {
              atomic_sub(o, 1);
            } else {
              m[p] = e - 1;
              n[p] = f;
            }
          }
        }
      }
    }
  }
}