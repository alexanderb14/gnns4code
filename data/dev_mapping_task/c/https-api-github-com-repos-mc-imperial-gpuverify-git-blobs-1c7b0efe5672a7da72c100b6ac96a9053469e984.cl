kernel void A(global int* a) {
  local int b[2][3][4][5];

  if (get_global_id(0) == 0) {
    b[1][2][3][3] = a[get_global_id(0)];
  }

  local char* c = (local char*)&(b[0][0][0][0]);

  if (get_global_id(0) == 1) {
    c[sizeof(int) * (60 + 2 * 20 + 3 * 5 + 3) + 2] = 42;
  }
}