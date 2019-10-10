__kernel void A(int a, __global float4* b, __global float4* c) {
  int d = get_global_id(0);
  if (d >= a)
    return;
  b[a - d - 1].wzyx = c[d].xyzw;
}