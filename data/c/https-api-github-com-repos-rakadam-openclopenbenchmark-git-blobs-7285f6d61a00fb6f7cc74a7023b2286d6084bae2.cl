kernel void A(global int* a, global int* b, int c) {
  int d = a[get_global_id(0)];

  for (int e = 0; e < 512; e++) {
    switch (d % 16) {
      case 0:
        d += (1 * 16) + 1;
        break;
      case 1:
        d += (34 * 16) + 1;
        break;
      case 2:
        d += (35 * 16) + 1;
        break;
      case 3:
        d += (284 * 16) + 1;
        break;
      case 4:
        d += (2486 * 16) + 1;
        break;
      case 5:
        d += (145 * 16) + 1;
        break;
      case 6:
        d += (234 * 16) + 1;
        break;
      case 7:
        d += (1224 * 16) + 1;
        break;
      case 8:
        d += (82365 * 16) + 1;
        break;
      case 9:
        d += (123456 * 16) + 1;
        break;
      case 10:
        d += (124 * 16) + 1;
        break;
      case 11:
        d += (823 * 16) + 1;
        break;
      case 12:
        d += (1178 * 16) + 1;
        break;
      case 13:
        d += (141 * 16) + 1;
        break;
      case 14:
        d += (134567 * 16) + 1;
        break;
      case 15:
        d += (2429 * 16) + 1;
        break;
      default:
        d += 1;
    }
  }

  b[get_global_id(0)] = d;
}