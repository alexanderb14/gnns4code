constant int Ga[4] = {7, 42, 0, -1};

kernel void A(global int* a) {
  int b = get_global_id(0);
  a[b] = Ga[b];
}