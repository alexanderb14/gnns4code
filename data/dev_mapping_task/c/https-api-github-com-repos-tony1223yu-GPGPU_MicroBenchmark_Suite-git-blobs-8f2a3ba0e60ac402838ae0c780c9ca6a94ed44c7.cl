__kernel void A(__global ulong* a, int b, int c) {
  int d = get_global_id(1) * 16;
  int e = get_global_id(0) * 16;

  __global ulong* f = (__global ulong*)(a[d * b + e]);

  for (int g = 0; g < c; g++) {
    f = (__global ulong*)(*f);
    f = (__global ulong*)(*f);
    f = (__global ulong*)(*f);
    f = (__global ulong*)(*f);
    f = (__global ulong*)(*f);
    f = (__global ulong*)(*f);
    f = (__global ulong*)(*f);
    f = (__global ulong*)(*f);
    f = (__global ulong*)(*f);
    f = (__global ulong*)(*f);
    f = (__global ulong*)(*f);
    f = (__global ulong*)(*f);
    f = (__global ulong*)(*f);
    f = (__global ulong*)(*f);
    f = (__global ulong*)(*f);
    f = (__global ulong*)(*f);
    f = (__global ulong*)(*f);
    f = (__global ulong*)(*f);
    f = (__global ulong*)(*f);
  }
  a[d * b + e] = f;
}

__kernel void B(__global ulong* a, int b, int c) {
  int d = get_global_id(1) * 16 * b + get_global_id(0) * 16;
  a[d] = (ulong)(&(a[d]));
}