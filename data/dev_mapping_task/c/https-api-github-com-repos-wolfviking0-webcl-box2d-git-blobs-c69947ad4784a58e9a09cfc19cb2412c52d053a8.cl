__kernel void __attribute__((vec_type_hint(uint4))) A(__global uint4* a, __global uint4* b, const uint c, const uint d, const uint e, const uint f) {
  uint g = get_global_id(0);

  if (g >= f)
    return;

  uint4 h, i;
  uint4 j;
  uint4 k, l;

  uint4 m = (uint4)(0, 0, 0xFFFFFFFF, 0xFFFFFFFF);
  uint4 n = (uint4)(0, 0xFFFFFFFF, 0, 0xFFFFFFFF);

  if (c > 0) {
    if (d > 0) {
      uint o = 1 << (d - 1);
      uint p = o - 1;
      uint q = ((g >> (d - 1)) << d) + (g & p);
      uint r = q + o;

      h = a[q];
      i = a[r];
      k = b[q];
      l = b[r];
      j = __builtin_astype(h < i, uint4);

      uint4 s = (h & j) | (i & ~j);
      uint4 t = (h & ~j) | (i & j);
      uint4 u = (k & j) | (l & ~j);
      uint4 v = (k & ~j) | (l & j);

      if (((g >> (c - 1)) & 1) ^ e) {
        a[q] = s;
        a[r] = t;
        b[q] = u;
        b[r] = v;
      } else {
        a[r] = s;
        a[q] = t;
        b[r] = u;
        b[q] = v;
      }
    } else {
      h = a[g];
      i = h.zwxy;
      k = b[g];
      l = k.zwxy;

      j = __builtin_astype(h < i, uint4);
      j = j.xyxy;

      if (((g >> c) & 1) ^ e) {
        h = (h & j) | (i & ~j);
        i = h.yxwz;
        k = (k & j) | (l & ~j);
        l = k.yxwz;

        j = __builtin_astype(h < i, uint4);
        j = j.xxzz;

        a[g] = (h & j) | (i & ~j);
        b[g] = (k & j) | (l & ~j);
      } else {
        h = (h & ~j) | (i & j);
        i = h.yxwz;
        k = (k & ~j) | (l & j);
        l = k.yxwz;

        j = __builtin_astype(h < i, uint4);
        j = j.xxzz;

        a[g] = (h & ~j) | (i & j);
        b[g] = (k & ~j) | (l & j);
      }
    }
  } else {
    uint4 w = (uint4)(0, 0xFFFFFFFF, 0xFFFFFFFF, 0);
    h = a[g];
    i = h.yxwz;
    k = b[g];
    l = k.yxwz;

    j = __builtin_astype(h < i, uint4);
    j = j.xxww;
    if (e) {
      h = (h & j) | (i & ~j);
      k = (k & j) | (l & ~j);
    } else {
      h = (h & ~j) | (i & j);
      k = (k & ~j) | (l & j);
    }

    i = h.zwxy;
    l = k.zwxy;

    j = __builtin_astype(h < i, uint4);
    j = j.xyxy;

    if ((g & 1) ^ e) {
      h = (h & j) | (i & ~j);
      i = h.yxwz;
      k = (k & j) | (l & ~j);
      l = k.yxwz;

      j = __builtin_astype(h < i, uint4);
      j = j.xxzz;

      a[g] = (h & j) | (i & ~j);
      b[g] = (k & j) | (l & ~j);
    } else {
      h = (h & ~j) | (i & j);
      i = h.yxwz;
      k = (k & ~j) | (l & j);
      l = k.yxwz;

      j = __builtin_astype(h < i, uint4);
      j = j.xxzz;

      a[g] = (h & ~j) | (i & j);
      b[g] = (k & ~j) | (l & j);
    }
  }
}