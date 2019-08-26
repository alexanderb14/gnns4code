kernel void A(global int* a, global int* b, int c) {
  int d = a[get_global_id(0)];

  for (int e = 0; e < 1024; e++) {
    if (d < 100) {
      d *= 2;

      if (d % 2 == 0) {
        d += 77;
      } else {
        d += 2347;

        if (d / 3 > 10) {
          d *= 34;
        } else if (d % 11 == 2) {
          d += 345;
        } else if (d % 11 == 3) {
          d += 3435;
        } else if (d % 11 == 7) {
          d *= 2345;
        }
      }
    } else {
      d += 3435;

      if (d < 0) {
        d *= 2349;

        if ((-d * 100) / 7 > 10) {
          d -= 234;
        } else {
          d /= 11;
        }
      }
    }
  }

  b[get_global_id(0)] = d;
}