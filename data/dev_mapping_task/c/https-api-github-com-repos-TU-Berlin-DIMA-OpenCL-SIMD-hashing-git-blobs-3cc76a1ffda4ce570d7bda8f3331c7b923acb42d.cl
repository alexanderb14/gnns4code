struct Bucket {
  uint key;
  uint val;
};
typedef struct Bucket Bucket;
int A(size_t a);

kernel __attribute__((vec_type_hint(uint8))) void B(global uint* a, const ulong b, global Bucket* c, const uint d, global uint* e, const uint f) {
  const uint g = get_global_id(0);
  const uint h = get_global_size(0);
  const ulong i = (b / h) * (g + 1);
  global uint* j = &e[(b / h) * g];

  const uchar k = 32 - A(d);

  ulong l = 0;
  ulong m = ((b / h) * g);

  for (; m != i; ++m) {
    uint n = a[m];

    ulong o = ((uint)(n * 2654435761)) >> k;
    Bucket p = c[o];

    if (n == p.key) {
      j[l++] = p.val;
    } else {
      while (f != p.key) {
        o = (o + 1) & (d - 1);
        p = c[o];
        if (p.key == n) {
          j[l++] = p.val;
          break;
        }
      }
    }
  }
}

int A(size_t a) {
  size_t b = 1;
  int c = 0;
  while (b < a) {
    b += b;
    c++;
  }

  return c;
}