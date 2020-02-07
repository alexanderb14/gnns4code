__kernel void A(__global float4* a) {
  unsigned int b = get_global_id(0);

  if (b == 0)
    a[b] = (float4)(-0.5f, 0.5f, 0.0f, 1.0f);
  else if (b == 1)
    a[b] = (float4)(-0.5f, 0.0f, 0.0f, 1.0f);
  else if (b == 2)
    a[b] = (float4)(0.0f, 0.0f, 0.0f, 1.0f);
}