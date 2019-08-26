kernel void A(global int* a, global int* b, global uint* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void B(global int2* a, global int2* b, global uint2* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void C(global int3* a, global int3* b, global uint3* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void D(global int4* a, global int4* b, global uint4* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void E(global int8* a, global int8* b, global uint8* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void F(global int16* a, global int16* b, global uint16* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void G(global uint* a, global uint* b, global uint* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void H(global uint2* a, global uint2* b, global uint2* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void I(global uint3* a, global uint3* b, global uint3* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void J(global uint4* a, global uint4* b, global uint4* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void K(global uint8* a, global uint8* b, global uint8* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void L(global uint16* a, global uint16* b, global uint16* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void M(global char* a, global char* b, global uchar* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void N(global char2* a, global char2* b, global uchar2* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void O(global char3* a, global char3* b, global uchar3* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void P(global char4* a, global char4* b, global uchar4* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void Q(global char8* a, global char8* b, global uchar8* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void R(global char16* a, global char16* b, global uchar16* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void S(global uchar* a, global uchar* b, global uchar* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void T(global uchar2* a, global uchar2* b, global uchar2* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void U(global uchar3* a, global uchar3* b, global uchar3* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void V(global uchar4* a, global uchar4* b, global uchar4* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void W(global uchar8* a, global uchar8* b, global uchar8* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void X(global uchar16* a, global uchar16* b, global uchar16* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void Y(global short* a, global short* b, global ushort* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void Z(global short2* a, global short2* b, global ushort2* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void AA(global short3* a, global short3* b, global ushort3* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void AB(global short4* a, global short4* b, global ushort4* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void AC(global short8* a, global short8* b, global ushort8* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void AD(global short16* a, global short16* b, global ushort16* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void AE(global ushort* a, global ushort* b, global ushort* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void AF(global ushort2* a, global ushort2* b, global ushort2* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void AG(global ushort3* a, global ushort3* b, global ushort3* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void AH(global ushort4* a, global ushort4* b, global ushort4* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void AI(global ushort8* a, global ushort8* b, global ushort8* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void AJ(global ushort16* a, global ushort16* b, global ushort16* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void AK(global long* a, global long* b, global ulong* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void AL(global long2* a, global long2* b, global ulong2* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void AM(global long3* a, global long3* b, global ulong3* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void AN(global long4* a, global long4* b, global ulong4* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void AO(global long8* a, global long8* b, global ulong8* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void AP(global long16* a, global long16* b, global ulong16* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void AQ(global ulong* a, global ulong* b, global ulong* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void AR(global ulong2* a, global ulong2* b, global ulong2* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void AS(global ulong3* a, global ulong3* b, global ulong3* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void AT(global ulong4* a, global ulong4* b, global ulong4* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void AU(global ulong8* a, global ulong8* b, global ulong8* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}
kernel void AV(global ulong16* a, global ulong16* b, global ulong16* c) {
  int d = get_global_id(0);
  c[d] = abs_diff(a[d], b[d]);
}