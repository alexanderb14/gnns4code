kernel void A(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const float8 j = convert_float8(*(const global uchar8*)(a + h * 8));
  const float8 k = convert_float8(*(const global uchar8*)(b + h * 8));
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat(((j + k)));
}
kernel void B(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const float8 j = convert_float8(*(const global uchar8*)(a + h * 8));
  const float8 k = convert_float8(*(const global uchar8*)(b + h * 8));
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat(((j + k * k)));
}
kernel void C(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const float8 j = convert_float8(*(const global uchar8*)(a + h * 8));
  const float8 k = convert_float8(*(const global uchar8*)(b + h * 8));
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat(((j - k)));
}
kernel void D(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const float8 j = convert_float8(*(const global uchar8*)(a + h * 8));
  const float8 k = convert_float8(*(const global uchar8*)(b + h * 8));
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat(((__clc_fabs(j - k))));
}
kernel void E(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const float8 j = convert_float8(*(const global uchar8*)(a + h * 8));
  const float8 k = convert_float8(*(const global uchar8*)(b + h * 8));
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat(((j * k)));
}
kernel void F(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const float8 j = convert_float8(*(const global uchar8*)(a + h * 8));
  const float8 k = convert_float8(*(const global uchar8*)(b + h * 8));
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat(((j / k)));
}
kernel void G(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const float8 j = convert_float8(*(const global uchar8*)(a + h * 8));
  const float8 k = convert_float8(*(const global uchar8*)(b + h * 8));
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat(((min(j, k))));
}
kernel void H(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const float8 j = convert_float8(*(const global uchar8*)(a + h * 8));
  const float8 k = convert_float8(*(const global uchar8*)(b + h * 8));
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat(((max(j, k))));
}
kernel void I(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const float8 j = convert_float8(*(const global uchar8*)(a + h * 8));
  const float8 k = convert_float8(*(const global uchar8*)(b + h * 8));
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat((((j + k) * .5f)));
}
kernel void J(global const uchar* a, global const uchar* b, global uchar* c, int d, int e, int f, int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  d /= sizeof(uchar);
  e /= sizeof(uchar);
  f /= sizeof(uchar);
  const float8 j = convert_float8(*(const global uchar8*)(a + h * 8));
  const float8 k = convert_float8(*(const global uchar8*)(b + h * 8));
  *(global uchar8*)(c + h * 8) = convert_uchar8_sat(((sqrt(j * j + k * k))));
}

kernel void K(global const uchar* a, global uchar* b, int c, int d, int e, float f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  float i = f;
  const float8 j = convert_float8(*(const global uchar8*)(a + g * 8));
  *(global uchar8*)(b + g * 8) = convert_uchar8_sat(((j + i)));
}
kernel void L(global const uchar* a, global uchar* b, int c, int d, int e, float f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  float i = f;
  const float8 j = convert_float8(*(const global uchar8*)(a + g * 8));
  *(global uchar8*)(b + g * 8) = convert_uchar8_sat(((j - i)));
}
kernel void M(global const uchar* a, global uchar* b, int c, int d, int e, float f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  float i = f;
  const float8 j = convert_float8(*(const global uchar8*)(a + g * 8));
  *(global uchar8*)(b + g * 8) = convert_uchar8_sat(((__clc_fabs(j - i))));
}
kernel void N(global const uchar* a, global uchar* b, int c, int d, int e, float f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  float i = f;
  const float8 j = convert_float8(*(const global uchar8*)(a + g * 8));
  *(global uchar8*)(b + g * 8) = convert_uchar8_sat(((j * i)));
}
kernel void O(global const uchar* a, global uchar* b, int c, int d, int e, float f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  float i = f;
  const float8 j = convert_float8(*(const global uchar8*)(a + g * 8));
  *(global uchar8*)(b + g * 8) = convert_uchar8_sat(((j / i)));
}
kernel void P(global const uchar* a, global uchar* b, int c, int d, int e, float f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  float i = f;
  const float8 j = convert_float8(*(const global uchar8*)(a + g * 8));
  *(global uchar8*)(b + g * 8) = convert_uchar8_sat(((i / j)));
}
kernel void Q(global const uchar* a, global uchar* b, int c, int d, int e, float f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  float i = f;
  const float8 j = convert_float8(*(const global uchar8*)(a + g * 8));
  *(global uchar8*)(b + g * 8) = convert_uchar8_sat(((min(j, i))));
}
kernel void R(global const uchar* a, global uchar* b, int c, int d, int e, float f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  float i = f;
  const float8 j = convert_float8(*(const global uchar8*)(a + g * 8));
  *(global uchar8*)(b + g * 8) = convert_uchar8_sat(((max(j, i))));
}
kernel void S(global const uchar* a, global uchar* b, int c, int d, int e, float f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  float i = f;
  const float8 j = convert_float8(*(const global uchar8*)(a + g * 8));
  *(global uchar8*)(b + g * 8) = convert_uchar8_sat((((j + i) * .5f)));
}

kernel void T(global const uchar* a, global uchar* b, int c, int d, int e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const float8 h = convert_float8(*(const global uchar8*)(a + f * 8));
  *(global uchar8*)(b + f * 8) = convert_uchar8_sat(((__clc_fabs(h))));
}
kernel void U(global const uchar* a, global uchar* b, int c, int d, int e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const float8 h = convert_float8(*(const global uchar8*)(a + f * 8));
  *(global uchar8*)(b + f * 8) = convert_uchar8_sat(((255.f - h)));
}
kernel void V(global const uchar* a, global uchar* b, int c, int d, int e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const float8 h = convert_float8(*(const global uchar8*)(a + f * 8));
  *(global uchar8*)(b + f * 8) = convert_uchar8_sat(((h * h)));
}
kernel void W(global const uchar* a, global uchar* b, int c, int d, int e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const float8 h = convert_float8(*(const global uchar8*)(a + f * 8));
  *(global uchar8*)(b + f * 8) = convert_uchar8_sat(((exp(h))));
}
kernel void X(global const uchar* a, global uchar* b, int c, int d, int e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const float8 h = convert_float8(*(const global uchar8*)(a + f * 8));
  *(global uchar8*)(b + f * 8) = convert_uchar8_sat(((log(h))));
}
kernel void Y(global const uchar* a, global uchar* b, int c, int d, int e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const float8 h = convert_float8(*(const global uchar8*)(a + f * 8));
  *(global uchar8*)(b + f * 8) = convert_uchar8_sat(((sqrt(h))));
}
kernel void Z(global const uchar* a, global uchar* b, int c, int d, int e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const float8 h = convert_float8(*(const global uchar8*)(a + f * 8));
  *(global uchar8*)(b + f * 8) = convert_uchar8_sat(((sin(h))));
}
kernel void AA(global const uchar* a, global uchar* b, int c, int d, int e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  c /= sizeof(uchar);
  d /= sizeof(uchar);
  const float8 h = convert_float8(*(const global uchar8*)(a + f * 8));
  *(global uchar8*)(b + f * 8) = convert_uchar8_sat(((cos(h))));
}