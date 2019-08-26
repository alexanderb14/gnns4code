kernel void A(global const uchar* a, global uchar* b, int c, int d, int e, float f, float g, float h, float i) {
  const int j = get_global_id(0);
  const int k = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);

  const uchar8 l = *(const global uchar8*)(a + j * 8);
  *(global uchar8*)(b + j * 8) = convert_uchar8_sat(((l < (uchar8)((uchar)f) ? (uchar8)((uchar)g) : (l > (uchar8)((uchar)h) ? (uchar8)((uchar)i) : l))));
}
kernel void B(global const uchar* a, global uchar* b, int c, int d, int e, float f, float g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar j = g;
  uchar k = f;
  const uchar8 l = *(const global uchar8*)(a + h * 8);
  *(global uchar8*)(b + h * 8) = convert_uchar8_sat((((l < k ? j : l))));
}
kernel void C(global const uchar* a, global uchar* b, int c, int d, int e, float f, float g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar j = g;
  uchar k = f;
  const uchar8 l = *(const global uchar8*)(a + h * 8);
  *(global uchar8*)(b + h * 8) = convert_uchar8_sat((((l <= k ? j : l))));
}
kernel void D(global const uchar* a, global uchar* b, int c, int d, int e, float f, float g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar j = g;
  uchar k = f;
  const uchar8 l = *(const global uchar8*)(a + h * 8);
  *(global uchar8*)(b + h * 8) = convert_uchar8_sat((((l == k ? j : l))));
}
kernel void E(global const uchar* a, global uchar* b, int c, int d, int e, float f, float g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar j = g;
  uchar k = f;
  const uchar8 l = *(const global uchar8*)(a + h * 8);
  *(global uchar8*)(b + h * 8) = convert_uchar8_sat((((l >= k ? j : l))));
}
kernel void F(global const uchar* a, global uchar* b, int c, int d, int e, float f, float g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar j = g;
  uchar k = f;
  const uchar8 l = *(const global uchar8*)(a + h * 8);
  *(global uchar8*)(b + h * 8) = convert_uchar8_sat((((l > k ? j : l))));
}

kernel void G(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const uchar8 j = *(const global uchar8*)(a + h * 8);
  const uchar8 k = *(const global uchar8*)(b + h * 8);
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat((((j < k ? j : k))));
}
kernel void H(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const uchar8 j = *(const global uchar8*)(a + h * 8);
  const uchar8 k = *(const global uchar8*)(b + h * 8);
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat((((j <= k ? j : k))));
}
kernel void I(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const uchar8 j = *(const global uchar8*)(a + h * 8);
  const uchar8 k = *(const global uchar8*)(b + h * 8);
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat((((j == k ? j : k))));
}
kernel void J(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const uchar8 j = *(const global uchar8*)(a + h * 8);
  const uchar8 k = *(const global uchar8*)(b + h * 8);
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat((((j >= k ? j : k))));
}
kernel void K(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const uchar8 j = *(const global uchar8*)(a + h * 8);
  const uchar8 k = *(const global uchar8*)(b + h * 8);
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat((((j > k ? j : k))));
}
kernel void L(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const uchar8 j = *(const global uchar8*)(a + h * 8);
  const uchar8 k = *(const global uchar8*)(b + h * 8);
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat((((j < k ? ((uchar8)(255)) : ((uchar8)(0))))));
}
kernel void M(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const uchar8 j = *(const global uchar8*)(a + h * 8);
  const uchar8 k = *(const global uchar8*)(b + h * 8);
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat((((j <= k ? ((uchar8)(255)) : ((uchar8)(0))))));
}
kernel void N(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const uchar8 j = *(const global uchar8*)(a + h * 8);
  const uchar8 k = *(const global uchar8*)(b + h * 8);
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat((((j == k ? ((uchar8)(255)) : ((uchar8)(0))))));
}
kernel void O(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const uchar8 j = *(const global uchar8*)(a + h * 8);
  const uchar8 k = *(const global uchar8*)(b + h * 8);
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat((((j >= k ? ((uchar8)(255)) : ((uchar8)(0))))));
}
kernel void P(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const uchar8 j = *(const global uchar8*)(a + h * 8);
  const uchar8 k = *(const global uchar8*)(b + h * 8);
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat((((j > k ? ((uchar8)(255)) : ((uchar8)(0))))));
}

kernel void Q(global const uchar* a, global uchar* b, int c, int d, int e, float f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = f;
  const uchar8 j = *(const global uchar8*)(a + g * 8);
  *(global uchar8*)(b + g * 8) = convert_uchar8_sat((((j < i ? ((uchar8)(255)) : ((uchar8)(0))))));
}
kernel void R(global const uchar* a, global uchar* b, int c, int d, int e, float f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = f;
  const uchar8 j = *(const global uchar8*)(a + g * 8);
  *(global uchar8*)(b + g * 8) = convert_uchar8_sat((((j <= i ? ((uchar8)(255)) : ((uchar8)(0))))));
}
kernel void S(global const uchar* a, global uchar* b, int c, int d, int e, float f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = f;
  const uchar8 j = *(const global uchar8*)(a + g * 8);
  *(global uchar8*)(b + g * 8) = convert_uchar8_sat((((j == i ? ((uchar8)(255)) : ((uchar8)(0))))));
}
kernel void T(global const uchar* a, global uchar* b, int c, int d, int e, float f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = f;
  const uchar8 j = *(const global uchar8*)(a + g * 8);
  *(global uchar8*)(b + g * 8) = convert_uchar8_sat((((j >= i ? ((uchar8)(255)) : ((uchar8)(0))))));
}
kernel void U(global const uchar* a, global uchar* b, int c, int d, int e, float f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  uchar i = f;
  const uchar8 j = *(const global uchar8*)(a + g * 8);
  *(global uchar8*)(b + g * 8) = convert_uchar8_sat((((j > i ? ((uchar8)(255)) : ((uchar8)(0))))));
}