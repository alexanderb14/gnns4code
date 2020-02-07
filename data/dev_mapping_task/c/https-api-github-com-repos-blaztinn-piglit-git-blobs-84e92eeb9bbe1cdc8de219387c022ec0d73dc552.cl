kernel void A(global int* a, global int* b, float c) {
  int d = get_global_id(0);
  b[d] = a[d] + c;
}

kernel void B(global float2* a, global float2* b, float2 c) {
  int d = get_global_id(0);
  b[d] = a[d] - c;
}