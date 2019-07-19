__kernel void A(const __global int* a, __global int* b) {
  int c = *a;
  int d;
  bool e = c > 100;
  b[2] = c;
  if (c > 1000) {
    d = 1000;
    b[3] = d;
  } else if (e) {
    d = 100;
    b[3] = d;
  } else {
    d = 10;
    b[3] = d;
  }

  b[4] = d;
  b[5] = c;

  switch (c) {
    case 1024:
      d += 10;
      b[6] = d;
      break;
    case 512:
      d += 9;
      b[7] = d;
      break;
    case 256:
      d += 8;
      b[8] = d;
      break;
    case 64:
      d += 6;
      b[9] = d;
      break;
    case 32:
      d += 5;
      b[10] = d;
      break;
    default:
      d += 1;
      b[11] = d;
      break;
  }

  b[0] = d;

  while (d < 1024) {
    d *= 2;
    d += 7;
  }
  b[1] = d;
}