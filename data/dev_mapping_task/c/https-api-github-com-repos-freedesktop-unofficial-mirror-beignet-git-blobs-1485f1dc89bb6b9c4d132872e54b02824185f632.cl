kernel void A(global uchar* a, global char* b) {
  int c = get_global_id(0);
  b[c] = convert_char_sat(a[c]);
};
kernel void B(global short* a, global char* b) {
  int c = get_global_id(0);
  b[c] = convert_char_sat(a[c]);
};
kernel void C(global ushort* a, global char* b) {
  int c = get_global_id(0);
  b[c] = convert_char_sat(a[c]);
};
kernel void D(global int* a, global char* b) {
  int c = get_global_id(0);
  b[c] = convert_char_sat(a[c]);
};
kernel void E(global uint* a, global char* b) {
  int c = get_global_id(0);
  b[c] = convert_char_sat(a[c]);
};
kernel void F(global long* a, global char* b) {
  int c = get_global_id(0);
  b[c] = convert_char_sat(a[c]);
};
kernel void G(global ulong* a, global char* b) {
  int c = get_global_id(0);
  b[c] = convert_char_sat(a[c]);
};
kernel void H(global float* a, global char* b) {
  int c = get_global_id(0);
  b[c] = convert_char_sat(a[c]);
};
kernel void I(global char* a, global uchar* b) {
  int c = get_global_id(0);
  b[c] = convert_uchar_sat(a[c]);
};
kernel void J(global short* a, global uchar* b) {
  int c = get_global_id(0);
  b[c] = convert_uchar_sat(a[c]);
};
kernel void K(global ushort* a, global uchar* b) {
  int c = get_global_id(0);
  b[c] = convert_uchar_sat(a[c]);
};
kernel void L(global int* a, global uchar* b) {
  int c = get_global_id(0);
  b[c] = convert_uchar_sat(a[c]);
};
kernel void M(global uint* a, global uchar* b) {
  int c = get_global_id(0);
  b[c] = convert_uchar_sat(a[c]);
};
kernel void N(global long* a, global uchar* b) {
  int c = get_global_id(0);
  b[c] = convert_uchar_sat(a[c]);
};
kernel void O(global ulong* a, global uchar* b) {
  int c = get_global_id(0);
  b[c] = convert_uchar_sat(a[c]);
};
kernel void P(global float* a, global uchar* b) {
  int c = get_global_id(0);
  b[c] = convert_uchar_sat(a[c]);
};
kernel void Q(global ushort* a, global short* b) {
  int c = get_global_id(0);
  b[c] = convert_short_sat(a[c]);
};
kernel void R(global int* a, global short* b) {
  int c = get_global_id(0);
  b[c] = convert_short_sat(a[c]);
};
kernel void S(global uint* a, global short* b) {
  int c = get_global_id(0);
  b[c] = convert_short_sat(a[c]);
};
kernel void T(global long* a, global short* b) {
  int c = get_global_id(0);
  b[c] = convert_short_sat(a[c]);
};
kernel void U(global ulong* a, global short* b) {
  int c = get_global_id(0);
  b[c] = convert_short_sat(a[c]);
};
kernel void V(global float* a, global short* b) {
  int c = get_global_id(0);
  b[c] = convert_short_sat(a[c]);
};
kernel void W(global short* a, global ushort* b) {
  int c = get_global_id(0);
  b[c] = convert_ushort_sat(a[c]);
};
kernel void X(global int* a, global ushort* b) {
  int c = get_global_id(0);
  b[c] = convert_ushort_sat(a[c]);
};
kernel void Y(global uint* a, global ushort* b) {
  int c = get_global_id(0);
  b[c] = convert_ushort_sat(a[c]);
};
kernel void Z(global long* a, global ushort* b) {
  int c = get_global_id(0);
  b[c] = convert_ushort_sat(a[c]);
};
kernel void AA(global ulong* a, global ushort* b) {
  int c = get_global_id(0);
  b[c] = convert_ushort_sat(a[c]);
};
kernel void AB(global float* a, global ushort* b) {
  int c = get_global_id(0);
  b[c] = convert_ushort_sat(a[c]);
};
kernel void AC(global uint* a, global int* b) {
  int c = get_global_id(0);
  b[c] = convert_int_sat(a[c]);
};
kernel void AD(global long* a, global int* b) {
  int c = get_global_id(0);
  b[c] = convert_int_sat(a[c]);
};
kernel void AE(global ulong* a, global int* b) {
  int c = get_global_id(0);
  b[c] = convert_int_sat(a[c]);
};
kernel void AF(global float* a, global int* b) {
  int c = get_global_id(0);
  b[c] = convert_int_sat(a[c]);
};
kernel void AG(global int* a, global uint* b) {
  int c = get_global_id(0);
  b[c] = convert_uint_sat(a[c]);
};
kernel void AH(global long* a, global uint* b) {
  int c = get_global_id(0);
  b[c] = convert_uint_sat(a[c]);
};
kernel void AI(global ulong* a, global uint* b) {
  int c = get_global_id(0);
  b[c] = convert_uint_sat(a[c]);
};
kernel void AJ(global float* a, global uint* b) {
  int c = get_global_id(0);
  b[c] = convert_uint_sat(a[c]);
};
kernel void AK(global ulong* a, global long* b) {
  int c = get_global_id(0);
  b[c] = convert_long_sat(a[c]);
};
kernel void AL(global float* a, global long* b) {
  int c = get_global_id(0);
  b[c] = convert_long_sat(a[c]);
};
kernel void AM(global long* a, global ulong* b) {
  int c = get_global_id(0);
  b[c] = convert_ulong_sat(a[c]);
};
kernel void AN(global float* a, global ulong* b) {
  int c = get_global_id(0);
  b[c] = convert_ulong_sat(a[c]);
};