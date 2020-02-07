int A(int a) {
  int b = 0;

  for (int c = 0; c < 100; c++) {
    b += c;
  }

  for (int d = 0; d < 100; d++) {
    b += d;
    for (int e = 0; e < get_local_id(0); e++) {
      b += e;
      if (b > 1000) {
        return 0;
      }
    }
  }

  for (int f = 0; f < 100; f++) {
    b += f;
  }

  return b;
}

__kernel void B() {
  int a;
  for (int b = 0; b < 200; b++) {
    a = A(b);
  }
  return;
}