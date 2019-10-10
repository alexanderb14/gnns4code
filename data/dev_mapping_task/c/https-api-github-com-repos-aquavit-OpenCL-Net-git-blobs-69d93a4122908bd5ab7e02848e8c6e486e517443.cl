const sampler_t Ga = 0x0001 | 0x0002 | 0x0010; kernel void A(read_only image2d_t a, global float2* b, global float* c, local float4* d) {
  int e = get_global_id(0);
  float2 f = b[e];
 float2 g = (float2)(642.2889f / f192.5287f / f
 float4 h = read_imagef(a, Ga, g);

 c[e] = h.w;
}