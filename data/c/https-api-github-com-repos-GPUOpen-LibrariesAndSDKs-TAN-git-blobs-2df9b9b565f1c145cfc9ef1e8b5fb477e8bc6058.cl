__kernel __attribute__((reqd_work_group_size(256, 1, 1))) void A(__global uint4* a, __global float4* b) {
  int c = get_global_id(0);
  b[c] = convert_float4(a[c]) / 67108864.0f;
  a[c] = 0;
}