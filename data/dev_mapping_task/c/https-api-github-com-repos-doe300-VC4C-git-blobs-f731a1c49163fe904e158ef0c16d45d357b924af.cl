struct SBlobInfo {
  int ConnectType;
  int NbBlobs;
  int LastUsefulIteration;
};

uint A(int a, int b) {
  return b << 16 | a;
}

int2 B(uint a) {
  int2 b;
  b.x = a & 0xFFFF;
  b.y = (a >> 16) & 0xFFFF;
  return b;
}

uint C(global uint* a, uint b, uint c) {
  int2 d = B(c);

  uint e = a[d.y * b + d.x];

  while (c != e) {
    c = e;
    d = B(c);
    e = a[d.y * b + d.x];
  }

  return c;
}

uint D(global const uint* a, int b, int c, int d, int e, uint f, uint g, uint h) {
  int i = 0;
  uint j[8];

  if (b > 0)
    j[i++] = c * g + b - 1;

  if (b < d - 1)
    j[i++] = c * g + b + 1;

  if (c > 0) {
    j[i++] = (c - 1) * g + b;

    if (f == 8) {
      if (b > 0)
        j[i++] = (c - 1) * g + b - 1;

      if (b < d - 1)
        j[i++] = (c - 1) * g + b + 1;
    }
  }

  if (c < e - 1) {
    j[i++] = (c + 1) * g + b;

    if (f == 8) {
      if (b > 0)
        j[i++] = (c + 1) * g + b - 1;

      if (b < d - 1)
        j[i++] = (c + 1) * g + b + 1;
    }
  }

  uint k = h;

  for (int l = 0; l < i; l++)
    k = min(k, a[j[l]]);

  return k;
}

kernel void E(global const uchar* a, global uint* b, global uint* c, uint d, uint e, uint f, global struct SBlobInfo* g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);

  const bool j = (h == 0 && i == 0);

  const int2 k = { h i;

  d /= sizeof(uchar);
  e /= sizeof(uint);
  f /= sizeof(uint);

  const uint l = i * e + h;
  const uint m = i * f + h;

  int n = convert_int_sat(a[k.y * d + k.x]);

  bool o = n != 0;

  if (o) {
    uint p = A(h, i);
    b[l] = p;
    c[m] = p;
  } else {
    b[l] = 0xffffffff;
    c[m] = 0xffffffff;
  }
}

kernel void F(global uint* a, global uint* b, uint c, uint d, global struct SBlobInfo* e, int f) {
  const int g = get_global_size(0);
  const int h = get_global_size(1);
  const int i = get_global_id(0);
  const int j = get_global_id(1);

  c /= sizeof(uint);
  d /= sizeof(uint);

  const uint k = j * c + i;

  uint l = a[k];

  bool m = l != 0xffffffff;

  if (m) {
    uint n = D(a, i, j, g, h, e->ConnectType, c, l);

    if (n < l) {
      int2 o = B(l);
      uint p = atomic_min(&b[o.y * d + o.x], n);
      if (n < p)
        e->LastUsefulIteration = f;
    }
  }
}

kernel void G(global uint* a, global uint* b, uint c, uint d, global struct SBlobInfo* e, int f) {
  if (e->LastUsefulIteration < f)
    return;

  const int g = get_global_id(0);
  const int h = get_global_id(1);

  c /= sizeof(uint);
  d /= sizeof(uint);

  const uint i = h * c + g;
  const uint j = h * d + g;

  uint k = a[i];

  bool l = k != 0xffffffff;

  if (l) {
    uint m = C(b, d, k);

    if (k != m) {
      b[j] = m;
      a[i] = m;
    }
  }
}

kernel void H(global uint* a, global uint* b, uint c, uint d, global struct SBlobInfo* e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);

  c /= sizeof(uint);
  d /= sizeof(uint);

  const uint h = g * c + f;
  const uint i = g * d + f;

  uint j = a[h];

  if (j != 0xffffffff) {
    if (j == A(f, g)) {
      uint k = atomic_add(&e->NbBlobs, 1);
      b[i] = k;
    }
  }
}

kernel void I(global uint* a, global uint* b, uint c, uint d, global struct SBlobInfo* e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);

  c /= sizeof(uint);
  d /= sizeof(uint);

  const uint h = g * c + f;

  uint i = a[h];

  if (i != 0xffffffff) {
    int2 j = B(i);
    a[h] = b[j.y * d + j.x];
  }
}