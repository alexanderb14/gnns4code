__kernel void A(__global float* a) {
  uint b = get_global_id(0);

  a[b] = 0.f;
}

__kernel void B(__global float* a, int b) {
  uint c = get_global_id(1);
  uint d = get_global_id(0);

  a[c * b + d] = 0.f;
}