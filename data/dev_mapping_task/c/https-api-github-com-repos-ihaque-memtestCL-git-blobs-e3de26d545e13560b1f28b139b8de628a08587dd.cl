unsigned A(uint a) {
  if (a == 0)
    return 0;
  if ((a &= a - 1) == 0)
    return 1;
  if ((a &= a - 1) == 0)
    return 2;
  if ((a &= a - 1) == 0)
    return 3;
  if ((a &= a - 1) == 0)
    return 4;
  if ((a &= a - 1) == 0)
    return 5;
  if ((a &= a - 1) == 0)
    return 6;
  if ((a &= a - 1) == 0)
    return 7;
  if ((a &= a - 1) == 0)
    return 8;
  if ((a &= a - 1) == 0)
    return 9;
  if ((a &= a - 1) == 0)
    return 10;
  if ((a &= a - 1) == 0)
    return 11;
  if ((a &= a - 1) == 0)
    return 12;
  if ((a &= a - 1) == 0)
    return 13;
  if ((a &= a - 1) == 0)
    return 14;
  if ((a &= a - 1) == 0)
    return 15;
  if ((a &= a - 1) == 0)
    return 16;
  if ((a &= a - 1) == 0)
    return 17;
  if ((a &= a - 1) == 0)
    return 18;
  if ((a &= a - 1) == 0)
    return 19;
  if ((a &= a - 1) == 0)
    return 20;
  if ((a &= a - 1) == 0)
    return 21;
  if ((a &= a - 1) == 0)
    return 22;
  if ((a &= a - 1) == 0)
    return 23;
  if ((a &= a - 1) == 0)
    return 24;
  if ((a &= a - 1) == 0)
    return 25;
  if ((a &= a - 1) == 0)
    return 26;
  if ((a &= a - 1) == 0)
    return 27;
  if ((a &= a - 1) == 0)
    return 28;
  if ((a &= a - 1) == 0)
    return 29;
  if ((a &= a - 1) == 0)
    return 30;
  if ((a &= a - 1) == 0)
    return 31;
  return 32;
}

__kernel void B(__global uint* a, uint b, const uint c) {
  for (uint d = 0; d < b; d++) {
    *((a + get_group_id(0) * b * get_local_size(0) + d * get_local_size(0) + get_local_id(0))) = c;
  }
}
__kernel void C(__global uint* a, uint b, const uint c, __global uint* d, __local uint* e) {
  e[get_local_id(0)] = 0;

  for (uint f = 0; f < b; f++) {
    e[get_local_id(0)] += A((*((a + get_group_id(0) * b * get_local_size(0) + f * get_local_size(0) + get_local_id(0)))) ^ (c));
  }

  for (uint g = get_local_size(0) >> 1; g > 0; g >>= 1) {
    barrier(1);
    if (get_local_id(0) < g)
      e[get_local_id(0)] += e[get_local_id(0) + g];
  }
  barrier(1);

  if (get_local_id(0) == 0)
    d[get_group_id(0)] = e[0];

  return;
}
__kernel void D(__global uint* a, uint b, uint c, const int d) {
  int e, f;
  switch (d) {
    case 1024:
      e = 0x0fbfffff;
      f = 0x3bf75696;
      break;
    case 512:
      e = 0x61c8647f;
      f = 0x2b3e0000;
      break;
    case 256:
      e = 0x7161ac7f;
      f = 0x43840000;
      break;
    case 128:
      e = 0x0432b47f;
      f = 0x1ce80000;
      break;
    case 2048:
      e = 0x763fffff;
      f = 0x4769466f;
      break;
    default:
      e = 0;
      f = 0;
      break;
  }

  uint g = 0;
  for (uint h = 0; h < c; h++) {
    (g) = ~(g);
    for (uint i = 0; i < d; i++) {
      (g) = ~(g);
      (g) = (e) * (g) + (f);
      (g) ^= 0xFFFFFFF0;
      (g) ^= 0xF;
    }
    (g) = ~(g);
  }

  for (uint j = 0; j < b; j++) {
    *((a + get_group_id(0) * b * get_local_size(0) + j * get_local_size(0) + get_local_id(0))) = g;
  }
}

__kernel void E(__global uint* a, uint b, uint c, const int d, __local uint* e) {
  int f, g;
  switch (d) {
    case 1024:
      f = 0x0fbfffff;
      g = 0x3bf75696;
      break;
    case 512:
      f = 0x61c8647f;
      g = 0x2b3e0000;
      break;
    case 256:
      f = 0x7161ac7f;
      g = 0x43840000;
      break;
    case 128:
      f = 0x0432b47f;
      g = 0x1ce80000;
      break;
    case 2048:
      f = 0x763fffff;
      g = 0x4769466f;
      break;
    default:
      f = 0;
      g = 0;
      break;
  }
  e[get_local_id(0)] = 0;
  for (uint h = 0; h < c; h++) {
    (e[get_local_id(0)]) = ~(e[get_local_id(0)]);
    for (uint i = 0; i < d; i++) {
      (e[get_local_id(0)]) = ~(e[get_local_id(0)]);
      (e[get_local_id(0)]) = (f) * (e[get_local_id(0)]) + (g);
      (e[get_local_id(0)]) ^= 0xFFFFFFF0;
      (e[get_local_id(0)]) ^= 0xF;
    }
    (e[get_local_id(0)]) = ~(e[get_local_id(0)]);
  }

  for (uint j = 0; j < b; j++) {
    *((a + get_group_id(0) * b * get_local_size(0) + j * get_local_size(0) + get_local_id(0))) = e[get_local_id(0)];
  }
}

__kernel void F(__global uint* a, uint b, uint c, uint d) {
  uint e = get_local_id(0) & 0x1;
  e *= 0xFFFFFFFF;

  const uint f = (e & d) | ((~e) & c);
  for (uint g = 0; g < b; g++) {
    *((a + get_group_id(0) * b * get_local_size(0) + g * get_local_size(0) + get_local_id(0))) = f;
  }
}

__kernel void G(__global uint* a, uint b, uint c, uint d, __global uint* e, __local uint* f) {
  f[get_local_id(0)] = 0;

  uint g = get_local_id(0) & 0x1;
  g *= 0xFFFFFFFF;

  const uint h = (g & d) | ((~g) & c);

  for (uint i = 0; i < b; i++) {
    f[get_local_id(0)] += A((*((a + get_group_id(0) * b * get_local_size(0) + i * get_local_size(0) + get_local_id(0)))) ^ (h));
  }

  for (uint j = get_local_size(0) >> 1; j > 0; j >>= 1) {
    barrier(1);
    if (get_local_id(0) < j)
      f[get_local_id(0)] += f[get_local_id(0) + j];
  }
  barrier(1);

  if (get_local_id(0) == 0)
    e[get_group_id(0)] = f[0];

  return;
}

__kernel void H(__global uint* a, uint b, int c, uint d) {
  uint e = 1 << ((get_local_id(0) + d) & 0x1f);
  e = c ? e : ~e;

  for (uint f = 0; f < b; f++) {
    *((a + get_group_id(0) * b * get_local_size(0) + f * get_local_size(0) + get_local_id(0))) = e;
  }
}

__kernel void I(__global uint* a, uint b, int c, uint d, __global uint* e, __local uint* f) {
  f[get_local_id(0)] = 0;

  uint g = 1 << ((get_local_id(0) + d) & 0x1f);
  g = c ? g : ~g;

  for (uint h = 0; h < b; h++) {
    f[get_local_id(0)] += A((*((a + get_group_id(0) * b * get_local_size(0) + h * get_local_size(0) + get_local_id(0)))) ^ (g));
  }

  for (uint i = get_local_size(0) >> 1; i > 0; i >>= 1) {
    barrier(1);
    if (get_local_id(0) < i)
      f[get_local_id(0)] += f[get_local_id(0) + i];
  }
  barrier(1);

  if (get_local_id(0) == 0)
    e[get_group_id(0)] = f[0];

  return;
}

void J(uint a, uint b, uint* c, uint* d) {
  *c = a * b;
  *d = mul_hi(a, b);
  *d <<= 1;
  *d |= ((*c) & 0x80000000) >> 31;
  *c &= 0x7FFFFFFF;
}

uint K(uint a, uint b) {
  uint c = a + b;
  if (c >= 0x80000000) {
    return c - 0x80000000 + 1;
  } else {
    return c;
  }
}
uint L(uint a, uint b) {
  uint c, d;
  J(a, b, &c, &d);
  return K(c, d);
}

uint M(uint a, uint b) {
  uint c = 1;
  while (b > 0) {
    if (b & 1) {
      c = L(c, a);
    }
    b >>= 1;
    a = L(a, a);
  }
  return c;
}

uint N(int a, int b) {
  uint c = M(16807, b + 1);
  return L(c, a);
}

int O(uint* a) {
  const uint b = 1;
  const uint c = 2;
  const uint d = 16;
  const uint e = 131072;
  const uint f = b + c + d;
  if ((*a) & e) {
    *a = (((*a) ^ f) << 1) | b;
    return 1;
  } else {
    *a <<= 1;
    return 0;
  }
}
int P(__local uint* a) {
  const uint b = 1;
  const uint c = 2;
  const uint d = 16;
  const uint e = 131072;
  const uint f = b + c + d;
  if ((*a) & e) {
    *a = (((*a) ^ f) << 1) | b;
    return 1;
  } else {
    *a <<= 1;
    return 0;
  }
}

__kernel void Q(__global uint* a, uint b, int c, __local uint* d) {
  if (c == 0)
    c = 123459876 + get_group_id(0);
  uint e = N(c + get_local_id(0), get_local_id(0));

  for (uint f = 0; f < b; f++) {
    d[get_local_id(0)] = N(c, get_local_id(0)) | (O(&e) << 31);
    barrier(1);

    c = d[get_local_size(0) - 1];

    barrier(1);

    *((a + get_group_id(0) * b * get_local_size(0) + f * get_local_size(0) + get_local_id(0))) = d[get_local_id(0)];
  }
}

__kernel void R(__global uint* a, uint b, int c, __global uint* d, __local uint* e, __local uint* f, __local uint* g) {
  e[get_local_id(0)] = 0;

  if (c == 0)
    c = 123459876 + get_group_id(0);

  g[get_local_id(0)] = N(c + get_local_id(0), get_local_id(0));
  for (uint h = 0; h < b; h++) {
    f[get_local_id(0)] = N(c, get_local_id(0)) | (P(g + get_local_id(0)) << 31);
    barrier(1);

    c = f[get_local_size(0) - 1];

    barrier(1);

    e[get_local_id(0)] += A((*((a + get_group_id(0) * b * get_local_size(0) + h * get_local_size(0) + get_local_id(0)))) ^ (f[get_local_id(0)]));
  }

  for (uint i = get_local_size(0) >> 1; i > 0; i >>= 1) {
    barrier(1);
    if (get_local_id(0) < i)
      e[get_local_id(0)] += e[get_local_id(0) + i];
  }
  barrier(1);

  if (get_local_id(0) == 0)
    d[get_group_id(0)] = e[0];

  return;
}
__kernel void S(__global uint* a, const uint b, const uint c, const uint d, const uint e, const uint f, const uint g) {
  const uint h = (get_group_id(0) * b * get_local_size(0) + get_local_id(0));
  const uint i = h / f;
  const uint j = h - (i * f);
  const uint k = get_local_size(0) / f;
  const uint l = get_local_size(0) - (f * k);
  uint m;
  uint n, o;
  n = i;
  o = j;
  for (uint p = 0; p < b; p++) {
    m = n * f + o;
    if (o == c)
      *(a + m) = d;
    n += k;
    o += l;
    if (o >= f) {
      o -= f;
      n++;
    }
  }
  barrier(1 | 2);
  for (uint q = 0; q < g; q++) {
    n = i;
    o = j;
    for (uint p = 0; p < b; p++) {
      m = n * f + o;
      if (o != c)
        *(a + m) = e;
      n += k;
      o += l;
      if (o >= f) {
        o -= f;
        n++;
      }
    }
  }
}

__kernel void T(__global uint* a, uint b, const uint c, const uint d, const uint e, __global uint* f, __local uint* g) {
  g[get_local_id(0)] = 0;
  uint h;

  for (uint i = 0; i < b; i++) {
    h = (get_group_id(0) * b * get_local_size(0) + i * get_local_size(0) + get_local_id(0));
    if ((h % e) == c)
      g[get_local_id(0)] += A((*(a + h)) ^ (d));
  }

  for (uint j = get_local_size(0) >> 1; j > 0; j >>= 1) {
    barrier(1);
    if (get_local_id(0) < j)
      g[get_local_id(0)] += g[get_local_id(0) + j];
  }
  barrier(1);

  if (get_local_id(0) == 0)
    f[get_group_id(0)] = g[0];

  return;
}