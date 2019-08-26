__kernel void A(__global int4* a) {
  unsigned int b = get_global_id(0);
  a[b].x = 0;
  a[b].y = 1;
  a[b].z = 2;
  a[b].w = 3;
}

__kernel void B(__global float4* a) {
  unsigned int b = get_global_id(0);
  a[b].x = 0.0f;
  a[b].y = 1.0f;
  a[b].z = 2.0f;
  a[b].w = 3.0f;
}