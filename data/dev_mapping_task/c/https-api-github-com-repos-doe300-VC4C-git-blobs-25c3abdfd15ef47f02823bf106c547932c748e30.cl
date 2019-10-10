kernel void A(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const uchar8 j = *(const global uchar8*)(a + h * 8);
  const uchar8 k = *(const global uchar8*)(b + h * 8);
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat(((j & k)));
}
kernel void B(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const uchar8 j = *(const global uchar8*)(a + h * 8);
  const uchar8 k = *(const global uchar8*)(b + h * 8);
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat(((j | k)));
}
kernel void C(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const uchar8 j = *(const global uchar8*)(a + h * 8);
  const uchar8 k = *(const global uchar8*)(b + h * 8);
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat(((j ^ k)));
}

kernel void D(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = f;
  const uchar8 j = *(const global uchar8*)(a + g * 8);
  *(global uchar8*)(b + g * 8) = convert_uchar8_sat(((j & i)));
}
kernel void E(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = f;
  const uchar8 j = *(const global uchar8*)(a + g * 8);
  *(global uchar8*)(b + g * 8) = convert_uchar8_sat(((j | i)));
}
kernel void F(global const uchar* a, global uchar* b, int c, int d, int e, int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = f;
  const uchar8 j = *(const global uchar8*)(a + g * 8);
  *(global uchar8*)(b + g * 8) = convert_uchar8_sat(((j ^ i)));
}

kernel void G(global const uchar* a, global uchar* b, int c, int d, int e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const uchar8 h = *(const global uchar8*)(a + f * 8);
  *(global uchar8*)(b + f * 8) = convert_uchar8_sat(((~h)));
}