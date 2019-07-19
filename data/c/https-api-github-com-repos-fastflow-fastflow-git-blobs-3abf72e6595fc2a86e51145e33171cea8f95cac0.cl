unsigned char A(__global unsigned char* a, const uint b, const uint c, const int d, const int e, const int f) {
  unsigned char g = (a[((d)*c + (e)) - f]);
  unsigned char h = 0;
  h += d > 0 && e > 0 ? (a[((d - 1) * c + (e - 1)) - f]) : 0;
  h += d > 0 ? (a[((d - 1) * c + (e)) - f]) : 0;
  h += d > 0 && e < c - 1 ? (a[((d - 1) * c + (e + 1)) - f]) : 0;
  h += e < c - 1 ? (a[((d)*c + (e + 1)) - f]) : 0;
  h += d < c - 1 && e < c - 1 ? (a[((d + 1) * c + (e + 1)) - f]) : 0;
  h += d < c - 1 ? (a[((d + 1) * c + (e)) - f]) : 0;
  h += d < c - 1 && e > 0 ? (a[((d + 1) * c + (e - 1)) - f]) : 0;
  h += e > 0 ? (a[((d)*c + (e - 1)) - f]) : 0;
  return (h == 3 || (g && h == 2));
}

__kernel void B(__global unsigned char* a, __global unsigned char* b, const uint c, const uint d, const uint e, const uint f, const uint g) {
  size_t h = get_global_id(0);
  size_t i = h + f;
  size_t j = i / d;
  size_t k = i % d;
  size_t l = get_local_size(0) * get_num_groups(0);
  while (h < e) {
    b[h + g] = A(a + g, c, d, j, k, f);
    h += l;
  }
}

unsigned char C(unsigned char a, unsigned char b) {
  return a || b;
}

__kernel void D(__global unsigned char* a, const uint b, __global unsigned char* c, const uint d, __local unsigned char* e, unsigned char f) {
  uint g = get_local_size(0);
  uint h = get_local_id(0);
  uint i = get_group_id(0) * g + get_local_id(0);
  uint j = g * get_num_groups(0);
  unsigned char k = f;
  a += b;
  if (i < d) {
    k = a[i];
    i += j;
  }
  while (i < d) {
    k = C(k, a[i]);
    i += j;
  }
  e[h] = k;
  barrier(1);
  if (g >= 512) {
    if (h < 256 && h + 256 < d) {
      e[h] = C(e[h], e[h + 256]);
    }
    barrier(1);
  }
  if (g >= 256) {
    if (h < 128 && h + 128 < d) {
      e[h] = C(e[h], e[h + 128]);
    }
    barrier(1);
  }
  if (g >= 128) {
    if (h < 64 && h + 64 < d) {
      e[h] = C(e[h], e[h + 64]);
    }
    barrier(1);
  }
  if (g >= 64) {
    if (h < 32 && h + 32 < d) {
      e[h] = C(e[h], e[h + 32]);
    }
    barrier(1);
  }
  if (g >= 32) {
    if (h < 16 && h + 16 < d) {
      e[h] = C(e[h], e[h + 16]);
    }
    barrier(1);
  }
  if (g >= 16) {
    if (h < 8 && h + 8 < d) {
      e[h] = C(e[h], e[h + 8]);
    }
    barrier(1);
  }
  if (g >= 8) {
    if (h < 4 && h + 4 < d) {
      e[h] = C(e[h], e[h + 4]);
    }
    barrier(1);
  }
  if (g >= 4) {
    if (h < 2 && h + 2 < d) {
      e[h] = C(e[h], e[h + 2]);
    }
    barrier(1);
  }
  if (g >= 2) {
    if (h < 1 && h + 1 < d) {
      e[h] = C(e[h], e[h + 1]);
    }
    barrier(1);
  }
  if (h == 0)
    c[get_group_id(0)] = e[h];
}