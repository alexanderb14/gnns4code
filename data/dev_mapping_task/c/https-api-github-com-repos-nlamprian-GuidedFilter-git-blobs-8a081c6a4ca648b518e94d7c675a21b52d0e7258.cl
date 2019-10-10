kernel void A(global float4* a, global float4* b, global float4* c) {
  int d = get_global_id(0);

  c[d] = a[d] * b[d];
}
kernel void B(global float4* a, global float4* b, int c) {
  int d = get_global_id(0);

  b[d] = pown(a[d], c);
}