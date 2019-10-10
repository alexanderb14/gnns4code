kernel void A(global long* a, global long* b, global long* c) {
  int d = get_global_id(0);
  switch (d) {
    case 0:
      c[d] = 0xFEDCBA9876543210UL;
      break;
    case 1:
      c[d] = a[d] & b[d];
      break;
    case 2:
      c[d] = a[d] | b[d];
      break;
    case 3:
      c[d] = a[d] ^ b[d];
      break;
    case 4:
      c[d] = a[d] ? 0x1122334455667788L : 0x8877665544332211UL;
      break;
  }
}