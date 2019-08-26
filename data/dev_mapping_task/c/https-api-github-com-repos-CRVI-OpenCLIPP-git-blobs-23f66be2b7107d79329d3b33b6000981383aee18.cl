void A(global float* a, float b, int c) {
  global int* d = (global int*)a;
  bool e = false;
  while (!e) {
    float f = *a;
    float g = min(f, b);
    int h = atomic_cmpxchg(d, __builtin_astype(f, int), __builtin_astype(g, int));
    float i = __builtin_astype(h, float);
    e = (f == i);
  }
}
void B(global float* a, float b, int c) {
  global int* d = (global int*)a;
  bool e = false;
  while (!e) {
    float f = *a;
    float g = max(f, b);
    int h = atomic_cmpxchg(d, __builtin_astype(f, int), __builtin_astype(g, int));
    float i = __builtin_astype(h, float);
    e = (f == i);
  }
}

void C(global float* a, uchar2 b, int c) {
  A(a + 0, b.x, c);
  A(a + 1, b.y, c);
}
void D(global float* a, uchar2 b, int c) {
  B(a + 0, b.x, c);
  B(a + 1, b.y, c);
}
void E(global float* a, uchar3 b, int c) {
  A(a + 0, b.x, c);
  A(a + 1, b.y, c);
  A(a + 2, b.z, c);
}
void F(global float* a, uchar3 b, int c) {
  B(a + 0, b.x, c);
  B(a + 1, b.y, c);
  B(a + 2, b.z, c);
}
void G(global float* a, uchar4 b, int c) {
  A(a + 0, b.x, c);
  A(a + 1, b.y, c);
  A(a + 2, b.z, c);
  A(a + 3, b.w, c);
}
void H(global float* a, uchar4 b, int c) {
  B(a + 0, b.x, c);
  B(a + 1, b.y, c);
  B(a + 2, b.z, c);
  B(a + 3, b.w, c);
}
void I(global float* a, float b, int c) {
  const int d = get_group_id(1) * get_num_groups(0) + get_group_id(0);

  global float* e = (global float*)(a + d * 4);
  *e = b;

  const int f = get_num_groups(0) * get_num_groups(1);
  a[f * 4 + d] = c;
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void J(global const uchar* a, global float* b, int c, int d, int e) {
  local uchar f[(16 * 16)];
  local int g[(16 * 16)];
  int h = get_global_id(0);
  const int i = (h & (16 - 1)) + (h >> 4) * 16 * 16;
  const int j = get_global_id(1);
  const int k = get_local_id(1) * get_local_size(0) + get_local_id(0);
  c /= sizeof(uchar);
  float l;
  if (i < d && j < e) {
    uchar m = convert_uchar(a[(j * c) + i + 0]);
    m = m;
    int n = 1;
    for (int o = 16; o < 16 * 16; o += 16)
      if (i + o < d) {
        uchar p = convert_uchar(a[(j * c) + i + o]);
        m = min(m, p);
        n++;
      }
    f[k] = m;
    g[k] = n;
  } else
    g[k] = 0;
  barrier(1);
  if (k < 128)
    if (g[k] && g[k + 128]) {
      l = convert_float(g[k + 128]) / g[k];
      f[k] = min(f[k], f[k + 128]);
      g[k] += g[k + 128];
    };
  barrier(1);
  if (k < 64)
    if (g[k] && g[k + 64]) {
      l = convert_float(g[k + 64]) / g[k];
      f[k] = min(f[k], f[k + 64]);
      g[k] += g[k + 64];
    };
  barrier(1);
  if (k < 32)
    if (g[k] && g[k + 32]) {
      l = convert_float(g[k + 32]) / g[k];
      f[k] = min(f[k], f[k + 32]);
      g[k] += g[k + 32];
    };
  barrier(1);
  if (k < 16)
    if (g[k] && g[k + 16]) {
      l = convert_float(g[k + 16]) / g[k];
      f[k] = min(f[k], f[k + 16]);
      g[k] += g[k + 16];
    };
  barrier(1);
  if (k < 8)
    if (g[k] && g[k + 8]) {
      l = convert_float(g[k + 8]) / g[k];
      f[k] = min(f[k], f[k + 8]);
      g[k] += g[k + 8];
    };
  barrier(1);
  if (k < 4)
    if (g[k] && g[k + 4]) {
      l = convert_float(g[k + 4]) / g[k];
      f[k] = min(f[k], f[k + 4]);
      g[k] += g[k + 4];
    };
  barrier(1);
  if (k < 2)
    if (g[k] && g[k + 2]) {
      l = convert_float(g[k + 2]) / g[k];
      f[k] = min(f[k], f[k + 2]);
      g[k] += g[k + 2];
    };
  barrier(1);
  if (k == 0) {
    if (g[k] && g[k + 1]) {
      l = convert_float(g[k + 1]) / g[k];
      f[k] = min(f[k], f[k + 1]);
      g[k] += g[k + 1];
    };
    A(b, f[0], g[0]);
  }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void K(global const uchar* a, global float* b, int c, int d, int e) {
  local uchar f[(16 * 16)];
  int g = get_global_id(0);
  const int h = (g & (16 - 1)) + (g >> 4) * 16 * 16;
  const int i = get_global_id(1);
  const int j = get_local_id(1) * get_local_size(0) + get_local_id(0);
  c /= sizeof(uchar);
  uchar k = convert_uchar(a[(i * c) + h + 0]);
  k = k;
  for (int l = 16; l < 16 * 16; l += 16) {
    uchar m = convert_uchar(a[(i * c) + h + l]);
    k = min(k, m);
  }
  f[j] = k;
  barrier(1);
  if (j < 128)
    f[j] = min(f[j], f[j + 128]);
  barrier(1);
  if (j < 64)
    f[j] = min(f[j], f[j + 64]);
  barrier(1);
  if (j < 32)
    f[j] = min(f[j], f[j + 32]);
  barrier(1);
  if (j < 16)
    f[j] = min(f[j], f[j + 16]);
  barrier(1);
  if (j < 8)
    f[j] = min(f[j], f[j + 8]);
  barrier(1);
  if (j < 4)
    f[j] = min(f[j], f[j + 4]);
  barrier(1);
  if (j < 2)
    f[j] = min(f[j], f[j + 2]);
  barrier(1);
  if (j == 0) {
    f[j] = min(f[j], f[j + 1]);
    A(b, f[0], 16 * 16 * 16);
  }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void L(global const uchar* a, global float* b, int c, int d, int e) {
  local uchar f[(16 * 16)];
  local int g[(16 * 16)];
  int h = get_global_id(0);
  const int i = (h & (16 - 1)) + (h >> 4) * 16 * 16;
  const int j = get_global_id(1);
  const int k = get_local_id(1) * get_local_size(0) + get_local_id(0);
  c /= sizeof(uchar);
  float l;
  if (i < d && j < e) {
    uchar m = convert_uchar(a[(j * c) + i + 0]);
    m = m;
    int n = 1;
    for (int o = 16; o < 16 * 16; o += 16)
      if (i + o < d) {
        uchar p = convert_uchar(a[(j * c) + i + o]);
        m = max(m, p);
        n++;
      }
    f[k] = m;
    g[k] = n;
  } else
    g[k] = 0;
  barrier(1);
  if (k < 128)
    if (g[k] && g[k + 128]) {
      l = convert_float(g[k + 128]) / g[k];
      f[k] = max(f[k], f[k + 128]);
      g[k] += g[k + 128];
    };
  barrier(1);
  if (k < 64)
    if (g[k] && g[k + 64]) {
      l = convert_float(g[k + 64]) / g[k];
      f[k] = max(f[k], f[k + 64]);
      g[k] += g[k + 64];
    };
  barrier(1);
  if (k < 32)
    if (g[k] && g[k + 32]) {
      l = convert_float(g[k + 32]) / g[k];
      f[k] = max(f[k], f[k + 32]);
      g[k] += g[k + 32];
    };
  barrier(1);
  if (k < 16)
    if (g[k] && g[k + 16]) {
      l = convert_float(g[k + 16]) / g[k];
      f[k] = max(f[k], f[k + 16]);
      g[k] += g[k + 16];
    };
  barrier(1);
  if (k < 8)
    if (g[k] && g[k + 8]) {
      l = convert_float(g[k + 8]) / g[k];
      f[k] = max(f[k], f[k + 8]);
      g[k] += g[k + 8];
    };
  barrier(1);
  if (k < 4)
    if (g[k] && g[k + 4]) {
      l = convert_float(g[k + 4]) / g[k];
      f[k] = max(f[k], f[k + 4]);
      g[k] += g[k + 4];
    };
  barrier(1);
  if (k < 2)
    if (g[k] && g[k + 2]) {
      l = convert_float(g[k + 2]) / g[k];
      f[k] = max(f[k], f[k + 2]);
      g[k] += g[k + 2];
    };
  barrier(1);
  if (k == 0) {
    if (g[k] && g[k + 1]) {
      l = convert_float(g[k + 1]) / g[k];
      f[k] = max(f[k], f[k + 1]);
      g[k] += g[k + 1];
    };
    B(b, f[0], g[0]);
  }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void M(global const uchar* a, global float* b, int c, int d, int e) {
  local uchar f[(16 * 16)];
  int g = get_global_id(0);
  const int h = (g & (16 - 1)) + (g >> 4) * 16 * 16;
  const int i = get_global_id(1);
  const int j = get_local_id(1) * get_local_size(0) + get_local_id(0);
  c /= sizeof(uchar);
  uchar k = convert_uchar(a[(i * c) + h + 0]);
  k = k;
  for (int l = 16; l < 16 * 16; l += 16) {
    uchar m = convert_uchar(a[(i * c) + h + l]);
    k = max(k, m);
  }
  f[j] = k;
  barrier(1);
  if (j < 128)
    f[j] = max(f[j], f[j + 128]);
  barrier(1);
  if (j < 64)
    f[j] = max(f[j], f[j + 64]);
  barrier(1);
  if (j < 32)
    f[j] = max(f[j], f[j + 32]);
  barrier(1);
  if (j < 16)
    f[j] = max(f[j], f[j + 16]);
  barrier(1);
  if (j < 8)
    f[j] = max(f[j], f[j + 8]);
  barrier(1);
  if (j < 4)
    f[j] = max(f[j], f[j + 4]);
  barrier(1);
  if (j < 2)
    f[j] = max(f[j], f[j + 2]);
  barrier(1);
  if (j == 0) {
    f[j] = max(f[j], f[j + 1]);
    B(b, f[0], 16 * 16 * 16);
  }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void N(global const uchar* a, global float* b, int c, int d, int e) {
  local uchar f[(16 * 16)];
  local int g[(16 * 16)];
  int h = get_global_id(0);
  const int i = (h & (16 - 1)) + (h >> 4) * 16 * 16;
  const int j = get_global_id(1);
  const int k = get_local_id(1) * get_local_size(0) + get_local_id(0);
  c /= sizeof(uchar);
  float l;
  if (i < d && j < e) {
    uchar m = convert_uchar(a[(j * c) + i + 0]);
    m = abs(m);
    int n = 1;
    for (int o = 16; o < 16 * 16; o += 16)
      if (i + o < d) {
        uchar p = convert_uchar(a[(j * c) + i + o]);
        m = min(m, abs(p));
        n++;
      }
    f[k] = m;
    g[k] = n;
  } else
    g[k] = 0;
  barrier(1);
  if (k < 128)
    if (g[k] && g[k + 128]) {
      l = convert_float(g[k + 128]) / g[k];
      f[k] = min(f[k], f[k + 128]);
      g[k] += g[k + 128];
    };
  barrier(1);
  if (k < 64)
    if (g[k] && g[k + 64]) {
      l = convert_float(g[k + 64]) / g[k];
      f[k] = min(f[k], f[k + 64]);
      g[k] += g[k + 64];
    };
  barrier(1);
  if (k < 32)
    if (g[k] && g[k + 32]) {
      l = convert_float(g[k + 32]) / g[k];
      f[k] = min(f[k], f[k + 32]);
      g[k] += g[k + 32];
    };
  barrier(1);
  if (k < 16)
    if (g[k] && g[k + 16]) {
      l = convert_float(g[k + 16]) / g[k];
      f[k] = min(f[k], f[k + 16]);
      g[k] += g[k + 16];
    };
  barrier(1);
  if (k < 8)
    if (g[k] && g[k + 8]) {
      l = convert_float(g[k + 8]) / g[k];
      f[k] = min(f[k], f[k + 8]);
      g[k] += g[k + 8];
    };
  barrier(1);
  if (k < 4)
    if (g[k] && g[k + 4]) {
      l = convert_float(g[k + 4]) / g[k];
      f[k] = min(f[k], f[k + 4]);
      g[k] += g[k + 4];
    };
  barrier(1);
  if (k < 2)
    if (g[k] && g[k + 2]) {
      l = convert_float(g[k + 2]) / g[k];
      f[k] = min(f[k], f[k + 2]);
      g[k] += g[k + 2];
    };
  barrier(1);
  if (k == 0) {
    if (g[k] && g[k + 1]) {
      l = convert_float(g[k + 1]) / g[k];
      f[k] = min(f[k], f[k + 1]);
      g[k] += g[k + 1];
    };
    A(b, f[0], g[0]);
  }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void O(global const uchar* a, global float* b, int c, int d, int e) {
  local uchar f[(16 * 16)];
  int g = get_global_id(0);
  const int h = (g & (16 - 1)) + (g >> 4) * 16 * 16;
  const int i = get_global_id(1);
  const int j = get_local_id(1) * get_local_size(0) + get_local_id(0);
  c /= sizeof(uchar);
  uchar k = convert_uchar(a[(i * c) + h + 0]);
  k = abs(k);
  for (int l = 16; l < 16 * 16; l += 16) {
    uchar m = convert_uchar(a[(i * c) + h + l]);
    k = min(k, abs(m));
  }
  f[j] = k;
  barrier(1);
  if (j < 128)
    f[j] = min(f[j], f[j + 128]);
  barrier(1);
  if (j < 64)
    f[j] = min(f[j], f[j + 64]);
  barrier(1);
  if (j < 32)
    f[j] = min(f[j], f[j + 32]);
  barrier(1);
  if (j < 16)
    f[j] = min(f[j], f[j + 16]);
  barrier(1);
  if (j < 8)
    f[j] = min(f[j], f[j + 8]);
  barrier(1);
  if (j < 4)
    f[j] = min(f[j], f[j + 4]);
  barrier(1);
  if (j < 2)
    f[j] = min(f[j], f[j + 2]);
  barrier(1);
  if (j == 0) {
    f[j] = min(f[j], f[j + 1]);
    A(b, f[0], 16 * 16 * 16);
  }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void P(global const uchar* a, global float* b, int c, int d, int e) {
  local uchar f[(16 * 16)];
  local int g[(16 * 16)];
  int h = get_global_id(0);
  const int i = (h & (16 - 1)) + (h >> 4) * 16 * 16;
  const int j = get_global_id(1);
  const int k = get_local_id(1) * get_local_size(0) + get_local_id(0);
  c /= sizeof(uchar);
  float l;
  if (i < d && j < e) {
    uchar m = convert_uchar(a[(j * c) + i + 0]);
    m = abs(m);
    int n = 1;
    for (int o = 16; o < 16 * 16; o += 16)
      if (i + o < d) {
        uchar p = convert_uchar(a[(j * c) + i + o]);
        m = max(m, abs(p));
        n++;
      }
    f[k] = m;
    g[k] = n;
  } else
    g[k] = 0;
  barrier(1);
  if (k < 128)
    if (g[k] && g[k + 128]) {
      l = convert_float(g[k + 128]) / g[k];
      f[k] = max(f[k], f[k + 128]);
      g[k] += g[k + 128];
    };
  barrier(1);
  if (k < 64)
    if (g[k] && g[k + 64]) {
      l = convert_float(g[k + 64]) / g[k];
      f[k] = max(f[k], f[k + 64]);
      g[k] += g[k + 64];
    };
  barrier(1);
  if (k < 32)
    if (g[k] && g[k + 32]) {
      l = convert_float(g[k + 32]) / g[k];
      f[k] = max(f[k], f[k + 32]);
      g[k] += g[k + 32];
    };
  barrier(1);
  if (k < 16)
    if (g[k] && g[k + 16]) {
      l = convert_float(g[k + 16]) / g[k];
      f[k] = max(f[k], f[k + 16]);
      g[k] += g[k + 16];
    };
  barrier(1);
  if (k < 8)
    if (g[k] && g[k + 8]) {
      l = convert_float(g[k + 8]) / g[k];
      f[k] = max(f[k], f[k + 8]);
      g[k] += g[k + 8];
    };
  barrier(1);
  if (k < 4)
    if (g[k] && g[k + 4]) {
      l = convert_float(g[k + 4]) / g[k];
      f[k] = max(f[k], f[k + 4]);
      g[k] += g[k + 4];
    };
  barrier(1);
  if (k < 2)
    if (g[k] && g[k + 2]) {
      l = convert_float(g[k + 2]) / g[k];
      f[k] = max(f[k], f[k + 2]);
      g[k] += g[k + 2];
    };
  barrier(1);
  if (k == 0) {
    if (g[k] && g[k + 1]) {
      l = convert_float(g[k + 1]) / g[k];
      f[k] = max(f[k], f[k + 1]);
      g[k] += g[k + 1];
    };
    B(b, f[0], g[0]);
  }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void Q(global const uchar* a, global float* b, int c, int d, int e) {
  local uchar f[(16 * 16)];
  int g = get_global_id(0);
  const int h = (g & (16 - 1)) + (g >> 4) * 16 * 16;
  const int i = get_global_id(1);
  const int j = get_local_id(1) * get_local_size(0) + get_local_id(0);
  c /= sizeof(uchar);
  uchar k = convert_uchar(a[(i * c) + h + 0]);
  k = abs(k);
  for (int l = 16; l < 16 * 16; l += 16) {
    uchar m = convert_uchar(a[(i * c) + h + l]);
    k = max(k, abs(m));
  }
  f[j] = k;
  barrier(1);
  if (j < 128)
    f[j] = max(f[j], f[j + 128]);
  barrier(1);
  if (j < 64)
    f[j] = max(f[j], f[j + 64]);
  barrier(1);
  if (j < 32)
    f[j] = max(f[j], f[j + 32]);
  barrier(1);
  if (j < 16)
    f[j] = max(f[j], f[j + 16]);
  barrier(1);
  if (j < 8)
    f[j] = max(f[j], f[j + 8]);
  barrier(1);
  if (j < 4)
    f[j] = max(f[j], f[j + 4]);
  barrier(1);
  if (j < 2)
    f[j] = max(f[j], f[j + 2]);
  barrier(1);
  if (j == 0) {
    f[j] = max(f[j], f[j + 1]);
    B(b, f[0], 16 * 16 * 16);
  }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void R(global const uchar* a, global float* b, int c, int d, int e) {
  local float f[(16 * 16)];
  local int g[(16 * 16)];
  int h = get_global_id(0);
  const int i = (h & (16 - 1)) + (h >> 4) * 16 * 16;
  const int j = get_global_id(1);
  const int k = get_local_id(1) * get_local_size(0) + get_local_id(0);
  c /= sizeof(uchar);
  float l;
  if (i < d && j < e) {
    float m = convert_float(a[(j * c) + i + 0]);
    m = m;
    int n = 1;
    for (int o = 16; o < 16 * 16; o += 16)
      if (i + o < d) {
        float p = convert_float(a[(j * c) + i + o]);
        m = (m + p);
        n++;
      }
    f[k] = m;
    g[k] = n;
  } else
    g[k] = 0;
  barrier(1);
  if (k < 128)
    if (g[k] && g[k + 128]) {
      l = convert_float(g[k + 128]) / g[k];
      f[k] = (f[k] + f[k + 128]);
      g[k] += g[k + 128];
    };
  barrier(1);
  if (k < 64)
    if (g[k] && g[k + 64]) {
      l = convert_float(g[k + 64]) / g[k];
      f[k] = (f[k] + f[k + 64]);
      g[k] += g[k + 64];
    };
  barrier(1);
  if (k < 32)
    if (g[k] && g[k + 32]) {
      l = convert_float(g[k + 32]) / g[k];
      f[k] = (f[k] + f[k + 32]);
      g[k] += g[k + 32];
    };
  barrier(1);
  if (k < 16)
    if (g[k] && g[k + 16]) {
      l = convert_float(g[k + 16]) / g[k];
      f[k] = (f[k] + f[k + 16]);
      g[k] += g[k + 16];
    };
  barrier(1);
  if (k < 8)
    if (g[k] && g[k + 8]) {
      l = convert_float(g[k + 8]) / g[k];
      f[k] = (f[k] + f[k + 8]);
      g[k] += g[k + 8];
    };
  barrier(1);
  if (k < 4)
    if (g[k] && g[k + 4]) {
      l = convert_float(g[k + 4]) / g[k];
      f[k] = (f[k] + f[k + 4]);
      g[k] += g[k + 4];
    };
  barrier(1);
  if (k < 2)
    if (g[k] && g[k + 2]) {
      l = convert_float(g[k + 2]) / g[k];
      f[k] = (f[k] + f[k + 2]);
      g[k] += g[k + 2];
    };
  barrier(1);
  if (k == 0) {
    if (g[k] && g[k + 1]) {
      l = convert_float(g[k + 1]) / g[k];
      f[k] = (f[k] + f[k + 1]);
      g[k] += g[k + 1];
    };
    I(b, f[0], g[0]);
  }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void S(global const uchar* a, global float* b, int c, int d, int e) {
  local float f[(16 * 16)];
  int g = get_global_id(0);
  const int h = (g & (16 - 1)) + (g >> 4) * 16 * 16;
  const int i = get_global_id(1);
  const int j = get_local_id(1) * get_local_size(0) + get_local_id(0);
  c /= sizeof(uchar);
  float k = convert_float(a[(i * c) + h + 0]);
  k = k;
  for (int l = 16; l < 16 * 16; l += 16) {
    float m = convert_float(a[(i * c) + h + l]);
    k = (k + m);
  }
  f[j] = k;
  barrier(1);
  if (j < 128)
    f[j] = (f[j] + f[j + 128]);
  barrier(1);
  if (j < 64)
    f[j] = (f[j] + f[j + 64]);
  barrier(1);
  if (j < 32)
    f[j] = (f[j] + f[j + 32]);
  barrier(1);
  if (j < 16)
    f[j] = (f[j] + f[j + 16]);
  barrier(1);
  if (j < 8)
    f[j] = (f[j] + f[j + 8]);
  barrier(1);
  if (j < 4)
    f[j] = (f[j] + f[j + 4]);
  barrier(1);
  if (j < 2)
    f[j] = (f[j] + f[j + 2]);
  barrier(1);
  if (j == 0) {
    f[j] = (f[j] + f[j + 1]);
    I(b, f[0], 16 * 16 * 16);
  }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void T(global const uchar* a, global float* b, int c, int d, int e) {
  local float f[(16 * 16)];
  local int g[(16 * 16)];
  int h = get_global_id(0);
  const int i = (h & (16 - 1)) + (h >> 4) * 16 * 16;
  const int j = get_global_id(1);
  const int k = get_local_id(1) * get_local_size(0) + get_local_id(0);
  c /= sizeof(uchar);
  float l;
  if (i < d && j < e) {
    float m = convert_float(a[(j * c) + i + 0]);
    m = (m * m);
    int n = 1;
    for (int o = 16; o < 16 * 16; o += 16)
      if (i + o < d) {
        float p = convert_float(a[(j * c) + i + o]);
        m = (m + (p * p));
        n++;
      }
    f[k] = m;
    g[k] = n;
  } else
    g[k] = 0;
  barrier(1);
  if (k < 128)
    if (g[k] && g[k + 128]) {
      l = convert_float(g[k + 128]) / g[k];
      f[k] = (f[k] + f[k + 128]);
      g[k] += g[k + 128];
    };
  barrier(1);
  if (k < 64)
    if (g[k] && g[k + 64]) {
      l = convert_float(g[k + 64]) / g[k];
      f[k] = (f[k] + f[k + 64]);
      g[k] += g[k + 64];
    };
  barrier(1);
  if (k < 32)
    if (g[k] && g[k + 32]) {
      l = convert_float(g[k + 32]) / g[k];
      f[k] = (f[k] + f[k + 32]);
      g[k] += g[k + 32];
    };
  barrier(1);
  if (k < 16)
    if (g[k] && g[k + 16]) {
      l = convert_float(g[k + 16]) / g[k];
      f[k] = (f[k] + f[k + 16]);
      g[k] += g[k + 16];
    };
  barrier(1);
  if (k < 8)
    if (g[k] && g[k + 8]) {
      l = convert_float(g[k + 8]) / g[k];
      f[k] = (f[k] + f[k + 8]);
      g[k] += g[k + 8];
    };
  barrier(1);
  if (k < 4)
    if (g[k] && g[k + 4]) {
      l = convert_float(g[k + 4]) / g[k];
      f[k] = (f[k] + f[k + 4]);
      g[k] += g[k + 4];
    };
  barrier(1);
  if (k < 2)
    if (g[k] && g[k + 2]) {
      l = convert_float(g[k + 2]) / g[k];
      f[k] = (f[k] + f[k + 2]);
      g[k] += g[k + 2];
    };
  barrier(1);
  if (k == 0) {
    if (g[k] && g[k + 1]) {
      l = convert_float(g[k + 1]) / g[k];
      f[k] = (f[k] + f[k + 1]);
      g[k] += g[k + 1];
    };
    I(b, f[0], g[0]);
  }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void U(global const uchar* a, global float* b, int c, int d, int e) {
  local float f[(16 * 16)];
  int g = get_global_id(0);
  const int h = (g & (16 - 1)) + (g >> 4) * 16 * 16;
  const int i = get_global_id(1);
  const int j = get_local_id(1) * get_local_size(0) + get_local_id(0);
  c /= sizeof(uchar);
  float k = convert_float(a[(i * c) + h + 0]);
  k = (k * k);
  for (int l = 16; l < 16 * 16; l += 16) {
    float m = convert_float(a[(i * c) + h + l]);
    k = (k + (m * m));
  }
  f[j] = k;
  barrier(1);
  if (j < 128)
    f[j] = (f[j] + f[j + 128]);
  barrier(1);
  if (j < 64)
    f[j] = (f[j] + f[j + 64]);
  barrier(1);
  if (j < 32)
    f[j] = (f[j] + f[j + 32]);
  barrier(1);
  if (j < 16)
    f[j] = (f[j] + f[j + 16]);
  barrier(1);
  if (j < 8)
    f[j] = (f[j] + f[j + 8]);
  barrier(1);
  if (j < 4)
    f[j] = (f[j] + f[j + 4]);
  barrier(1);
  if (j < 2)
    f[j] = (f[j] + f[j + 2]);
  barrier(1);
  if (j == 0) {
    f[j] = (f[j] + f[j + 1]);
    I(b, f[0], 16 * 16 * 16);
  }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void V(global const uchar* a, global float* b, int c, int d, int e) {
  local float f[(16 * 16)];
  local int g[(16 * 16)];
  int h = get_global_id(0);
  const int i = (h & (16 - 1)) + (h >> 4) * 16 * 16;
  const int j = get_global_id(1);
  const int k = get_local_id(1) * get_local_size(0) + get_local_id(0);
  c /= sizeof(uchar);
  float l;
  if (i < d && j < e) {
    float m = convert_float(a[(j * c) + i + 0]);
    m = convert_float(m != 0 ? 1 : 0);
    int n = 1;
    for (int o = 16; o < 16 * 16; o += 16)
      if (i + o < d) {
        float p = convert_float(a[(j * c) + i + o]);
        m = (m + convert_float(p != 0 ? 1 : 0));
        n++;
      }
    f[k] = m;
    g[k] = n;
  } else
    g[k] = 0;
  barrier(1);
  if (k < 128)
    if (g[k] && g[k + 128]) {
      l = convert_float(g[k + 128]) / g[k];
      f[k] = (f[k] + f[k + 128]);
      g[k] += g[k + 128];
    };
  barrier(1);
  if (k < 64)
    if (g[k] && g[k + 64]) {
      l = convert_float(g[k + 64]) / g[k];
      f[k] = (f[k] + f[k + 64]);
      g[k] += g[k + 64];
    };
  barrier(1);
  if (k < 32)
    if (g[k] && g[k + 32]) {
      l = convert_float(g[k + 32]) / g[k];
      f[k] = (f[k] + f[k + 32]);
      g[k] += g[k + 32];
    };
  barrier(1);
  if (k < 16)
    if (g[k] && g[k + 16]) {
      l = convert_float(g[k + 16]) / g[k];
      f[k] = (f[k] + f[k + 16]);
      g[k] += g[k + 16];
    };
  barrier(1);
  if (k < 8)
    if (g[k] && g[k + 8]) {
      l = convert_float(g[k + 8]) / g[k];
      f[k] = (f[k] + f[k + 8]);
      g[k] += g[k + 8];
    };
  barrier(1);
  if (k < 4)
    if (g[k] && g[k + 4]) {
      l = convert_float(g[k + 4]) / g[k];
      f[k] = (f[k] + f[k + 4]);
      g[k] += g[k + 4];
    };
  barrier(1);
  if (k < 2)
    if (g[k] && g[k + 2]) {
      l = convert_float(g[k + 2]) / g[k];
      f[k] = (f[k] + f[k + 2]);
      g[k] += g[k + 2];
    };
  barrier(1);
  if (k == 0) {
    if (g[k] && g[k + 1]) {
      l = convert_float(g[k + 1]) / g[k];
      f[k] = (f[k] + f[k + 1]);
      g[k] += g[k + 1];
    };
    I(b, f[0], g[0]);
  }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void W(global const uchar* a, global float* b, int c, int d, int e) {
  local float f[(16 * 16)];
  int g = get_global_id(0);
  const int h = (g & (16 - 1)) + (g >> 4) * 16 * 16;
  const int i = get_global_id(1);
  const int j = get_local_id(1) * get_local_size(0) + get_local_id(0);
  c /= sizeof(uchar);
  float k = convert_float(a[(i * c) + h + 0]);
  k = convert_float(k != 0 ? 1 : 0);
  for (int l = 16; l < 16 * 16; l += 16) {
    float m = convert_float(a[(i * c) + h + l]);
    k = (k + convert_float(m != 0 ? 1 : 0));
  }
  f[j] = k;
  barrier(1);
  if (j < 128)
    f[j] = (f[j] + f[j + 128]);
  barrier(1);
  if (j < 64)
    f[j] = (f[j] + f[j + 64]);
  barrier(1);
  if (j < 32)
    f[j] = (f[j] + f[j + 32]);
  barrier(1);
  if (j < 16)
    f[j] = (f[j] + f[j + 16]);
  barrier(1);
  if (j < 8)
    f[j] = (f[j] + f[j + 8]);
  barrier(1);
  if (j < 4)
    f[j] = (f[j] + f[j + 4]);
  barrier(1);
  if (j < 2)
    f[j] = (f[j] + f[j + 2]);
  barrier(1);
  if (j == 0) {
    f[j] = (f[j] + f[j + 1]);
    I(b, f[0], 16 * 16 * 16);
  }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void X(global const uchar* a, global float* b, int c, int d, int e) {
  local float f[(16 * 16)];
  local int g[(16 * 16)];
  int h = get_global_id(0);
  const int i = (h & (16 - 1)) + (h >> 4) * 16 * 16;
  const int j = get_global_id(1);
  const int k = get_local_id(1) * get_local_size(0) + get_local_id(0);
  c /= sizeof(uchar);
  float l;
  if (i < d && j < e) {
    float m = convert_float(a[(j * c) + i + 0]);
    m = m;
    int n = 1;
    for (int o = 16; o < 16 * 16; o += 16)
      if (i + o < d) {
        float p = convert_float(a[(j * c) + i + o]);
        m = (m + p);
        n++;
      }
    f[k] = (m / n);
    g[k] = n;
  } else
    g[k] = 0;
  barrier(1);
  if (k < 128)
    if (g[k] && g[k + 128]) {
      l = convert_float(g[k + 128]) / g[k];
      f[k] = ((f[k] + f[k + 128] * l) / (1 + l));
      g[k] += g[k + 128];
    };
  barrier(1);
  if (k < 64)
    if (g[k] && g[k + 64]) {
      l = convert_float(g[k + 64]) / g[k];
      f[k] = ((f[k] + f[k + 64] * l) / (1 + l));
      g[k] += g[k + 64];
    };
  barrier(1);
  if (k < 32)
    if (g[k] && g[k + 32]) {
      l = convert_float(g[k + 32]) / g[k];
      f[k] = ((f[k] + f[k + 32] * l) / (1 + l));
      g[k] += g[k + 32];
    };
  barrier(1);
  if (k < 16)
    if (g[k] && g[k + 16]) {
      l = convert_float(g[k + 16]) / g[k];
      f[k] = ((f[k] + f[k + 16] * l) / (1 + l));
      g[k] += g[k + 16];
    };
  barrier(1);
  if (k < 8)
    if (g[k] && g[k + 8]) {
      l = convert_float(g[k + 8]) / g[k];
      f[k] = ((f[k] + f[k + 8] * l) / (1 + l));
      g[k] += g[k + 8];
    };
  barrier(1);
  if (k < 4)
    if (g[k] && g[k + 4]) {
      l = convert_float(g[k + 4]) / g[k];
      f[k] = ((f[k] + f[k + 4] * l) / (1 + l));
      g[k] += g[k + 4];
    };
  barrier(1);
  if (k < 2)
    if (g[k] && g[k + 2]) {
      l = convert_float(g[k + 2]) / g[k];
      f[k] = ((f[k] + f[k + 2] * l) / (1 + l));
      g[k] += g[k + 2];
    };
  barrier(1);
  if (k == 0) {
    if (g[k] && g[k + 1]) {
      l = convert_float(g[k + 1]) / g[k];
      f[k] = ((f[k] + f[k + 1] * l) / (1 + l));
      g[k] += g[k + 1];
    };
    I(b, f[0], g[0]);
  }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void Y(global const uchar* a, global float* b, int c, int d, int e) {
  local float f[(16 * 16)];
  int g = get_global_id(0);
  const int h = (g & (16 - 1)) + (g >> 4) * 16 * 16;
  const int i = get_global_id(1);
  const int j = get_local_id(1) * get_local_size(0) + get_local_id(0);
  c /= sizeof(uchar);
  float k = convert_float(a[(i * c) + h + 0]);
  k = k;
  for (int l = 16; l < 16 * 16; l += 16) {
    float m = convert_float(a[(i * c) + h + l]);
    k = (k + m);
  }
  f[j] = (k / 16);
  barrier(1);
  if (j < 128)
    f[j] = ((f[j] + f[j + 128] * 1) / (1 + 1));
  barrier(1);
  if (j < 64)
    f[j] = ((f[j] + f[j + 64] * 1) / (1 + 1));
  barrier(1);
  if (j < 32)
    f[j] = ((f[j] + f[j + 32] * 1) / (1 + 1));
  barrier(1);
  if (j < 16)
    f[j] = ((f[j] + f[j + 16] * 1) / (1 + 1));
  barrier(1);
  if (j < 8)
    f[j] = ((f[j] + f[j + 8] * 1) / (1 + 1));
  barrier(1);
  if (j < 4)
    f[j] = ((f[j] + f[j + 4] * 1) / (1 + 1));
  barrier(1);
  if (j < 2)
    f[j] = ((f[j] + f[j + 2] * 1) / (1 + 1));
  barrier(1);
  if (j == 0) {
    f[j] = ((f[j] + f[j + 1] * 1) / (1 + 1));
    I(b, f[0], 16 * 16 * 16);
  }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void Z(global const uchar* a, global float* b, int c, int d, int e) {
  local float f[(16 * 16)];
  local int g[(16 * 16)];
  int h = get_global_id(0);
  const int i = (h & (16 - 1)) + (h >> 4) * 16 * 16;
  const int j = get_global_id(1);
  const int k = get_local_id(1) * get_local_size(0) + get_local_id(0);
  c /= sizeof(uchar);
  float l;
  if (i < d && j < e) {
    float m = convert_float(a[(j * c) + i + 0]);
    m = (m * m);
    int n = 1;
    for (int o = 16; o < 16 * 16; o += 16)
      if (i + o < d) {
        float p = convert_float(a[(j * c) + i + o]);
        m = (m + (p * p));
        n++;
      }
    f[k] = (m / n);
    g[k] = n;
  } else
    g[k] = 0;
  barrier(1);
  if (k < 128)
    if (g[k] && g[k + 128]) {
      l = convert_float(g[k + 128]) / g[k];
      f[k] = ((f[k] + f[k + 128] * l) / (1 + l));
      g[k] += g[k + 128];
    };
  barrier(1);
  if (k < 64)
    if (g[k] && g[k + 64]) {
      l = convert_float(g[k + 64]) / g[k];
      f[k] = ((f[k] + f[k + 64] * l) / (1 + l));
      g[k] += g[k + 64];
    };
  barrier(1);
  if (k < 32)
    if (g[k] && g[k + 32]) {
      l = convert_float(g[k + 32]) / g[k];
      f[k] = ((f[k] + f[k + 32] * l) / (1 + l));
      g[k] += g[k + 32];
    };
  barrier(1);
  if (k < 16)
    if (g[k] && g[k + 16]) {
      l = convert_float(g[k + 16]) / g[k];
      f[k] = ((f[k] + f[k + 16] * l) / (1 + l));
      g[k] += g[k + 16];
    };
  barrier(1);
  if (k < 8)
    if (g[k] && g[k + 8]) {
      l = convert_float(g[k + 8]) / g[k];
      f[k] = ((f[k] + f[k + 8] * l) / (1 + l));
      g[k] += g[k + 8];
    };
  barrier(1);
  if (k < 4)
    if (g[k] && g[k + 4]) {
      l = convert_float(g[k + 4]) / g[k];
      f[k] = ((f[k] + f[k + 4] * l) / (1 + l));
      g[k] += g[k + 4];
    };
  barrier(1);
  if (k < 2)
    if (g[k] && g[k + 2]) {
      l = convert_float(g[k + 2]) / g[k];
      f[k] = ((f[k] + f[k + 2] * l) / (1 + l));
      g[k] += g[k + 2];
    };
  barrier(1);
  if (k == 0) {
    if (g[k] && g[k + 1]) {
      l = convert_float(g[k + 1]) / g[k];
      f[k] = ((f[k] + f[k + 1] * l) / (1 + l));
      g[k] += g[k + 1];
    };
    I(b, f[0], g[0]);
  }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AA(global const uchar* a, global float* b, int c, int d, int e) {
  local float f[(16 * 16)];
  int g = get_global_id(0);
  const int h = (g & (16 - 1)) + (g >> 4) * 16 * 16;
  const int i = get_global_id(1);
  const int j = get_local_id(1) * get_local_size(0) + get_local_id(0);
  c /= sizeof(uchar);
  float k = convert_float(a[(i * c) + h + 0]);
  k = (k * k);
  for (int l = 16; l < 16 * 16; l += 16) {
    float m = convert_float(a[(i * c) + h + l]);
    k = (k + (m * m));
  }
  f[j] = (k / 16);
  barrier(1);
  if (j < 128)
    f[j] = ((f[j] + f[j + 128] * 1) / (1 + 1));
  barrier(1);
  if (j < 64)
    f[j] = ((f[j] + f[j + 64] * 1) / (1 + 1));
  barrier(1);
  if (j < 32)
    f[j] = ((f[j] + f[j + 32] * 1) / (1 + 1));
  barrier(1);
  if (j < 16)
    f[j] = ((f[j] + f[j + 16] * 1) / (1 + 1));
  barrier(1);
  if (j < 8)
    f[j] = ((f[j] + f[j + 8] * 1) / (1 + 1));
  barrier(1);
  if (j < 4)
    f[j] = ((f[j] + f[j + 4] * 1) / (1 + 1));
  barrier(1);
  if (j < 2)
    f[j] = ((f[j] + f[j + 2] * 1) / (1 + 1));
  barrier(1);
  if (j == 0) {
    f[j] = ((f[j] + f[j + 1] * 1) / (1 + 1));
    I(b, f[0], 16 * 16 * 16);
  }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AB(global const uchar* a, global float* b, int c, int d, int e, float4 f) {
  local float g[(16 * 16)];
  local int h[(16 * 16)];
  int i = get_global_id(0);
  const int j = (i & (16 - 1)) + (i >> 4) * 16 * 16;
  const int k = get_global_id(1);
  const int l = get_local_id(1) * get_local_size(0) + get_local_id(0);
  c /= sizeof(uchar);
  float m;
  if (j < d && k < e) {
    float n = convert_float(a[(k * c) + j + 0]);
    n = (n - f.x) * (n - f.x);
    int o = 1;
    for (int p = 16; p < 16 * 16; p += 16)
      if (j + p < d) {
        float q = convert_float(a[(k * c) + j + p]);
        n = (n + (q - f.x) * (q - f.x));
        o++;
      }
    g[l] = (n / o);
    h[l] = o;
  } else
    h[l] = 0;
  barrier(1);
  if (l < 128)
    if (h[l] && h[l + 128]) {
      m = convert_float(h[l + 128]) / h[l];
      g[l] = ((g[l] + g[l + 128] * m) / (1 + m));
      h[l] += h[l + 128];
    };
  barrier(1);
  if (l < 64)
    if (h[l] && h[l + 64]) {
      m = convert_float(h[l + 64]) / h[l];
      g[l] = ((g[l] + g[l + 64] * m) / (1 + m));
      h[l] += h[l + 64];
    };
  barrier(1);
  if (l < 32)
    if (h[l] && h[l + 32]) {
      m = convert_float(h[l + 32]) / h[l];
      g[l] = ((g[l] + g[l + 32] * m) / (1 + m));
      h[l] += h[l + 32];
    };
  barrier(1);
  if (l < 16)
    if (h[l] && h[l + 16]) {
      m = convert_float(h[l + 16]) / h[l];
      g[l] = ((g[l] + g[l + 16] * m) / (1 + m));
      h[l] += h[l + 16];
    };
  barrier(1);
  if (l < 8)
    if (h[l] && h[l + 8]) {
      m = convert_float(h[l + 8]) / h[l];
      g[l] = ((g[l] + g[l + 8] * m) / (1 + m));
      h[l] += h[l + 8];
    };
  barrier(1);
  if (l < 4)
    if (h[l] && h[l + 4]) {
      m = convert_float(h[l + 4]) / h[l];
      g[l] = ((g[l] + g[l + 4] * m) / (1 + m));
      h[l] += h[l + 4];
    };
  barrier(1);
  if (l < 2)
    if (h[l] && h[l + 2]) {
      m = convert_float(h[l + 2]) / h[l];
      g[l] = ((g[l] + g[l + 2] * m) / (1 + m));
      h[l] += h[l + 2];
    };
  barrier(1);
  if (l == 0) {
    if (h[l] && h[l + 1]) {
      m = convert_float(h[l + 1]) / h[l];
      g[l] = ((g[l] + g[l + 1] * m) / (1 + m));
      h[l] += h[l + 1];
    };
    I(b, g[0], h[0]);
  }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AC(global const uchar* a, global float* b, int c, int d, int e, float4 f) {
  local float g[(16 * 16)];
  int h = get_global_id(0);
  const int i = (h & (16 - 1)) + (h >> 4) * 16 * 16;
  const int j = get_global_id(1);
  const int k = get_local_id(1) * get_local_size(0) + get_local_id(0);
  c /= sizeof(uchar);
  float l = convert_float(a[(j * c) + i + 0]);
  l = (l - f.x) * (l - f.x);
  for (int m = 16; m < 16 * 16; m += 16) {
    float n = convert_float(a[(j * c) + i + m]);
    l = (l + (n - f.x) * (n - f.x));
  }
  g[k] = (l / 16);
  barrier(1);
  if (k < 128)
    g[k] = ((g[k] + g[k + 128] * 1) / (1 + 1));
  barrier(1);
  if (k < 64)
    g[k] = ((g[k] + g[k + 64] * 1) / (1 + 1));
  barrier(1);
  if (k < 32)
    g[k] = ((g[k] + g[k + 32] * 1) / (1 + 1));
  barrier(1);
  if (k < 16)
    g[k] = ((g[k] + g[k + 16] * 1) / (1 + 1));
  barrier(1);
  if (k < 8)
    g[k] = ((g[k] + g[k + 8] * 1) / (1 + 1));
  barrier(1);
  if (k < 4)
    g[k] = ((g[k] + g[k + 4] * 1) / (1 + 1));
  barrier(1);
  if (k < 2)
    g[k] = ((g[k] + g[k + 2] * 1) / (1 + 1));
  barrier(1);
  if (k == 0) {
    g[k] = ((g[k] + g[k + 1] * 1) / (1 + 1));
    I(b, g[0], 16 * 16 * 16);
  }
}

kernel void AD(global const uchar* a, global float* b) {
  *b = convert_float(*a);
}

kernel void AE(global const uchar* a, global float* b) {
  *b = convert_float(abs(*a));
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AF(global const uchar* a, global float* b, global int2* c, int d, int e, int f) {
  local uchar g[(16 * 16)];
  local int2 h[(16 * 16)];
  int i = get_global_id(0);
  const int j = (i & (16 - 1)) + (i >> 4) * 16 * 16;
  const int k = get_global_id(1);
  const int l = get_local_id(1) * get_local_size(0) + get_local_id(0);
  d /= sizeof(uchar);
  uchar m = a[(k * d) + j + 0]; int2 n = (int2)(j k; for (int o = 16; o < 16 * 16; o += 16) {
    uchar p = a[(k * d) + j + o];
    if (p < m) {
      m = p;
      n.x = j + o;
    } } g[l] = m; h[l] = n; barrier(1); if (l < 128) if (g[l + 128] < g[l]) {
    g[l] = g[l + 128];
    h[l] = h[l + 128]; }; barrier(1); if (l < 64) if (g[l + 64] < g[l]) {
    g[l] = g[l + 64];
    h[l] = h[l + 64]; }; barrier(1); if (l < 32) if (g[l + 32] < g[l]) {
    g[l] = g[l + 32];
    h[l] = h[l + 32]; }; barrier(1); if (l < 16) if (g[l + 16] < g[l]) {
    g[l] = g[l + 16];
    h[l] = h[l + 16]; }; barrier(1); if (l < 8) if (g[l + 8] < g[l]) {
    g[l] = g[l + 8];
    h[l] = h[l + 8]; }; barrier(1); if (l < 4) if (g[l + 4] < g[l]) {
    g[l] = g[l + 4];
    h[l] = h[l + 4]; }; barrier(1); if (l < 2) if (g[l + 2] < g[l]) {
    g[l] = g[l + 2];
    h[l] = h[l + 2]; }; barrier(1); if (l == 0) {
    if (g[1] < g[0]) {
      g[0] = g[1];
      h[0] = h[1];
    };
    const int q = get_group_id(1) * get_num_groups(0) + get_group_id(0);
    b[q] = g[0];
    c[q] = h[0]; }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AG(global const uchar* a, global float* b, global int2* c, int d, int e, int f) {
  local uchar g[(16 * 16)];
  local int2 h[(16 * 16)];
  local char i[(16 * 16)];
  int j = get_global_id(0);
  const int k = (j & (16 - 1)) + (j >> 4) * 16 * 16;
  const int l = get_global_id(1);
  const int m = get_local_id(1) * get_local_size(0) + get_local_id(0);
  d /= sizeof(uchar);
  if (k < e && l < f) {
    uchar n = a[(l * d) + k + 0]; int2 o = (int2)(k l; int p = 1; for (int q = 16; q < 16 * 16; q += 16) if (k + q < e) {
      uchar r = a[(l * d) + k + q];
      if (r < n) {
        n = r;
        o.x = k + q;
      } } g[m] = n; h[m] = o; i[m] = 1;
  } else
    i[m] = 0;
  barrier(1);
  if (m < 128)
    if (i[m] && i[m + 128]) {
      if (g[m + 128] < g[m]) {
        g[m] = g[m + 128];
        h[m] = h[m + 128];
      }
    };
  barrier(1);
  if (m < 64)
    if (i[m] && i[m + 64]) {
      if (g[m + 64] < g[m]) {
        g[m] = g[m + 64];
        h[m] = h[m + 64];
      }
    };
  barrier(1);
  if (m < 32)
    if (i[m] && i[m + 32]) {
      if (g[m + 32] < g[m]) {
        g[m] = g[m + 32];
        h[m] = h[m + 32];
      }
    };
  barrier(1);
  if (m < 16)
    if (i[m] && i[m + 16]) {
      if (g[m + 16] < g[m]) {
        g[m] = g[m + 16];
        h[m] = h[m + 16];
      }
    };
  barrier(1);
  if (m < 8)
    if (i[m] && i[m + 8]) {
      if (g[m + 8] < g[m]) {
        g[m] = g[m + 8];
        h[m] = h[m + 8];
      }
    };
  barrier(1);
  if (m < 4)
    if (i[m] && i[m + 4]) {
      if (g[m + 4] < g[m]) {
        g[m] = g[m + 4];
        h[m] = h[m + 4];
      }
    };
  barrier(1);
  if (m < 2)
    if (i[m] && i[m + 2]) {
      if (g[m + 2] < g[m]) {
        g[m] = g[m + 2];
        h[m] = h[m + 2];
      }
    };
  barrier(1);
  if (m == 0) {
    if (i[0] && i[1]) {
      if (g[1] < g[0]) {
        g[0] = g[1];
        h[0] = h[1];
      }
    };
    const int s = get_group_id(1) * get_num_groups(0) + get_group_id(0);
    b[s] = g[0];
    c[s] = h[0];
  }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AH(global const uchar* a, global float* b, global int2* c, int d, int e, int f) {
  local uchar g[(16 * 16)];
  local int2 h[(16 * 16)];
  int i = get_global_id(0);
  const int j = (i & (16 - 1)) + (i >> 4) * 16 * 16;
  const int k = get_global_id(1);
  const int l = get_local_id(1) * get_local_size(0) + get_local_id(0);
  d /= sizeof(uchar);
  uchar m = a[(k * d) + j + 0]; int2 n = (int2)(j k; for (int o = 16; o < 16 * 16; o += 16) {
    uchar p = a[(k * d) + j + o];
    if (p > m) {
      m = p;
      n.x = j + o;
    } } g[l] = m; h[l] = n; barrier(1); if (l < 128) if (g[l + 128] > g[l]) {
    g[l] = g[l + 128];
    h[l] = h[l + 128]; }; barrier(1); if (l < 64) if (g[l + 64] > g[l]) {
    g[l] = g[l + 64];
    h[l] = h[l + 64]; }; barrier(1); if (l < 32) if (g[l + 32] > g[l]) {
    g[l] = g[l + 32];
    h[l] = h[l + 32]; }; barrier(1); if (l < 16) if (g[l + 16] > g[l]) {
    g[l] = g[l + 16];
    h[l] = h[l + 16]; }; barrier(1); if (l < 8) if (g[l + 8] > g[l]) {
    g[l] = g[l + 8];
    h[l] = h[l + 8]; }; barrier(1); if (l < 4) if (g[l + 4] > g[l]) {
    g[l] = g[l + 4];
    h[l] = h[l + 4]; }; barrier(1); if (l < 2) if (g[l + 2] > g[l]) {
    g[l] = g[l + 2];
    h[l] = h[l + 2]; }; barrier(1); if (l == 0) {
    if (g[1] > g[0]) {
      g[0] = g[1];
      h[0] = h[1];
    };
    const int q = get_group_id(1) * get_num_groups(0) + get_group_id(0);
    b[q] = g[0];
    c[q] = h[0]; }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AI(global const uchar* a, global float* b, global int2* c, int d, int e, int f) {
  local uchar g[(16 * 16)];
  local int2 h[(16 * 16)];
  local char i[(16 * 16)];
  int j = get_global_id(0);
  const int k = (j & (16 - 1)) + (j >> 4) * 16 * 16;
  const int l = get_global_id(1);
  const int m = get_local_id(1) * get_local_size(0) + get_local_id(0);
  d /= sizeof(uchar);
  if (k < e && l < f) {
    uchar n = a[(l * d) + k + 0]; int2 o = (int2)(k l; int p = 1; for (int q = 16; q < 16 * 16; q += 16) if (k + q < e) {
      uchar r = a[(l * d) + k + q];
      if (r > n) {
        n = r;
        o.x = k + q;
      } } g[m] = n; h[m] = o; i[m] = 1;
  } else
    i[m] = 0;
  barrier(1);
  if (m < 128)
    if (i[m] && i[m + 128]) {
      if (g[m + 128] > g[m]) {
        g[m] = g[m + 128];
        h[m] = h[m + 128];
      }
    };
  barrier(1);
  if (m < 64)
    if (i[m] && i[m + 64]) {
      if (g[m + 64] > g[m]) {
        g[m] = g[m + 64];
        h[m] = h[m + 64];
      }
    };
  barrier(1);
  if (m < 32)
    if (i[m] && i[m + 32]) {
      if (g[m + 32] > g[m]) {
        g[m] = g[m + 32];
        h[m] = h[m + 32];
      }
    };
  barrier(1);
  if (m < 16)
    if (i[m] && i[m + 16]) {
      if (g[m + 16] > g[m]) {
        g[m] = g[m + 16];
        h[m] = h[m + 16];
      }
    };
  barrier(1);
  if (m < 8)
    if (i[m] && i[m + 8]) {
      if (g[m + 8] > g[m]) {
        g[m] = g[m + 8];
        h[m] = h[m + 8];
      }
    };
  barrier(1);
  if (m < 4)
    if (i[m] && i[m + 4]) {
      if (g[m + 4] > g[m]) {
        g[m] = g[m + 4];
        h[m] = h[m + 4];
      }
    };
  barrier(1);
  if (m < 2)
    if (i[m] && i[m + 2]) {
      if (g[m + 2] > g[m]) {
        g[m] = g[m + 2];
        h[m] = h[m + 2];
      }
    };
  barrier(1);
  if (m == 0) {
    if (i[0] && i[1]) {
      if (g[1] > g[0]) {
        g[0] = g[1];
        h[0] = h[1];
      }
    };
    const int s = get_group_id(1) * get_num_groups(0) + get_group_id(0);
    b[s] = g[0];
    c[s] = h[0];
  }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AJ(global const uchar* a, global float* b, global int2* c, int d, int e, int f) {
  local uchar g[(16 * 16)];
  local int2 h[(16 * 16)];
  int i = get_global_id(0);
  const int j = (i & (16 - 1)) + (i >> 4) * 16 * 16;
  const int k = get_global_id(1);
  const int l = get_local_id(1) * get_local_size(0) + get_local_id(0);
  d /= sizeof(uchar);
  uchar m = abs(a[(k * d) + j + 0]); int2 n = (int2)(j k; for (int o = 16; o < 16 * 16; o += 16) {
    uchar p = abs(a[(k * d) + j + o]);
    if (p < m) {
      m = p;
      n.x = j + o;
    } } g[l] = m; h[l] = n; barrier(1); if (l < 128) if (g[l + 128] < g[l]) {
    g[l] = g[l + 128];
    h[l] = h[l + 128]; }; barrier(1); if (l < 64) if (g[l + 64] < g[l]) {
    g[l] = g[l + 64];
    h[l] = h[l + 64]; }; barrier(1); if (l < 32) if (g[l + 32] < g[l]) {
    g[l] = g[l + 32];
    h[l] = h[l + 32]; }; barrier(1); if (l < 16) if (g[l + 16] < g[l]) {
    g[l] = g[l + 16];
    h[l] = h[l + 16]; }; barrier(1); if (l < 8) if (g[l + 8] < g[l]) {
    g[l] = g[l + 8];
    h[l] = h[l + 8]; }; barrier(1); if (l < 4) if (g[l + 4] < g[l]) {
    g[l] = g[l + 4];
    h[l] = h[l + 4]; }; barrier(1); if (l < 2) if (g[l + 2] < g[l]) {
    g[l] = g[l + 2];
    h[l] = h[l + 2]; }; barrier(1); if (l == 0) {
    if (g[1] < g[0]) {
      g[0] = g[1];
      h[0] = h[1];
    };
    const int q = get_group_id(1) * get_num_groups(0) + get_group_id(0);
    b[q] = g[0];
    c[q] = h[0]; }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AK(global const uchar* a, global float* b, global int2* c, int d, int e, int f) {
  local uchar g[(16 * 16)];
  local int2 h[(16 * 16)];
  local char i[(16 * 16)];
  int j = get_global_id(0);
  const int k = (j & (16 - 1)) + (j >> 4) * 16 * 16;
  const int l = get_global_id(1);
  const int m = get_local_id(1) * get_local_size(0) + get_local_id(0);
  d /= sizeof(uchar);
  if (k < e && l < f) {
    uchar n = abs(a[(l * d) + k + 0]); int2 o = (int2)(k l; int p = 1; for (int q = 16; q < 16 * 16; q += 16) if (k + q < e) {
      uchar r = abs(a[(l * d) + k + q]);
      if (r < n) {
        n = r;
        o.x = k + q;
      } } g[m] = n; h[m] = o; i[m] = 1;
  } else
    i[m] = 0;
  barrier(1);
  if (m < 128)
    if (i[m] && i[m + 128]) {
      if (g[m + 128] < g[m]) {
        g[m] = g[m + 128];
        h[m] = h[m + 128];
      }
    };
  barrier(1);
  if (m < 64)
    if (i[m] && i[m + 64]) {
      if (g[m + 64] < g[m]) {
        g[m] = g[m + 64];
        h[m] = h[m + 64];
      }
    };
  barrier(1);
  if (m < 32)
    if (i[m] && i[m + 32]) {
      if (g[m + 32] < g[m]) {
        g[m] = g[m + 32];
        h[m] = h[m + 32];
      }
    };
  barrier(1);
  if (m < 16)
    if (i[m] && i[m + 16]) {
      if (g[m + 16] < g[m]) {
        g[m] = g[m + 16];
        h[m] = h[m + 16];
      }
    };
  barrier(1);
  if (m < 8)
    if (i[m] && i[m + 8]) {
      if (g[m + 8] < g[m]) {
        g[m] = g[m + 8];
        h[m] = h[m + 8];
      }
    };
  barrier(1);
  if (m < 4)
    if (i[m] && i[m + 4]) {
      if (g[m + 4] < g[m]) {
        g[m] = g[m + 4];
        h[m] = h[m + 4];
      }
    };
  barrier(1);
  if (m < 2)
    if (i[m] && i[m + 2]) {
      if (g[m + 2] < g[m]) {
        g[m] = g[m + 2];
        h[m] = h[m + 2];
      }
    };
  barrier(1);
  if (m == 0) {
    if (i[0] && i[1]) {
      if (g[1] < g[0]) {
        g[0] = g[1];
        h[0] = h[1];
      }
    };
    const int s = get_group_id(1) * get_num_groups(0) + get_group_id(0);
    b[s] = g[0];
    c[s] = h[0];
  }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AL(global const uchar* a, global float* b, global int2* c, int d, int e, int f) {
  local uchar g[(16 * 16)];
  local int2 h[(16 * 16)];
  int i = get_global_id(0);
  const int j = (i & (16 - 1)) + (i >> 4) * 16 * 16;
  const int k = get_global_id(1);
  const int l = get_local_id(1) * get_local_size(0) + get_local_id(0);
  d /= sizeof(uchar);
  uchar m = abs(a[(k * d) + j + 0]); int2 n = (int2)(j k; for (int o = 16; o < 16 * 16; o += 16) {
    uchar p = abs(a[(k * d) + j + o]);
    if (p > m) {
      m = p;
      n.x = j + o;
    } } g[l] = m; h[l] = n; barrier(1); if (l < 128) if (g[l + 128] > g[l]) {
    g[l] = g[l + 128];
    h[l] = h[l + 128]; }; barrier(1); if (l < 64) if (g[l + 64] > g[l]) {
    g[l] = g[l + 64];
    h[l] = h[l + 64]; }; barrier(1); if (l < 32) if (g[l + 32] > g[l]) {
    g[l] = g[l + 32];
    h[l] = h[l + 32]; }; barrier(1); if (l < 16) if (g[l + 16] > g[l]) {
    g[l] = g[l + 16];
    h[l] = h[l + 16]; }; barrier(1); if (l < 8) if (g[l + 8] > g[l]) {
    g[l] = g[l + 8];
    h[l] = h[l + 8]; }; barrier(1); if (l < 4) if (g[l + 4] > g[l]) {
    g[l] = g[l + 4];
    h[l] = h[l + 4]; }; barrier(1); if (l < 2) if (g[l + 2] > g[l]) {
    g[l] = g[l + 2];
    h[l] = h[l + 2]; }; barrier(1); if (l == 0) {
    if (g[1] > g[0]) {
      g[0] = g[1];
      h[0] = h[1];
    };
    const int q = get_group_id(1) * get_num_groups(0) + get_group_id(0);
    b[q] = g[0];
    c[q] = h[0]; }
}
__attribute__((reqd_work_group_size(16, 16, 1))) kernel void AM(global const uchar* a, global float* b, global int2* c, int d, int e, int f) {
  local uchar g[(16 * 16)];
  local int2 h[(16 * 16)];
  local char i[(16 * 16)];
  int j = get_global_id(0);
  const int k = (j & (16 - 1)) + (j >> 4) * 16 * 16;
  const int l = get_global_id(1);
  const int m = get_local_id(1) * get_local_size(0) + get_local_id(0);
  d /= sizeof(uchar);
  if (k < e && l < f) {
    uchar n = abs(a[(l * d) + k + 0]); int2 o = (int2)(k l; int p = 1; for (int q = 16; q < 16 * 16; q += 16) if (k + q < e) {
      uchar r = abs(a[(l * d) + k + q]);
      if (r > n) {
        n = r;
        o.x = k + q;
      } } g[m] = n; h[m] = o; i[m] = 1;
  } else
    i[m] = 0;
  barrier(1);
  if (m < 128)
    if (i[m] && i[m + 128]) {
      if (g[m + 128] > g[m]) {
        g[m] = g[m + 128];
        h[m] = h[m + 128];
      }
    };
  barrier(1);
  if (m < 64)
    if (i[m] && i[m + 64]) {
      if (g[m + 64] > g[m]) {
        g[m] = g[m + 64];
        h[m] = h[m + 64];
      }
    };
  barrier(1);
  if (m < 32)
    if (i[m] && i[m + 32]) {
      if (g[m + 32] > g[m]) {
        g[m] = g[m + 32];
        h[m] = h[m + 32];
      }
    };
  barrier(1);
  if (m < 16)
    if (i[m] && i[m + 16]) {
      if (g[m + 16] > g[m]) {
        g[m] = g[m + 16];
        h[m] = h[m + 16];
      }
    };
  barrier(1);
  if (m < 8)
    if (i[m] && i[m + 8]) {
      if (g[m + 8] > g[m]) {
        g[m] = g[m + 8];
        h[m] = h[m + 8];
      }
    };
  barrier(1);
  if (m < 4)
    if (i[m] && i[m + 4]) {
      if (g[m + 4] > g[m]) {
        g[m] = g[m + 4];
        h[m] = h[m + 4];
      }
    };
  barrier(1);
  if (m < 2)
    if (i[m] && i[m + 2]) {
      if (g[m + 2] > g[m]) {
        g[m] = g[m + 2];
        h[m] = h[m + 2];
      }
    };
  barrier(1);
  if (m == 0) {
    if (i[0] && i[1]) {
      if (g[1] > g[0]) {
        g[0] = g[1];
        h[0] = h[1];
      }
    };
    const int s = get_group_id(1) * get_num_groups(0) + get_group_id(0);
    b[s] = g[0];
    c[s] = h[0];
  }
}