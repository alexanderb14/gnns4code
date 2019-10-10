inline float A(const float a, const float b) {
  return a + b;
}
inline float B(const float a, const float b) {
  return a - b;
}
inline float C(const float a, const float b) {
  return a * b;
}
inline float D(const float a, const float b) {
  return a / b;
}
kernel void E(const global float* a, const unsigned b, const unsigned c, global unsigned* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[1024];
  local unsigned h[1024];
  a += e % b + (e / b) * b * c;
  g[f] = -__builtin_inff();
  for (unsigned i = f; i < c; i += 1024) {
    const float j = a[i * b];
    if (j > g[f]) {
      g[f] = j;
      h[f] = i;
    }
  }
  barrier(1);
  if (1024 >= 512 << 1) {
    if (f < 512) {
      if (g[f + 512] > g[f] || (g[f + 512] == g[f] && h[f + 512] < h[f])) {
        g[f] = g[f + 512];
        h[f] = h[f + 512];
      }
    }
    barrier(1);
  }
  if (1024 >= 256 << 1) {
    if (f < 256) {
      if (g[f + 256] > g[f] || (g[f + 256] == g[f] && h[f + 256] < h[f])) {
        g[f] = g[f + 256];
        h[f] = h[f + 256];
      }
    }
    barrier(1);
  }
  if (1024 >= 128 << 1) {
    if (f < 128) {
      if (g[f + 128] > g[f] || (g[f + 128] == g[f] && h[f + 128] < h[f])) {
        g[f] = g[f + 128];
        h[f] = h[f + 128];
      }
    }
    barrier(1);
  }
  if (1024 >= 64 << 1) {
    if (f < 64) {
      if (g[f + 64] > g[f] || (g[f + 64] == g[f] && h[f + 64] < h[f])) {
        g[f] = g[f + 64];
        h[f] = h[f + 64];
      }
    }
    barrier(1);
  }
  if (1024 >= 32 << 1) {
    if (f < 32) {
      if (g[f + 32] > g[f] || (g[f + 32] == g[f] && h[f + 32] < h[f])) {
        g[f] = g[f + 32];
        h[f] = h[f + 32];
      }
    }
    barrier(1);
  }
  if (1024 >= 16 << 1) {
    if (f < 16) {
      if (g[f + 16] > g[f] || (g[f + 16] == g[f] && h[f + 16] < h[f])) {
        g[f] = g[f + 16];
        h[f] = h[f + 16];
      }
    }
    barrier(1);
  }
  if (1024 >= 8 << 1) {
    if (f < 8) {
      if (g[f + 8] > g[f] || (g[f + 8] == g[f] && h[f + 8] < h[f])) {
        g[f] = g[f + 8];
        h[f] = h[f + 8];
      }
    }
    barrier(1);
  }
  if (1024 >= 4 << 1) {
    if (f < 4) {
      if (g[f + 4] > g[f] || (g[f + 4] == g[f] && h[f + 4] < h[f])) {
        g[f] = g[f + 4];
        h[f] = h[f + 4];
      }
    }
    barrier(1);
  }
  if (1024 >= 2 << 1) {
    if (f < 2) {
      if (g[f + 2] > g[f] || (g[f + 2] == g[f] && h[f + 2] < h[f])) {
        g[f] = g[f + 2];
        h[f] = h[f + 2];
      }
    }
    barrier(1);
  }
  if (1024 >= 1 << 1) {
    if (f < 1) {
      if (g[f + 1] > g[f] || (g[f + 1] == g[f] && h[f + 1] < h[f])) {
        g[f] = g[f + 1];
        h[f] = h[f + 1];
      }
    }
    barrier(1);
  }
  if (f == 0)
    d[e] = h[0];
}
kernel void F(const global float* a, const unsigned b, const unsigned c, global unsigned* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[512];
  local unsigned h[512];
  a += e % b + (e / b) * b * c;
  g[f] = -__builtin_inff();
  for (unsigned i = f; i < c; i += 512) {
    const float j = a[i * b];
    if (j > g[f]) {
      g[f] = j;
      h[f] = i;
    }
  }
  barrier(1);
  if (512 >= 512 << 1) {
    if (f < 512) {
      if (g[f + 512] > g[f] || (g[f + 512] == g[f] && h[f + 512] < h[f])) {
        g[f] = g[f + 512];
        h[f] = h[f + 512];
      }
    }
    barrier(1);
  }
  if (512 >= 256 << 1) {
    if (f < 256) {
      if (g[f + 256] > g[f] || (g[f + 256] == g[f] && h[f + 256] < h[f])) {
        g[f] = g[f + 256];
        h[f] = h[f + 256];
      }
    }
    barrier(1);
  }
  if (512 >= 128 << 1) {
    if (f < 128) {
      if (g[f + 128] > g[f] || (g[f + 128] == g[f] && h[f + 128] < h[f])) {
        g[f] = g[f + 128];
        h[f] = h[f + 128];
      }
    }
    barrier(1);
  }
  if (512 >= 64 << 1) {
    if (f < 64) {
      if (g[f + 64] > g[f] || (g[f + 64] == g[f] && h[f + 64] < h[f])) {
        g[f] = g[f + 64];
        h[f] = h[f + 64];
      }
    }
    barrier(1);
  }
  if (512 >= 32 << 1) {
    if (f < 32) {
      if (g[f + 32] > g[f] || (g[f + 32] == g[f] && h[f + 32] < h[f])) {
        g[f] = g[f + 32];
        h[f] = h[f + 32];
      }
    }
    barrier(1);
  }
  if (512 >= 16 << 1) {
    if (f < 16) {
      if (g[f + 16] > g[f] || (g[f + 16] == g[f] && h[f + 16] < h[f])) {
        g[f] = g[f + 16];
        h[f] = h[f + 16];
      }
    }
    barrier(1);
  }
  if (512 >= 8 << 1) {
    if (f < 8) {
      if (g[f + 8] > g[f] || (g[f + 8] == g[f] && h[f + 8] < h[f])) {
        g[f] = g[f + 8];
        h[f] = h[f + 8];
      }
    }
    barrier(1);
  }
  if (512 >= 4 << 1) {
    if (f < 4) {
      if (g[f + 4] > g[f] || (g[f + 4] == g[f] && h[f + 4] < h[f])) {
        g[f] = g[f + 4];
        h[f] = h[f + 4];
      }
    }
    barrier(1);
  }
  if (512 >= 2 << 1) {
    if (f < 2) {
      if (g[f + 2] > g[f] || (g[f + 2] == g[f] && h[f + 2] < h[f])) {
        g[f] = g[f + 2];
        h[f] = h[f + 2];
      }
    }
    barrier(1);
  }
  if (512 >= 1 << 1) {
    if (f < 1) {
      if (g[f + 1] > g[f] || (g[f + 1] == g[f] && h[f + 1] < h[f])) {
        g[f] = g[f + 1];
        h[f] = h[f + 1];
      }
    }
    barrier(1);
  }
  if (f == 0)
    d[e] = h[0];
}
kernel void G(const global float* a, const unsigned b, const unsigned c, global unsigned* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[256];
  local unsigned h[256];
  a += e % b + (e / b) * b * c;
  g[f] = -__builtin_inff();
  for (unsigned i = f; i < c; i += 256) {
    const float j = a[i * b];
    if (j > g[f]) {
      g[f] = j;
      h[f] = i;
    }
  }
  barrier(1);
  if (256 >= 512 << 1) {
    if (f < 512) {
      if (g[f + 512] > g[f] || (g[f + 512] == g[f] && h[f + 512] < h[f])) {
        g[f] = g[f + 512];
        h[f] = h[f + 512];
      }
    }
    barrier(1);
  }
  if (256 >= 256 << 1) {
    if (f < 256) {
      if (g[f + 256] > g[f] || (g[f + 256] == g[f] && h[f + 256] < h[f])) {
        g[f] = g[f + 256];
        h[f] = h[f + 256];
      }
    }
    barrier(1);
  }
  if (256 >= 128 << 1) {
    if (f < 128) {
      if (g[f + 128] > g[f] || (g[f + 128] == g[f] && h[f + 128] < h[f])) {
        g[f] = g[f + 128];
        h[f] = h[f + 128];
      }
    }
    barrier(1);
  }
  if (256 >= 64 << 1) {
    if (f < 64) {
      if (g[f + 64] > g[f] || (g[f + 64] == g[f] && h[f + 64] < h[f])) {
        g[f] = g[f + 64];
        h[f] = h[f + 64];
      }
    }
    barrier(1);
  }
  if (256 >= 32 << 1) {
    if (f < 32) {
      if (g[f + 32] > g[f] || (g[f + 32] == g[f] && h[f + 32] < h[f])) {
        g[f] = g[f + 32];
        h[f] = h[f + 32];
      }
    }
    barrier(1);
  }
  if (256 >= 16 << 1) {
    if (f < 16) {
      if (g[f + 16] > g[f] || (g[f + 16] == g[f] && h[f + 16] < h[f])) {
        g[f] = g[f + 16];
        h[f] = h[f + 16];
      }
    }
    barrier(1);
  }
  if (256 >= 8 << 1) {
    if (f < 8) {
      if (g[f + 8] > g[f] || (g[f + 8] == g[f] && h[f + 8] < h[f])) {
        g[f] = g[f + 8];
        h[f] = h[f + 8];
      }
    }
    barrier(1);
  }
  if (256 >= 4 << 1) {
    if (f < 4) {
      if (g[f + 4] > g[f] || (g[f + 4] == g[f] && h[f + 4] < h[f])) {
        g[f] = g[f + 4];
        h[f] = h[f + 4];
      }
    }
    barrier(1);
  }
  if (256 >= 2 << 1) {
    if (f < 2) {
      if (g[f + 2] > g[f] || (g[f + 2] == g[f] && h[f + 2] < h[f])) {
        g[f] = g[f + 2];
        h[f] = h[f + 2];
      }
    }
    barrier(1);
  }
  if (256 >= 1 << 1) {
    if (f < 1) {
      if (g[f + 1] > g[f] || (g[f + 1] == g[f] && h[f + 1] < h[f])) {
        g[f] = g[f + 1];
        h[f] = h[f + 1];
      }
    }
    barrier(1);
  }
  if (f == 0)
    d[e] = h[0];
}
kernel void H(const global float* a, const unsigned b, const unsigned c, global unsigned* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[128];
  local unsigned h[128];
  a += e % b + (e / b) * b * c;
  g[f] = -__builtin_inff();
  for (unsigned i = f; i < c; i += 128) {
    const float j = a[i * b];
    if (j > g[f]) {
      g[f] = j;
      h[f] = i;
    }
  }
  barrier(1);
  if (128 >= 512 << 1) {
    if (f < 512) {
      if (g[f + 512] > g[f] || (g[f + 512] == g[f] && h[f + 512] < h[f])) {
        g[f] = g[f + 512];
        h[f] = h[f + 512];
      }
    }
    barrier(1);
  }
  if (128 >= 256 << 1) {
    if (f < 256) {
      if (g[f + 256] > g[f] || (g[f + 256] == g[f] && h[f + 256] < h[f])) {
        g[f] = g[f + 256];
        h[f] = h[f + 256];
      }
    }
    barrier(1);
  }
  if (128 >= 128 << 1) {
    if (f < 128) {
      if (g[f + 128] > g[f] || (g[f + 128] == g[f] && h[f + 128] < h[f])) {
        g[f] = g[f + 128];
        h[f] = h[f + 128];
      }
    }
    barrier(1);
  }
  if (128 >= 64 << 1) {
    if (f < 64) {
      if (g[f + 64] > g[f] || (g[f + 64] == g[f] && h[f + 64] < h[f])) {
        g[f] = g[f + 64];
        h[f] = h[f + 64];
      }
    }
    barrier(1);
  }
  if (128 >= 32 << 1) {
    if (f < 32) {
      if (g[f + 32] > g[f] || (g[f + 32] == g[f] && h[f + 32] < h[f])) {
        g[f] = g[f + 32];
        h[f] = h[f + 32];
      }
    }
    barrier(1);
  }
  if (128 >= 16 << 1) {
    if (f < 16) {
      if (g[f + 16] > g[f] || (g[f + 16] == g[f] && h[f + 16] < h[f])) {
        g[f] = g[f + 16];
        h[f] = h[f + 16];
      }
    }
    barrier(1);
  }
  if (128 >= 8 << 1) {
    if (f < 8) {
      if (g[f + 8] > g[f] || (g[f + 8] == g[f] && h[f + 8] < h[f])) {
        g[f] = g[f + 8];
        h[f] = h[f + 8];
      }
    }
    barrier(1);
  }
  if (128 >= 4 << 1) {
    if (f < 4) {
      if (g[f + 4] > g[f] || (g[f + 4] == g[f] && h[f + 4] < h[f])) {
        g[f] = g[f + 4];
        h[f] = h[f + 4];
      }
    }
    barrier(1);
  }
  if (128 >= 2 << 1) {
    if (f < 2) {
      if (g[f + 2] > g[f] || (g[f + 2] == g[f] && h[f + 2] < h[f])) {
        g[f] = g[f + 2];
        h[f] = h[f + 2];
      }
    }
    barrier(1);
  }
  if (128 >= 1 << 1) {
    if (f < 1) {
      if (g[f + 1] > g[f] || (g[f + 1] == g[f] && h[f + 1] < h[f])) {
        g[f] = g[f + 1];
        h[f] = h[f + 1];
      }
    }
    barrier(1);
  }
  if (f == 0)
    d[e] = h[0];
}
kernel void I(const global float* a, const unsigned b, const unsigned c, global unsigned* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[64];
  local unsigned h[64];
  a += e % b + (e / b) * b * c;
  g[f] = -__builtin_inff();
  for (unsigned i = f; i < c; i += 64) {
    const float j = a[i * b];
    if (j > g[f]) {
      g[f] = j;
      h[f] = i;
    }
  }
  barrier(1);
  if (64 >= 512 << 1) {
    if (f < 512) {
      if (g[f + 512] > g[f] || (g[f + 512] == g[f] && h[f + 512] < h[f])) {
        g[f] = g[f + 512];
        h[f] = h[f + 512];
      }
    }
    barrier(1);
  }
  if (64 >= 256 << 1) {
    if (f < 256) {
      if (g[f + 256] > g[f] || (g[f + 256] == g[f] && h[f + 256] < h[f])) {
        g[f] = g[f + 256];
        h[f] = h[f + 256];
      }
    }
    barrier(1);
  }
  if (64 >= 128 << 1) {
    if (f < 128) {
      if (g[f + 128] > g[f] || (g[f + 128] == g[f] && h[f + 128] < h[f])) {
        g[f] = g[f + 128];
        h[f] = h[f + 128];
      }
    }
    barrier(1);
  }
  if (64 >= 64 << 1) {
    if (f < 64) {
      if (g[f + 64] > g[f] || (g[f + 64] == g[f] && h[f + 64] < h[f])) {
        g[f] = g[f + 64];
        h[f] = h[f + 64];
      }
    }
    barrier(1);
  }
  if (64 >= 32 << 1) {
    if (f < 32) {
      if (g[f + 32] > g[f] || (g[f + 32] == g[f] && h[f + 32] < h[f])) {
        g[f] = g[f + 32];
        h[f] = h[f + 32];
      }
    }
    barrier(1);
  }
  if (64 >= 16 << 1) {
    if (f < 16) {
      if (g[f + 16] > g[f] || (g[f + 16] == g[f] && h[f + 16] < h[f])) {
        g[f] = g[f + 16];
        h[f] = h[f + 16];
      }
    }
    barrier(1);
  }
  if (64 >= 8 << 1) {
    if (f < 8) {
      if (g[f + 8] > g[f] || (g[f + 8] == g[f] && h[f + 8] < h[f])) {
        g[f] = g[f + 8];
        h[f] = h[f + 8];
      }
    }
    barrier(1);
  }
  if (64 >= 4 << 1) {
    if (f < 4) {
      if (g[f + 4] > g[f] || (g[f + 4] == g[f] && h[f + 4] < h[f])) {
        g[f] = g[f + 4];
        h[f] = h[f + 4];
      }
    }
    barrier(1);
  }
  if (64 >= 2 << 1) {
    if (f < 2) {
      if (g[f + 2] > g[f] || (g[f + 2] == g[f] && h[f + 2] < h[f])) {
        g[f] = g[f + 2];
        h[f] = h[f + 2];
      }
    }
    barrier(1);
  }
  if (64 >= 1 << 1) {
    if (f < 1) {
      if (g[f + 1] > g[f] || (g[f + 1] == g[f] && h[f + 1] < h[f])) {
        g[f] = g[f + 1];
        h[f] = h[f + 1];
      }
    }
    barrier(1);
  }
  if (f == 0)
    d[e] = h[0];
}
kernel void J(const global float* a, const unsigned b, const unsigned c, global unsigned* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[32];
  local unsigned h[32];
  a += e % b + (e / b) * b * c;
  g[f] = -__builtin_inff();
  for (unsigned i = f; i < c; i += 32) {
    const float j = a[i * b];
    if (j > g[f]) {
      g[f] = j;
      h[f] = i;
    }
  }
  barrier(1);
  if (32 >= 512 << 1) {
    if (f < 512) {
      if (g[f + 512] > g[f] || (g[f + 512] == g[f] && h[f + 512] < h[f])) {
        g[f] = g[f + 512];
        h[f] = h[f + 512];
      }
    }
    barrier(1);
  }
  if (32 >= 256 << 1) {
    if (f < 256) {
      if (g[f + 256] > g[f] || (g[f + 256] == g[f] && h[f + 256] < h[f])) {
        g[f] = g[f + 256];
        h[f] = h[f + 256];
      }
    }
    barrier(1);
  }
  if (32 >= 128 << 1) {
    if (f < 128) {
      if (g[f + 128] > g[f] || (g[f + 128] == g[f] && h[f + 128] < h[f])) {
        g[f] = g[f + 128];
        h[f] = h[f + 128];
      }
    }
    barrier(1);
  }
  if (32 >= 64 << 1) {
    if (f < 64) {
      if (g[f + 64] > g[f] || (g[f + 64] == g[f] && h[f + 64] < h[f])) {
        g[f] = g[f + 64];
        h[f] = h[f + 64];
      }
    }
    barrier(1);
  }
  if (32 >= 32 << 1) {
    if (f < 32) {
      if (g[f + 32] > g[f] || (g[f + 32] == g[f] && h[f + 32] < h[f])) {
        g[f] = g[f + 32];
        h[f] = h[f + 32];
      }
    }
    barrier(1);
  }
  if (32 >= 16 << 1) {
    if (f < 16) {
      if (g[f + 16] > g[f] || (g[f + 16] == g[f] && h[f + 16] < h[f])) {
        g[f] = g[f + 16];
        h[f] = h[f + 16];
      }
    }
    barrier(1);
  }
  if (32 >= 8 << 1) {
    if (f < 8) {
      if (g[f + 8] > g[f] || (g[f + 8] == g[f] && h[f + 8] < h[f])) {
        g[f] = g[f + 8];
        h[f] = h[f + 8];
      }
    }
    barrier(1);
  }
  if (32 >= 4 << 1) {
    if (f < 4) {
      if (g[f + 4] > g[f] || (g[f + 4] == g[f] && h[f + 4] < h[f])) {
        g[f] = g[f + 4];
        h[f] = h[f + 4];
      }
    }
    barrier(1);
  }
  if (32 >= 2 << 1) {
    if (f < 2) {
      if (g[f + 2] > g[f] || (g[f + 2] == g[f] && h[f + 2] < h[f])) {
        g[f] = g[f + 2];
        h[f] = h[f + 2];
      }
    }
    barrier(1);
  }
  if (32 >= 1 << 1) {
    if (f < 1) {
      if (g[f + 1] > g[f] || (g[f + 1] == g[f] && h[f + 1] < h[f])) {
        g[f] = g[f + 1];
        h[f] = h[f + 1];
      }
    }
    barrier(1);
  }
  if (f == 0)
    d[e] = h[0];
}
kernel void K(const global float* a, const unsigned b, const unsigned c, global unsigned* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[16];
  local unsigned h[16];
  a += e % b + (e / b) * b * c;
  g[f] = -__builtin_inff();
  for (unsigned i = f; i < c; i += 16) {
    const float j = a[i * b];
    if (j > g[f]) {
      g[f] = j;
      h[f] = i;
    }
  }
  barrier(1);
  if (16 >= 512 << 1) {
    if (f < 512) {
      if (g[f + 512] > g[f] || (g[f + 512] == g[f] && h[f + 512] < h[f])) {
        g[f] = g[f + 512];
        h[f] = h[f + 512];
      }
    }
    barrier(1);
  }
  if (16 >= 256 << 1) {
    if (f < 256) {
      if (g[f + 256] > g[f] || (g[f + 256] == g[f] && h[f + 256] < h[f])) {
        g[f] = g[f + 256];
        h[f] = h[f + 256];
      }
    }
    barrier(1);
  }
  if (16 >= 128 << 1) {
    if (f < 128) {
      if (g[f + 128] > g[f] || (g[f + 128] == g[f] && h[f + 128] < h[f])) {
        g[f] = g[f + 128];
        h[f] = h[f + 128];
      }
    }
    barrier(1);
  }
  if (16 >= 64 << 1) {
    if (f < 64) {
      if (g[f + 64] > g[f] || (g[f + 64] == g[f] && h[f + 64] < h[f])) {
        g[f] = g[f + 64];
        h[f] = h[f + 64];
      }
    }
    barrier(1);
  }
  if (16 >= 32 << 1) {
    if (f < 32) {
      if (g[f + 32] > g[f] || (g[f + 32] == g[f] && h[f + 32] < h[f])) {
        g[f] = g[f + 32];
        h[f] = h[f + 32];
      }
    }
    barrier(1);
  }
  if (16 >= 16 << 1) {
    if (f < 16) {
      if (g[f + 16] > g[f] || (g[f + 16] == g[f] && h[f + 16] < h[f])) {
        g[f] = g[f + 16];
        h[f] = h[f + 16];
      }
    }
    barrier(1);
  }
  if (16 >= 8 << 1) {
    if (f < 8) {
      if (g[f + 8] > g[f] || (g[f + 8] == g[f] && h[f + 8] < h[f])) {
        g[f] = g[f + 8];
        h[f] = h[f + 8];
      }
    }
    barrier(1);
  }
  if (16 >= 4 << 1) {
    if (f < 4) {
      if (g[f + 4] > g[f] || (g[f + 4] == g[f] && h[f + 4] < h[f])) {
        g[f] = g[f + 4];
        h[f] = h[f + 4];
      }
    }
    barrier(1);
  }
  if (16 >= 2 << 1) {
    if (f < 2) {
      if (g[f + 2] > g[f] || (g[f + 2] == g[f] && h[f + 2] < h[f])) {
        g[f] = g[f + 2];
        h[f] = h[f + 2];
      }
    }
    barrier(1);
  }
  if (16 >= 1 << 1) {
    if (f < 1) {
      if (g[f + 1] > g[f] || (g[f + 1] == g[f] && h[f + 1] < h[f])) {
        g[f] = g[f + 1];
        h[f] = h[f + 1];
      }
    }
    barrier(1);
  }
  if (f == 0)
    d[e] = h[0];
}
kernel void L(const global float* a, const unsigned b, const unsigned c, global unsigned* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[8];
  local unsigned h[8];
  a += e % b + (e / b) * b * c;
  g[f] = -__builtin_inff();
  for (unsigned i = f; i < c; i += 8) {
    const float j = a[i * b];
    if (j > g[f]) {
      g[f] = j;
      h[f] = i;
    }
  }
  barrier(1);
  if (8 >= 512 << 1) {
    if (f < 512) {
      if (g[f + 512] > g[f] || (g[f + 512] == g[f] && h[f + 512] < h[f])) {
        g[f] = g[f + 512];
        h[f] = h[f + 512];
      }
    }
    barrier(1);
  }
  if (8 >= 256 << 1) {
    if (f < 256) {
      if (g[f + 256] > g[f] || (g[f + 256] == g[f] && h[f + 256] < h[f])) {
        g[f] = g[f + 256];
        h[f] = h[f + 256];
      }
    }
    barrier(1);
  }
  if (8 >= 128 << 1) {
    if (f < 128) {
      if (g[f + 128] > g[f] || (g[f + 128] == g[f] && h[f + 128] < h[f])) {
        g[f] = g[f + 128];
        h[f] = h[f + 128];
      }
    }
    barrier(1);
  }
  if (8 >= 64 << 1) {
    if (f < 64) {
      if (g[f + 64] > g[f] || (g[f + 64] == g[f] && h[f + 64] < h[f])) {
        g[f] = g[f + 64];
        h[f] = h[f + 64];
      }
    }
    barrier(1);
  }
  if (8 >= 32 << 1) {
    if (f < 32) {
      if (g[f + 32] > g[f] || (g[f + 32] == g[f] && h[f + 32] < h[f])) {
        g[f] = g[f + 32];
        h[f] = h[f + 32];
      }
    }
    barrier(1);
  }
  if (8 >= 16 << 1) {
    if (f < 16) {
      if (g[f + 16] > g[f] || (g[f + 16] == g[f] && h[f + 16] < h[f])) {
        g[f] = g[f + 16];
        h[f] = h[f + 16];
      }
    }
    barrier(1);
  }
  if (8 >= 8 << 1) {
    if (f < 8) {
      if (g[f + 8] > g[f] || (g[f + 8] == g[f] && h[f + 8] < h[f])) {
        g[f] = g[f + 8];
        h[f] = h[f + 8];
      }
    }
    barrier(1);
  }
  if (8 >= 4 << 1) {
    if (f < 4) {
      if (g[f + 4] > g[f] || (g[f + 4] == g[f] && h[f + 4] < h[f])) {
        g[f] = g[f + 4];
        h[f] = h[f + 4];
      }
    }
    barrier(1);
  }
  if (8 >= 2 << 1) {
    if (f < 2) {
      if (g[f + 2] > g[f] || (g[f + 2] == g[f] && h[f + 2] < h[f])) {
        g[f] = g[f + 2];
        h[f] = h[f + 2];
      }
    }
    barrier(1);
  }
  if (8 >= 1 << 1) {
    if (f < 1) {
      if (g[f + 1] > g[f] || (g[f + 1] == g[f] && h[f + 1] < h[f])) {
        g[f] = g[f + 1];
        h[f] = h[f + 1];
      }
    }
    barrier(1);
  }
  if (f == 0)
    d[e] = h[0];
}
kernel void M(const global float* a, const unsigned b, const unsigned c, global unsigned* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[4];
  local unsigned h[4];
  a += e % b + (e / b) * b * c;
  g[f] = -__builtin_inff();
  for (unsigned i = f; i < c; i += 4) {
    const float j = a[i * b];
    if (j > g[f]) {
      g[f] = j;
      h[f] = i;
    }
  }
  barrier(1);
  if (4 >= 512 << 1) {
    if (f < 512) {
      if (g[f + 512] > g[f] || (g[f + 512] == g[f] && h[f + 512] < h[f])) {
        g[f] = g[f + 512];
        h[f] = h[f + 512];
      }
    }
    barrier(1);
  }
  if (4 >= 256 << 1) {
    if (f < 256) {
      if (g[f + 256] > g[f] || (g[f + 256] == g[f] && h[f + 256] < h[f])) {
        g[f] = g[f + 256];
        h[f] = h[f + 256];
      }
    }
    barrier(1);
  }
  if (4 >= 128 << 1) {
    if (f < 128) {
      if (g[f + 128] > g[f] || (g[f + 128] == g[f] && h[f + 128] < h[f])) {
        g[f] = g[f + 128];
        h[f] = h[f + 128];
      }
    }
    barrier(1);
  }
  if (4 >= 64 << 1) {
    if (f < 64) {
      if (g[f + 64] > g[f] || (g[f + 64] == g[f] && h[f + 64] < h[f])) {
        g[f] = g[f + 64];
        h[f] = h[f + 64];
      }
    }
    barrier(1);
  }
  if (4 >= 32 << 1) {
    if (f < 32) {
      if (g[f + 32] > g[f] || (g[f + 32] == g[f] && h[f + 32] < h[f])) {
        g[f] = g[f + 32];
        h[f] = h[f + 32];
      }
    }
    barrier(1);
  }
  if (4 >= 16 << 1) {
    if (f < 16) {
      if (g[f + 16] > g[f] || (g[f + 16] == g[f] && h[f + 16] < h[f])) {
        g[f] = g[f + 16];
        h[f] = h[f + 16];
      }
    }
    barrier(1);
  }
  if (4 >= 8 << 1) {
    if (f < 8) {
      if (g[f + 8] > g[f] || (g[f + 8] == g[f] && h[f + 8] < h[f])) {
        g[f] = g[f + 8];
        h[f] = h[f + 8];
      }
    }
    barrier(1);
  }
  if (4 >= 4 << 1) {
    if (f < 4) {
      if (g[f + 4] > g[f] || (g[f + 4] == g[f] && h[f + 4] < h[f])) {
        g[f] = g[f + 4];
        h[f] = h[f + 4];
      }
    }
    barrier(1);
  }
  if (4 >= 2 << 1) {
    if (f < 2) {
      if (g[f + 2] > g[f] || (g[f + 2] == g[f] && h[f + 2] < h[f])) {
        g[f] = g[f + 2];
        h[f] = h[f + 2];
      }
    }
    barrier(1);
  }
  if (4 >= 1 << 1) {
    if (f < 1) {
      if (g[f + 1] > g[f] || (g[f + 1] == g[f] && h[f + 1] < h[f])) {
        g[f] = g[f + 1];
        h[f] = h[f + 1];
      }
    }
    barrier(1);
  }
  if (f == 0)
    d[e] = h[0];
}
kernel void N(const global float* a, const unsigned b, const unsigned c, global unsigned* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[2];
  local unsigned h[2];
  a += e % b + (e / b) * b * c;
  g[f] = -__builtin_inff();
  for (unsigned i = f; i < c; i += 2) {
    const float j = a[i * b];
    if (j > g[f]) {
      g[f] = j;
      h[f] = i;
    }
  }
  barrier(1);
  if (2 >= 512 << 1) {
    if (f < 512) {
      if (g[f + 512] > g[f] || (g[f + 512] == g[f] && h[f + 512] < h[f])) {
        g[f] = g[f + 512];
        h[f] = h[f + 512];
      }
    }
    barrier(1);
  }
  if (2 >= 256 << 1) {
    if (f < 256) {
      if (g[f + 256] > g[f] || (g[f + 256] == g[f] && h[f + 256] < h[f])) {
        g[f] = g[f + 256];
        h[f] = h[f + 256];
      }
    }
    barrier(1);
  }
  if (2 >= 128 << 1) {
    if (f < 128) {
      if (g[f + 128] > g[f] || (g[f + 128] == g[f] && h[f + 128] < h[f])) {
        g[f] = g[f + 128];
        h[f] = h[f + 128];
      }
    }
    barrier(1);
  }
  if (2 >= 64 << 1) {
    if (f < 64) {
      if (g[f + 64] > g[f] || (g[f + 64] == g[f] && h[f + 64] < h[f])) {
        g[f] = g[f + 64];
        h[f] = h[f + 64];
      }
    }
    barrier(1);
  }
  if (2 >= 32 << 1) {
    if (f < 32) {
      if (g[f + 32] > g[f] || (g[f + 32] == g[f] && h[f + 32] < h[f])) {
        g[f] = g[f + 32];
        h[f] = h[f + 32];
      }
    }
    barrier(1);
  }
  if (2 >= 16 << 1) {
    if (f < 16) {
      if (g[f + 16] > g[f] || (g[f + 16] == g[f] && h[f + 16] < h[f])) {
        g[f] = g[f + 16];
        h[f] = h[f + 16];
      }
    }
    barrier(1);
  }
  if (2 >= 8 << 1) {
    if (f < 8) {
      if (g[f + 8] > g[f] || (g[f + 8] == g[f] && h[f + 8] < h[f])) {
        g[f] = g[f + 8];
        h[f] = h[f + 8];
      }
    }
    barrier(1);
  }
  if (2 >= 4 << 1) {
    if (f < 4) {
      if (g[f + 4] > g[f] || (g[f + 4] == g[f] && h[f + 4] < h[f])) {
        g[f] = g[f + 4];
        h[f] = h[f + 4];
      }
    }
    barrier(1);
  }
  if (2 >= 2 << 1) {
    if (f < 2) {
      if (g[f + 2] > g[f] || (g[f + 2] == g[f] && h[f + 2] < h[f])) {
        g[f] = g[f + 2];
        h[f] = h[f + 2];
      }
    }
    barrier(1);
  }
  if (2 >= 1 << 1) {
    if (f < 1) {
      if (g[f + 1] > g[f] || (g[f + 1] == g[f] && h[f + 1] < h[f])) {
        g[f] = g[f + 1];
        h[f] = h[f + 1];
      }
    }
    barrier(1);
  }
  if (f == 0)
    d[e] = h[0];
}
kernel void O(const global float* a, const unsigned b, const unsigned c, global unsigned* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[1];
  local unsigned h[1];
  a += e % b + (e / b) * b * c;
  g[f] = -__builtin_inff();
  for (unsigned i = f; i < c; i += 1) {
    const float j = a[i * b];
    if (j > g[f]) {
      g[f] = j;
      h[f] = i;
    }
  }
  barrier(1);
  if (1 >= 512 << 1) {
    if (f < 512) {
      if (g[f + 512] > g[f] || (g[f + 512] == g[f] && h[f + 512] < h[f])) {
        g[f] = g[f + 512];
        h[f] = h[f + 512];
      }
    }
    barrier(1);
  }
  if (1 >= 256 << 1) {
    if (f < 256) {
      if (g[f + 256] > g[f] || (g[f + 256] == g[f] && h[f + 256] < h[f])) {
        g[f] = g[f + 256];
        h[f] = h[f + 256];
      }
    }
    barrier(1);
  }
  if (1 >= 128 << 1) {
    if (f < 128) {
      if (g[f + 128] > g[f] || (g[f + 128] == g[f] && h[f + 128] < h[f])) {
        g[f] = g[f + 128];
        h[f] = h[f + 128];
      }
    }
    barrier(1);
  }
  if (1 >= 64 << 1) {
    if (f < 64) {
      if (g[f + 64] > g[f] || (g[f + 64] == g[f] && h[f + 64] < h[f])) {
        g[f] = g[f + 64];
        h[f] = h[f + 64];
      }
    }
    barrier(1);
  }
  if (1 >= 32 << 1) {
    if (f < 32) {
      if (g[f + 32] > g[f] || (g[f + 32] == g[f] && h[f + 32] < h[f])) {
        g[f] = g[f + 32];
        h[f] = h[f + 32];
      }
    }
    barrier(1);
  }
  if (1 >= 16 << 1) {
    if (f < 16) {
      if (g[f + 16] > g[f] || (g[f + 16] == g[f] && h[f + 16] < h[f])) {
        g[f] = g[f + 16];
        h[f] = h[f + 16];
      }
    }
    barrier(1);
  }
  if (1 >= 8 << 1) {
    if (f < 8) {
      if (g[f + 8] > g[f] || (g[f + 8] == g[f] && h[f + 8] < h[f])) {
        g[f] = g[f + 8];
        h[f] = h[f + 8];
      }
    }
    barrier(1);
  }
  if (1 >= 4 << 1) {
    if (f < 4) {
      if (g[f + 4] > g[f] || (g[f + 4] == g[f] && h[f + 4] < h[f])) {
        g[f] = g[f + 4];
        h[f] = h[f + 4];
      }
    }
    barrier(1);
  }
  if (1 >= 2 << 1) {
    if (f < 2) {
      if (g[f + 2] > g[f] || (g[f + 2] == g[f] && h[f + 2] < h[f])) {
        g[f] = g[f + 2];
        h[f] = h[f + 2];
      }
    }
    barrier(1);
  }
  if (1 >= 1 << 1) {
    if (f < 1) {
      if (g[f + 1] > g[f] || (g[f + 1] == g[f] && h[f + 1] < h[f])) {
        g[f] = g[f + 1];
        h[f] = h[f + 1];
      }
    }
    barrier(1);
  }
  if (f == 0)
    d[e] = h[0];
}
kernel void P(const global float* a, const unsigned b, const unsigned c, global unsigned* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[1024];
  local unsigned h[1024];
  a += e % b + (e / b) * b * c;
  g[f] = __builtin_inff();
  for (unsigned i = f; i < c; i += 1024) {
    const float j = a[i * b];
    if (j < g[f]) {
      g[f] = j;
      h[f] = i;
    }
  }
  barrier(1);
  if (1024 >= 512 << 1) {
    if (f < 512) {
      if (g[f + 512] < g[f] || (g[f + 512] == g[f] && h[f + 512] < h[f])) {
        g[f] = g[f + 512];
        h[f] = h[f + 512];
      }
    }
    barrier(1);
  }
  if (1024 >= 256 << 1) {
    if (f < 256) {
      if (g[f + 256] < g[f] || (g[f + 256] == g[f] && h[f + 256] < h[f])) {
        g[f] = g[f + 256];
        h[f] = h[f + 256];
      }
    }
    barrier(1);
  }
  if (1024 >= 128 << 1) {
    if (f < 128) {
      if (g[f + 128] < g[f] || (g[f + 128] == g[f] && h[f + 128] < h[f])) {
        g[f] = g[f + 128];
        h[f] = h[f + 128];
      }
    }
    barrier(1);
  }
  if (1024 >= 64 << 1) {
    if (f < 64) {
      if (g[f + 64] < g[f] || (g[f + 64] == g[f] && h[f + 64] < h[f])) {
        g[f] = g[f + 64];
        h[f] = h[f + 64];
      }
    }
    barrier(1);
  }
  if (1024 >= 32 << 1) {
    if (f < 32) {
      if (g[f + 32] < g[f] || (g[f + 32] == g[f] && h[f + 32] < h[f])) {
        g[f] = g[f + 32];
        h[f] = h[f + 32];
      }
    }
    barrier(1);
  }
  if (1024 >= 16 << 1) {
    if (f < 16) {
      if (g[f + 16] < g[f] || (g[f + 16] == g[f] && h[f + 16] < h[f])) {
        g[f] = g[f + 16];
        h[f] = h[f + 16];
      }
    }
    barrier(1);
  }
  if (1024 >= 8 << 1) {
    if (f < 8) {
      if (g[f + 8] < g[f] || (g[f + 8] == g[f] && h[f + 8] < h[f])) {
        g[f] = g[f + 8];
        h[f] = h[f + 8];
      }
    }
    barrier(1);
  }
  if (1024 >= 4 << 1) {
    if (f < 4) {
      if (g[f + 4] < g[f] || (g[f + 4] == g[f] && h[f + 4] < h[f])) {
        g[f] = g[f + 4];
        h[f] = h[f + 4];
      }
    }
    barrier(1);
  }
  if (1024 >= 2 << 1) {
    if (f < 2) {
      if (g[f + 2] < g[f] || (g[f + 2] == g[f] && h[f + 2] < h[f])) {
        g[f] = g[f + 2];
        h[f] = h[f + 2];
      }
    }
    barrier(1);
  }
  if (1024 >= 1 << 1) {
    if (f < 1) {
      if (g[f + 1] < g[f] || (g[f + 1] == g[f] && h[f + 1] < h[f])) {
        g[f] = g[f + 1];
        h[f] = h[f + 1];
      }
    }
    barrier(1);
  }
  if (f == 0)
    d[e] = h[0];
}
kernel void Q(const global float* a, const unsigned b, const unsigned c, global unsigned* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[512];
  local unsigned h[512];
  a += e % b + (e / b) * b * c;
  g[f] = __builtin_inff();
  for (unsigned i = f; i < c; i += 512) {
    const float j = a[i * b];
    if (j < g[f]) {
      g[f] = j;
      h[f] = i;
    }
  }
  barrier(1);
  if (512 >= 512 << 1) {
    if (f < 512) {
      if (g[f + 512] < g[f] || (g[f + 512] == g[f] && h[f + 512] < h[f])) {
        g[f] = g[f + 512];
        h[f] = h[f + 512];
      }
    }
    barrier(1);
  }
  if (512 >= 256 << 1) {
    if (f < 256) {
      if (g[f + 256] < g[f] || (g[f + 256] == g[f] && h[f + 256] < h[f])) {
        g[f] = g[f + 256];
        h[f] = h[f + 256];
      }
    }
    barrier(1);
  }
  if (512 >= 128 << 1) {
    if (f < 128) {
      if (g[f + 128] < g[f] || (g[f + 128] == g[f] && h[f + 128] < h[f])) {
        g[f] = g[f + 128];
        h[f] = h[f + 128];
      }
    }
    barrier(1);
  }
  if (512 >= 64 << 1) {
    if (f < 64) {
      if (g[f + 64] < g[f] || (g[f + 64] == g[f] && h[f + 64] < h[f])) {
        g[f] = g[f + 64];
        h[f] = h[f + 64];
      }
    }
    barrier(1);
  }
  if (512 >= 32 << 1) {
    if (f < 32) {
      if (g[f + 32] < g[f] || (g[f + 32] == g[f] && h[f + 32] < h[f])) {
        g[f] = g[f + 32];
        h[f] = h[f + 32];
      }
    }
    barrier(1);
  }
  if (512 >= 16 << 1) {
    if (f < 16) {
      if (g[f + 16] < g[f] || (g[f + 16] == g[f] && h[f + 16] < h[f])) {
        g[f] = g[f + 16];
        h[f] = h[f + 16];
      }
    }
    barrier(1);
  }
  if (512 >= 8 << 1) {
    if (f < 8) {
      if (g[f + 8] < g[f] || (g[f + 8] == g[f] && h[f + 8] < h[f])) {
        g[f] = g[f + 8];
        h[f] = h[f + 8];
      }
    }
    barrier(1);
  }
  if (512 >= 4 << 1) {
    if (f < 4) {
      if (g[f + 4] < g[f] || (g[f + 4] == g[f] && h[f + 4] < h[f])) {
        g[f] = g[f + 4];
        h[f] = h[f + 4];
      }
    }
    barrier(1);
  }
  if (512 >= 2 << 1) {
    if (f < 2) {
      if (g[f + 2] < g[f] || (g[f + 2] == g[f] && h[f + 2] < h[f])) {
        g[f] = g[f + 2];
        h[f] = h[f + 2];
      }
    }
    barrier(1);
  }
  if (512 >= 1 << 1) {
    if (f < 1) {
      if (g[f + 1] < g[f] || (g[f + 1] == g[f] && h[f + 1] < h[f])) {
        g[f] = g[f + 1];
        h[f] = h[f + 1];
      }
    }
    barrier(1);
  }
  if (f == 0)
    d[e] = h[0];
}
kernel void R(const global float* a, const unsigned b, const unsigned c, global unsigned* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[256];
  local unsigned h[256];
  a += e % b + (e / b) * b * c;
  g[f] = __builtin_inff();
  for (unsigned i = f; i < c; i += 256) {
    const float j = a[i * b];
    if (j < g[f]) {
      g[f] = j;
      h[f] = i;
    }
  }
  barrier(1);
  if (256 >= 512 << 1) {
    if (f < 512) {
      if (g[f + 512] < g[f] || (g[f + 512] == g[f] && h[f + 512] < h[f])) {
        g[f] = g[f + 512];
        h[f] = h[f + 512];
      }
    }
    barrier(1);
  }
  if (256 >= 256 << 1) {
    if (f < 256) {
      if (g[f + 256] < g[f] || (g[f + 256] == g[f] && h[f + 256] < h[f])) {
        g[f] = g[f + 256];
        h[f] = h[f + 256];
      }
    }
    barrier(1);
  }
  if (256 >= 128 << 1) {
    if (f < 128) {
      if (g[f + 128] < g[f] || (g[f + 128] == g[f] && h[f + 128] < h[f])) {
        g[f] = g[f + 128];
        h[f] = h[f + 128];
      }
    }
    barrier(1);
  }
  if (256 >= 64 << 1) {
    if (f < 64) {
      if (g[f + 64] < g[f] || (g[f + 64] == g[f] && h[f + 64] < h[f])) {
        g[f] = g[f + 64];
        h[f] = h[f + 64];
      }
    }
    barrier(1);
  }
  if (256 >= 32 << 1) {
    if (f < 32) {
      if (g[f + 32] < g[f] || (g[f + 32] == g[f] && h[f + 32] < h[f])) {
        g[f] = g[f + 32];
        h[f] = h[f + 32];
      }
    }
    barrier(1);
  }
  if (256 >= 16 << 1) {
    if (f < 16) {
      if (g[f + 16] < g[f] || (g[f + 16] == g[f] && h[f + 16] < h[f])) {
        g[f] = g[f + 16];
        h[f] = h[f + 16];
      }
    }
    barrier(1);
  }
  if (256 >= 8 << 1) {
    if (f < 8) {
      if (g[f + 8] < g[f] || (g[f + 8] == g[f] && h[f + 8] < h[f])) {
        g[f] = g[f + 8];
        h[f] = h[f + 8];
      }
    }
    barrier(1);
  }
  if (256 >= 4 << 1) {
    if (f < 4) {
      if (g[f + 4] < g[f] || (g[f + 4] == g[f] && h[f + 4] < h[f])) {
        g[f] = g[f + 4];
        h[f] = h[f + 4];
      }
    }
    barrier(1);
  }
  if (256 >= 2 << 1) {
    if (f < 2) {
      if (g[f + 2] < g[f] || (g[f + 2] == g[f] && h[f + 2] < h[f])) {
        g[f] = g[f + 2];
        h[f] = h[f + 2];
      }
    }
    barrier(1);
  }
  if (256 >= 1 << 1) {
    if (f < 1) {
      if (g[f + 1] < g[f] || (g[f + 1] == g[f] && h[f + 1] < h[f])) {
        g[f] = g[f + 1];
        h[f] = h[f + 1];
      }
    }
    barrier(1);
  }
  if (f == 0)
    d[e] = h[0];
}
kernel void S(const global float* a, const unsigned b, const unsigned c, global unsigned* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[128];
  local unsigned h[128];
  a += e % b + (e / b) * b * c;
  g[f] = __builtin_inff();
  for (unsigned i = f; i < c; i += 128) {
    const float j = a[i * b];
    if (j < g[f]) {
      g[f] = j;
      h[f] = i;
    }
  }
  barrier(1);
  if (128 >= 512 << 1) {
    if (f < 512) {
      if (g[f + 512] < g[f] || (g[f + 512] == g[f] && h[f + 512] < h[f])) {
        g[f] = g[f + 512];
        h[f] = h[f + 512];
      }
    }
    barrier(1);
  }
  if (128 >= 256 << 1) {
    if (f < 256) {
      if (g[f + 256] < g[f] || (g[f + 256] == g[f] && h[f + 256] < h[f])) {
        g[f] = g[f + 256];
        h[f] = h[f + 256];
      }
    }
    barrier(1);
  }
  if (128 >= 128 << 1) {
    if (f < 128) {
      if (g[f + 128] < g[f] || (g[f + 128] == g[f] && h[f + 128] < h[f])) {
        g[f] = g[f + 128];
        h[f] = h[f + 128];
      }
    }
    barrier(1);
  }
  if (128 >= 64 << 1) {
    if (f < 64) {
      if (g[f + 64] < g[f] || (g[f + 64] == g[f] && h[f + 64] < h[f])) {
        g[f] = g[f + 64];
        h[f] = h[f + 64];
      }
    }
    barrier(1);
  }
  if (128 >= 32 << 1) {
    if (f < 32) {
      if (g[f + 32] < g[f] || (g[f + 32] == g[f] && h[f + 32] < h[f])) {
        g[f] = g[f + 32];
        h[f] = h[f + 32];
      }
    }
    barrier(1);
  }
  if (128 >= 16 << 1) {
    if (f < 16) {
      if (g[f + 16] < g[f] || (g[f + 16] == g[f] && h[f + 16] < h[f])) {
        g[f] = g[f + 16];
        h[f] = h[f + 16];
      }
    }
    barrier(1);
  }
  if (128 >= 8 << 1) {
    if (f < 8) {
      if (g[f + 8] < g[f] || (g[f + 8] == g[f] && h[f + 8] < h[f])) {
        g[f] = g[f + 8];
        h[f] = h[f + 8];
      }
    }
    barrier(1);
  }
  if (128 >= 4 << 1) {
    if (f < 4) {
      if (g[f + 4] < g[f] || (g[f + 4] == g[f] && h[f + 4] < h[f])) {
        g[f] = g[f + 4];
        h[f] = h[f + 4];
      }
    }
    barrier(1);
  }
  if (128 >= 2 << 1) {
    if (f < 2) {
      if (g[f + 2] < g[f] || (g[f + 2] == g[f] && h[f + 2] < h[f])) {
        g[f] = g[f + 2];
        h[f] = h[f + 2];
      }
    }
    barrier(1);
  }
  if (128 >= 1 << 1) {
    if (f < 1) {
      if (g[f + 1] < g[f] || (g[f + 1] == g[f] && h[f + 1] < h[f])) {
        g[f] = g[f + 1];
        h[f] = h[f + 1];
      }
    }
    barrier(1);
  }
  if (f == 0)
    d[e] = h[0];
}
kernel void T(const global float* a, const unsigned b, const unsigned c, global unsigned* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[64];
  local unsigned h[64];
  a += e % b + (e / b) * b * c;
  g[f] = __builtin_inff();
  for (unsigned i = f; i < c; i += 64) {
    const float j = a[i * b];
    if (j < g[f]) {
      g[f] = j;
      h[f] = i;
    }
  }
  barrier(1);
  if (64 >= 512 << 1) {
    if (f < 512) {
      if (g[f + 512] < g[f] || (g[f + 512] == g[f] && h[f + 512] < h[f])) {
        g[f] = g[f + 512];
        h[f] = h[f + 512];
      }
    }
    barrier(1);
  }
  if (64 >= 256 << 1) {
    if (f < 256) {
      if (g[f + 256] < g[f] || (g[f + 256] == g[f] && h[f + 256] < h[f])) {
        g[f] = g[f + 256];
        h[f] = h[f + 256];
      }
    }
    barrier(1);
  }
  if (64 >= 128 << 1) {
    if (f < 128) {
      if (g[f + 128] < g[f] || (g[f + 128] == g[f] && h[f + 128] < h[f])) {
        g[f] = g[f + 128];
        h[f] = h[f + 128];
      }
    }
    barrier(1);
  }
  if (64 >= 64 << 1) {
    if (f < 64) {
      if (g[f + 64] < g[f] || (g[f + 64] == g[f] && h[f + 64] < h[f])) {
        g[f] = g[f + 64];
        h[f] = h[f + 64];
      }
    }
    barrier(1);
  }
  if (64 >= 32 << 1) {
    if (f < 32) {
      if (g[f + 32] < g[f] || (g[f + 32] == g[f] && h[f + 32] < h[f])) {
        g[f] = g[f + 32];
        h[f] = h[f + 32];
      }
    }
    barrier(1);
  }
  if (64 >= 16 << 1) {
    if (f < 16) {
      if (g[f + 16] < g[f] || (g[f + 16] == g[f] && h[f + 16] < h[f])) {
        g[f] = g[f + 16];
        h[f] = h[f + 16];
      }
    }
    barrier(1);
  }
  if (64 >= 8 << 1) {
    if (f < 8) {
      if (g[f + 8] < g[f] || (g[f + 8] == g[f] && h[f + 8] < h[f])) {
        g[f] = g[f + 8];
        h[f] = h[f + 8];
      }
    }
    barrier(1);
  }
  if (64 >= 4 << 1) {
    if (f < 4) {
      if (g[f + 4] < g[f] || (g[f + 4] == g[f] && h[f + 4] < h[f])) {
        g[f] = g[f + 4];
        h[f] = h[f + 4];
      }
    }
    barrier(1);
  }
  if (64 >= 2 << 1) {
    if (f < 2) {
      if (g[f + 2] < g[f] || (g[f + 2] == g[f] && h[f + 2] < h[f])) {
        g[f] = g[f + 2];
        h[f] = h[f + 2];
      }
    }
    barrier(1);
  }
  if (64 >= 1 << 1) {
    if (f < 1) {
      if (g[f + 1] < g[f] || (g[f + 1] == g[f] && h[f + 1] < h[f])) {
        g[f] = g[f + 1];
        h[f] = h[f + 1];
      }
    }
    barrier(1);
  }
  if (f == 0)
    d[e] = h[0];
}
kernel void U(const global float* a, const unsigned b, const unsigned c, global unsigned* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[32];
  local unsigned h[32];
  a += e % b + (e / b) * b * c;
  g[f] = __builtin_inff();
  for (unsigned i = f; i < c; i += 32) {
    const float j = a[i * b];
    if (j < g[f]) {
      g[f] = j;
      h[f] = i;
    }
  }
  barrier(1);
  if (32 >= 512 << 1) {
    if (f < 512) {
      if (g[f + 512] < g[f] || (g[f + 512] == g[f] && h[f + 512] < h[f])) {
        g[f] = g[f + 512];
        h[f] = h[f + 512];
      }
    }
    barrier(1);
  }
  if (32 >= 256 << 1) {
    if (f < 256) {
      if (g[f + 256] < g[f] || (g[f + 256] == g[f] && h[f + 256] < h[f])) {
        g[f] = g[f + 256];
        h[f] = h[f + 256];
      }
    }
    barrier(1);
  }
  if (32 >= 128 << 1) {
    if (f < 128) {
      if (g[f + 128] < g[f] || (g[f + 128] == g[f] && h[f + 128] < h[f])) {
        g[f] = g[f + 128];
        h[f] = h[f + 128];
      }
    }
    barrier(1);
  }
  if (32 >= 64 << 1) {
    if (f < 64) {
      if (g[f + 64] < g[f] || (g[f + 64] == g[f] && h[f + 64] < h[f])) {
        g[f] = g[f + 64];
        h[f] = h[f + 64];
      }
    }
    barrier(1);
  }
  if (32 >= 32 << 1) {
    if (f < 32) {
      if (g[f + 32] < g[f] || (g[f + 32] == g[f] && h[f + 32] < h[f])) {
        g[f] = g[f + 32];
        h[f] = h[f + 32];
      }
    }
    barrier(1);
  }
  if (32 >= 16 << 1) {
    if (f < 16) {
      if (g[f + 16] < g[f] || (g[f + 16] == g[f] && h[f + 16] < h[f])) {
        g[f] = g[f + 16];
        h[f] = h[f + 16];
      }
    }
    barrier(1);
  }
  if (32 >= 8 << 1) {
    if (f < 8) {
      if (g[f + 8] < g[f] || (g[f + 8] == g[f] && h[f + 8] < h[f])) {
        g[f] = g[f + 8];
        h[f] = h[f + 8];
      }
    }
    barrier(1);
  }
  if (32 >= 4 << 1) {
    if (f < 4) {
      if (g[f + 4] < g[f] || (g[f + 4] == g[f] && h[f + 4] < h[f])) {
        g[f] = g[f + 4];
        h[f] = h[f + 4];
      }
    }
    barrier(1);
  }
  if (32 >= 2 << 1) {
    if (f < 2) {
      if (g[f + 2] < g[f] || (g[f + 2] == g[f] && h[f + 2] < h[f])) {
        g[f] = g[f + 2];
        h[f] = h[f + 2];
      }
    }
    barrier(1);
  }
  if (32 >= 1 << 1) {
    if (f < 1) {
      if (g[f + 1] < g[f] || (g[f + 1] == g[f] && h[f + 1] < h[f])) {
        g[f] = g[f + 1];
        h[f] = h[f + 1];
      }
    }
    barrier(1);
  }
  if (f == 0)
    d[e] = h[0];
}
kernel void V(const global float* a, const unsigned b, const unsigned c, global unsigned* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[16];
  local unsigned h[16];
  a += e % b + (e / b) * b * c;
  g[f] = __builtin_inff();
  for (unsigned i = f; i < c; i += 16) {
    const float j = a[i * b];
    if (j < g[f]) {
      g[f] = j;
      h[f] = i;
    }
  }
  barrier(1);
  if (16 >= 512 << 1) {
    if (f < 512) {
      if (g[f + 512] < g[f] || (g[f + 512] == g[f] && h[f + 512] < h[f])) {
        g[f] = g[f + 512];
        h[f] = h[f + 512];
      }
    }
    barrier(1);
  }
  if (16 >= 256 << 1) {
    if (f < 256) {
      if (g[f + 256] < g[f] || (g[f + 256] == g[f] && h[f + 256] < h[f])) {
        g[f] = g[f + 256];
        h[f] = h[f + 256];
      }
    }
    barrier(1);
  }
  if (16 >= 128 << 1) {
    if (f < 128) {
      if (g[f + 128] < g[f] || (g[f + 128] == g[f] && h[f + 128] < h[f])) {
        g[f] = g[f + 128];
        h[f] = h[f + 128];
      }
    }
    barrier(1);
  }
  if (16 >= 64 << 1) {
    if (f < 64) {
      if (g[f + 64] < g[f] || (g[f + 64] == g[f] && h[f + 64] < h[f])) {
        g[f] = g[f + 64];
        h[f] = h[f + 64];
      }
    }
    barrier(1);
  }
  if (16 >= 32 << 1) {
    if (f < 32) {
      if (g[f + 32] < g[f] || (g[f + 32] == g[f] && h[f + 32] < h[f])) {
        g[f] = g[f + 32];
        h[f] = h[f + 32];
      }
    }
    barrier(1);
  }
  if (16 >= 16 << 1) {
    if (f < 16) {
      if (g[f + 16] < g[f] || (g[f + 16] == g[f] && h[f + 16] < h[f])) {
        g[f] = g[f + 16];
        h[f] = h[f + 16];
      }
    }
    barrier(1);
  }
  if (16 >= 8 << 1) {
    if (f < 8) {
      if (g[f + 8] < g[f] || (g[f + 8] == g[f] && h[f + 8] < h[f])) {
        g[f] = g[f + 8];
        h[f] = h[f + 8];
      }
    }
    barrier(1);
  }
  if (16 >= 4 << 1) {
    if (f < 4) {
      if (g[f + 4] < g[f] || (g[f + 4] == g[f] && h[f + 4] < h[f])) {
        g[f] = g[f + 4];
        h[f] = h[f + 4];
      }
    }
    barrier(1);
  }
  if (16 >= 2 << 1) {
    if (f < 2) {
      if (g[f + 2] < g[f] || (g[f + 2] == g[f] && h[f + 2] < h[f])) {
        g[f] = g[f + 2];
        h[f] = h[f + 2];
      }
    }
    barrier(1);
  }
  if (16 >= 1 << 1) {
    if (f < 1) {
      if (g[f + 1] < g[f] || (g[f + 1] == g[f] && h[f + 1] < h[f])) {
        g[f] = g[f + 1];
        h[f] = h[f + 1];
      }
    }
    barrier(1);
  }
  if (f == 0)
    d[e] = h[0];
}
kernel void W(const global float* a, const unsigned b, const unsigned c, global unsigned* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[8];
  local unsigned h[8];
  a += e % b + (e / b) * b * c;
  g[f] = __builtin_inff();
  for (unsigned i = f; i < c; i += 8) {
    const float j = a[i * b];
    if (j < g[f]) {
      g[f] = j;
      h[f] = i;
    }
  }
  barrier(1);
  if (8 >= 512 << 1) {
    if (f < 512) {
      if (g[f + 512] < g[f] || (g[f + 512] == g[f] && h[f + 512] < h[f])) {
        g[f] = g[f + 512];
        h[f] = h[f + 512];
      }
    }
    barrier(1);
  }
  if (8 >= 256 << 1) {
    if (f < 256) {
      if (g[f + 256] < g[f] || (g[f + 256] == g[f] && h[f + 256] < h[f])) {
        g[f] = g[f + 256];
        h[f] = h[f + 256];
      }
    }
    barrier(1);
  }
  if (8 >= 128 << 1) {
    if (f < 128) {
      if (g[f + 128] < g[f] || (g[f + 128] == g[f] && h[f + 128] < h[f])) {
        g[f] = g[f + 128];
        h[f] = h[f + 128];
      }
    }
    barrier(1);
  }
  if (8 >= 64 << 1) {
    if (f < 64) {
      if (g[f + 64] < g[f] || (g[f + 64] == g[f] && h[f + 64] < h[f])) {
        g[f] = g[f + 64];
        h[f] = h[f + 64];
      }
    }
    barrier(1);
  }
  if (8 >= 32 << 1) {
    if (f < 32) {
      if (g[f + 32] < g[f] || (g[f + 32] == g[f] && h[f + 32] < h[f])) {
        g[f] = g[f + 32];
        h[f] = h[f + 32];
      }
    }
    barrier(1);
  }
  if (8 >= 16 << 1) {
    if (f < 16) {
      if (g[f + 16] < g[f] || (g[f + 16] == g[f] && h[f + 16] < h[f])) {
        g[f] = g[f + 16];
        h[f] = h[f + 16];
      }
    }
    barrier(1);
  }
  if (8 >= 8 << 1) {
    if (f < 8) {
      if (g[f + 8] < g[f] || (g[f + 8] == g[f] && h[f + 8] < h[f])) {
        g[f] = g[f + 8];
        h[f] = h[f + 8];
      }
    }
    barrier(1);
  }
  if (8 >= 4 << 1) {
    if (f < 4) {
      if (g[f + 4] < g[f] || (g[f + 4] == g[f] && h[f + 4] < h[f])) {
        g[f] = g[f + 4];
        h[f] = h[f + 4];
      }
    }
    barrier(1);
  }
  if (8 >= 2 << 1) {
    if (f < 2) {
      if (g[f + 2] < g[f] || (g[f + 2] == g[f] && h[f + 2] < h[f])) {
        g[f] = g[f + 2];
        h[f] = h[f + 2];
      }
    }
    barrier(1);
  }
  if (8 >= 1 << 1) {
    if (f < 1) {
      if (g[f + 1] < g[f] || (g[f + 1] == g[f] && h[f + 1] < h[f])) {
        g[f] = g[f + 1];
        h[f] = h[f + 1];
      }
    }
    barrier(1);
  }
  if (f == 0)
    d[e] = h[0];
}
kernel void X(const global float* a, const unsigned b, const unsigned c, global unsigned* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[4];
  local unsigned h[4];
  a += e % b + (e / b) * b * c;
  g[f] = __builtin_inff();
  for (unsigned i = f; i < c; i += 4) {
    const float j = a[i * b];
    if (j < g[f]) {
      g[f] = j;
      h[f] = i;
    }
  }
  barrier(1);
  if (4 >= 512 << 1) {
    if (f < 512) {
      if (g[f + 512] < g[f] || (g[f + 512] == g[f] && h[f + 512] < h[f])) {
        g[f] = g[f + 512];
        h[f] = h[f + 512];
      }
    }
    barrier(1);
  }
  if (4 >= 256 << 1) {
    if (f < 256) {
      if (g[f + 256] < g[f] || (g[f + 256] == g[f] && h[f + 256] < h[f])) {
        g[f] = g[f + 256];
        h[f] = h[f + 256];
      }
    }
    barrier(1);
  }
  if (4 >= 128 << 1) {
    if (f < 128) {
      if (g[f + 128] < g[f] || (g[f + 128] == g[f] && h[f + 128] < h[f])) {
        g[f] = g[f + 128];
        h[f] = h[f + 128];
      }
    }
    barrier(1);
  }
  if (4 >= 64 << 1) {
    if (f < 64) {
      if (g[f + 64] < g[f] || (g[f + 64] == g[f] && h[f + 64] < h[f])) {
        g[f] = g[f + 64];
        h[f] = h[f + 64];
      }
    }
    barrier(1);
  }
  if (4 >= 32 << 1) {
    if (f < 32) {
      if (g[f + 32] < g[f] || (g[f + 32] == g[f] && h[f + 32] < h[f])) {
        g[f] = g[f + 32];
        h[f] = h[f + 32];
      }
    }
    barrier(1);
  }
  if (4 >= 16 << 1) {
    if (f < 16) {
      if (g[f + 16] < g[f] || (g[f + 16] == g[f] && h[f + 16] < h[f])) {
        g[f] = g[f + 16];
        h[f] = h[f + 16];
      }
    }
    barrier(1);
  }
  if (4 >= 8 << 1) {
    if (f < 8) {
      if (g[f + 8] < g[f] || (g[f + 8] == g[f] && h[f + 8] < h[f])) {
        g[f] = g[f + 8];
        h[f] = h[f + 8];
      }
    }
    barrier(1);
  }
  if (4 >= 4 << 1) {
    if (f < 4) {
      if (g[f + 4] < g[f] || (g[f + 4] == g[f] && h[f + 4] < h[f])) {
        g[f] = g[f + 4];
        h[f] = h[f + 4];
      }
    }
    barrier(1);
  }
  if (4 >= 2 << 1) {
    if (f < 2) {
      if (g[f + 2] < g[f] || (g[f + 2] == g[f] && h[f + 2] < h[f])) {
        g[f] = g[f + 2];
        h[f] = h[f + 2];
      }
    }
    barrier(1);
  }
  if (4 >= 1 << 1) {
    if (f < 1) {
      if (g[f + 1] < g[f] || (g[f + 1] == g[f] && h[f + 1] < h[f])) {
        g[f] = g[f + 1];
        h[f] = h[f + 1];
      }
    }
    barrier(1);
  }
  if (f == 0)
    d[e] = h[0];
}
kernel void Y(const global float* a, const unsigned b, const unsigned c, global unsigned* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[2];
  local unsigned h[2];
  a += e % b + (e / b) * b * c;
  g[f] = __builtin_inff();
  for (unsigned i = f; i < c; i += 2) {
    const float j = a[i * b];
    if (j < g[f]) {
      g[f] = j;
      h[f] = i;
    }
  }
  barrier(1);
  if (2 >= 512 << 1) {
    if (f < 512) {
      if (g[f + 512] < g[f] || (g[f + 512] == g[f] && h[f + 512] < h[f])) {
        g[f] = g[f + 512];
        h[f] = h[f + 512];
      }
    }
    barrier(1);
  }
  if (2 >= 256 << 1) {
    if (f < 256) {
      if (g[f + 256] < g[f] || (g[f + 256] == g[f] && h[f + 256] < h[f])) {
        g[f] = g[f + 256];
        h[f] = h[f + 256];
      }
    }
    barrier(1);
  }
  if (2 >= 128 << 1) {
    if (f < 128) {
      if (g[f + 128] < g[f] || (g[f + 128] == g[f] && h[f + 128] < h[f])) {
        g[f] = g[f + 128];
        h[f] = h[f + 128];
      }
    }
    barrier(1);
  }
  if (2 >= 64 << 1) {
    if (f < 64) {
      if (g[f + 64] < g[f] || (g[f + 64] == g[f] && h[f + 64] < h[f])) {
        g[f] = g[f + 64];
        h[f] = h[f + 64];
      }
    }
    barrier(1);
  }
  if (2 >= 32 << 1) {
    if (f < 32) {
      if (g[f + 32] < g[f] || (g[f + 32] == g[f] && h[f + 32] < h[f])) {
        g[f] = g[f + 32];
        h[f] = h[f + 32];
      }
    }
    barrier(1);
  }
  if (2 >= 16 << 1) {
    if (f < 16) {
      if (g[f + 16] < g[f] || (g[f + 16] == g[f] && h[f + 16] < h[f])) {
        g[f] = g[f + 16];
        h[f] = h[f + 16];
      }
    }
    barrier(1);
  }
  if (2 >= 8 << 1) {
    if (f < 8) {
      if (g[f + 8] < g[f] || (g[f + 8] == g[f] && h[f + 8] < h[f])) {
        g[f] = g[f + 8];
        h[f] = h[f + 8];
      }
    }
    barrier(1);
  }
  if (2 >= 4 << 1) {
    if (f < 4) {
      if (g[f + 4] < g[f] || (g[f + 4] == g[f] && h[f + 4] < h[f])) {
        g[f] = g[f + 4];
        h[f] = h[f + 4];
      }
    }
    barrier(1);
  }
  if (2 >= 2 << 1) {
    if (f < 2) {
      if (g[f + 2] < g[f] || (g[f + 2] == g[f] && h[f + 2] < h[f])) {
        g[f] = g[f + 2];
        h[f] = h[f + 2];
      }
    }
    barrier(1);
  }
  if (2 >= 1 << 1) {
    if (f < 1) {
      if (g[f + 1] < g[f] || (g[f + 1] == g[f] && h[f + 1] < h[f])) {
        g[f] = g[f + 1];
        h[f] = h[f + 1];
      }
    }
    barrier(1);
  }
  if (f == 0)
    d[e] = h[0];
}
kernel void Z(const global float* a, const unsigned b, const unsigned c, global unsigned* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[1];
  local unsigned h[1];
  a += e % b + (e / b) * b * c;
  g[f] = __builtin_inff();
  for (unsigned i = f; i < c; i += 1) {
    const float j = a[i * b];
    if (j < g[f]) {
      g[f] = j;
      h[f] = i;
    }
  }
  barrier(1);
  if (1 >= 512 << 1) {
    if (f < 512) {
      if (g[f + 512] < g[f] || (g[f + 512] == g[f] && h[f + 512] < h[f])) {
        g[f] = g[f + 512];
        h[f] = h[f + 512];
      }
    }
    barrier(1);
  }
  if (1 >= 256 << 1) {
    if (f < 256) {
      if (g[f + 256] < g[f] || (g[f + 256] == g[f] && h[f + 256] < h[f])) {
        g[f] = g[f + 256];
        h[f] = h[f + 256];
      }
    }
    barrier(1);
  }
  if (1 >= 128 << 1) {
    if (f < 128) {
      if (g[f + 128] < g[f] || (g[f + 128] == g[f] && h[f + 128] < h[f])) {
        g[f] = g[f + 128];
        h[f] = h[f + 128];
      }
    }
    barrier(1);
  }
  if (1 >= 64 << 1) {
    if (f < 64) {
      if (g[f + 64] < g[f] || (g[f + 64] == g[f] && h[f + 64] < h[f])) {
        g[f] = g[f + 64];
        h[f] = h[f + 64];
      }
    }
    barrier(1);
  }
  if (1 >= 32 << 1) {
    if (f < 32) {
      if (g[f + 32] < g[f] || (g[f + 32] == g[f] && h[f + 32] < h[f])) {
        g[f] = g[f + 32];
        h[f] = h[f + 32];
      }
    }
    barrier(1);
  }
  if (1 >= 16 << 1) {
    if (f < 16) {
      if (g[f + 16] < g[f] || (g[f + 16] == g[f] && h[f + 16] < h[f])) {
        g[f] = g[f + 16];
        h[f] = h[f + 16];
      }
    }
    barrier(1);
  }
  if (1 >= 8 << 1) {
    if (f < 8) {
      if (g[f + 8] < g[f] || (g[f + 8] == g[f] && h[f + 8] < h[f])) {
        g[f] = g[f + 8];
        h[f] = h[f + 8];
      }
    }
    barrier(1);
  }
  if (1 >= 4 << 1) {
    if (f < 4) {
      if (g[f + 4] < g[f] || (g[f + 4] == g[f] && h[f + 4] < h[f])) {
        g[f] = g[f + 4];
        h[f] = h[f + 4];
      }
    }
    barrier(1);
  }
  if (1 >= 2 << 1) {
    if (f < 2) {
      if (g[f + 2] < g[f] || (g[f + 2] == g[f] && h[f + 2] < h[f])) {
        g[f] = g[f + 2];
        h[f] = h[f + 2];
      }
    }
    barrier(1);
  }
  if (1 >= 1 << 1) {
    if (f < 1) {
      if (g[f + 1] < g[f] || (g[f + 1] == g[f] && h[f + 1] < h[f])) {
        g[f] = g[f + 1];
        h[f] = h[f + 1];
      }
    }
    barrier(1);
  }
  if (f == 0)
    d[e] = h[0];
}

kernel void AA(const unsigned a, const unsigned b, global float* c) {
  const unsigned d = get_global_id(0);
  if (d < a)
    c[d] = !(d % b);
}

kernel void AB(const global float* a, const global unsigned* b, const unsigned c, const unsigned d, const unsigned e, const unsigned f, const unsigned g, global float* h) {
  const unsigned i = get_global_id(0);
  const unsigned j = get_group_id(1);
  const unsigned k = j * e + b[j * f] * d;
  const unsigned l = j * g;
  if (i < g)
    h[l + i] = a[k + (i / d) * c + (i % d)];
}

kernel void AC(const global float* a, const unsigned b, const unsigned c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  if (g < e)
    f[g] = a[(g / c) * d + (g % c) + b];
}

kernel void AD(const global float* a, const unsigned b, const unsigned c, const unsigned d, const unsigned e, global float* f, const unsigned g) {
  const unsigned h = get_global_id(0);
  if (h < e)
    f[(h / b) * c + (h % b) + g] = a[h % d];
}

inline void AE(global float* a, const float b) {
  union {
    unsigned u;
    float f;
  } c, d;
  unsigned e;
  c.f = *a;
  d.f = c.f + b;
  while ((e = atomic_cmpxchg((global unsigned*)a, c.u, d.u)) != c.u) {
    c.u = e;
    d.f = c.f + b;
  }
}

kernel void AF(const global float* a, const global unsigned* b, const unsigned c, const unsigned d, const unsigned e, const unsigned f, const unsigned g, global float* h) {
  const unsigned i = get_global_id(0);
  const unsigned j = get_group_id(1);
  const unsigned k = j * e + b[j * f] * d;
  const unsigned l = j * g;
  if (i < g) {
    AE(h + k + (i / d) * c + (i % d), a[l + i]);
  }
}

kernel void AG(const global float* a, const unsigned b, const unsigned c, const unsigned d, const unsigned e, global float* f, const unsigned g) {
  const unsigned h = get_global_id(0);
  if (h < c * max(d, e)) {
    AE(f + g + ((h / c) * b + (h % c)) % (b * d), a[h % (c * e)]);
  }
}
kernel void AH(const global float* a, const unsigned b, global float* c) {
  const unsigned d = get_global_id(0);
  if (d < b)
    c[d] = (-a[d]);
}
kernel void AI(const global float* a, const unsigned b, global float* c) {
  const unsigned d = get_global_id(0);
  if (d < b)
    c[d] = (__clc_fabs(a[d]));
}
kernel void AJ(const global float* a, const unsigned b, global float* c) {
  const unsigned d = get_global_id(0);
  if (d < b)
    c[d] = (sqrt(a[d]));
}
kernel void AK(const global float* a, const unsigned b, global float* c) {
  const unsigned d = get_global_id(0);
  if (d < b)
    c[d] = (exp(a[d]));
}
kernel void AL(const global float* a, const unsigned b, global float* c) {
  const unsigned d = get_global_id(0);
  if (d < b)
    c[d] = (log(a[d]));
}
kernel void AM(const global float* a, const unsigned b, global float* c) {
  const unsigned d = get_global_id(0);
  if (d < b)
    c[d] = (tanh(a[d]));
}
kernel void AN(const global float* a, const unsigned b, global float* c) {
  const unsigned d = get_global_id(0);
  if (d < b)
    c[d] = (.5f + .5f * tanh(.5f * a[d]));
}
kernel void AO(const global float* a, const unsigned b, global float* c) {
  const unsigned d = get_global_id(0);
  if (d < b)
    c[d] = (max(a[d], .0f) + log(1.f + exp(-__clc_fabs(a[d]))));
}

kernel void AP(const global float* a, const unsigned b, global float* c) {
  const unsigned d = get_global_id(0);
  if (d < b)
    c[d] = (sin(a[d]));
}
kernel void AQ(const global float* a, const unsigned b, global float* c) {
  const unsigned d = get_global_id(0);
  if (d < b)
    c[d] = (cos(a[d]));
}
kernel void AR(const global float* a, const unsigned b, global float* c) {
  const unsigned d = get_global_id(0);
  if (d < b)
    c[d] = (tan(a[d]));
}

kernel void AS(const global float* a, const global float* b, const global float* c, const unsigned d, global float* e) {
  const unsigned f = get_global_id(0);
  if (f < d)
    e[f] += (sign(a[f]) * c[f]);
}
kernel void AT(const global float* a, const global float* b, const global float* c, const unsigned d, global float* e) {
  const unsigned f = get_global_id(0);
  if (f < d)
    e[f] += (.5f * c[f] / b[f]);
}
kernel void AU(const global float* a, const global float* b, const global float* c, const unsigned d, global float* e) {
  const unsigned f = get_global_id(0);
  if (f < d)
    e[f] += (b[f] * c[f]);
}
kernel void AV(const global float* a, const global float* b, const global float* c, const unsigned d, global float* e) {
  const unsigned f = get_global_id(0);
  if (f < d)
    e[f] += (c[f] / a[f]);
}
kernel void AW(const global float* a, const global float* b, const global float* c, const unsigned d, global float* e) {
  const unsigned f = get_global_id(0);
  if (f < d)
    e[f] += ((1.f - b[f] * b[f]) * c[f]);
}
kernel void AX(const global float* a, const global float* b, const global float* c, const unsigned d, global float* e) {
  const unsigned f = get_global_id(0);
  if (f < d)
    e[f] += (b[f] * (1.f - b[f]) * c[f]);
}
kernel void AY(const global float* a, const global float* b, const global float* c, const unsigned d, global float* e) {
  const unsigned f = get_global_id(0);
  if (f < d)
    e[f] += ((.5f + .5f * tanh(.5f * a[f])) * c[f]);
}
kernel void AZ(const global float* a, const global float* b, const global float* c, const unsigned d, global float* e) {
  const unsigned f = get_global_id(0);
  if (f < d)
    e[f] += (cos(a[f]) * c[f]);
}
kernel void BA(const global float* a, const global float* b, const global float* c, const unsigned d, global float* e) {
  const unsigned f = get_global_id(0);
  if (f < d)
    e[f] += (-sin(a[f]) * c[f]);
}
kernel void BB(const global float* a, const global float* b, const global float* c, const unsigned d, global float* e) {
  const unsigned f = get_global_id(0);
  if (f < d)
    e[f] += ((1.f + b[f] * b[f]) * c[f]);
}

kernel void BC(const global float* a, const float b, const unsigned c, global float* d) {
  const unsigned e = get_global_id(0);
  if (e < c)
    d[e] = (a[e] + b);
}
kernel void BD(const global float* a, const float b, const unsigned c, global float* d) {
  const unsigned e = get_global_id(0);
  if (e < c)
    d[e] = (a[e] - b);
}
kernel void BE(const global float* a, const float b, const unsigned c, global float* d) {
  const unsigned e = get_global_id(0);
  if (e < c)
    d[e] = (b - a[e]);
}
kernel void BF(const global float* a, const float b, const unsigned c, global float* d) {
  const unsigned e = get_global_id(0);
  if (e < c)
    d[e] = (a[e] * b);
}
kernel void BG(const global float* a, const float b, const unsigned c, global float* d) {
  const unsigned e = get_global_id(0);
  if (e < c)
    d[e] = (a[e] / b);
}
kernel void BH(const global float* a, const float b, const unsigned c, global float* d) {
  const unsigned e = get_global_id(0);
  if (e < c)
    d[e] = (b / a[e]);
}
kernel void BI(const global float* a, const float b, const unsigned c, global float* d) {
  const unsigned e = get_global_id(0);
  if (e < c)
    d[e] = (__clc_pow(a[e], b));
}
kernel void BJ(const global float* a, const float b, const unsigned c, global float* d) {
  const unsigned e = get_global_id(0);
  if (e < c)
    d[e] = (__clc_pow(b, a[e]));
}
kernel void BK(const global float* a, const float b, const unsigned c, global float* d) {
  const unsigned e = get_global_id(0);
  if (e < c)
    d[e] = (max(a[e], .0f) + b * min(a[e], .0f));
}
kernel void BL(const global float* a, const float b, const unsigned c, global float* d) {
  const unsigned e = get_global_id(0);
  if (e < c)
    d[e] = (max(a[e], .0f) + b * (exp(min(a[e], .0f)) - 1.0f));
}

kernel void BM(const global float* a, const int b, const unsigned c, global float* d) {
  const unsigned e = get_global_id(0);
  if (e < c)
    d[e] = pown(a[e], b);
}

kernel void BN(const global float* a, const global float* b, const global float* c, const float d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  if (g < e)
    f[g] += (c[g]);
}
kernel void BO(const global float* a, const global float* b, const global float* c, const float d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  if (g < e)
    f[g] += (c[g]);
}
kernel void BP(const global float* a, const global float* b, const global float* c, const float d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  if (g < e)
    f[g] += (-c[g]);
}
kernel void BQ(const global float* a, const global float* b, const global float* c, const float d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  if (g < e)
    f[g] += (d * c[g]);
}
kernel void BR(const global float* a, const global float* b, const global float* c, const float d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  if (g < e)
    f[g] += (c[g] / d);
}
kernel void BS(const global float* a, const global float* b, const global float* c, const float d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  if (g < e)
    f[g] += (-b[g] * c[g] / a[g]);
}
kernel void BT(const global float* a, const global float* b, const global float* c, const float d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  if (g < e)
    f[g] += (d * c[g] * b[g] / a[g]);
}
kernel void BU(const global float* a, const global float* b, const global float* c, const float d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  if (g < e)
    f[g] += (log(d) * c[g] * b[g]);
}
kernel void BV(const global float* a, const global float* b, const global float* c, const float d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  if (g < e)
    f[g] += (c[g] * ((a[g] > .0f) + d * (a[g] <= .0f)));
}

kernel void BW(const global float* a, const global float* b, const global float* c, const float d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  if (g < e)
    f[g] += (c[g] * ((a[g] > .0f) + (b[g] + d) * (a[g] <= .0f)));
}

kernel void BX(const global float* a, const global float* b, const global float* c, const int d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  if (g < e)
    f[g] += d * c[g] * b[g] / a[g];
}

kernel void BY(const global float* a, const global float* b, const unsigned c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  const unsigned h = get_group_id(1);
  const unsigned i = h * c;
  if (g < c) {
    f[g + i] = A(a[g + d * i], b[e * h]);
  }
}
kernel void BZ(const global float* a, const global float* b, const unsigned c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  const unsigned h = get_group_id(1);
  const unsigned i = h * c;
  if (g < c) {
    f[g + i] = B(a[g + d * i], b[e * h]);
  }
}
kernel void CA(const global float* a, const global float* b, const unsigned c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  const unsigned h = get_group_id(1);
  const unsigned i = h * c;
  if (g < c) {
    f[g + i] = B(b[e * h], a[g + d * i]);
  }
}
kernel void CB(const global float* a, const global float* b, const unsigned c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  const unsigned h = get_group_id(1);
  const unsigned i = h * c;
  if (g < c) {
    f[g + i] = C(a[g + d * i], b[e * h]);
  }
}
kernel void CC(const global float* a, const global float* b, const unsigned c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  const unsigned h = get_group_id(1);
  const unsigned i = h * c;
  if (g < c) {
    f[g + i] = D(a[g + d * i], b[e * h]);
  }
}
kernel void CD(const global float* a, const global float* b, const unsigned c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  const unsigned h = get_group_id(1);
  const unsigned i = h * c;
  if (g < c) {
    f[g + i] = D(b[e * h], a[g + d * i]);
  }
}
kernel void CE(const global float* a, const global float* b, const unsigned c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  const unsigned h = get_group_id(1);
  const unsigned i = h * c;
  if (g < c) {
    f[g + i] = __clc_pow(a[g + d * i], b[e * h]);
  }
}
kernel void CF(const global float* a, const global float* b, const unsigned c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  const unsigned h = get_group_id(1);
  const unsigned i = h * c;
  if (g < c) {
    f[g + i] = __clc_pow(b[e * h], a[g + d * i]);
  }
}

kernel void CG(const global float* a, const global float* b, const unsigned c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  const unsigned h = get_group_id(1);
  const unsigned i = h * c;
  if (g < c) {
    f[g + i] = A(a[g + d * i], b[g + e * i]);
  }
}
kernel void CH(const global float* a, const global float* b, const unsigned c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  const unsigned h = get_group_id(1);
  const unsigned i = h * c;
  if (g < c) {
    f[g + i] = B(a[g + d * i], b[g + e * i]);
  }
}
kernel void CI(const global float* a, const global float* b, const unsigned c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  const unsigned h = get_group_id(1);
  const unsigned i = h * c;
  if (g < c) {
    f[g + i] = C(a[g + d * i], b[g + e * i]);
  }
}
kernel void CJ(const global float* a, const global float* b, const unsigned c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  const unsigned h = get_group_id(1);
  const unsigned i = h * c;
  if (g < c) {
    f[g + i] = D(a[g + d * i], b[g + e * i]);
  }
}
kernel void CK(const global float* a, const global float* b, const unsigned c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_global_id(0);
  const unsigned h = get_group_id(1);
  const unsigned i = h * c;
  if (g < c) {
    f[g + i] = __clc_pow(a[g + d * i], b[g + e * i]);
  }
}
kernel void CL(const global float* a, const global float* b, const global float* c, const global float* d, const unsigned e, const unsigned f, const unsigned g, global float* h, global float* i) {
  const unsigned j = get_global_id(0);
  const unsigned k = get_group_id(1);
  const unsigned l = k * e;
  if (j < e) {
    const float m = d[j + l];
    AE(h + j + f * l, m);
    AE(i + j + g * l, m);
  }
}

kernel void CM(const global float* a, const global float* b, const global float* c, const global float* d, const unsigned e, const unsigned f, const unsigned g, global float* h, global float* i) {
  const unsigned j = get_global_id(0);
  const unsigned k = get_group_id(1);
  const unsigned l = k * e;
  if (j < e) {
    const float m = d[j + l];
    AE(h + j + f * l, m);
    AE(i + j + g * l, -m);
  }
}

kernel void CN(const global float* a, const global float* b, const global float* c, const global float* d, const unsigned e, const unsigned f, const unsigned g, global float* h, global float* i) {
  const unsigned j = get_global_id(0);
  const unsigned k = get_group_id(1);
  const unsigned l = k * e;
  if (j < e) {
    const float m = d[j + l];
    const unsigned n = j + f * l;
    const unsigned o = j + g * l;
    AE(h + n, m * b[o]);
    AE(i + o, m * a[n]);
  }
}

kernel void CO(const global float* a, const global float* b, const global float* c, const global float* d, const unsigned e, const unsigned f, const unsigned g, global float* h, global float* i) {
  const unsigned j = get_global_id(0);
  const unsigned k = get_group_id(1);
  const unsigned l = k * e;
  if (j < e) {
    const unsigned m = j + g * l;
    const unsigned n = j + l;
    const float o = d[n] / b[m];
    AE(h + j + f * l, o);
    AE(i + m, -o * c[n]);
  }
}

kernel void CP(const global float* a, const global float* b, const global float* c, const global float* d, const unsigned e, const unsigned f, const unsigned g, global float* h, global float* i) {
  const unsigned j = get_global_id(0);
  const unsigned k = get_group_id(1);
  const unsigned l = k * e;
  if (j < e) {
    const unsigned m = j + f * l;
    const unsigned n = j + g * l;
    const unsigned o = j + l;
    const float p = d[o] * c[o];
    AE(h + m, p * b[n] / a[m]);
    AE(i + n, p * log(a[m]));
  }
}

kernel void CQ(const global float* a, unsigned b, unsigned c, global float* d) {
  const unsigned e = get_global_id(0);
  const unsigned f = get_global_id(1);
  const unsigned g = get_group_id(2);
  const unsigned h = g * b * c;
  if (e < b && f < c)
    d[h + f + e * c] = a[h + e + f * b];
}

kernel void CR(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_global_id(0);
  const unsigned f = get_global_id(1);
  const unsigned g = get_group_id(2);
  const unsigned h = g * b * c;
  if (e < b && f < c)
    d[h + e + f * b] += a[h + f + e * c];
}
kernel void CS(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[1024];
  a += e % b + (e / b) * b * c;
  float h = -__builtin_inff();
  for (unsigned i = f; i < c; i += 1024) {
    h = max(a[i * b], h);
  }
  g[f] = h;
  barrier(1);
  if (1024 >= 512 << 1) {
    if (f < 512)
      g[f] = max(g[f + 512], g[f]);
    barrier(1);
  }
  if (1024 >= 256 << 1) {
    if (f < 256)
      g[f] = max(g[f + 256], g[f]);
    barrier(1);
  }
  if (1024 >= 128 << 1) {
    if (f < 128)
      g[f] = max(g[f + 128], g[f]);
    barrier(1);
  }
  if (1024 >= 64 << 1) {
    if (f < 64)
      g[f] = max(g[f + 64], g[f]);
    barrier(1);
  }
  if (1024 >= 32 << 1) {
    if (f < 32)
      g[f] = max(g[f + 32], g[f]);
    barrier(1);
  }
  if (1024 >= 16 << 1) {
    if (f < 16)
      g[f] = max(g[f + 16], g[f]);
    barrier(1);
  }
  if (1024 >= 8 << 1) {
    if (f < 8)
      g[f] = max(g[f + 8], g[f]);
    barrier(1);
  }
  if (1024 >= 4 << 1) {
    if (f < 4)
      g[f] = max(g[f + 4], g[f]);
    barrier(1);
  }
  if (1024 >= 2 << 1) {
    if (f < 2)
      g[f] = max(g[f + 2], g[f]);
    barrier(1);
  }
  if (1024 >= 1 << 1) {
    if (f < 1)
      g[f] = max(g[f + 1], g[f]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void CT(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[512];
  a += e % b + (e / b) * b * c;
  float h = -__builtin_inff();
  for (unsigned i = f; i < c; i += 512) {
    h = max(a[i * b], h);
  }
  g[f] = h;
  barrier(1);
  if (512 >= 512 << 1) {
    if (f < 512)
      g[f] = max(g[f + 512], g[f]);
    barrier(1);
  }
  if (512 >= 256 << 1) {
    if (f < 256)
      g[f] = max(g[f + 256], g[f]);
    barrier(1);
  }
  if (512 >= 128 << 1) {
    if (f < 128)
      g[f] = max(g[f + 128], g[f]);
    barrier(1);
  }
  if (512 >= 64 << 1) {
    if (f < 64)
      g[f] = max(g[f + 64], g[f]);
    barrier(1);
  }
  if (512 >= 32 << 1) {
    if (f < 32)
      g[f] = max(g[f + 32], g[f]);
    barrier(1);
  }
  if (512 >= 16 << 1) {
    if (f < 16)
      g[f] = max(g[f + 16], g[f]);
    barrier(1);
  }
  if (512 >= 8 << 1) {
    if (f < 8)
      g[f] = max(g[f + 8], g[f]);
    barrier(1);
  }
  if (512 >= 4 << 1) {
    if (f < 4)
      g[f] = max(g[f + 4], g[f]);
    barrier(1);
  }
  if (512 >= 2 << 1) {
    if (f < 2)
      g[f] = max(g[f + 2], g[f]);
    barrier(1);
  }
  if (512 >= 1 << 1) {
    if (f < 1)
      g[f] = max(g[f + 1], g[f]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void CU(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[256];
  a += e % b + (e / b) * b * c;
  float h = -__builtin_inff();
  for (unsigned i = f; i < c; i += 256) {
    h = max(a[i * b], h);
  }
  g[f] = h;
  barrier(1);
  if (256 >= 512 << 1) {
    if (f < 512)
      g[f] = max(g[f + 512], g[f]);
    barrier(1);
  }
  if (256 >= 256 << 1) {
    if (f < 256)
      g[f] = max(g[f + 256], g[f]);
    barrier(1);
  }
  if (256 >= 128 << 1) {
    if (f < 128)
      g[f] = max(g[f + 128], g[f]);
    barrier(1);
  }
  if (256 >= 64 << 1) {
    if (f < 64)
      g[f] = max(g[f + 64], g[f]);
    barrier(1);
  }
  if (256 >= 32 << 1) {
    if (f < 32)
      g[f] = max(g[f + 32], g[f]);
    barrier(1);
  }
  if (256 >= 16 << 1) {
    if (f < 16)
      g[f] = max(g[f + 16], g[f]);
    barrier(1);
  }
  if (256 >= 8 << 1) {
    if (f < 8)
      g[f] = max(g[f + 8], g[f]);
    barrier(1);
  }
  if (256 >= 4 << 1) {
    if (f < 4)
      g[f] = max(g[f + 4], g[f]);
    barrier(1);
  }
  if (256 >= 2 << 1) {
    if (f < 2)
      g[f] = max(g[f + 2], g[f]);
    barrier(1);
  }
  if (256 >= 1 << 1) {
    if (f < 1)
      g[f] = max(g[f + 1], g[f]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void CV(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[128];
  a += e % b + (e / b) * b * c;
  float h = -__builtin_inff();
  for (unsigned i = f; i < c; i += 128) {
    h = max(a[i * b], h);
  }
  g[f] = h;
  barrier(1);
  if (128 >= 512 << 1) {
    if (f < 512)
      g[f] = max(g[f + 512], g[f]);
    barrier(1);
  }
  if (128 >= 256 << 1) {
    if (f < 256)
      g[f] = max(g[f + 256], g[f]);
    barrier(1);
  }
  if (128 >= 128 << 1) {
    if (f < 128)
      g[f] = max(g[f + 128], g[f]);
    barrier(1);
  }
  if (128 >= 64 << 1) {
    if (f < 64)
      g[f] = max(g[f + 64], g[f]);
    barrier(1);
  }
  if (128 >= 32 << 1) {
    if (f < 32)
      g[f] = max(g[f + 32], g[f]);
    barrier(1);
  }
  if (128 >= 16 << 1) {
    if (f < 16)
      g[f] = max(g[f + 16], g[f]);
    barrier(1);
  }
  if (128 >= 8 << 1) {
    if (f < 8)
      g[f] = max(g[f + 8], g[f]);
    barrier(1);
  }
  if (128 >= 4 << 1) {
    if (f < 4)
      g[f] = max(g[f + 4], g[f]);
    barrier(1);
  }
  if (128 >= 2 << 1) {
    if (f < 2)
      g[f] = max(g[f + 2], g[f]);
    barrier(1);
  }
  if (128 >= 1 << 1) {
    if (f < 1)
      g[f] = max(g[f + 1], g[f]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void CW(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[64];
  a += e % b + (e / b) * b * c;
  float h = -__builtin_inff();
  for (unsigned i = f; i < c; i += 64) {
    h = max(a[i * b], h);
  }
  g[f] = h;
  barrier(1);
  if (64 >= 512 << 1) {
    if (f < 512)
      g[f] = max(g[f + 512], g[f]);
    barrier(1);
  }
  if (64 >= 256 << 1) {
    if (f < 256)
      g[f] = max(g[f + 256], g[f]);
    barrier(1);
  }
  if (64 >= 128 << 1) {
    if (f < 128)
      g[f] = max(g[f + 128], g[f]);
    barrier(1);
  }
  if (64 >= 64 << 1) {
    if (f < 64)
      g[f] = max(g[f + 64], g[f]);
    barrier(1);
  }
  if (64 >= 32 << 1) {
    if (f < 32)
      g[f] = max(g[f + 32], g[f]);
    barrier(1);
  }
  if (64 >= 16 << 1) {
    if (f < 16)
      g[f] = max(g[f + 16], g[f]);
    barrier(1);
  }
  if (64 >= 8 << 1) {
    if (f < 8)
      g[f] = max(g[f + 8], g[f]);
    barrier(1);
  }
  if (64 >= 4 << 1) {
    if (f < 4)
      g[f] = max(g[f + 4], g[f]);
    barrier(1);
  }
  if (64 >= 2 << 1) {
    if (f < 2)
      g[f] = max(g[f + 2], g[f]);
    barrier(1);
  }
  if (64 >= 1 << 1) {
    if (f < 1)
      g[f] = max(g[f + 1], g[f]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void CX(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[32];
  a += e % b + (e / b) * b * c;
  float h = -__builtin_inff();
  for (unsigned i = f; i < c; i += 32) {
    h = max(a[i * b], h);
  }
  g[f] = h;
  barrier(1);
  if (32 >= 512 << 1) {
    if (f < 512)
      g[f] = max(g[f + 512], g[f]);
    barrier(1);
  }
  if (32 >= 256 << 1) {
    if (f < 256)
      g[f] = max(g[f + 256], g[f]);
    barrier(1);
  }
  if (32 >= 128 << 1) {
    if (f < 128)
      g[f] = max(g[f + 128], g[f]);
    barrier(1);
  }
  if (32 >= 64 << 1) {
    if (f < 64)
      g[f] = max(g[f + 64], g[f]);
    barrier(1);
  }
  if (32 >= 32 << 1) {
    if (f < 32)
      g[f] = max(g[f + 32], g[f]);
    barrier(1);
  }
  if (32 >= 16 << 1) {
    if (f < 16)
      g[f] = max(g[f + 16], g[f]);
    barrier(1);
  }
  if (32 >= 8 << 1) {
    if (f < 8)
      g[f] = max(g[f + 8], g[f]);
    barrier(1);
  }
  if (32 >= 4 << 1) {
    if (f < 4)
      g[f] = max(g[f + 4], g[f]);
    barrier(1);
  }
  if (32 >= 2 << 1) {
    if (f < 2)
      g[f] = max(g[f + 2], g[f]);
    barrier(1);
  }
  if (32 >= 1 << 1) {
    if (f < 1)
      g[f] = max(g[f + 1], g[f]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void CY(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[16];
  a += e % b + (e / b) * b * c;
  float h = -__builtin_inff();
  for (unsigned i = f; i < c; i += 16) {
    h = max(a[i * b], h);
  }
  g[f] = h;
  barrier(1);
  if (16 >= 512 << 1) {
    if (f < 512)
      g[f] = max(g[f + 512], g[f]);
    barrier(1);
  }
  if (16 >= 256 << 1) {
    if (f < 256)
      g[f] = max(g[f + 256], g[f]);
    barrier(1);
  }
  if (16 >= 128 << 1) {
    if (f < 128)
      g[f] = max(g[f + 128], g[f]);
    barrier(1);
  }
  if (16 >= 64 << 1) {
    if (f < 64)
      g[f] = max(g[f + 64], g[f]);
    barrier(1);
  }
  if (16 >= 32 << 1) {
    if (f < 32)
      g[f] = max(g[f + 32], g[f]);
    barrier(1);
  }
  if (16 >= 16 << 1) {
    if (f < 16)
      g[f] = max(g[f + 16], g[f]);
    barrier(1);
  }
  if (16 >= 8 << 1) {
    if (f < 8)
      g[f] = max(g[f + 8], g[f]);
    barrier(1);
  }
  if (16 >= 4 << 1) {
    if (f < 4)
      g[f] = max(g[f + 4], g[f]);
    barrier(1);
  }
  if (16 >= 2 << 1) {
    if (f < 2)
      g[f] = max(g[f + 2], g[f]);
    barrier(1);
  }
  if (16 >= 1 << 1) {
    if (f < 1)
      g[f] = max(g[f + 1], g[f]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void CZ(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[8];
  a += e % b + (e / b) * b * c;
  float h = -__builtin_inff();
  for (unsigned i = f; i < c; i += 8) {
    h = max(a[i * b], h);
  }
  g[f] = h;
  barrier(1);
  if (8 >= 512 << 1) {
    if (f < 512)
      g[f] = max(g[f + 512], g[f]);
    barrier(1);
  }
  if (8 >= 256 << 1) {
    if (f < 256)
      g[f] = max(g[f + 256], g[f]);
    barrier(1);
  }
  if (8 >= 128 << 1) {
    if (f < 128)
      g[f] = max(g[f + 128], g[f]);
    barrier(1);
  }
  if (8 >= 64 << 1) {
    if (f < 64)
      g[f] = max(g[f + 64], g[f]);
    barrier(1);
  }
  if (8 >= 32 << 1) {
    if (f < 32)
      g[f] = max(g[f + 32], g[f]);
    barrier(1);
  }
  if (8 >= 16 << 1) {
    if (f < 16)
      g[f] = max(g[f + 16], g[f]);
    barrier(1);
  }
  if (8 >= 8 << 1) {
    if (f < 8)
      g[f] = max(g[f + 8], g[f]);
    barrier(1);
  }
  if (8 >= 4 << 1) {
    if (f < 4)
      g[f] = max(g[f + 4], g[f]);
    barrier(1);
  }
  if (8 >= 2 << 1) {
    if (f < 2)
      g[f] = max(g[f + 2], g[f]);
    barrier(1);
  }
  if (8 >= 1 << 1) {
    if (f < 1)
      g[f] = max(g[f + 1], g[f]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void DA(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[4];
  a += e % b + (e / b) * b * c;
  float h = -__builtin_inff();
  for (unsigned i = f; i < c; i += 4) {
    h = max(a[i * b], h);
  }
  g[f] = h;
  barrier(1);
  if (4 >= 512 << 1) {
    if (f < 512)
      g[f] = max(g[f + 512], g[f]);
    barrier(1);
  }
  if (4 >= 256 << 1) {
    if (f < 256)
      g[f] = max(g[f + 256], g[f]);
    barrier(1);
  }
  if (4 >= 128 << 1) {
    if (f < 128)
      g[f] = max(g[f + 128], g[f]);
    barrier(1);
  }
  if (4 >= 64 << 1) {
    if (f < 64)
      g[f] = max(g[f + 64], g[f]);
    barrier(1);
  }
  if (4 >= 32 << 1) {
    if (f < 32)
      g[f] = max(g[f + 32], g[f]);
    barrier(1);
  }
  if (4 >= 16 << 1) {
    if (f < 16)
      g[f] = max(g[f + 16], g[f]);
    barrier(1);
  }
  if (4 >= 8 << 1) {
    if (f < 8)
      g[f] = max(g[f + 8], g[f]);
    barrier(1);
  }
  if (4 >= 4 << 1) {
    if (f < 4)
      g[f] = max(g[f + 4], g[f]);
    barrier(1);
  }
  if (4 >= 2 << 1) {
    if (f < 2)
      g[f] = max(g[f + 2], g[f]);
    barrier(1);
  }
  if (4 >= 1 << 1) {
    if (f < 1)
      g[f] = max(g[f + 1], g[f]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void DB(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[2];
  a += e % b + (e / b) * b * c;
  float h = -__builtin_inff();
  for (unsigned i = f; i < c; i += 2) {
    h = max(a[i * b], h);
  }
  g[f] = h;
  barrier(1);
  if (2 >= 512 << 1) {
    if (f < 512)
      g[f] = max(g[f + 512], g[f]);
    barrier(1);
  }
  if (2 >= 256 << 1) {
    if (f < 256)
      g[f] = max(g[f + 256], g[f]);
    barrier(1);
  }
  if (2 >= 128 << 1) {
    if (f < 128)
      g[f] = max(g[f + 128], g[f]);
    barrier(1);
  }
  if (2 >= 64 << 1) {
    if (f < 64)
      g[f] = max(g[f + 64], g[f]);
    barrier(1);
  }
  if (2 >= 32 << 1) {
    if (f < 32)
      g[f] = max(g[f + 32], g[f]);
    barrier(1);
  }
  if (2 >= 16 << 1) {
    if (f < 16)
      g[f] = max(g[f + 16], g[f]);
    barrier(1);
  }
  if (2 >= 8 << 1) {
    if (f < 8)
      g[f] = max(g[f + 8], g[f]);
    barrier(1);
  }
  if (2 >= 4 << 1) {
    if (f < 4)
      g[f] = max(g[f + 4], g[f]);
    barrier(1);
  }
  if (2 >= 2 << 1) {
    if (f < 2)
      g[f] = max(g[f + 2], g[f]);
    barrier(1);
  }
  if (2 >= 1 << 1) {
    if (f < 1)
      g[f] = max(g[f + 1], g[f]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void DC(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[1];
  a += e % b + (e / b) * b * c;
  float h = -__builtin_inff();
  for (unsigned i = f; i < c; i += 1) {
    h = max(a[i * b], h);
  }
  g[f] = h;
  barrier(1);
  if (1 >= 512 << 1) {
    if (f < 512)
      g[f] = max(g[f + 512], g[f]);
    barrier(1);
  }
  if (1 >= 256 << 1) {
    if (f < 256)
      g[f] = max(g[f + 256], g[f]);
    barrier(1);
  }
  if (1 >= 128 << 1) {
    if (f < 128)
      g[f] = max(g[f + 128], g[f]);
    barrier(1);
  }
  if (1 >= 64 << 1) {
    if (f < 64)
      g[f] = max(g[f + 64], g[f]);
    barrier(1);
  }
  if (1 >= 32 << 1) {
    if (f < 32)
      g[f] = max(g[f + 32], g[f]);
    barrier(1);
  }
  if (1 >= 16 << 1) {
    if (f < 16)
      g[f] = max(g[f + 16], g[f]);
    barrier(1);
  }
  if (1 >= 8 << 1) {
    if (f < 8)
      g[f] = max(g[f + 8], g[f]);
    barrier(1);
  }
  if (1 >= 4 << 1) {
    if (f < 4)
      g[f] = max(g[f + 4], g[f]);
    barrier(1);
  }
  if (1 >= 2 << 1) {
    if (f < 2)
      g[f] = max(g[f + 2], g[f]);
    barrier(1);
  }
  if (1 >= 1 << 1) {
    if (f < 1)
      g[f] = max(g[f + 1], g[f]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void DD(const global float* a, const global float* b, const global float* c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_group_id(0);
  const unsigned h = get_local_id(0);
  const float i = b[g];
  local unsigned j[1024];
  a += g % d + (g / d) * d * e;
  f += g % d + (g / d) * d * e;
  unsigned k = e;
  for (unsigned l = h; l < e; l += 1024) {
    if (a[l * d] == i) {
      k = min(l, k);
    }
  }
  j[h] = k;
  barrier(1);
  if (1024 >= 512 << 1) {
    if (h < 512)
      j[h] = min(j[h + 512], j[h]);
    barrier(1);
  }
  if (1024 >= 256 << 1) {
    if (h < 256)
      j[h] = min(j[h + 256], j[h]);
    barrier(1);
  }
  if (1024 >= 128 << 1) {
    if (h < 128)
      j[h] = min(j[h + 128], j[h]);
    barrier(1);
  }
  if (1024 >= 64 << 1) {
    if (h < 64)
      j[h] = min(j[h + 64], j[h]);
    barrier(1);
  }
  if (1024 >= 32 << 1) {
    if (h < 32)
      j[h] = min(j[h + 32], j[h]);
    barrier(1);
  }
  if (1024 >= 16 << 1) {
    if (h < 16)
      j[h] = min(j[h + 16], j[h]);
    barrier(1);
  }
  if (1024 >= 8 << 1) {
    if (h < 8)
      j[h] = min(j[h + 8], j[h]);
    barrier(1);
  }
  if (1024 >= 4 << 1) {
    if (h < 4)
      j[h] = min(j[h + 4], j[h]);
    barrier(1);
  }
  if (1024 >= 2 << 1) {
    if (h < 2)
      j[h] = min(j[h + 2], j[h]);
    barrier(1);
  }
  if (1024 >= 1 << 1) {
    if (h < 1)
      j[h] = min(j[h + 1], j[h]);
    barrier(1);
  }
  if (h == 0)
    f[j[0] * d] += c[g];
}
kernel void DE(const global float* a, const global float* b, const global float* c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_group_id(0);
  const unsigned h = get_local_id(0);
  const float i = b[g];
  local unsigned j[512];
  a += g % d + (g / d) * d * e;
  f += g % d + (g / d) * d * e;
  unsigned k = e;
  for (unsigned l = h; l < e; l += 512) {
    if (a[l * d] == i) {
      k = min(l, k);
    }
  }
  j[h] = k;
  barrier(1);
  if (512 >= 512 << 1) {
    if (h < 512)
      j[h] = min(j[h + 512], j[h]);
    barrier(1);
  }
  if (512 >= 256 << 1) {
    if (h < 256)
      j[h] = min(j[h + 256], j[h]);
    barrier(1);
  }
  if (512 >= 128 << 1) {
    if (h < 128)
      j[h] = min(j[h + 128], j[h]);
    barrier(1);
  }
  if (512 >= 64 << 1) {
    if (h < 64)
      j[h] = min(j[h + 64], j[h]);
    barrier(1);
  }
  if (512 >= 32 << 1) {
    if (h < 32)
      j[h] = min(j[h + 32], j[h]);
    barrier(1);
  }
  if (512 >= 16 << 1) {
    if (h < 16)
      j[h] = min(j[h + 16], j[h]);
    barrier(1);
  }
  if (512 >= 8 << 1) {
    if (h < 8)
      j[h] = min(j[h + 8], j[h]);
    barrier(1);
  }
  if (512 >= 4 << 1) {
    if (h < 4)
      j[h] = min(j[h + 4], j[h]);
    barrier(1);
  }
  if (512 >= 2 << 1) {
    if (h < 2)
      j[h] = min(j[h + 2], j[h]);
    barrier(1);
  }
  if (512 >= 1 << 1) {
    if (h < 1)
      j[h] = min(j[h + 1], j[h]);
    barrier(1);
  }
  if (h == 0)
    f[j[0] * d] += c[g];
}
kernel void DF(const global float* a, const global float* b, const global float* c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_group_id(0);
  const unsigned h = get_local_id(0);
  const float i = b[g];
  local unsigned j[256];
  a += g % d + (g / d) * d * e;
  f += g % d + (g / d) * d * e;
  unsigned k = e;
  for (unsigned l = h; l < e; l += 256) {
    if (a[l * d] == i) {
      k = min(l, k);
    }
  }
  j[h] = k;
  barrier(1);
  if (256 >= 512 << 1) {
    if (h < 512)
      j[h] = min(j[h + 512], j[h]);
    barrier(1);
  }
  if (256 >= 256 << 1) {
    if (h < 256)
      j[h] = min(j[h + 256], j[h]);
    barrier(1);
  }
  if (256 >= 128 << 1) {
    if (h < 128)
      j[h] = min(j[h + 128], j[h]);
    barrier(1);
  }
  if (256 >= 64 << 1) {
    if (h < 64)
      j[h] = min(j[h + 64], j[h]);
    barrier(1);
  }
  if (256 >= 32 << 1) {
    if (h < 32)
      j[h] = min(j[h + 32], j[h]);
    barrier(1);
  }
  if (256 >= 16 << 1) {
    if (h < 16)
      j[h] = min(j[h + 16], j[h]);
    barrier(1);
  }
  if (256 >= 8 << 1) {
    if (h < 8)
      j[h] = min(j[h + 8], j[h]);
    barrier(1);
  }
  if (256 >= 4 << 1) {
    if (h < 4)
      j[h] = min(j[h + 4], j[h]);
    barrier(1);
  }
  if (256 >= 2 << 1) {
    if (h < 2)
      j[h] = min(j[h + 2], j[h]);
    barrier(1);
  }
  if (256 >= 1 << 1) {
    if (h < 1)
      j[h] = min(j[h + 1], j[h]);
    barrier(1);
  }
  if (h == 0)
    f[j[0] * d] += c[g];
}
kernel void DG(const global float* a, const global float* b, const global float* c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_group_id(0);
  const unsigned h = get_local_id(0);
  const float i = b[g];
  local unsigned j[128];
  a += g % d + (g / d) * d * e;
  f += g % d + (g / d) * d * e;
  unsigned k = e;
  for (unsigned l = h; l < e; l += 128) {
    if (a[l * d] == i) {
      k = min(l, k);
    }
  }
  j[h] = k;
  barrier(1);
  if (128 >= 512 << 1) {
    if (h < 512)
      j[h] = min(j[h + 512], j[h]);
    barrier(1);
  }
  if (128 >= 256 << 1) {
    if (h < 256)
      j[h] = min(j[h + 256], j[h]);
    barrier(1);
  }
  if (128 >= 128 << 1) {
    if (h < 128)
      j[h] = min(j[h + 128], j[h]);
    barrier(1);
  }
  if (128 >= 64 << 1) {
    if (h < 64)
      j[h] = min(j[h + 64], j[h]);
    barrier(1);
  }
  if (128 >= 32 << 1) {
    if (h < 32)
      j[h] = min(j[h + 32], j[h]);
    barrier(1);
  }
  if (128 >= 16 << 1) {
    if (h < 16)
      j[h] = min(j[h + 16], j[h]);
    barrier(1);
  }
  if (128 >= 8 << 1) {
    if (h < 8)
      j[h] = min(j[h + 8], j[h]);
    barrier(1);
  }
  if (128 >= 4 << 1) {
    if (h < 4)
      j[h] = min(j[h + 4], j[h]);
    barrier(1);
  }
  if (128 >= 2 << 1) {
    if (h < 2)
      j[h] = min(j[h + 2], j[h]);
    barrier(1);
  }
  if (128 >= 1 << 1) {
    if (h < 1)
      j[h] = min(j[h + 1], j[h]);
    barrier(1);
  }
  if (h == 0)
    f[j[0] * d] += c[g];
}
kernel void DH(const global float* a, const global float* b, const global float* c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_group_id(0);
  const unsigned h = get_local_id(0);
  const float i = b[g];
  local unsigned j[64];
  a += g % d + (g / d) * d * e;
  f += g % d + (g / d) * d * e;
  unsigned k = e;
  for (unsigned l = h; l < e; l += 64) {
    if (a[l * d] == i) {
      k = min(l, k);
    }
  }
  j[h] = k;
  barrier(1);
  if (64 >= 512 << 1) {
    if (h < 512)
      j[h] = min(j[h + 512], j[h]);
    barrier(1);
  }
  if (64 >= 256 << 1) {
    if (h < 256)
      j[h] = min(j[h + 256], j[h]);
    barrier(1);
  }
  if (64 >= 128 << 1) {
    if (h < 128)
      j[h] = min(j[h + 128], j[h]);
    barrier(1);
  }
  if (64 >= 64 << 1) {
    if (h < 64)
      j[h] = min(j[h + 64], j[h]);
    barrier(1);
  }
  if (64 >= 32 << 1) {
    if (h < 32)
      j[h] = min(j[h + 32], j[h]);
    barrier(1);
  }
  if (64 >= 16 << 1) {
    if (h < 16)
      j[h] = min(j[h + 16], j[h]);
    barrier(1);
  }
  if (64 >= 8 << 1) {
    if (h < 8)
      j[h] = min(j[h + 8], j[h]);
    barrier(1);
  }
  if (64 >= 4 << 1) {
    if (h < 4)
      j[h] = min(j[h + 4], j[h]);
    barrier(1);
  }
  if (64 >= 2 << 1) {
    if (h < 2)
      j[h] = min(j[h + 2], j[h]);
    barrier(1);
  }
  if (64 >= 1 << 1) {
    if (h < 1)
      j[h] = min(j[h + 1], j[h]);
    barrier(1);
  }
  if (h == 0)
    f[j[0] * d] += c[g];
}
kernel void DI(const global float* a, const global float* b, const global float* c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_group_id(0);
  const unsigned h = get_local_id(0);
  const float i = b[g];
  local unsigned j[32];
  a += g % d + (g / d) * d * e;
  f += g % d + (g / d) * d * e;
  unsigned k = e;
  for (unsigned l = h; l < e; l += 32) {
    if (a[l * d] == i) {
      k = min(l, k);
    }
  }
  j[h] = k;
  barrier(1);
  if (32 >= 512 << 1) {
    if (h < 512)
      j[h] = min(j[h + 512], j[h]);
    barrier(1);
  }
  if (32 >= 256 << 1) {
    if (h < 256)
      j[h] = min(j[h + 256], j[h]);
    barrier(1);
  }
  if (32 >= 128 << 1) {
    if (h < 128)
      j[h] = min(j[h + 128], j[h]);
    barrier(1);
  }
  if (32 >= 64 << 1) {
    if (h < 64)
      j[h] = min(j[h + 64], j[h]);
    barrier(1);
  }
  if (32 >= 32 << 1) {
    if (h < 32)
      j[h] = min(j[h + 32], j[h]);
    barrier(1);
  }
  if (32 >= 16 << 1) {
    if (h < 16)
      j[h] = min(j[h + 16], j[h]);
    barrier(1);
  }
  if (32 >= 8 << 1) {
    if (h < 8)
      j[h] = min(j[h + 8], j[h]);
    barrier(1);
  }
  if (32 >= 4 << 1) {
    if (h < 4)
      j[h] = min(j[h + 4], j[h]);
    barrier(1);
  }
  if (32 >= 2 << 1) {
    if (h < 2)
      j[h] = min(j[h + 2], j[h]);
    barrier(1);
  }
  if (32 >= 1 << 1) {
    if (h < 1)
      j[h] = min(j[h + 1], j[h]);
    barrier(1);
  }
  if (h == 0)
    f[j[0] * d] += c[g];
}
kernel void DJ(const global float* a, const global float* b, const global float* c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_group_id(0);
  const unsigned h = get_local_id(0);
  const float i = b[g];
  local unsigned j[16];
  a += g % d + (g / d) * d * e;
  f += g % d + (g / d) * d * e;
  unsigned k = e;
  for (unsigned l = h; l < e; l += 16) {
    if (a[l * d] == i) {
      k = min(l, k);
    }
  }
  j[h] = k;
  barrier(1);
  if (16 >= 512 << 1) {
    if (h < 512)
      j[h] = min(j[h + 512], j[h]);
    barrier(1);
  }
  if (16 >= 256 << 1) {
    if (h < 256)
      j[h] = min(j[h + 256], j[h]);
    barrier(1);
  }
  if (16 >= 128 << 1) {
    if (h < 128)
      j[h] = min(j[h + 128], j[h]);
    barrier(1);
  }
  if (16 >= 64 << 1) {
    if (h < 64)
      j[h] = min(j[h + 64], j[h]);
    barrier(1);
  }
  if (16 >= 32 << 1) {
    if (h < 32)
      j[h] = min(j[h + 32], j[h]);
    barrier(1);
  }
  if (16 >= 16 << 1) {
    if (h < 16)
      j[h] = min(j[h + 16], j[h]);
    barrier(1);
  }
  if (16 >= 8 << 1) {
    if (h < 8)
      j[h] = min(j[h + 8], j[h]);
    barrier(1);
  }
  if (16 >= 4 << 1) {
    if (h < 4)
      j[h] = min(j[h + 4], j[h]);
    barrier(1);
  }
  if (16 >= 2 << 1) {
    if (h < 2)
      j[h] = min(j[h + 2], j[h]);
    barrier(1);
  }
  if (16 >= 1 << 1) {
    if (h < 1)
      j[h] = min(j[h + 1], j[h]);
    barrier(1);
  }
  if (h == 0)
    f[j[0] * d] += c[g];
}
kernel void DK(const global float* a, const global float* b, const global float* c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_group_id(0);
  const unsigned h = get_local_id(0);
  const float i = b[g];
  local unsigned j[8];
  a += g % d + (g / d) * d * e;
  f += g % d + (g / d) * d * e;
  unsigned k = e;
  for (unsigned l = h; l < e; l += 8) {
    if (a[l * d] == i) {
      k = min(l, k);
    }
  }
  j[h] = k;
  barrier(1);
  if (8 >= 512 << 1) {
    if (h < 512)
      j[h] = min(j[h + 512], j[h]);
    barrier(1);
  }
  if (8 >= 256 << 1) {
    if (h < 256)
      j[h] = min(j[h + 256], j[h]);
    barrier(1);
  }
  if (8 >= 128 << 1) {
    if (h < 128)
      j[h] = min(j[h + 128], j[h]);
    barrier(1);
  }
  if (8 >= 64 << 1) {
    if (h < 64)
      j[h] = min(j[h + 64], j[h]);
    barrier(1);
  }
  if (8 >= 32 << 1) {
    if (h < 32)
      j[h] = min(j[h + 32], j[h]);
    barrier(1);
  }
  if (8 >= 16 << 1) {
    if (h < 16)
      j[h] = min(j[h + 16], j[h]);
    barrier(1);
  }
  if (8 >= 8 << 1) {
    if (h < 8)
      j[h] = min(j[h + 8], j[h]);
    barrier(1);
  }
  if (8 >= 4 << 1) {
    if (h < 4)
      j[h] = min(j[h + 4], j[h]);
    barrier(1);
  }
  if (8 >= 2 << 1) {
    if (h < 2)
      j[h] = min(j[h + 2], j[h]);
    barrier(1);
  }
  if (8 >= 1 << 1) {
    if (h < 1)
      j[h] = min(j[h + 1], j[h]);
    barrier(1);
  }
  if (h == 0)
    f[j[0] * d] += c[g];
}
kernel void DL(const global float* a, const global float* b, const global float* c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_group_id(0);
  const unsigned h = get_local_id(0);
  const float i = b[g];
  local unsigned j[4];
  a += g % d + (g / d) * d * e;
  f += g % d + (g / d) * d * e;
  unsigned k = e;
  for (unsigned l = h; l < e; l += 4) {
    if (a[l * d] == i) {
      k = min(l, k);
    }
  }
  j[h] = k;
  barrier(1);
  if (4 >= 512 << 1) {
    if (h < 512)
      j[h] = min(j[h + 512], j[h]);
    barrier(1);
  }
  if (4 >= 256 << 1) {
    if (h < 256)
      j[h] = min(j[h + 256], j[h]);
    barrier(1);
  }
  if (4 >= 128 << 1) {
    if (h < 128)
      j[h] = min(j[h + 128], j[h]);
    barrier(1);
  }
  if (4 >= 64 << 1) {
    if (h < 64)
      j[h] = min(j[h + 64], j[h]);
    barrier(1);
  }
  if (4 >= 32 << 1) {
    if (h < 32)
      j[h] = min(j[h + 32], j[h]);
    barrier(1);
  }
  if (4 >= 16 << 1) {
    if (h < 16)
      j[h] = min(j[h + 16], j[h]);
    barrier(1);
  }
  if (4 >= 8 << 1) {
    if (h < 8)
      j[h] = min(j[h + 8], j[h]);
    barrier(1);
  }
  if (4 >= 4 << 1) {
    if (h < 4)
      j[h] = min(j[h + 4], j[h]);
    barrier(1);
  }
  if (4 >= 2 << 1) {
    if (h < 2)
      j[h] = min(j[h + 2], j[h]);
    barrier(1);
  }
  if (4 >= 1 << 1) {
    if (h < 1)
      j[h] = min(j[h + 1], j[h]);
    barrier(1);
  }
  if (h == 0)
    f[j[0] * d] += c[g];
}
kernel void DM(const global float* a, const global float* b, const global float* c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_group_id(0);
  const unsigned h = get_local_id(0);
  const float i = b[g];
  local unsigned j[2];
  a += g % d + (g / d) * d * e;
  f += g % d + (g / d) * d * e;
  unsigned k = e;
  for (unsigned l = h; l < e; l += 2) {
    if (a[l * d] == i) {
      k = min(l, k);
    }
  }
  j[h] = k;
  barrier(1);
  if (2 >= 512 << 1) {
    if (h < 512)
      j[h] = min(j[h + 512], j[h]);
    barrier(1);
  }
  if (2 >= 256 << 1) {
    if (h < 256)
      j[h] = min(j[h + 256], j[h]);
    barrier(1);
  }
  if (2 >= 128 << 1) {
    if (h < 128)
      j[h] = min(j[h + 128], j[h]);
    barrier(1);
  }
  if (2 >= 64 << 1) {
    if (h < 64)
      j[h] = min(j[h + 64], j[h]);
    barrier(1);
  }
  if (2 >= 32 << 1) {
    if (h < 32)
      j[h] = min(j[h + 32], j[h]);
    barrier(1);
  }
  if (2 >= 16 << 1) {
    if (h < 16)
      j[h] = min(j[h + 16], j[h]);
    barrier(1);
  }
  if (2 >= 8 << 1) {
    if (h < 8)
      j[h] = min(j[h + 8], j[h]);
    barrier(1);
  }
  if (2 >= 4 << 1) {
    if (h < 4)
      j[h] = min(j[h + 4], j[h]);
    barrier(1);
  }
  if (2 >= 2 << 1) {
    if (h < 2)
      j[h] = min(j[h + 2], j[h]);
    barrier(1);
  }
  if (2 >= 1 << 1) {
    if (h < 1)
      j[h] = min(j[h + 1], j[h]);
    barrier(1);
  }
  if (h == 0)
    f[j[0] * d] += c[g];
}
kernel void DN(const global float* a, const global float* b, const global float* c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_group_id(0);
  const unsigned h = get_local_id(0);
  const float i = b[g];
  local unsigned j[1];
  a += g % d + (g / d) * d * e;
  f += g % d + (g / d) * d * e;
  unsigned k = e;
  for (unsigned l = h; l < e; l += 1) {
    if (a[l * d] == i) {
      k = min(l, k);
    }
  }
  j[h] = k;
  barrier(1);
  if (1 >= 512 << 1) {
    if (h < 512)
      j[h] = min(j[h + 512], j[h]);
    barrier(1);
  }
  if (1 >= 256 << 1) {
    if (h < 256)
      j[h] = min(j[h + 256], j[h]);
    barrier(1);
  }
  if (1 >= 128 << 1) {
    if (h < 128)
      j[h] = min(j[h + 128], j[h]);
    barrier(1);
  }
  if (1 >= 64 << 1) {
    if (h < 64)
      j[h] = min(j[h + 64], j[h]);
    barrier(1);
  }
  if (1 >= 32 << 1) {
    if (h < 32)
      j[h] = min(j[h + 32], j[h]);
    barrier(1);
  }
  if (1 >= 16 << 1) {
    if (h < 16)
      j[h] = min(j[h + 16], j[h]);
    barrier(1);
  }
  if (1 >= 8 << 1) {
    if (h < 8)
      j[h] = min(j[h + 8], j[h]);
    barrier(1);
  }
  if (1 >= 4 << 1) {
    if (h < 4)
      j[h] = min(j[h + 4], j[h]);
    barrier(1);
  }
  if (1 >= 2 << 1) {
    if (h < 2)
      j[h] = min(j[h + 2], j[h]);
    barrier(1);
  }
  if (1 >= 1 << 1) {
    if (h < 1)
      j[h] = min(j[h + 1], j[h]);
    barrier(1);
  }
  if (h == 0)
    f[j[0] * d] += c[g];
}
kernel void DO(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[1024];
  a += e % b + (e / b) * b * c;
  float h = __builtin_inff();
  for (unsigned i = f; i < c; i += 1024) {
    h = min(a[i * b], h);
  }
  g[f] = h;
  barrier(1);
  if (1024 >= 512 << 1) {
    if (f < 512)
      g[f] = min(g[f + 512], g[f]);
    barrier(1);
  }
  if (1024 >= 256 << 1) {
    if (f < 256)
      g[f] = min(g[f + 256], g[f]);
    barrier(1);
  }
  if (1024 >= 128 << 1) {
    if (f < 128)
      g[f] = min(g[f + 128], g[f]);
    barrier(1);
  }
  if (1024 >= 64 << 1) {
    if (f < 64)
      g[f] = min(g[f + 64], g[f]);
    barrier(1);
  }
  if (1024 >= 32 << 1) {
    if (f < 32)
      g[f] = min(g[f + 32], g[f]);
    barrier(1);
  }
  if (1024 >= 16 << 1) {
    if (f < 16)
      g[f] = min(g[f + 16], g[f]);
    barrier(1);
  }
  if (1024 >= 8 << 1) {
    if (f < 8)
      g[f] = min(g[f + 8], g[f]);
    barrier(1);
  }
  if (1024 >= 4 << 1) {
    if (f < 4)
      g[f] = min(g[f + 4], g[f]);
    barrier(1);
  }
  if (1024 >= 2 << 1) {
    if (f < 2)
      g[f] = min(g[f + 2], g[f]);
    barrier(1);
  }
  if (1024 >= 1 << 1) {
    if (f < 1)
      g[f] = min(g[f + 1], g[f]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void DP(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[512];
  a += e % b + (e / b) * b * c;
  float h = __builtin_inff();
  for (unsigned i = f; i < c; i += 512) {
    h = min(a[i * b], h);
  }
  g[f] = h;
  barrier(1);
  if (512 >= 512 << 1) {
    if (f < 512)
      g[f] = min(g[f + 512], g[f]);
    barrier(1);
  }
  if (512 >= 256 << 1) {
    if (f < 256)
      g[f] = min(g[f + 256], g[f]);
    barrier(1);
  }
  if (512 >= 128 << 1) {
    if (f < 128)
      g[f] = min(g[f + 128], g[f]);
    barrier(1);
  }
  if (512 >= 64 << 1) {
    if (f < 64)
      g[f] = min(g[f + 64], g[f]);
    barrier(1);
  }
  if (512 >= 32 << 1) {
    if (f < 32)
      g[f] = min(g[f + 32], g[f]);
    barrier(1);
  }
  if (512 >= 16 << 1) {
    if (f < 16)
      g[f] = min(g[f + 16], g[f]);
    barrier(1);
  }
  if (512 >= 8 << 1) {
    if (f < 8)
      g[f] = min(g[f + 8], g[f]);
    barrier(1);
  }
  if (512 >= 4 << 1) {
    if (f < 4)
      g[f] = min(g[f + 4], g[f]);
    barrier(1);
  }
  if (512 >= 2 << 1) {
    if (f < 2)
      g[f] = min(g[f + 2], g[f]);
    barrier(1);
  }
  if (512 >= 1 << 1) {
    if (f < 1)
      g[f] = min(g[f + 1], g[f]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void DQ(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[256];
  a += e % b + (e / b) * b * c;
  float h = __builtin_inff();
  for (unsigned i = f; i < c; i += 256) {
    h = min(a[i * b], h);
  }
  g[f] = h;
  barrier(1);
  if (256 >= 512 << 1) {
    if (f < 512)
      g[f] = min(g[f + 512], g[f]);
    barrier(1);
  }
  if (256 >= 256 << 1) {
    if (f < 256)
      g[f] = min(g[f + 256], g[f]);
    barrier(1);
  }
  if (256 >= 128 << 1) {
    if (f < 128)
      g[f] = min(g[f + 128], g[f]);
    barrier(1);
  }
  if (256 >= 64 << 1) {
    if (f < 64)
      g[f] = min(g[f + 64], g[f]);
    barrier(1);
  }
  if (256 >= 32 << 1) {
    if (f < 32)
      g[f] = min(g[f + 32], g[f]);
    barrier(1);
  }
  if (256 >= 16 << 1) {
    if (f < 16)
      g[f] = min(g[f + 16], g[f]);
    barrier(1);
  }
  if (256 >= 8 << 1) {
    if (f < 8)
      g[f] = min(g[f + 8], g[f]);
    barrier(1);
  }
  if (256 >= 4 << 1) {
    if (f < 4)
      g[f] = min(g[f + 4], g[f]);
    barrier(1);
  }
  if (256 >= 2 << 1) {
    if (f < 2)
      g[f] = min(g[f + 2], g[f]);
    barrier(1);
  }
  if (256 >= 1 << 1) {
    if (f < 1)
      g[f] = min(g[f + 1], g[f]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void DR(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[128];
  a += e % b + (e / b) * b * c;
  float h = __builtin_inff();
  for (unsigned i = f; i < c; i += 128) {
    h = min(a[i * b], h);
  }
  g[f] = h;
  barrier(1);
  if (128 >= 512 << 1) {
    if (f < 512)
      g[f] = min(g[f + 512], g[f]);
    barrier(1);
  }
  if (128 >= 256 << 1) {
    if (f < 256)
      g[f] = min(g[f + 256], g[f]);
    barrier(1);
  }
  if (128 >= 128 << 1) {
    if (f < 128)
      g[f] = min(g[f + 128], g[f]);
    barrier(1);
  }
  if (128 >= 64 << 1) {
    if (f < 64)
      g[f] = min(g[f + 64], g[f]);
    barrier(1);
  }
  if (128 >= 32 << 1) {
    if (f < 32)
      g[f] = min(g[f + 32], g[f]);
    barrier(1);
  }
  if (128 >= 16 << 1) {
    if (f < 16)
      g[f] = min(g[f + 16], g[f]);
    barrier(1);
  }
  if (128 >= 8 << 1) {
    if (f < 8)
      g[f] = min(g[f + 8], g[f]);
    barrier(1);
  }
  if (128 >= 4 << 1) {
    if (f < 4)
      g[f] = min(g[f + 4], g[f]);
    barrier(1);
  }
  if (128 >= 2 << 1) {
    if (f < 2)
      g[f] = min(g[f + 2], g[f]);
    barrier(1);
  }
  if (128 >= 1 << 1) {
    if (f < 1)
      g[f] = min(g[f + 1], g[f]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void DS(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[64];
  a += e % b + (e / b) * b * c;
  float h = __builtin_inff();
  for (unsigned i = f; i < c; i += 64) {
    h = min(a[i * b], h);
  }
  g[f] = h;
  barrier(1);
  if (64 >= 512 << 1) {
    if (f < 512)
      g[f] = min(g[f + 512], g[f]);
    barrier(1);
  }
  if (64 >= 256 << 1) {
    if (f < 256)
      g[f] = min(g[f + 256], g[f]);
    barrier(1);
  }
  if (64 >= 128 << 1) {
    if (f < 128)
      g[f] = min(g[f + 128], g[f]);
    barrier(1);
  }
  if (64 >= 64 << 1) {
    if (f < 64)
      g[f] = min(g[f + 64], g[f]);
    barrier(1);
  }
  if (64 >= 32 << 1) {
    if (f < 32)
      g[f] = min(g[f + 32], g[f]);
    barrier(1);
  }
  if (64 >= 16 << 1) {
    if (f < 16)
      g[f] = min(g[f + 16], g[f]);
    barrier(1);
  }
  if (64 >= 8 << 1) {
    if (f < 8)
      g[f] = min(g[f + 8], g[f]);
    barrier(1);
  }
  if (64 >= 4 << 1) {
    if (f < 4)
      g[f] = min(g[f + 4], g[f]);
    barrier(1);
  }
  if (64 >= 2 << 1) {
    if (f < 2)
      g[f] = min(g[f + 2], g[f]);
    barrier(1);
  }
  if (64 >= 1 << 1) {
    if (f < 1)
      g[f] = min(g[f + 1], g[f]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void DT(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[32];
  a += e % b + (e / b) * b * c;
  float h = __builtin_inff();
  for (unsigned i = f; i < c; i += 32) {
    h = min(a[i * b], h);
  }
  g[f] = h;
  barrier(1);
  if (32 >= 512 << 1) {
    if (f < 512)
      g[f] = min(g[f + 512], g[f]);
    barrier(1);
  }
  if (32 >= 256 << 1) {
    if (f < 256)
      g[f] = min(g[f + 256], g[f]);
    barrier(1);
  }
  if (32 >= 128 << 1) {
    if (f < 128)
      g[f] = min(g[f + 128], g[f]);
    barrier(1);
  }
  if (32 >= 64 << 1) {
    if (f < 64)
      g[f] = min(g[f + 64], g[f]);
    barrier(1);
  }
  if (32 >= 32 << 1) {
    if (f < 32)
      g[f] = min(g[f + 32], g[f]);
    barrier(1);
  }
  if (32 >= 16 << 1) {
    if (f < 16)
      g[f] = min(g[f + 16], g[f]);
    barrier(1);
  }
  if (32 >= 8 << 1) {
    if (f < 8)
      g[f] = min(g[f + 8], g[f]);
    barrier(1);
  }
  if (32 >= 4 << 1) {
    if (f < 4)
      g[f] = min(g[f + 4], g[f]);
    barrier(1);
  }
  if (32 >= 2 << 1) {
    if (f < 2)
      g[f] = min(g[f + 2], g[f]);
    barrier(1);
  }
  if (32 >= 1 << 1) {
    if (f < 1)
      g[f] = min(g[f + 1], g[f]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void DU(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[16];
  a += e % b + (e / b) * b * c;
  float h = __builtin_inff();
  for (unsigned i = f; i < c; i += 16) {
    h = min(a[i * b], h);
  }
  g[f] = h;
  barrier(1);
  if (16 >= 512 << 1) {
    if (f < 512)
      g[f] = min(g[f + 512], g[f]);
    barrier(1);
  }
  if (16 >= 256 << 1) {
    if (f < 256)
      g[f] = min(g[f + 256], g[f]);
    barrier(1);
  }
  if (16 >= 128 << 1) {
    if (f < 128)
      g[f] = min(g[f + 128], g[f]);
    barrier(1);
  }
  if (16 >= 64 << 1) {
    if (f < 64)
      g[f] = min(g[f + 64], g[f]);
    barrier(1);
  }
  if (16 >= 32 << 1) {
    if (f < 32)
      g[f] = min(g[f + 32], g[f]);
    barrier(1);
  }
  if (16 >= 16 << 1) {
    if (f < 16)
      g[f] = min(g[f + 16], g[f]);
    barrier(1);
  }
  if (16 >= 8 << 1) {
    if (f < 8)
      g[f] = min(g[f + 8], g[f]);
    barrier(1);
  }
  if (16 >= 4 << 1) {
    if (f < 4)
      g[f] = min(g[f + 4], g[f]);
    barrier(1);
  }
  if (16 >= 2 << 1) {
    if (f < 2)
      g[f] = min(g[f + 2], g[f]);
    barrier(1);
  }
  if (16 >= 1 << 1) {
    if (f < 1)
      g[f] = min(g[f + 1], g[f]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void DV(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[8];
  a += e % b + (e / b) * b * c;
  float h = __builtin_inff();
  for (unsigned i = f; i < c; i += 8) {
    h = min(a[i * b], h);
  }
  g[f] = h;
  barrier(1);
  if (8 >= 512 << 1) {
    if (f < 512)
      g[f] = min(g[f + 512], g[f]);
    barrier(1);
  }
  if (8 >= 256 << 1) {
    if (f < 256)
      g[f] = min(g[f + 256], g[f]);
    barrier(1);
  }
  if (8 >= 128 << 1) {
    if (f < 128)
      g[f] = min(g[f + 128], g[f]);
    barrier(1);
  }
  if (8 >= 64 << 1) {
    if (f < 64)
      g[f] = min(g[f + 64], g[f]);
    barrier(1);
  }
  if (8 >= 32 << 1) {
    if (f < 32)
      g[f] = min(g[f + 32], g[f]);
    barrier(1);
  }
  if (8 >= 16 << 1) {
    if (f < 16)
      g[f] = min(g[f + 16], g[f]);
    barrier(1);
  }
  if (8 >= 8 << 1) {
    if (f < 8)
      g[f] = min(g[f + 8], g[f]);
    barrier(1);
  }
  if (8 >= 4 << 1) {
    if (f < 4)
      g[f] = min(g[f + 4], g[f]);
    barrier(1);
  }
  if (8 >= 2 << 1) {
    if (f < 2)
      g[f] = min(g[f + 2], g[f]);
    barrier(1);
  }
  if (8 >= 1 << 1) {
    if (f < 1)
      g[f] = min(g[f + 1], g[f]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void DW(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[4];
  a += e % b + (e / b) * b * c;
  float h = __builtin_inff();
  for (unsigned i = f; i < c; i += 4) {
    h = min(a[i * b], h);
  }
  g[f] = h;
  barrier(1);
  if (4 >= 512 << 1) {
    if (f < 512)
      g[f] = min(g[f + 512], g[f]);
    barrier(1);
  }
  if (4 >= 256 << 1) {
    if (f < 256)
      g[f] = min(g[f + 256], g[f]);
    barrier(1);
  }
  if (4 >= 128 << 1) {
    if (f < 128)
      g[f] = min(g[f + 128], g[f]);
    barrier(1);
  }
  if (4 >= 64 << 1) {
    if (f < 64)
      g[f] = min(g[f + 64], g[f]);
    barrier(1);
  }
  if (4 >= 32 << 1) {
    if (f < 32)
      g[f] = min(g[f + 32], g[f]);
    barrier(1);
  }
  if (4 >= 16 << 1) {
    if (f < 16)
      g[f] = min(g[f + 16], g[f]);
    barrier(1);
  }
  if (4 >= 8 << 1) {
    if (f < 8)
      g[f] = min(g[f + 8], g[f]);
    barrier(1);
  }
  if (4 >= 4 << 1) {
    if (f < 4)
      g[f] = min(g[f + 4], g[f]);
    barrier(1);
  }
  if (4 >= 2 << 1) {
    if (f < 2)
      g[f] = min(g[f + 2], g[f]);
    barrier(1);
  }
  if (4 >= 1 << 1) {
    if (f < 1)
      g[f] = min(g[f + 1], g[f]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void DX(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[2];
  a += e % b + (e / b) * b * c;
  float h = __builtin_inff();
  for (unsigned i = f; i < c; i += 2) {
    h = min(a[i * b], h);
  }
  g[f] = h;
  barrier(1);
  if (2 >= 512 << 1) {
    if (f < 512)
      g[f] = min(g[f + 512], g[f]);
    barrier(1);
  }
  if (2 >= 256 << 1) {
    if (f < 256)
      g[f] = min(g[f + 256], g[f]);
    barrier(1);
  }
  if (2 >= 128 << 1) {
    if (f < 128)
      g[f] = min(g[f + 128], g[f]);
    barrier(1);
  }
  if (2 >= 64 << 1) {
    if (f < 64)
      g[f] = min(g[f + 64], g[f]);
    barrier(1);
  }
  if (2 >= 32 << 1) {
    if (f < 32)
      g[f] = min(g[f + 32], g[f]);
    barrier(1);
  }
  if (2 >= 16 << 1) {
    if (f < 16)
      g[f] = min(g[f + 16], g[f]);
    barrier(1);
  }
  if (2 >= 8 << 1) {
    if (f < 8)
      g[f] = min(g[f + 8], g[f]);
    barrier(1);
  }
  if (2 >= 4 << 1) {
    if (f < 4)
      g[f] = min(g[f + 4], g[f]);
    barrier(1);
  }
  if (2 >= 2 << 1) {
    if (f < 2)
      g[f] = min(g[f + 2], g[f]);
    barrier(1);
  }
  if (2 >= 1 << 1) {
    if (f < 1)
      g[f] = min(g[f + 1], g[f]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void DY(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[1];
  a += e % b + (e / b) * b * c;
  float h = __builtin_inff();
  for (unsigned i = f; i < c; i += 1) {
    h = min(a[i * b], h);
  }
  g[f] = h;
  barrier(1);
  if (1 >= 512 << 1) {
    if (f < 512)
      g[f] = min(g[f + 512], g[f]);
    barrier(1);
  }
  if (1 >= 256 << 1) {
    if (f < 256)
      g[f] = min(g[f + 256], g[f]);
    barrier(1);
  }
  if (1 >= 128 << 1) {
    if (f < 128)
      g[f] = min(g[f + 128], g[f]);
    barrier(1);
  }
  if (1 >= 64 << 1) {
    if (f < 64)
      g[f] = min(g[f + 64], g[f]);
    barrier(1);
  }
  if (1 >= 32 << 1) {
    if (f < 32)
      g[f] = min(g[f + 32], g[f]);
    barrier(1);
  }
  if (1 >= 16 << 1) {
    if (f < 16)
      g[f] = min(g[f + 16], g[f]);
    barrier(1);
  }
  if (1 >= 8 << 1) {
    if (f < 8)
      g[f] = min(g[f + 8], g[f]);
    barrier(1);
  }
  if (1 >= 4 << 1) {
    if (f < 4)
      g[f] = min(g[f + 4], g[f]);
    barrier(1);
  }
  if (1 >= 2 << 1) {
    if (f < 2)
      g[f] = min(g[f + 2], g[f]);
    barrier(1);
  }
  if (1 >= 1 << 1) {
    if (f < 1)
      g[f] = min(g[f + 1], g[f]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void DZ(const global float* a, const global float* b, const global float* c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_group_id(0);
  const unsigned h = get_local_id(0);
  const float i = b[g];
  local unsigned j[1024];
  a += g % d + (g / d) * d * e;
  f += g % d + (g / d) * d * e;
  unsigned k = e;
  for (unsigned l = h; l < e; l += 1024) {
    if (a[l * d] == i) {
      k = min(l, k);
    }
  }
  j[h] = k;
  barrier(1);
  if (1024 >= 512 << 1) {
    if (h < 512)
      j[h] = min(j[h + 512], j[h]);
    barrier(1);
  }
  if (1024 >= 256 << 1) {
    if (h < 256)
      j[h] = min(j[h + 256], j[h]);
    barrier(1);
  }
  if (1024 >= 128 << 1) {
    if (h < 128)
      j[h] = min(j[h + 128], j[h]);
    barrier(1);
  }
  if (1024 >= 64 << 1) {
    if (h < 64)
      j[h] = min(j[h + 64], j[h]);
    barrier(1);
  }
  if (1024 >= 32 << 1) {
    if (h < 32)
      j[h] = min(j[h + 32], j[h]);
    barrier(1);
  }
  if (1024 >= 16 << 1) {
    if (h < 16)
      j[h] = min(j[h + 16], j[h]);
    barrier(1);
  }
  if (1024 >= 8 << 1) {
    if (h < 8)
      j[h] = min(j[h + 8], j[h]);
    barrier(1);
  }
  if (1024 >= 4 << 1) {
    if (h < 4)
      j[h] = min(j[h + 4], j[h]);
    barrier(1);
  }
  if (1024 >= 2 << 1) {
    if (h < 2)
      j[h] = min(j[h + 2], j[h]);
    barrier(1);
  }
  if (1024 >= 1 << 1) {
    if (h < 1)
      j[h] = min(j[h + 1], j[h]);
    barrier(1);
  }
  if (h == 0)
    f[j[0] * d] += c[g];
}
kernel void EA(const global float* a, const global float* b, const global float* c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_group_id(0);
  const unsigned h = get_local_id(0);
  const float i = b[g];
  local unsigned j[512];
  a += g % d + (g / d) * d * e;
  f += g % d + (g / d) * d * e;
  unsigned k = e;
  for (unsigned l = h; l < e; l += 512) {
    if (a[l * d] == i) {
      k = min(l, k);
    }
  }
  j[h] = k;
  barrier(1);
  if (512 >= 512 << 1) {
    if (h < 512)
      j[h] = min(j[h + 512], j[h]);
    barrier(1);
  }
  if (512 >= 256 << 1) {
    if (h < 256)
      j[h] = min(j[h + 256], j[h]);
    barrier(1);
  }
  if (512 >= 128 << 1) {
    if (h < 128)
      j[h] = min(j[h + 128], j[h]);
    barrier(1);
  }
  if (512 >= 64 << 1) {
    if (h < 64)
      j[h] = min(j[h + 64], j[h]);
    barrier(1);
  }
  if (512 >= 32 << 1) {
    if (h < 32)
      j[h] = min(j[h + 32], j[h]);
    barrier(1);
  }
  if (512 >= 16 << 1) {
    if (h < 16)
      j[h] = min(j[h + 16], j[h]);
    barrier(1);
  }
  if (512 >= 8 << 1) {
    if (h < 8)
      j[h] = min(j[h + 8], j[h]);
    barrier(1);
  }
  if (512 >= 4 << 1) {
    if (h < 4)
      j[h] = min(j[h + 4], j[h]);
    barrier(1);
  }
  if (512 >= 2 << 1) {
    if (h < 2)
      j[h] = min(j[h + 2], j[h]);
    barrier(1);
  }
  if (512 >= 1 << 1) {
    if (h < 1)
      j[h] = min(j[h + 1], j[h]);
    barrier(1);
  }
  if (h == 0)
    f[j[0] * d] += c[g];
}
kernel void EB(const global float* a, const global float* b, const global float* c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_group_id(0);
  const unsigned h = get_local_id(0);
  const float i = b[g];
  local unsigned j[256];
  a += g % d + (g / d) * d * e;
  f += g % d + (g / d) * d * e;
  unsigned k = e;
  for (unsigned l = h; l < e; l += 256) {
    if (a[l * d] == i) {
      k = min(l, k);
    }
  }
  j[h] = k;
  barrier(1);
  if (256 >= 512 << 1) {
    if (h < 512)
      j[h] = min(j[h + 512], j[h]);
    barrier(1);
  }
  if (256 >= 256 << 1) {
    if (h < 256)
      j[h] = min(j[h + 256], j[h]);
    barrier(1);
  }
  if (256 >= 128 << 1) {
    if (h < 128)
      j[h] = min(j[h + 128], j[h]);
    barrier(1);
  }
  if (256 >= 64 << 1) {
    if (h < 64)
      j[h] = min(j[h + 64], j[h]);
    barrier(1);
  }
  if (256 >= 32 << 1) {
    if (h < 32)
      j[h] = min(j[h + 32], j[h]);
    barrier(1);
  }
  if (256 >= 16 << 1) {
    if (h < 16)
      j[h] = min(j[h + 16], j[h]);
    barrier(1);
  }
  if (256 >= 8 << 1) {
    if (h < 8)
      j[h] = min(j[h + 8], j[h]);
    barrier(1);
  }
  if (256 >= 4 << 1) {
    if (h < 4)
      j[h] = min(j[h + 4], j[h]);
    barrier(1);
  }
  if (256 >= 2 << 1) {
    if (h < 2)
      j[h] = min(j[h + 2], j[h]);
    barrier(1);
  }
  if (256 >= 1 << 1) {
    if (h < 1)
      j[h] = min(j[h + 1], j[h]);
    barrier(1);
  }
  if (h == 0)
    f[j[0] * d] += c[g];
}
kernel void EC(const global float* a, const global float* b, const global float* c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_group_id(0);
  const unsigned h = get_local_id(0);
  const float i = b[g];
  local unsigned j[128];
  a += g % d + (g / d) * d * e;
  f += g % d + (g / d) * d * e;
  unsigned k = e;
  for (unsigned l = h; l < e; l += 128) {
    if (a[l * d] == i) {
      k = min(l, k);
    }
  }
  j[h] = k;
  barrier(1);
  if (128 >= 512 << 1) {
    if (h < 512)
      j[h] = min(j[h + 512], j[h]);
    barrier(1);
  }
  if (128 >= 256 << 1) {
    if (h < 256)
      j[h] = min(j[h + 256], j[h]);
    barrier(1);
  }
  if (128 >= 128 << 1) {
    if (h < 128)
      j[h] = min(j[h + 128], j[h]);
    barrier(1);
  }
  if (128 >= 64 << 1) {
    if (h < 64)
      j[h] = min(j[h + 64], j[h]);
    barrier(1);
  }
  if (128 >= 32 << 1) {
    if (h < 32)
      j[h] = min(j[h + 32], j[h]);
    barrier(1);
  }
  if (128 >= 16 << 1) {
    if (h < 16)
      j[h] = min(j[h + 16], j[h]);
    barrier(1);
  }
  if (128 >= 8 << 1) {
    if (h < 8)
      j[h] = min(j[h + 8], j[h]);
    barrier(1);
  }
  if (128 >= 4 << 1) {
    if (h < 4)
      j[h] = min(j[h + 4], j[h]);
    barrier(1);
  }
  if (128 >= 2 << 1) {
    if (h < 2)
      j[h] = min(j[h + 2], j[h]);
    barrier(1);
  }
  if (128 >= 1 << 1) {
    if (h < 1)
      j[h] = min(j[h + 1], j[h]);
    barrier(1);
  }
  if (h == 0)
    f[j[0] * d] += c[g];
}
kernel void ED(const global float* a, const global float* b, const global float* c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_group_id(0);
  const unsigned h = get_local_id(0);
  const float i = b[g];
  local unsigned j[64];
  a += g % d + (g / d) * d * e;
  f += g % d + (g / d) * d * e;
  unsigned k = e;
  for (unsigned l = h; l < e; l += 64) {
    if (a[l * d] == i) {
      k = min(l, k);
    }
  }
  j[h] = k;
  barrier(1);
  if (64 >= 512 << 1) {
    if (h < 512)
      j[h] = min(j[h + 512], j[h]);
    barrier(1);
  }
  if (64 >= 256 << 1) {
    if (h < 256)
      j[h] = min(j[h + 256], j[h]);
    barrier(1);
  }
  if (64 >= 128 << 1) {
    if (h < 128)
      j[h] = min(j[h + 128], j[h]);
    barrier(1);
  }
  if (64 >= 64 << 1) {
    if (h < 64)
      j[h] = min(j[h + 64], j[h]);
    barrier(1);
  }
  if (64 >= 32 << 1) {
    if (h < 32)
      j[h] = min(j[h + 32], j[h]);
    barrier(1);
  }
  if (64 >= 16 << 1) {
    if (h < 16)
      j[h] = min(j[h + 16], j[h]);
    barrier(1);
  }
  if (64 >= 8 << 1) {
    if (h < 8)
      j[h] = min(j[h + 8], j[h]);
    barrier(1);
  }
  if (64 >= 4 << 1) {
    if (h < 4)
      j[h] = min(j[h + 4], j[h]);
    barrier(1);
  }
  if (64 >= 2 << 1) {
    if (h < 2)
      j[h] = min(j[h + 2], j[h]);
    barrier(1);
  }
  if (64 >= 1 << 1) {
    if (h < 1)
      j[h] = min(j[h + 1], j[h]);
    barrier(1);
  }
  if (h == 0)
    f[j[0] * d] += c[g];
}
kernel void EE(const global float* a, const global float* b, const global float* c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_group_id(0);
  const unsigned h = get_local_id(0);
  const float i = b[g];
  local unsigned j[32];
  a += g % d + (g / d) * d * e;
  f += g % d + (g / d) * d * e;
  unsigned k = e;
  for (unsigned l = h; l < e; l += 32) {
    if (a[l * d] == i) {
      k = min(l, k);
    }
  }
  j[h] = k;
  barrier(1);
  if (32 >= 512 << 1) {
    if (h < 512)
      j[h] = min(j[h + 512], j[h]);
    barrier(1);
  }
  if (32 >= 256 << 1) {
    if (h < 256)
      j[h] = min(j[h + 256], j[h]);
    barrier(1);
  }
  if (32 >= 128 << 1) {
    if (h < 128)
      j[h] = min(j[h + 128], j[h]);
    barrier(1);
  }
  if (32 >= 64 << 1) {
    if (h < 64)
      j[h] = min(j[h + 64], j[h]);
    barrier(1);
  }
  if (32 >= 32 << 1) {
    if (h < 32)
      j[h] = min(j[h + 32], j[h]);
    barrier(1);
  }
  if (32 >= 16 << 1) {
    if (h < 16)
      j[h] = min(j[h + 16], j[h]);
    barrier(1);
  }
  if (32 >= 8 << 1) {
    if (h < 8)
      j[h] = min(j[h + 8], j[h]);
    barrier(1);
  }
  if (32 >= 4 << 1) {
    if (h < 4)
      j[h] = min(j[h + 4], j[h]);
    barrier(1);
  }
  if (32 >= 2 << 1) {
    if (h < 2)
      j[h] = min(j[h + 2], j[h]);
    barrier(1);
  }
  if (32 >= 1 << 1) {
    if (h < 1)
      j[h] = min(j[h + 1], j[h]);
    barrier(1);
  }
  if (h == 0)
    f[j[0] * d] += c[g];
}
kernel void EF(const global float* a, const global float* b, const global float* c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_group_id(0);
  const unsigned h = get_local_id(0);
  const float i = b[g];
  local unsigned j[16];
  a += g % d + (g / d) * d * e;
  f += g % d + (g / d) * d * e;
  unsigned k = e;
  for (unsigned l = h; l < e; l += 16) {
    if (a[l * d] == i) {
      k = min(l, k);
    }
  }
  j[h] = k;
  barrier(1);
  if (16 >= 512 << 1) {
    if (h < 512)
      j[h] = min(j[h + 512], j[h]);
    barrier(1);
  }
  if (16 >= 256 << 1) {
    if (h < 256)
      j[h] = min(j[h + 256], j[h]);
    barrier(1);
  }
  if (16 >= 128 << 1) {
    if (h < 128)
      j[h] = min(j[h + 128], j[h]);
    barrier(1);
  }
  if (16 >= 64 << 1) {
    if (h < 64)
      j[h] = min(j[h + 64], j[h]);
    barrier(1);
  }
  if (16 >= 32 << 1) {
    if (h < 32)
      j[h] = min(j[h + 32], j[h]);
    barrier(1);
  }
  if (16 >= 16 << 1) {
    if (h < 16)
      j[h] = min(j[h + 16], j[h]);
    barrier(1);
  }
  if (16 >= 8 << 1) {
    if (h < 8)
      j[h] = min(j[h + 8], j[h]);
    barrier(1);
  }
  if (16 >= 4 << 1) {
    if (h < 4)
      j[h] = min(j[h + 4], j[h]);
    barrier(1);
  }
  if (16 >= 2 << 1) {
    if (h < 2)
      j[h] = min(j[h + 2], j[h]);
    barrier(1);
  }
  if (16 >= 1 << 1) {
    if (h < 1)
      j[h] = min(j[h + 1], j[h]);
    barrier(1);
  }
  if (h == 0)
    f[j[0] * d] += c[g];
}
kernel void EG(const global float* a, const global float* b, const global float* c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_group_id(0);
  const unsigned h = get_local_id(0);
  const float i = b[g];
  local unsigned j[8];
  a += g % d + (g / d) * d * e;
  f += g % d + (g / d) * d * e;
  unsigned k = e;
  for (unsigned l = h; l < e; l += 8) {
    if (a[l * d] == i) {
      k = min(l, k);
    }
  }
  j[h] = k;
  barrier(1);
  if (8 >= 512 << 1) {
    if (h < 512)
      j[h] = min(j[h + 512], j[h]);
    barrier(1);
  }
  if (8 >= 256 << 1) {
    if (h < 256)
      j[h] = min(j[h + 256], j[h]);
    barrier(1);
  }
  if (8 >= 128 << 1) {
    if (h < 128)
      j[h] = min(j[h + 128], j[h]);
    barrier(1);
  }
  if (8 >= 64 << 1) {
    if (h < 64)
      j[h] = min(j[h + 64], j[h]);
    barrier(1);
  }
  if (8 >= 32 << 1) {
    if (h < 32)
      j[h] = min(j[h + 32], j[h]);
    barrier(1);
  }
  if (8 >= 16 << 1) {
    if (h < 16)
      j[h] = min(j[h + 16], j[h]);
    barrier(1);
  }
  if (8 >= 8 << 1) {
    if (h < 8)
      j[h] = min(j[h + 8], j[h]);
    barrier(1);
  }
  if (8 >= 4 << 1) {
    if (h < 4)
      j[h] = min(j[h + 4], j[h]);
    barrier(1);
  }
  if (8 >= 2 << 1) {
    if (h < 2)
      j[h] = min(j[h + 2], j[h]);
    barrier(1);
  }
  if (8 >= 1 << 1) {
    if (h < 1)
      j[h] = min(j[h + 1], j[h]);
    barrier(1);
  }
  if (h == 0)
    f[j[0] * d] += c[g];
}
kernel void EH(const global float* a, const global float* b, const global float* c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_group_id(0);
  const unsigned h = get_local_id(0);
  const float i = b[g];
  local unsigned j[4];
  a += g % d + (g / d) * d * e;
  f += g % d + (g / d) * d * e;
  unsigned k = e;
  for (unsigned l = h; l < e; l += 4) {
    if (a[l * d] == i) {
      k = min(l, k);
    }
  }
  j[h] = k;
  barrier(1);
  if (4 >= 512 << 1) {
    if (h < 512)
      j[h] = min(j[h + 512], j[h]);
    barrier(1);
  }
  if (4 >= 256 << 1) {
    if (h < 256)
      j[h] = min(j[h + 256], j[h]);
    barrier(1);
  }
  if (4 >= 128 << 1) {
    if (h < 128)
      j[h] = min(j[h + 128], j[h]);
    barrier(1);
  }
  if (4 >= 64 << 1) {
    if (h < 64)
      j[h] = min(j[h + 64], j[h]);
    barrier(1);
  }
  if (4 >= 32 << 1) {
    if (h < 32)
      j[h] = min(j[h + 32], j[h]);
    barrier(1);
  }
  if (4 >= 16 << 1) {
    if (h < 16)
      j[h] = min(j[h + 16], j[h]);
    barrier(1);
  }
  if (4 >= 8 << 1) {
    if (h < 8)
      j[h] = min(j[h + 8], j[h]);
    barrier(1);
  }
  if (4 >= 4 << 1) {
    if (h < 4)
      j[h] = min(j[h + 4], j[h]);
    barrier(1);
  }
  if (4 >= 2 << 1) {
    if (h < 2)
      j[h] = min(j[h + 2], j[h]);
    barrier(1);
  }
  if (4 >= 1 << 1) {
    if (h < 1)
      j[h] = min(j[h + 1], j[h]);
    barrier(1);
  }
  if (h == 0)
    f[j[0] * d] += c[g];
}
kernel void EI(const global float* a, const global float* b, const global float* c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_group_id(0);
  const unsigned h = get_local_id(0);
  const float i = b[g];
  local unsigned j[2];
  a += g % d + (g / d) * d * e;
  f += g % d + (g / d) * d * e;
  unsigned k = e;
  for (unsigned l = h; l < e; l += 2) {
    if (a[l * d] == i) {
      k = min(l, k);
    }
  }
  j[h] = k;
  barrier(1);
  if (2 >= 512 << 1) {
    if (h < 512)
      j[h] = min(j[h + 512], j[h]);
    barrier(1);
  }
  if (2 >= 256 << 1) {
    if (h < 256)
      j[h] = min(j[h + 256], j[h]);
    barrier(1);
  }
  if (2 >= 128 << 1) {
    if (h < 128)
      j[h] = min(j[h + 128], j[h]);
    barrier(1);
  }
  if (2 >= 64 << 1) {
    if (h < 64)
      j[h] = min(j[h + 64], j[h]);
    barrier(1);
  }
  if (2 >= 32 << 1) {
    if (h < 32)
      j[h] = min(j[h + 32], j[h]);
    barrier(1);
  }
  if (2 >= 16 << 1) {
    if (h < 16)
      j[h] = min(j[h + 16], j[h]);
    barrier(1);
  }
  if (2 >= 8 << 1) {
    if (h < 8)
      j[h] = min(j[h + 8], j[h]);
    barrier(1);
  }
  if (2 >= 4 << 1) {
    if (h < 4)
      j[h] = min(j[h + 4], j[h]);
    barrier(1);
  }
  if (2 >= 2 << 1) {
    if (h < 2)
      j[h] = min(j[h + 2], j[h]);
    barrier(1);
  }
  if (2 >= 1 << 1) {
    if (h < 1)
      j[h] = min(j[h + 1], j[h]);
    barrier(1);
  }
  if (h == 0)
    f[j[0] * d] += c[g];
}
kernel void EJ(const global float* a, const global float* b, const global float* c, const unsigned d, const unsigned e, global float* f) {
  const unsigned g = get_group_id(0);
  const unsigned h = get_local_id(0);
  const float i = b[g];
  local unsigned j[1];
  a += g % d + (g / d) * d * e;
  f += g % d + (g / d) * d * e;
  unsigned k = e;
  for (unsigned l = h; l < e; l += 1) {
    if (a[l * d] == i) {
      k = min(l, k);
    }
  }
  j[h] = k;
  barrier(1);
  if (1 >= 512 << 1) {
    if (h < 512)
      j[h] = min(j[h + 512], j[h]);
    barrier(1);
  }
  if (1 >= 256 << 1) {
    if (h < 256)
      j[h] = min(j[h + 256], j[h]);
    barrier(1);
  }
  if (1 >= 128 << 1) {
    if (h < 128)
      j[h] = min(j[h + 128], j[h]);
    barrier(1);
  }
  if (1 >= 64 << 1) {
    if (h < 64)
      j[h] = min(j[h + 64], j[h]);
    barrier(1);
  }
  if (1 >= 32 << 1) {
    if (h < 32)
      j[h] = min(j[h + 32], j[h]);
    barrier(1);
  }
  if (1 >= 16 << 1) {
    if (h < 16)
      j[h] = min(j[h + 16], j[h]);
    barrier(1);
  }
  if (1 >= 8 << 1) {
    if (h < 8)
      j[h] = min(j[h + 8], j[h]);
    barrier(1);
  }
  if (1 >= 4 << 1) {
    if (h < 4)
      j[h] = min(j[h + 4], j[h]);
    barrier(1);
  }
  if (1 >= 2 << 1) {
    if (h < 2)
      j[h] = min(j[h + 2], j[h]);
    barrier(1);
  }
  if (1 >= 1 << 1) {
    if (h < 1)
      j[h] = min(j[h + 1], j[h]);
    barrier(1);
  }
  if (h == 0)
    f[j[0] * d] += c[g];
}
kernel void EK(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[1024];
  a += e % b + (e / b) * b * c;
  g[f] = 0;
  for (unsigned h = f; h < c; h += 1024)
    g[f] += a[h * b];
  barrier(1);
  if (1024 >= 512 << 1) {
    if (f < 512)
      g[f] += g[f + 512];
    barrier(1);
  }
  if (1024 >= 256 << 1) {
    if (f < 256)
      g[f] += g[f + 256];
    barrier(1);
  }
  if (1024 >= 128 << 1) {
    if (f < 128)
      g[f] += g[f + 128];
    barrier(1);
  }
  if (1024 >= 64 << 1) {
    if (f < 64)
      g[f] += g[f + 64];
    barrier(1);
  }
  if (1024 >= 32 << 1) {
    if (f < 32)
      g[f] += g[f + 32];
    barrier(1);
  }
  if (1024 >= 16 << 1) {
    if (f < 16)
      g[f] += g[f + 16];
    barrier(1);
  }
  if (1024 >= 8 << 1) {
    if (f < 8)
      g[f] += g[f + 8];
    barrier(1);
  }
  if (1024 >= 4 << 1) {
    if (f < 4)
      g[f] += g[f + 4];
    barrier(1);
  }
  if (1024 >= 2 << 1) {
    if (f < 2)
      g[f] += g[f + 2];
    barrier(1);
  }
  if (1024 >= 1 << 1) {
    if (f < 1)
      g[f] += g[f + 1];
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void EL(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[512];
  a += e % b + (e / b) * b * c;
  g[f] = 0;
  for (unsigned h = f; h < c; h += 512)
    g[f] += a[h * b];
  barrier(1);
  if (512 >= 512 << 1) {
    if (f < 512)
      g[f] += g[f + 512];
    barrier(1);
  }
  if (512 >= 256 << 1) {
    if (f < 256)
      g[f] += g[f + 256];
    barrier(1);
  }
  if (512 >= 128 << 1) {
    if (f < 128)
      g[f] += g[f + 128];
    barrier(1);
  }
  if (512 >= 64 << 1) {
    if (f < 64)
      g[f] += g[f + 64];
    barrier(1);
  }
  if (512 >= 32 << 1) {
    if (f < 32)
      g[f] += g[f + 32];
    barrier(1);
  }
  if (512 >= 16 << 1) {
    if (f < 16)
      g[f] += g[f + 16];
    barrier(1);
  }
  if (512 >= 8 << 1) {
    if (f < 8)
      g[f] += g[f + 8];
    barrier(1);
  }
  if (512 >= 4 << 1) {
    if (f < 4)
      g[f] += g[f + 4];
    barrier(1);
  }
  if (512 >= 2 << 1) {
    if (f < 2)
      g[f] += g[f + 2];
    barrier(1);
  }
  if (512 >= 1 << 1) {
    if (f < 1)
      g[f] += g[f + 1];
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void EM(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[256];
  a += e % b + (e / b) * b * c;
  g[f] = 0;
  for (unsigned h = f; h < c; h += 256)
    g[f] += a[h * b];
  barrier(1);
  if (256 >= 512 << 1) {
    if (f < 512)
      g[f] += g[f + 512];
    barrier(1);
  }
  if (256 >= 256 << 1) {
    if (f < 256)
      g[f] += g[f + 256];
    barrier(1);
  }
  if (256 >= 128 << 1) {
    if (f < 128)
      g[f] += g[f + 128];
    barrier(1);
  }
  if (256 >= 64 << 1) {
    if (f < 64)
      g[f] += g[f + 64];
    barrier(1);
  }
  if (256 >= 32 << 1) {
    if (f < 32)
      g[f] += g[f + 32];
    barrier(1);
  }
  if (256 >= 16 << 1) {
    if (f < 16)
      g[f] += g[f + 16];
    barrier(1);
  }
  if (256 >= 8 << 1) {
    if (f < 8)
      g[f] += g[f + 8];
    barrier(1);
  }
  if (256 >= 4 << 1) {
    if (f < 4)
      g[f] += g[f + 4];
    barrier(1);
  }
  if (256 >= 2 << 1) {
    if (f < 2)
      g[f] += g[f + 2];
    barrier(1);
  }
  if (256 >= 1 << 1) {
    if (f < 1)
      g[f] += g[f + 1];
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void EN(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[128];
  a += e % b + (e / b) * b * c;
  g[f] = 0;
  for (unsigned h = f; h < c; h += 128)
    g[f] += a[h * b];
  barrier(1);
  if (128 >= 512 << 1) {
    if (f < 512)
      g[f] += g[f + 512];
    barrier(1);
  }
  if (128 >= 256 << 1) {
    if (f < 256)
      g[f] += g[f + 256];
    barrier(1);
  }
  if (128 >= 128 << 1) {
    if (f < 128)
      g[f] += g[f + 128];
    barrier(1);
  }
  if (128 >= 64 << 1) {
    if (f < 64)
      g[f] += g[f + 64];
    barrier(1);
  }
  if (128 >= 32 << 1) {
    if (f < 32)
      g[f] += g[f + 32];
    barrier(1);
  }
  if (128 >= 16 << 1) {
    if (f < 16)
      g[f] += g[f + 16];
    barrier(1);
  }
  if (128 >= 8 << 1) {
    if (f < 8)
      g[f] += g[f + 8];
    barrier(1);
  }
  if (128 >= 4 << 1) {
    if (f < 4)
      g[f] += g[f + 4];
    barrier(1);
  }
  if (128 >= 2 << 1) {
    if (f < 2)
      g[f] += g[f + 2];
    barrier(1);
  }
  if (128 >= 1 << 1) {
    if (f < 1)
      g[f] += g[f + 1];
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void EO(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[64];
  a += e % b + (e / b) * b * c;
  g[f] = 0;
  for (unsigned h = f; h < c; h += 64)
    g[f] += a[h * b];
  barrier(1);
  if (64 >= 512 << 1) {
    if (f < 512)
      g[f] += g[f + 512];
    barrier(1);
  }
  if (64 >= 256 << 1) {
    if (f < 256)
      g[f] += g[f + 256];
    barrier(1);
  }
  if (64 >= 128 << 1) {
    if (f < 128)
      g[f] += g[f + 128];
    barrier(1);
  }
  if (64 >= 64 << 1) {
    if (f < 64)
      g[f] += g[f + 64];
    barrier(1);
  }
  if (64 >= 32 << 1) {
    if (f < 32)
      g[f] += g[f + 32];
    barrier(1);
  }
  if (64 >= 16 << 1) {
    if (f < 16)
      g[f] += g[f + 16];
    barrier(1);
  }
  if (64 >= 8 << 1) {
    if (f < 8)
      g[f] += g[f + 8];
    barrier(1);
  }
  if (64 >= 4 << 1) {
    if (f < 4)
      g[f] += g[f + 4];
    barrier(1);
  }
  if (64 >= 2 << 1) {
    if (f < 2)
      g[f] += g[f + 2];
    barrier(1);
  }
  if (64 >= 1 << 1) {
    if (f < 1)
      g[f] += g[f + 1];
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void EP(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[32];
  a += e % b + (e / b) * b * c;
  g[f] = 0;
  for (unsigned h = f; h < c; h += 32)
    g[f] += a[h * b];
  barrier(1);
  if (32 >= 512 << 1) {
    if (f < 512)
      g[f] += g[f + 512];
    barrier(1);
  }
  if (32 >= 256 << 1) {
    if (f < 256)
      g[f] += g[f + 256];
    barrier(1);
  }
  if (32 >= 128 << 1) {
    if (f < 128)
      g[f] += g[f + 128];
    barrier(1);
  }
  if (32 >= 64 << 1) {
    if (f < 64)
      g[f] += g[f + 64];
    barrier(1);
  }
  if (32 >= 32 << 1) {
    if (f < 32)
      g[f] += g[f + 32];
    barrier(1);
  }
  if (32 >= 16 << 1) {
    if (f < 16)
      g[f] += g[f + 16];
    barrier(1);
  }
  if (32 >= 8 << 1) {
    if (f < 8)
      g[f] += g[f + 8];
    barrier(1);
  }
  if (32 >= 4 << 1) {
    if (f < 4)
      g[f] += g[f + 4];
    barrier(1);
  }
  if (32 >= 2 << 1) {
    if (f < 2)
      g[f] += g[f + 2];
    barrier(1);
  }
  if (32 >= 1 << 1) {
    if (f < 1)
      g[f] += g[f + 1];
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void EQ(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[16];
  a += e % b + (e / b) * b * c;
  g[f] = 0;
  for (unsigned h = f; h < c; h += 16)
    g[f] += a[h * b];
  barrier(1);
  if (16 >= 512 << 1) {
    if (f < 512)
      g[f] += g[f + 512];
    barrier(1);
  }
  if (16 >= 256 << 1) {
    if (f < 256)
      g[f] += g[f + 256];
    barrier(1);
  }
  if (16 >= 128 << 1) {
    if (f < 128)
      g[f] += g[f + 128];
    barrier(1);
  }
  if (16 >= 64 << 1) {
    if (f < 64)
      g[f] += g[f + 64];
    barrier(1);
  }
  if (16 >= 32 << 1) {
    if (f < 32)
      g[f] += g[f + 32];
    barrier(1);
  }
  if (16 >= 16 << 1) {
    if (f < 16)
      g[f] += g[f + 16];
    barrier(1);
  }
  if (16 >= 8 << 1) {
    if (f < 8)
      g[f] += g[f + 8];
    barrier(1);
  }
  if (16 >= 4 << 1) {
    if (f < 4)
      g[f] += g[f + 4];
    barrier(1);
  }
  if (16 >= 2 << 1) {
    if (f < 2)
      g[f] += g[f + 2];
    barrier(1);
  }
  if (16 >= 1 << 1) {
    if (f < 1)
      g[f] += g[f + 1];
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void ER(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[8];
  a += e % b + (e / b) * b * c;
  g[f] = 0;
  for (unsigned h = f; h < c; h += 8)
    g[f] += a[h * b];
  barrier(1);
  if (8 >= 512 << 1) {
    if (f < 512)
      g[f] += g[f + 512];
    barrier(1);
  }
  if (8 >= 256 << 1) {
    if (f < 256)
      g[f] += g[f + 256];
    barrier(1);
  }
  if (8 >= 128 << 1) {
    if (f < 128)
      g[f] += g[f + 128];
    barrier(1);
  }
  if (8 >= 64 << 1) {
    if (f < 64)
      g[f] += g[f + 64];
    barrier(1);
  }
  if (8 >= 32 << 1) {
    if (f < 32)
      g[f] += g[f + 32];
    barrier(1);
  }
  if (8 >= 16 << 1) {
    if (f < 16)
      g[f] += g[f + 16];
    barrier(1);
  }
  if (8 >= 8 << 1) {
    if (f < 8)
      g[f] += g[f + 8];
    barrier(1);
  }
  if (8 >= 4 << 1) {
    if (f < 4)
      g[f] += g[f + 4];
    barrier(1);
  }
  if (8 >= 2 << 1) {
    if (f < 2)
      g[f] += g[f + 2];
    barrier(1);
  }
  if (8 >= 1 << 1) {
    if (f < 1)
      g[f] += g[f + 1];
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void ES(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[4];
  a += e % b + (e / b) * b * c;
  g[f] = 0;
  for (unsigned h = f; h < c; h += 4)
    g[f] += a[h * b];
  barrier(1);
  if (4 >= 512 << 1) {
    if (f < 512)
      g[f] += g[f + 512];
    barrier(1);
  }
  if (4 >= 256 << 1) {
    if (f < 256)
      g[f] += g[f + 256];
    barrier(1);
  }
  if (4 >= 128 << 1) {
    if (f < 128)
      g[f] += g[f + 128];
    barrier(1);
  }
  if (4 >= 64 << 1) {
    if (f < 64)
      g[f] += g[f + 64];
    barrier(1);
  }
  if (4 >= 32 << 1) {
    if (f < 32)
      g[f] += g[f + 32];
    barrier(1);
  }
  if (4 >= 16 << 1) {
    if (f < 16)
      g[f] += g[f + 16];
    barrier(1);
  }
  if (4 >= 8 << 1) {
    if (f < 8)
      g[f] += g[f + 8];
    barrier(1);
  }
  if (4 >= 4 << 1) {
    if (f < 4)
      g[f] += g[f + 4];
    barrier(1);
  }
  if (4 >= 2 << 1) {
    if (f < 2)
      g[f] += g[f + 2];
    barrier(1);
  }
  if (4 >= 1 << 1) {
    if (f < 1)
      g[f] += g[f + 1];
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void ET(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[2];
  a += e % b + (e / b) * b * c;
  g[f] = 0;
  for (unsigned h = f; h < c; h += 2)
    g[f] += a[h * b];
  barrier(1);
  if (2 >= 512 << 1) {
    if (f < 512)
      g[f] += g[f + 512];
    barrier(1);
  }
  if (2 >= 256 << 1) {
    if (f < 256)
      g[f] += g[f + 256];
    barrier(1);
  }
  if (2 >= 128 << 1) {
    if (f < 128)
      g[f] += g[f + 128];
    barrier(1);
  }
  if (2 >= 64 << 1) {
    if (f < 64)
      g[f] += g[f + 64];
    barrier(1);
  }
  if (2 >= 32 << 1) {
    if (f < 32)
      g[f] += g[f + 32];
    barrier(1);
  }
  if (2 >= 16 << 1) {
    if (f < 16)
      g[f] += g[f + 16];
    barrier(1);
  }
  if (2 >= 8 << 1) {
    if (f < 8)
      g[f] += g[f + 8];
    barrier(1);
  }
  if (2 >= 4 << 1) {
    if (f < 4)
      g[f] += g[f + 4];
    barrier(1);
  }
  if (2 >= 2 << 1) {
    if (f < 2)
      g[f] += g[f + 2];
    barrier(1);
  }
  if (2 >= 1 << 1) {
    if (f < 1)
      g[f] += g[f + 1];
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void EU(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[1];
  a += e % b + (e / b) * b * c;
  g[f] = 0;
  for (unsigned h = f; h < c; h += 1)
    g[f] += a[h * b];
  barrier(1);
  if (1 >= 512 << 1) {
    if (f < 512)
      g[f] += g[f + 512];
    barrier(1);
  }
  if (1 >= 256 << 1) {
    if (f < 256)
      g[f] += g[f + 256];
    barrier(1);
  }
  if (1 >= 128 << 1) {
    if (f < 128)
      g[f] += g[f + 128];
    barrier(1);
  }
  if (1 >= 64 << 1) {
    if (f < 64)
      g[f] += g[f + 64];
    barrier(1);
  }
  if (1 >= 32 << 1) {
    if (f < 32)
      g[f] += g[f + 32];
    barrier(1);
  }
  if (1 >= 16 << 1) {
    if (f < 16)
      g[f] += g[f + 16];
    barrier(1);
  }
  if (1 >= 8 << 1) {
    if (f < 8)
      g[f] += g[f + 8];
    barrier(1);
  }
  if (1 >= 4 << 1) {
    if (f < 4)
      g[f] += g[f + 4];
    barrier(1);
  }
  if (1 >= 2 << 1) {
    if (f < 2)
      g[f] += g[f + 2];
    barrier(1);
  }
  if (1 >= 1 << 1) {
    if (f < 1)
      g[f] += g[f + 1];
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}

inline float EV(float a, float b) {
  return a > b ? a + log(1.f + exp(b - a)) : b + log(1.f + exp(a - b));
}
kernel void EW(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[1024];
  a += e % b + (e / b) * b * c;
  g[f] = -1e38;
  for (unsigned h = f; h < c; h += 1024) {
    g[f] = EV(g[f], a[h * b]);
  }
  barrier(1);
  if (1024 >= 512 << 1) {
    if (f < 512)
      g[f] = EV(g[f], g[f + 512]);
    barrier(1);
  }
  if (1024 >= 256 << 1) {
    if (f < 256)
      g[f] = EV(g[f], g[f + 256]);
    barrier(1);
  }
  if (1024 >= 128 << 1) {
    if (f < 128)
      g[f] = EV(g[f], g[f + 128]);
    barrier(1);
  }
  if (1024 >= 64 << 1) {
    if (f < 64)
      g[f] = EV(g[f], g[f + 64]);
    barrier(1);
  }
  if (1024 >= 32 << 1) {
    if (f < 32)
      g[f] = EV(g[f], g[f + 32]);
    barrier(1);
  }
  if (1024 >= 16 << 1) {
    if (f < 16)
      g[f] = EV(g[f], g[f + 16]);
    barrier(1);
  }
  if (1024 >= 8 << 1) {
    if (f < 8)
      g[f] = EV(g[f], g[f + 8]);
    barrier(1);
  }
  if (1024 >= 4 << 1) {
    if (f < 4)
      g[f] = EV(g[f], g[f + 4]);
    barrier(1);
  }
  if (1024 >= 2 << 1) {
    if (f < 2)
      g[f] = EV(g[f], g[f + 2]);
    barrier(1);
  }
  if (1024 >= 1 << 1) {
    if (f < 1)
      g[f] = EV(g[f], g[f + 1]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void EX(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[512];
  a += e % b + (e / b) * b * c;
  g[f] = -1e38;
  for (unsigned h = f; h < c; h += 512) {
    g[f] = EV(g[f], a[h * b]);
  }
  barrier(1);
  if (512 >= 512 << 1) {
    if (f < 512)
      g[f] = EV(g[f], g[f + 512]);
    barrier(1);
  }
  if (512 >= 256 << 1) {
    if (f < 256)
      g[f] = EV(g[f], g[f + 256]);
    barrier(1);
  }
  if (512 >= 128 << 1) {
    if (f < 128)
      g[f] = EV(g[f], g[f + 128]);
    barrier(1);
  }
  if (512 >= 64 << 1) {
    if (f < 64)
      g[f] = EV(g[f], g[f + 64]);
    barrier(1);
  }
  if (512 >= 32 << 1) {
    if (f < 32)
      g[f] = EV(g[f], g[f + 32]);
    barrier(1);
  }
  if (512 >= 16 << 1) {
    if (f < 16)
      g[f] = EV(g[f], g[f + 16]);
    barrier(1);
  }
  if (512 >= 8 << 1) {
    if (f < 8)
      g[f] = EV(g[f], g[f + 8]);
    barrier(1);
  }
  if (512 >= 4 << 1) {
    if (f < 4)
      g[f] = EV(g[f], g[f + 4]);
    barrier(1);
  }
  if (512 >= 2 << 1) {
    if (f < 2)
      g[f] = EV(g[f], g[f + 2]);
    barrier(1);
  }
  if (512 >= 1 << 1) {
    if (f < 1)
      g[f] = EV(g[f], g[f + 1]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void EY(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[256];
  a += e % b + (e / b) * b * c;
  g[f] = -1e38;
  for (unsigned h = f; h < c; h += 256) {
    g[f] = EV(g[f], a[h * b]);
  }
  barrier(1);
  if (256 >= 512 << 1) {
    if (f < 512)
      g[f] = EV(g[f], g[f + 512]);
    barrier(1);
  }
  if (256 >= 256 << 1) {
    if (f < 256)
      g[f] = EV(g[f], g[f + 256]);
    barrier(1);
  }
  if (256 >= 128 << 1) {
    if (f < 128)
      g[f] = EV(g[f], g[f + 128]);
    barrier(1);
  }
  if (256 >= 64 << 1) {
    if (f < 64)
      g[f] = EV(g[f], g[f + 64]);
    barrier(1);
  }
  if (256 >= 32 << 1) {
    if (f < 32)
      g[f] = EV(g[f], g[f + 32]);
    barrier(1);
  }
  if (256 >= 16 << 1) {
    if (f < 16)
      g[f] = EV(g[f], g[f + 16]);
    barrier(1);
  }
  if (256 >= 8 << 1) {
    if (f < 8)
      g[f] = EV(g[f], g[f + 8]);
    barrier(1);
  }
  if (256 >= 4 << 1) {
    if (f < 4)
      g[f] = EV(g[f], g[f + 4]);
    barrier(1);
  }
  if (256 >= 2 << 1) {
    if (f < 2)
      g[f] = EV(g[f], g[f + 2]);
    barrier(1);
  }
  if (256 >= 1 << 1) {
    if (f < 1)
      g[f] = EV(g[f], g[f + 1]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void EZ(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[128];
  a += e % b + (e / b) * b * c;
  g[f] = -1e38;
  for (unsigned h = f; h < c; h += 128) {
    g[f] = EV(g[f], a[h * b]);
  }
  barrier(1);
  if (128 >= 512 << 1) {
    if (f < 512)
      g[f] = EV(g[f], g[f + 512]);
    barrier(1);
  }
  if (128 >= 256 << 1) {
    if (f < 256)
      g[f] = EV(g[f], g[f + 256]);
    barrier(1);
  }
  if (128 >= 128 << 1) {
    if (f < 128)
      g[f] = EV(g[f], g[f + 128]);
    barrier(1);
  }
  if (128 >= 64 << 1) {
    if (f < 64)
      g[f] = EV(g[f], g[f + 64]);
    barrier(1);
  }
  if (128 >= 32 << 1) {
    if (f < 32)
      g[f] = EV(g[f], g[f + 32]);
    barrier(1);
  }
  if (128 >= 16 << 1) {
    if (f < 16)
      g[f] = EV(g[f], g[f + 16]);
    barrier(1);
  }
  if (128 >= 8 << 1) {
    if (f < 8)
      g[f] = EV(g[f], g[f + 8]);
    barrier(1);
  }
  if (128 >= 4 << 1) {
    if (f < 4)
      g[f] = EV(g[f], g[f + 4]);
    barrier(1);
  }
  if (128 >= 2 << 1) {
    if (f < 2)
      g[f] = EV(g[f], g[f + 2]);
    barrier(1);
  }
  if (128 >= 1 << 1) {
    if (f < 1)
      g[f] = EV(g[f], g[f + 1]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void FA(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[64];
  a += e % b + (e / b) * b * c;
  g[f] = -1e38;
  for (unsigned h = f; h < c; h += 64) {
    g[f] = EV(g[f], a[h * b]);
  }
  barrier(1);
  if (64 >= 512 << 1) {
    if (f < 512)
      g[f] = EV(g[f], g[f + 512]);
    barrier(1);
  }
  if (64 >= 256 << 1) {
    if (f < 256)
      g[f] = EV(g[f], g[f + 256]);
    barrier(1);
  }
  if (64 >= 128 << 1) {
    if (f < 128)
      g[f] = EV(g[f], g[f + 128]);
    barrier(1);
  }
  if (64 >= 64 << 1) {
    if (f < 64)
      g[f] = EV(g[f], g[f + 64]);
    barrier(1);
  }
  if (64 >= 32 << 1) {
    if (f < 32)
      g[f] = EV(g[f], g[f + 32]);
    barrier(1);
  }
  if (64 >= 16 << 1) {
    if (f < 16)
      g[f] = EV(g[f], g[f + 16]);
    barrier(1);
  }
  if (64 >= 8 << 1) {
    if (f < 8)
      g[f] = EV(g[f], g[f + 8]);
    barrier(1);
  }
  if (64 >= 4 << 1) {
    if (f < 4)
      g[f] = EV(g[f], g[f + 4]);
    barrier(1);
  }
  if (64 >= 2 << 1) {
    if (f < 2)
      g[f] = EV(g[f], g[f + 2]);
    barrier(1);
  }
  if (64 >= 1 << 1) {
    if (f < 1)
      g[f] = EV(g[f], g[f + 1]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void FB(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[32];
  a += e % b + (e / b) * b * c;
  g[f] = -1e38;
  for (unsigned h = f; h < c; h += 32) {
    g[f] = EV(g[f], a[h * b]);
  }
  barrier(1);
  if (32 >= 512 << 1) {
    if (f < 512)
      g[f] = EV(g[f], g[f + 512]);
    barrier(1);
  }
  if (32 >= 256 << 1) {
    if (f < 256)
      g[f] = EV(g[f], g[f + 256]);
    barrier(1);
  }
  if (32 >= 128 << 1) {
    if (f < 128)
      g[f] = EV(g[f], g[f + 128]);
    barrier(1);
  }
  if (32 >= 64 << 1) {
    if (f < 64)
      g[f] = EV(g[f], g[f + 64]);
    barrier(1);
  }
  if (32 >= 32 << 1) {
    if (f < 32)
      g[f] = EV(g[f], g[f + 32]);
    barrier(1);
  }
  if (32 >= 16 << 1) {
    if (f < 16)
      g[f] = EV(g[f], g[f + 16]);
    barrier(1);
  }
  if (32 >= 8 << 1) {
    if (f < 8)
      g[f] = EV(g[f], g[f + 8]);
    barrier(1);
  }
  if (32 >= 4 << 1) {
    if (f < 4)
      g[f] = EV(g[f], g[f + 4]);
    barrier(1);
  }
  if (32 >= 2 << 1) {
    if (f < 2)
      g[f] = EV(g[f], g[f + 2]);
    barrier(1);
  }
  if (32 >= 1 << 1) {
    if (f < 1)
      g[f] = EV(g[f], g[f + 1]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void FC(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[16];
  a += e % b + (e / b) * b * c;
  g[f] = -1e38;
  for (unsigned h = f; h < c; h += 16) {
    g[f] = EV(g[f], a[h * b]);
  }
  barrier(1);
  if (16 >= 512 << 1) {
    if (f < 512)
      g[f] = EV(g[f], g[f + 512]);
    barrier(1);
  }
  if (16 >= 256 << 1) {
    if (f < 256)
      g[f] = EV(g[f], g[f + 256]);
    barrier(1);
  }
  if (16 >= 128 << 1) {
    if (f < 128)
      g[f] = EV(g[f], g[f + 128]);
    barrier(1);
  }
  if (16 >= 64 << 1) {
    if (f < 64)
      g[f] = EV(g[f], g[f + 64]);
    barrier(1);
  }
  if (16 >= 32 << 1) {
    if (f < 32)
      g[f] = EV(g[f], g[f + 32]);
    barrier(1);
  }
  if (16 >= 16 << 1) {
    if (f < 16)
      g[f] = EV(g[f], g[f + 16]);
    barrier(1);
  }
  if (16 >= 8 << 1) {
    if (f < 8)
      g[f] = EV(g[f], g[f + 8]);
    barrier(1);
  }
  if (16 >= 4 << 1) {
    if (f < 4)
      g[f] = EV(g[f], g[f + 4]);
    barrier(1);
  }
  if (16 >= 2 << 1) {
    if (f < 2)
      g[f] = EV(g[f], g[f + 2]);
    barrier(1);
  }
  if (16 >= 1 << 1) {
    if (f < 1)
      g[f] = EV(g[f], g[f + 1]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void FD(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[8];
  a += e % b + (e / b) * b * c;
  g[f] = -1e38;
  for (unsigned h = f; h < c; h += 8) {
    g[f] = EV(g[f], a[h * b]);
  }
  barrier(1);
  if (8 >= 512 << 1) {
    if (f < 512)
      g[f] = EV(g[f], g[f + 512]);
    barrier(1);
  }
  if (8 >= 256 << 1) {
    if (f < 256)
      g[f] = EV(g[f], g[f + 256]);
    barrier(1);
  }
  if (8 >= 128 << 1) {
    if (f < 128)
      g[f] = EV(g[f], g[f + 128]);
    barrier(1);
  }
  if (8 >= 64 << 1) {
    if (f < 64)
      g[f] = EV(g[f], g[f + 64]);
    barrier(1);
  }
  if (8 >= 32 << 1) {
    if (f < 32)
      g[f] = EV(g[f], g[f + 32]);
    barrier(1);
  }
  if (8 >= 16 << 1) {
    if (f < 16)
      g[f] = EV(g[f], g[f + 16]);
    barrier(1);
  }
  if (8 >= 8 << 1) {
    if (f < 8)
      g[f] = EV(g[f], g[f + 8]);
    barrier(1);
  }
  if (8 >= 4 << 1) {
    if (f < 4)
      g[f] = EV(g[f], g[f + 4]);
    barrier(1);
  }
  if (8 >= 2 << 1) {
    if (f < 2)
      g[f] = EV(g[f], g[f + 2]);
    barrier(1);
  }
  if (8 >= 1 << 1) {
    if (f < 1)
      g[f] = EV(g[f], g[f + 1]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void FE(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[4];
  a += e % b + (e / b) * b * c;
  g[f] = -1e38;
  for (unsigned h = f; h < c; h += 4) {
    g[f] = EV(g[f], a[h * b]);
  }
  barrier(1);
  if (4 >= 512 << 1) {
    if (f < 512)
      g[f] = EV(g[f], g[f + 512]);
    barrier(1);
  }
  if (4 >= 256 << 1) {
    if (f < 256)
      g[f] = EV(g[f], g[f + 256]);
    barrier(1);
  }
  if (4 >= 128 << 1) {
    if (f < 128)
      g[f] = EV(g[f], g[f + 128]);
    barrier(1);
  }
  if (4 >= 64 << 1) {
    if (f < 64)
      g[f] = EV(g[f], g[f + 64]);
    barrier(1);
  }
  if (4 >= 32 << 1) {
    if (f < 32)
      g[f] = EV(g[f], g[f + 32]);
    barrier(1);
  }
  if (4 >= 16 << 1) {
    if (f < 16)
      g[f] = EV(g[f], g[f + 16]);
    barrier(1);
  }
  if (4 >= 8 << 1) {
    if (f < 8)
      g[f] = EV(g[f], g[f + 8]);
    barrier(1);
  }
  if (4 >= 4 << 1) {
    if (f < 4)
      g[f] = EV(g[f], g[f + 4]);
    barrier(1);
  }
  if (4 >= 2 << 1) {
    if (f < 2)
      g[f] = EV(g[f], g[f + 2]);
    barrier(1);
  }
  if (4 >= 1 << 1) {
    if (f < 1)
      g[f] = EV(g[f], g[f + 1]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void FF(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[2];
  a += e % b + (e / b) * b * c;
  g[f] = -1e38;
  for (unsigned h = f; h < c; h += 2) {
    g[f] = EV(g[f], a[h * b]);
  }
  barrier(1);
  if (2 >= 512 << 1) {
    if (f < 512)
      g[f] = EV(g[f], g[f + 512]);
    barrier(1);
  }
  if (2 >= 256 << 1) {
    if (f < 256)
      g[f] = EV(g[f], g[f + 256]);
    barrier(1);
  }
  if (2 >= 128 << 1) {
    if (f < 128)
      g[f] = EV(g[f], g[f + 128]);
    barrier(1);
  }
  if (2 >= 64 << 1) {
    if (f < 64)
      g[f] = EV(g[f], g[f + 64]);
    barrier(1);
  }
  if (2 >= 32 << 1) {
    if (f < 32)
      g[f] = EV(g[f], g[f + 32]);
    barrier(1);
  }
  if (2 >= 16 << 1) {
    if (f < 16)
      g[f] = EV(g[f], g[f + 16]);
    barrier(1);
  }
  if (2 >= 8 << 1) {
    if (f < 8)
      g[f] = EV(g[f], g[f + 8]);
    barrier(1);
  }
  if (2 >= 4 << 1) {
    if (f < 4)
      g[f] = EV(g[f], g[f + 4]);
    barrier(1);
  }
  if (2 >= 2 << 1) {
    if (f < 2)
      g[f] = EV(g[f], g[f + 2]);
    barrier(1);
  }
  if (2 >= 1 << 1) {
    if (f < 1)
      g[f] = EV(g[f], g[f + 1]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}
kernel void FG(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_group_id(0);
  const unsigned f = get_local_id(0);
  local float g[1];
  a += e % b + (e / b) * b * c;
  g[f] = -1e38;
  for (unsigned h = f; h < c; h += 1) {
    g[f] = EV(g[f], a[h * b]);
  }
  barrier(1);
  if (1 >= 512 << 1) {
    if (f < 512)
      g[f] = EV(g[f], g[f + 512]);
    barrier(1);
  }
  if (1 >= 256 << 1) {
    if (f < 256)
      g[f] = EV(g[f], g[f + 256]);
    barrier(1);
  }
  if (1 >= 128 << 1) {
    if (f < 128)
      g[f] = EV(g[f], g[f + 128]);
    barrier(1);
  }
  if (1 >= 64 << 1) {
    if (f < 64)
      g[f] = EV(g[f], g[f + 64]);
    barrier(1);
  }
  if (1 >= 32 << 1) {
    if (f < 32)
      g[f] = EV(g[f], g[f + 32]);
    barrier(1);
  }
  if (1 >= 16 << 1) {
    if (f < 16)
      g[f] = EV(g[f], g[f + 16]);
    barrier(1);
  }
  if (1 >= 8 << 1) {
    if (f < 8)
      g[f] = EV(g[f], g[f + 8]);
    barrier(1);
  }
  if (1 >= 4 << 1) {
    if (f < 4)
      g[f] = EV(g[f], g[f + 4]);
    barrier(1);
  }
  if (1 >= 2 << 1) {
    if (f < 2)
      g[f] = EV(g[f], g[f + 2]);
    barrier(1);
  }
  if (1 >= 1 << 1) {
    if (f < 1)
      g[f] = EV(g[f], g[f + 1]);
    barrier(1);
  }
  if (f == 0)
    d[e] = g[0];
}

kernel void FH(const global float* a, const unsigned b, const unsigned c, const unsigned d, global float* e) {
  const unsigned f = get_global_id(0);
  if (f < d)
    e[f] = a[f % b + (f / c) * b];
}

kernel void FI(const global float* a, const global unsigned* b, const unsigned c, const unsigned d, global float* e) {
  const unsigned f = get_global_id(0);
  const unsigned g = get_group_id(1);
  const unsigned h = b[g * c] * d;
  const unsigned i = g * d;
  if (f < d)
    e[i + f] = a[h + f];
}

kernel void FJ(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_global_id(0);
  if (e < c)
    d[e] = a[e + b];
}

kernel void FK(const global float* a, const unsigned b, global float* c, const unsigned d) {
  const unsigned e = get_global_id(0);
  if (e < b)
    c[e + d] = a[e];
}

kernel void FL(const global float* a, const unsigned b, const unsigned c, global float* d) {
  const unsigned e = get_global_id(0);
  if (e < b) {
    float f = .0f;
    a += e;
    for (unsigned g = 0; g < c; ++g, a += b) {
      f += *a;
    }
    d[e] = f;
  }
}

kernel void FM(const global float* a, const global unsigned* b, const unsigned c, const unsigned d, global float* e) {
  const unsigned f = get_global_id(0);
  const unsigned g = get_group_id(1);
  const unsigned h = b[g * c] * d;
  const unsigned i = g * d;
  if (f < d)
    AE(e + h + f, a[i + f]);
}

kernel void FN(const global float* a, const unsigned b, global float* c, const unsigned d) {
  const unsigned e = get_global_id(0);
  if (e < b)
    c[e + d] += a[e];
}

kernel void FO(const float a, const unsigned b, global float* c) {
  const unsigned d = get_global_id(0);
  if (d < b)
    c[d] *= a;
}

kernel void FP(const global float* a, const unsigned b, const unsigned c, const unsigned d, global float* e) {
  const unsigned f = get_global_id(0);
  const unsigned g = get_group_id(1);
  const unsigned h = g * b;
  if (f < b)
    AE(e + f + d * h, a[f + c * h]);
}

kernel void FQ(const global float* a, const unsigned b, const unsigned c, const unsigned d, global float* e) {
  const unsigned f = get_global_id(0);
  const unsigned g = get_group_id(1);
  const unsigned h = g * b;
  if (f < b)
    AE(e + f + d * h, -a[f + c * h]);
}