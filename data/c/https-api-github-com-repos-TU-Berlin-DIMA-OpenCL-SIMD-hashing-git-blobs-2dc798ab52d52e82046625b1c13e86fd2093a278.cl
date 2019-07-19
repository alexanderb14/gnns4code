struct Bucket {
  uint key;
  uint val;
};
typedef struct Bucket Bucket;

kernel __attribute__((vec_type_hint(uint8))) void A(global uint* a, global uint* b, const ulong c, global Bucket* d, const uint e, const uint f) {
  ulong g;
  ulong h = e * 1.2;
  Bucket i = f global uint* j = &a[get_global_id(0) * c];
  global uint* k = &b[get_global_id(0) * c];
  global Bucket* l = &d[get_global_id(0) * h];

  for (int m = 0; m < 1; ++m) {
    for (g = 0; g != h; ++g) {
      l[g] = i;
    }

    for (g = 0; g != c; ++g) {
      Bucket n = {g], g]};

      ulong o = (uint)(n.key * 2654435761);
      o = (o * e) >> 32;

      while (f != l[o].key) {
        o++;
      }

      l[o] = n;
    }
  }
}