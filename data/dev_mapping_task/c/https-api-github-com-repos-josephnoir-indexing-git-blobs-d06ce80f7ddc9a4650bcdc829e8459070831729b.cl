kernel void A(global uint* restrict a, global uint* restrict b, private uint c) {
  uint d = get_global_id(0);
  if (d < c)
    b[d] = d;
}
kernel void B(global const uint* restrict a, global const uint* restrict b, global uint* restrict c, global uint* restrict d) {
  int e = get_global_id(0);
  int f = get_global_size(0);
  uint g = a[e];
  uint h = b[e];

  int i = 0;
  for (int j = 0; j < f; j++) {
    uint k = a[j];
    bool l = (k < g) || (k == g && j < e);
    i += (l) ? 1 : 0;
  }
  c[i] = g;
  d[i] = h;
}

kernel void C(global const uint* restrict a, global uint* restrict b, int c, int d) {
  int e = get_global_id(0);
  int f = e ^ c;

  uint g = a[e];
  uint h = g;
  uint i = a[f];
  uint j = i;

  bool k = (j < h) || (j == h && f < e);
  bool l = k ^ (f < e) ^ ((d & e) != 0);

  b[e] = (l) ? i : g;
}

kernel void D(global const uint* restrict a, global uint* restrict b, int c, int d) {
  int e = get_global_id(0);
  int f = e & (c - 1);
  int g = (e << 1) - f;
  int h = g | c;

  uint i = a[g];
  uint j = i;
  uint k = a[h];
  uint l = k;

  bool m = (l < j) || (l == j && h < g);
  bool n = m ^ ((d & g) != 0);

  b[g] = (n) ? k : i;
  b[h] = (n) ? i : k;
}
kernel void E(global uint* restrict a, global uint* restrict b, global uint* restrict c) {
  uint d = a[0];
  uint e = a[1];
  int f = get_global_id(0);
  int g = f & (d - 1);
  int h = (f << 1) - g;
  bool i = ((e & h) == 0);
  b += h;
  c += h;

  uint j = b[0];
  uint k = c[0];
  uint l = b[d];
  uint m = c[d];

  bool n = i ^ (j < l);

  b[0] = (n) ? l : j;
  c[0] = (n) ? m : k;
  b[d] = (n) ? j : l;
  c[d] = (n) ? k : m;
}

kernel void F(global uint* restrict a, int b, int c) {
  b >>= 1;
  int d = get_global_id(0);
  int e = d & (b - 1);
  int f = ((d - e) << 2) + e;
  bool g = ((c & f) == 0);
  a += f;

  uint h = a[0];
  uint i = a[b];
  uint j = a[2 * b];
  uint k = a[3 * b];

  {
    bool l = g ^ (h < j);
    uint m = h;
    uint n = j;
    h = (l) ? n : m;
    j = (l) ? m : n;
  }
  {
    bool l = g ^ (i < k);
    uint m = i;
    uint n = k;
    i = (l) ? n : m;
    k = (l) ? m : n;
  }
  {
    bool l = g ^ (h < i);
    uint m = h;
    uint n = i;
    h = (l) ? n : m;
    i = (l) ? m : n;
  }
  {
    bool l = g ^ (j < k);
    uint m = j;
    uint n = k;
    j = (l) ? n : m;
    k = (l) ? m : n;
  }

  a[0] = h;
  a[b] = i;
  a[2 * b] = j;
  a[3 * b] = k;
}
kernel void G(global uint* restrict a, int b, int c) {
  b >>= 2;
  int d = get_global_id(0);
  int e = d & (b - 1);
  int f = ((d - e) << 3) + e;
  bool g = ((c & f) == 0);
  a += f;

  uint h[8];
  for (int i = 0; i < 8; i++)
    h[i] = a[i * b];

  {
    for (int j = 0; j < 4; j++) {
      {
        bool k = g ^ (h[0 + j] < h[0 + j + 4]);
        uint l = h[0 + j];
        uint m = h[0 + j + 4];
        h[0 + j] = (k) ? m : l;
        h[0 + j + 4] = (k) ? l : m;
      }
    }
    {
      for (int n = 0; n < 2; n++) {
        {
          bool k = g ^ (h[0 + n] < h[0 + n + 2]);
          uint l = h[0 + n];
          uint m = h[0 + n + 2];
          h[0 + n] = (k) ? m : l;
          h[0 + n + 2] = (k) ? l : m;
        }
      }
      {{bool k = g ^ (h[0] < h[0 + 1]);
      uint l = h[0];
      uint m = h[0 + 1];
      h[0] = (k) ? m : l;
      h[0 + 1] = (k) ? l : m;
    }
  }
  {
    {
      bool k = g ^ (h[0 + 2] < h[0 + 2 + 1]);
      uint l = h[0 + 2];
      uint m = h[0 + 2 + 1];
      h[0 + 2] = (k) ? m : l;
      h[0 + 2 + 1] = (k) ? l : m;
    }
  }
}
{
  for (int n = 0; n < 2; n++) {
    {
      bool k = g ^ (h[0 + 4 + n] < h[0 + 4 + n + 2]);
      uint l = h[0 + 4 + n];
      uint m = h[0 + 4 + n + 2];
      h[0 + 4 + n] = (k) ? m : l;
      h[0 + 4 + n + 2] = (k) ? l : m;
    }
  }
  {{bool k = g ^ (h[0 + 4] < h[0 + 4 + 1]);
  uint l = h[0 + 4];
  uint m = h[0 + 4 + 1];
  h[0 + 4] = (k) ? m : l;
  h[0 + 4 + 1] = (k) ? l : m;
}
}
{
  {
    bool k = g ^ (h[0 + 4 + 2] < h[0 + 4 + 2 + 1]);
    uint l = h[0 + 4 + 2];
    uint m = h[0 + 4 + 2 + 1];
    h[0 + 4 + 2] = (k) ? m : l;
    h[0 + 4 + 2 + 1] = (k) ? l : m;
  }
}
}
}

for (int i = 0; i < 8; i++)
  a[i * b] = h[i];
}

kernel void H(global uint* restrict a, int b, int c) {
  b >>= 3;
  int d = get_global_id(0);
  int e = d & (b - 1);
  int f = ((d - e) << 4) + e;
  bool g = ((c & f) == 0);
  a += f;

  uint h[16];
  for (int i = 0; i < 16; i++)
    h[i] = a[i * b];

  {
    for (int j = 0; j < 8; j++) {
      {
        bool k = g ^ (h[0 + j] < h[0 + j + 8]);
        uint l = h[0 + j];
        uint m = h[0 + j + 8];
        h[0 + j] = (k) ? m : l;
        h[0 + j + 8] = (k) ? l : m;
      }
    }
    {
      for (int n = 0; n < 4; n++) {
        {
          bool k = g ^ (h[0 + n] < h[0 + n + 4]);
          uint l = h[0 + n];
          uint m = h[0 + n + 4];
          h[0 + n] = (k) ? m : l;
          h[0 + n + 4] = (k) ? l : m;
        }
      }
      {
        for (int o = 0; o < 2; o++) {
          {
            bool k = g ^ (h[0 + o] < h[0 + o + 2]);
            uint l = h[0 + o];
            uint m = h[0 + o + 2];
            h[0 + o] = (k) ? m : l;
            h[0 + o + 2] = (k) ? l : m;
          }
        }
        {{bool k = g ^ (h[0] < h[0 + 1]);
        uint l = h[0];
        uint m = h[0 + 1];
        h[0] = (k) ? m : l;
        h[0 + 1] = (k) ? l : m;
      }
    }
    {
      {
        bool k = g ^ (h[0 + 2] < h[0 + 2 + 1]);
        uint l = h[0 + 2];
        uint m = h[0 + 2 + 1];
        h[0 + 2] = (k) ? m : l;
        h[0 + 2 + 1] = (k) ? l : m;
      }
    }
  }
  {
    for (int o = 0; o < 2; o++) {
      {
        bool k = g ^ (h[0 + 4 + o] < h[0 + 4 + o + 2]);
        uint l = h[0 + 4 + o];
        uint m = h[0 + 4 + o + 2];
        h[0 + 4 + o] = (k) ? m : l;
        h[0 + 4 + o + 2] = (k) ? l : m;
      }
    }
    {{bool k = g ^ (h[0 + 4] < h[0 + 4 + 1]);
    uint l = h[0 + 4];
    uint m = h[0 + 4 + 1];
    h[0 + 4] = (k) ? m : l;
    h[0 + 4 + 1] = (k) ? l : m;
  }
}
{
  {
    bool k = g ^ (h[0 + 4 + 2] < h[0 + 4 + 2 + 1]);
    uint l = h[0 + 4 + 2];
    uint m = h[0 + 4 + 2 + 1];
    h[0 + 4 + 2] = (k) ? m : l;
    h[0 + 4 + 2 + 1] = (k) ? l : m;
  }
}
}
}
{
  for (int n = 0; n < 4; n++) {
    {
      bool k = g ^ (h[0 + 8 + n] < h[0 + 8 + n + 4]);
      uint l = h[0 + 8 + n];
      uint m = h[0 + 8 + n + 4];
      h[0 + 8 + n] = (k) ? m : l;
      h[0 + 8 + n + 4] = (k) ? l : m;
    }
  }
  {
    for (int o = 0; o < 2; o++) {
      {
        bool k = g ^ (h[0 + 8 + o] < h[0 + 8 + o + 2]);
        uint l = h[0 + 8 + o];
        uint m = h[0 + 8 + o + 2];
        h[0 + 8 + o] = (k) ? m : l;
        h[0 + 8 + o + 2] = (k) ? l : m;
      }
    }
    {{bool k = g ^ (h[0 + 8] < h[0 + 8 + 1]);
    uint l = h[0 + 8];
    uint m = h[0 + 8 + 1];
    h[0 + 8] = (k) ? m : l;
    h[0 + 8 + 1] = (k) ? l : m;
  }
}
{
  {
    bool k = g ^ (h[0 + 8 + 2] < h[0 + 8 + 2 + 1]);
    uint l = h[0 + 8 + 2];
    uint m = h[0 + 8 + 2 + 1];
    h[0 + 8 + 2] = (k) ? m : l;
    h[0 + 8 + 2 + 1] = (k) ? l : m;
  }
}
}
{
  for (int o = 0; o < 2; o++) {
    {
      bool k = g ^ (h[0 + 8 + 4 + o] < h[0 + 8 + 4 + o + 2]);
      uint l = h[0 + 8 + 4 + o];
      uint m = h[0 + 8 + 4 + o + 2];
      h[0 + 8 + 4 + o] = (k) ? m : l;
      h[0 + 8 + 4 + o + 2] = (k) ? l : m;
    }
  }
  {{bool k = g ^ (h[0 + 8 + 4] < h[0 + 8 + 4 + 1]);
  uint l = h[0 + 8 + 4];
  uint m = h[0 + 8 + 4 + 1];
  h[0 + 8 + 4] = (k) ? m : l;
  h[0 + 8 + 4 + 1] = (k) ? l : m;
}
}
{
  {
    bool k = g ^ (h[0 + 8 + 4 + 2] < h[0 + 8 + 4 + 2 + 1]);
    uint l = h[0 + 8 + 4 + 2];
    uint m = h[0 + 8 + 4 + 2 + 1];
    h[0 + 8 + 4 + 2] = (k) ? m : l;
    h[0 + 8 + 4 + 2 + 1] = (k) ? l : m;
  }
}
}
}
}

for (int i = 0; i < 16; i++)
  a[i * b] = h[i];
}