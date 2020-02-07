kernel void A(global ulong* a) {
  a[0] = rhadd(0UL, 0xFFFFFFFFFFFFFFFFUL);
}