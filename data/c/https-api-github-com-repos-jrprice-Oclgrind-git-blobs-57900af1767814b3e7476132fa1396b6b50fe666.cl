kernel void A(global int* a, global int* b) {
  int c = get_global_id(0);
  int d = a[c];
  int e;
  switch (d) {
    case 0:
      e = -7;
      break;
    case 1:
      e = c;
      break;
    case 2:
    case 3:
    case 4:
      e = d + c;
      break;
    default:
      e = 42;
      break;
  }

  b[c] = e;
}