float A(const uint* const a) {
  return ((*a) * ((1.0f) / (0xffffffff + (1.0f))) + ((0.5f) * ((1.0f) / (0xffffffff + (1.0f)))));
}

void B(__global uchar* a, const uint* const b, const uint* const c, const uint* const d, const uint* const e, const uint* const f) {
  a[*b] = *c;
  a[*b + 2048] = *c >> 8;
  a[*b + 2 * 2048] = *c >> 16;
  a[*b + 3 * 2048] = *c >> 24;
  a[*b + 4 * 2048] = *d;
  a[*b + 5 * 2048] = *d >> 8;
  a[*b + 6 * 2048] = *d >> 16;
  a[*b + 7 * 2048] = *d >> 24;
  a[*b + 8 * 2048] = *e;
  a[*b + 9 * 2048] = *e >> 8;
  a[*b + 10 * 2048] = *e >> 16;
  a[*b + 11 * 2048] = *e >> 24;
  a[*b + 12 * 2048] = *f;
  a[*b + 13 * 2048] = *f >> 8;
  a[*b + 14 * 2048] = *f >> 16;
  a[*b + 15 * 2048] = *f >> 24;
}

void C(__global char* a, const uint* const b, const uint* const c, const uint* const d, const uint* const e, const uint* const f) {
  a[*b] = (*c) & 0x1;
  a[*b + 2048] = (*c >> 1) & 0x1;
  a[*b + 2 * 2048] = (*c >> 2) & 0x1;
  a[*b + 3 * 2048] = (*c >> 3) & 0x1;
  a[*b + 4 * 2048] = (*d) & 0x1;
  a[*b + 5 * 2048] = (*d >> 1) & 0x1;
  a[*b + 6 * 2048] = (*d >> 2) & 0x1;
  a[*b + 7 * 2048] = (*d >> 3) & 0x1;
  a[*b + 8 * 2048] = (*e) & 0x1;
  a[*b + 9 * 2048] = (*e >> 1) & 0x1;
  a[*b + 10 * 2048] = (*e >> 2) & 0x1;
  a[*b + 11 * 2048] = (*e >> 3) & 0x1;
  a[*b + 12 * 2048] = (*f) & 0x1;
  a[*b + 13 * 2048] = (*f >> 1) & 0x1;
  a[*b + 14 * 2048] = (*f >> 2) & 0x1;
  a[*b + 15 * 2048] = (*f >> 3) & 0x1;
}

void D(__global short* a, const uint* const b, const uint* const c, const uint* const d, const uint* const e, const uint* const f) {
  a[*b] = *c;
  a[*b + 2048] = *c >> 16;
  a[*b + 2 * 2048] = *d;
  a[*b + 3 * 2048] = *d >> 16;
  a[*b + 4 * 2048] = *e;
  a[*b + 5 * 2048] = *e >> 16;
  a[*b + 6 * 2048] = *f;
  a[*b + 7 * 2048] = *f >> 16;
}

void E(__global ushort* a, const uint* const b, const uint* const c, const uint* const d, const uint* const e, const uint* const f) {
  a[*b] = *c;
  a[*b + 2048] = *c >> 16;
  a[*b + 2 * 2048] = *d;
  a[*b + 3 * 2048] = *d >> 16;
  a[*b + 4 * 2048] = *e;
  a[*b + 5 * 2048] = *e >> 16;
  a[*b + 6 * 2048] = *f;
  a[*b + 7 * 2048] = *f >> 16;
}

void F(__global int* a, const uint* const b, const uint* const c, const uint* const d, const uint* const e, const uint* const f) {
  a[*b] = *c;
  a[*b + 2048] = *d;
  a[*b + 2 * 2048] = *e;
  a[*b + 3 * 2048] = *f;
}

void G(__global uint* a, const uint* const b, const uint* const c, const uint* const d, const uint* const e, const uint* const f) {
  a[*b] = *c;
  a[*b + 2048] = *d;
  a[*b + 2 * 2048] = *e;
  a[*b + 3 * 2048] = *f;
}

void H(__global long* a, const uint* const b, const uint* const c, const uint* const d, const uint* const e, const uint* const f) {
  long g = *d;
  g = (g << 32) | *c;
  long h = *f;
  h = (h << 32) | *e;
  a[*b] = g;
  a[*b + 2048] = h;
}

void I(__global ulong* a, const uint* const b, const uint* const c, const uint* const d, const uint* const e, const uint* const f) {
  long g = *d;
  g = (g << 32) | *c;
  long h = *f;
  h = (h << 32) | *e;
  a[*b] = g;
  a[*b + 2048] = h;
}

void J(__global float* a, const uint* const b, const uint* const c, const uint* const d, const uint* const e, const uint* const f) {
  a[*b] = 1.f - A(c);
  a[*b + 2048] = 1.f - A(d);
  a[*b + 2 * 2048] = 1.f - A(e);
  a[*b + 3 * 2048] = 1.f - A(f);
}

void K(__global uchar* a, const uint* const b, const uint* const c, const uint* const d, const uint* const e, const uint* const f, const uint* const g) {
  if (*b < *g) {
    a[*b] = *c;
  }
  if (*b + 2048 < *g) {
    a[*b + 2048] = *c >> 8;
  }
  if (*b + 2 * 2048 < *g) {
    a[*b + 2 * 2048] = *c >> 16;
  }
  if (*b + 3 * 2048 < *g) {
    a[*b + 3 * 2048] = *c >> 24;
  }
  if (*b + 4 * 2048 < *g) {
    a[*b + 4 * 2048] = *d;
  }
  if (*b + 5 * 2048 < *g) {
    a[*b + 5 * 2048] = *d >> 8;
  }
  if (*b + 6 * 2048 < *g) {
    a[*b + 6 * 2048] = *d >> 16;
  }
  if (*b + 7 * 2048 < *g) {
    a[*b + 7 * 2048] = *d >> 24;
  }
  if (*b + 8 * 2048 < *g) {
    a[*b + 8 * 2048] = *e;
  }
  if (*b + 9 * 2048 < *g) {
    a[*b + 9 * 2048] = *e >> 8;
  }
  if (*b + 10 * 2048 < *g) {
    a[*b + 10 * 2048] = *e >> 16;
  }
  if (*b + 11 * 2048 < *g) {
    a[*b + 11 * 2048] = *e >> 24;
  }
  if (*b + 12 * 2048 < *g) {
    a[*b + 12 * 2048] = *f;
  }
  if (*b + 13 * 2048 < *g) {
    a[*b + 13 * 2048] = *f >> 8;
  }
  if (*b + 14 * 2048 < *g) {
    a[*b + 14 * 2048] = *f >> 16;
  }
  if (*b + 15 * 2048 < *g) {
    a[*b + 15 * 2048] = *f >> 24;
  }
}

void L(__global char* a, const uint* const b, const uint* const c, const uint* const d, const uint* const e, const uint* const f, const uint* const g) {
  if (*b < *g) {
    a[*b] = (*c) & 0x1;
  }
  if (*b + 2048 < *g) {
    a[*b + 2048] = (*c >> 1) & 0x1;
  }
  if (*b + 2 * 2048 < *g) {
    a[*b + 2 * 2048] = (*c >> 2) & 0x1;
  }
  if (*b + 3 * 2048 < *g) {
    a[*b + 3 * 2048] = (*c >> 3) & 0x1;
  }
  if (*b + 4 * 2048 < *g) {
    a[*b + 4 * 2048] = (*d) & 0x1;
  }
  if (*b + 5 * 2048 < *g) {
    a[*b + 5 * 2048] = (*d >> 1) & 0x1;
  }
  if (*b + 6 * 2048 < *g) {
    a[*b + 6 * 2048] = (*d >> 2) & 0x1;
  }
  if (*b + 7 * 2048 < *g) {
    a[*b + 7 * 2048] = (*d >> 3) & 0x1;
  }
  if (*b + 8 * 2048 < *g) {
    a[*b + 8 * 2048] = (*e) & 0x1;
  }
  if (*b + 9 * 2048 < *g) {
    a[*b + 9 * 2048] = (*e >> 1) & 0x1;
  }
  if (*b + 10 * 2048 < *g) {
    a[*b + 10 * 2048] = (*e >> 2) & 0x1;
  }
  if (*b + 11 * 2048 < *g) {
    a[*b + 11 * 2048] = (*e >> 3) & 0x1;
  }
  if (*b + 12 * 2048 < *g) {
    a[*b + 12 * 2048] = (*f) & 0x1;
  }
  if (*b + 13 * 2048 < *g) {
    a[*b + 13 * 2048] = (*f >> 1) & 0x1;
  }
  if (*b + 14 * 2048 < *g) {
    a[*b + 14 * 2048] = (*f >> 2) & 0x1;
  }
  if (*b + 15 * 2048 < *g) {
    a[*b + 15 * 2048] = (*f >> 3) & 0x1;
  }
}

void M(__global short* a, const uint* const b, const uint* const c, const uint* const d, const uint* const e, const uint* const f, const uint* const g) {
  if (*b < *g) {
    a[*b] = *c;
  }
  if (*b + 2048 < *g) {
    a[*b + 2048] = *c >> 16;
  }
  if (*b + 2 * 2048 < *g) {
    a[*b + 2 * 2048] = *d;
  }
  if (*b + 3 * 2048 < *g) {
    a[*b + 3 * 2048] = *d >> 16;
  }
  if (*b + 4 * 2048 < *g) {
    a[*b + 4 * 2048] = *e;
  }
  if (*b + 5 * 2048 < *g) {
    a[*b + 5 * 2048] = *e >> 16;
  }
  if (*b + 6 * 2048 < *g) {
    a[*b + 6 * 2048] = *f;
  }
  if (*b + 7 * 2048 < *g) {
    a[*b + 7 * 2048] = *f >> 16;
  }
}

void N(__global ushort* a, const uint* const b, const uint* const c, const uint* const d, const uint* const e, const uint* const f, const uint* const g) {
  if (*b < *g) {
    a[*b] = *c;
  }
  if (*b + 2048 < *g) {
    a[*b + 2048] = *c >> 16;
  }
  if (*b + 2 * 2048 < *g) {
    a[*b + 2 * 2048] = *d;
  }
  if (*b + 3 * 2048 < *g) {
    a[*b + 3 * 2048] = *d >> 16;
  }
  if (*b + 4 * 2048 < *g) {
    a[*b + 4 * 2048] = *e;
  }
  if (*b + 5 * 2048 < *g) {
    a[*b + 5 * 2048] = *e >> 16;
  }
  if (*b + 6 * 2048 < *g) {
    a[*b + 6 * 2048] = *f;
  }
  if (*b + 7 * 2048 < *g) {
    a[*b + 7 * 2048] = *f >> 16;
  }
}

void O(__global int* a, const uint* const b, const uint* const c, const uint* const d, const uint* const e, const uint* const f, const uint* const g) {
  if (*b < *g) {
    a[*b] = *c;
  }
  if (*b + 2048 < *g) {
    a[*b + 2048] = *d;
  }
  if (*b + 2 * 2048 < *g) {
    a[*b + 2 * 2048] = *e;
  }
  if (*b + 3 * 2048 < *g) {
    a[*b + 3 * 2048] = *f;
  }
}

void P(__global uint* a, const uint* const b, const uint* const c, const uint* const d, const uint* const e, const uint* const f, const uint* const g) {
  if (*b < *g) {
    a[*b] = *c;
  }
  if (*b + 2048 < *g) {
    a[*b + 2048] = *d;
  }
  if (*b + 2 * 2048 < *g) {
    a[*b + 2 * 2048] = *e;
  }
  if (*b + 3 * 2048 < *g) {
    a[*b + 3 * 2048] = *f;
  }
}

void Q(__global long* a, const uint* const b, const uint* const c, const uint* const d, const uint* const e, const uint* const f, const uint* const g) {
  long h = *d;
  h = (h << 32) | *c;
  long i = *f;
  i = (i << 32) | *e;
  if (*b < *g) {
    a[*b] = h;
  }
  if (*b + 2048 < *g) {
    a[*b + 2048] = i;
  }
}

void R(__global ulong* a, const uint* const b, const uint* const c, const uint* const d, const uint* const e, const uint* const f, const uint* const g) {
  long h = *d;
  h = (h << 32) | *c;
  long i = *f;
  i = (i << 32) | *e;
  if (*b < *g) {
    a[*b] = h;
  }
  if (*b + 2048 < *g) {
    a[*b + 2048] = i;
  }
}

void S(__global float* a, const uint* const b, const uint* const c, const uint* const d, const uint* const e, const uint* const f, const uint* const g) {
  if (*b < *g) {
    a[*b] = 1.f - A(c);
  }
  if (*b + 2048 < *g) {
    a[*b + 2048] = 1.f - A(d);
  }
  if (*b + 2 * 2048 < *g) {
    a[*b + 2 * 2048] = 1.f - A(e);
  }
  if (*b + 3 * 2048 < *g) {
    a[*b + 3 * 2048] = 1.f - A(f);
  }
}