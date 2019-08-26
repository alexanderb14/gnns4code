struct Bucket {
  uint key;
  uint val;
};
typedef struct Bucket Bucket;

kernel __attribute__((vec_type_hint(uint8))) void A(global Bucket* a, const uint b, const ulong c, global Bucket* d) {
  uint e = b / 32;
  uint f = b - 1;
  uint8 g = (uint8)(eeeeeeee
  uint8 h = (uint8)(ffffffff

  uint8 i = (uint8)(1, 2, 3, 4, 5, 6, 7, 8) *
               (uint8)(3, 3, 3, 3, 3, 3, 3, 3) * g;

  ulong j = 0;
  uint8 k = 0;
  uint8 l = (uint8)(0, 0, 0, 0, 0, 0, 0, 0);
  uint8 m = (uint8)(0, 0, 0, 0, 0, 0, 0, 0);

  while (j < c) {

    l.s0 = a[i.s0].key;
    l.s1 = a[i.s1].key;
    l.s2 = a[i.s2].key;
    l.s3 = a[i.s3].key;
    l.s4 = a[i.s4].key;
    l.s5 = a[i.s5].key;
    l.s6 = a[i.s6].key;
    l.s7 = a[i.s7].key;

    m.s0 = a[i.s0].val;
    m.s1 = a[i.s1].val;
    m.s2 = a[i.s2].val;
    m.s3 = a[i.s3].val;
    m.s4 = a[i.s4].val;
    m.s5 = a[i.s5].val;
    m.s6 = a[i.s6].val;
    m.s7 = a[i.s7].val;

    k += m + l;

    i += g;
    i = i & h;

    j += 8;
  }

  d[0].key = k.s0;
  d[1].key = k.s1;
  d[2].key = k.s2;
  d[3].key = k.s3;
  d[4].key = k.s4;
  d[5].key = k.s5;
  d[6].key = k.s6;
  d[7].key = k.s7;
}

__kernel __attribute__((vec_type_hint(uint8))) kernel void B(global Bucket* a, const uint b, const ulong c) {
  uint d = b / 32;
  uint e = b - 1;
  uint8 f = (uint8)(dddddddd
  uint8 g = (uint8)(eeeeeeee

  uint8 h = (uint8)(1, 2, 3, 4, 5, 6, 7, 8) *
               (uint8)(3, 3, 3, 3, 3, 3, 3, 3) * f;

  ulong i = 0;
  const uint8 j = (uint8)(0, 1, 2, 3, 4, 5, 6, 7);
  const uint8 k = (uint8)(0, 1, 2, 3, 4, 5, 6, 7);

  while (i < c) {

    a[h.s0].key = j.s0;
    a[h.s1].key = j.s1;
    a[h.s2].key = j.s2;
    a[h.s3].key = j.s3;
    a[h.s4].key = j.s4;
    a[h.s5].key = j.s5;
    a[h.s6].key = j.s6;
    a[h.s7].key = j.s7;

    a[h.s0].val = k.s0;
    a[h.s1].val = k.s1;
    a[h.s2].val = k.s2;
    a[h.s3].val = k.s3;
    a[h.s4].val = k.s4;
    a[h.s5].val = k.s5;
    a[h.s6].val = k.s6;
    a[h.s7].val = k.s7;

    h += f;
    h = h & g;

    i += 8;
  }
}