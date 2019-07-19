void A() {
  barrier(1 | 2);
}

__kernel void B(__local int* a) {
  for (int b = 0; b < 100; b++) {
    a[get_local_id(0)] = get_local_id(0);
    A();
  }

  if (a[0] == 22) {
    A();

    for (int b = 0; b < 100; b++) {
      a[get_local_id(0)] = get_local_id(0);
      A();
    }

    for (int b = 0; b < 100; b++) {
      a[get_local_id(0)] = get_local_id(0);
      A();
    }

    for (int b = 0; b < 100; b++) {
      a[get_local_id(0)] = get_local_id(0);
      A();
    }
  }
}