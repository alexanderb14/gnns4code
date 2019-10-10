__kernel void A(__global ulong* a, long b, long c, int d) {
  if (get_local_id(0) % 64 < 32) {
    __global ulong* e = a + get_group_id(0) * c + (get_local_id(0) / 64) * 0 + (get_local_id(0) % 64) * d;
    while (b-- > 0) {
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
      e = (__global ulong*)(*e);
    }
    a[get_group_id(0) * c + (get_local_id(0) / 64) * 0 + (get_local_id(0) & 64) * d] = (ulong)(e);
  }
}

__kernel void B(__global ulong* a, int b, int c, int d) {
  if (get_local_id(0) % 64 < 32) {
    int e = 0;
    __global ulong* f = a + get_group_id(0) * c * b + (get_local_id(0) / 64) * 0 + (get_local_id(0) % 64) * d;
    for (int g = 0; g < b - 1; g++) {
      f[e] = (ulong)(&f[e + c]);
      e = e + c;
    }
    f[e] = (ulong)f;
  }
}