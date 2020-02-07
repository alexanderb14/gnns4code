typedef struct AnsTableEntry_Struct {
  ushort freq;
  ushort cum_freq;
  uchar symbol;
} AnsTableEntry;

__kernel void A(const __global ushort* a, __global AnsTableEntry* b) {
  __local ushort c[256];

  uint d = get_local_id(0);
  if (d < 256) {
    int e = d + get_local_size(0) * get_global_id(1);
    c[d] = a[e];
  }

  barrier(1);

  uint f = 256;
  uint g = 1;
  for (uint h = f >> 1; h > 0; h >>= 1) {
    barrier(1);
    if (d < h) {
      uint i = g * (2 * d + 1) - 1;
      uint j = g * (2 * d + 2) - 1;
      c[j] += c[i];
    }
    g *= 2;
  }

  if (d == 0) {
    c[256 - 1] = 0;
  }

  for (uint h = 1; h < 256; h *= 2) {
    g >>= 1;
    barrier(1);
    if (d < h) {
      uint i = g * (2 * d + 1) - 1;
      uint j = g * (2 * d + 2) - 1;

      uint k = c[i];
      c[i] = c[j];
      c[j] += k;
    }
  }

  barrier(1);

  uint l = get_global_id(0);

  uint m = 0;
  uint n = 256 - 1;
  uint o = (n + m) / 2;

  for (int p = 0; p < 11; ++p) {
    uint q = (uint)(l < c[o]);
    uint r = (uint)(o < 256 - 1 && c[o + 1] <= l);

    m = (r)*max(m + 1, o) + ((1 - r) * m);
    n = (q)*min(n - 1, o) + ((1 - q) * n);
    o = (n + m) / 2;
  }

  int s = l + get_global_size(0) * get_global_id(1);
  int t = o + get_local_size(0) * get_global_id(1);
  b[s].freq = a[t];
  b[s].cum_freq = c[o];
  b[s].symbol = o;
}