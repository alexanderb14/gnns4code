kernel void A(global int* a) {
  local int b[2][3][4][5];

  b[1][2][3][3] = a[get_global_id(0)];
}