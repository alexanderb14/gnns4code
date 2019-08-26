kernel void A(__global char2* a, __global char2* b, __local char2* c, int d) {
  event_t e;
  int f = d * get_local_size(0);
  int g;
  e = async_work_group_copy((__local char2*)c, (__global const char2*)(b + f * get_group_id(0)), (size_t)f, 0);
  wait_group_events(1, &e);
  e = async_work_group_copy((__global char2*)(a + f * get_group_id(0)), (__local const char2*)c, (size_t)f, 0);
  wait_group_events(1, &e);
};
kernel void B(__global uchar2* a, __global uchar2* b, __local uchar2* c, int d) {
  event_t e;
  int f = d * get_local_size(0);
  int g;
  e = async_work_group_copy((__local uchar2*)c, (__global const uchar2*)(b + f * get_group_id(0)), (size_t)f, 0);
  wait_group_events(1, &e);
  e = async_work_group_copy((__global uchar2*)(a + f * get_group_id(0)), (__local const uchar2*)c, (size_t)f, 0);
  wait_group_events(1, &e);
};
kernel void C(__global short2* a, __global short2* b, __local short2* c, int d) {
  event_t e;
  int f = d * get_local_size(0);
  int g;
  e = async_work_group_copy((__local short2*)c, (__global const short2*)(b + f * get_group_id(0)), (size_t)f, 0);
  wait_group_events(1, &e);
  e = async_work_group_copy((__global short2*)(a + f * get_group_id(0)), (__local const short2*)c, (size_t)f, 0);
  wait_group_events(1, &e);
};
kernel void D(__global ushort2* a, __global ushort2* b, __local ushort2* c, int d) {
  event_t e;
  int f = d * get_local_size(0);
  int g;
  e = async_work_group_copy((__local ushort2*)c, (__global const ushort2*)(b + f * get_group_id(0)), (size_t)f, 0);
  wait_group_events(1, &e);
  e = async_work_group_copy((__global ushort2*)(a + f * get_group_id(0)), (__local const ushort2*)c, (size_t)f, 0);
  wait_group_events(1, &e);
};
kernel void E(__global int2* a, __global int2* b, __local int2* c, int d) {
  event_t e;
  int f = d * get_local_size(0);
  int g;
  e = async_work_group_copy((__local int2*)c, (__global const int2*)(b + f * get_group_id(0)), (size_t)f, 0);
  wait_group_events(1, &e);
  e = async_work_group_copy((__global int2*)(a + f * get_group_id(0)), (__local const int2*)c, (size_t)f, 0);
  wait_group_events(1, &e);
};
kernel void F(__global uint2* a, __global uint2* b, __local uint2* c, int d) {
  event_t e;
  int f = d * get_local_size(0);
  int g;
  e = async_work_group_copy((__local uint2*)c, (__global const uint2*)(b + f * get_group_id(0)), (size_t)f, 0);
  wait_group_events(1, &e);
  e = async_work_group_copy((__global uint2*)(a + f * get_group_id(0)), (__local const uint2*)c, (size_t)f, 0);
  wait_group_events(1, &e);
};
kernel void G(__global long2* a, __global long2* b, __local long2* c, int d) {
  event_t e;
  int f = d * get_local_size(0);
  int g;
  e = async_work_group_copy((__local long2*)c, (__global const long2*)(b + f * get_group_id(0)), (size_t)f, 0);
  wait_group_events(1, &e);
  e = async_work_group_copy((__global long2*)(a + f * get_group_id(0)), (__local const long2*)c, (size_t)f, 0);
  wait_group_events(1, &e);
};
kernel void H(__global ulong2* a, __global ulong2* b, __local ulong2* c, int d) {
  event_t e;
  int f = d * get_local_size(0);
  int g;
  e = async_work_group_copy((__local ulong2*)c, (__global const ulong2*)(b + f * get_group_id(0)), (size_t)f, 0);
  wait_group_events(1, &e);
  e = async_work_group_copy((__global ulong2*)(a + f * get_group_id(0)), (__local const ulong2*)c, (size_t)f, 0);
  wait_group_events(1, &e);
};
kernel void I(__global float2* a, __global float2* b, __local float2* c, int d) {
  event_t e;
  int f = d * get_local_size(0);
  int g;
  e = async_work_group_copy((__local float2*)c, (__global const float2*)(b + f * get_group_id(0)), (size_t)f, 0);
  wait_group_events(1, &e);
  e = async_work_group_copy((__global float2*)(a + f * get_group_id(0)), (__local const float2*)c, (size_t)f, 0);
  wait_group_events(1, &e);
};