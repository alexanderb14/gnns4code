__kernel void A(__global float4* a, __global float2* b, int c, int d) {
  const int e = get_global_id(0);
  const int f = get_global_id(1);

  if (e < c && f < d) {
  float4 g = (float4)( e f e f;
        float2 h = b[f*c + e] ;
        float4 i = (float4)(
            g           g           gh            gh
        if( e % 10 == 0 && f % 10 == 0 && __clc_fabs(h.x) < 20 && __clc_fabs(h.y) < 20)
        a[f*c + e ] = (float4)i;
        else
        a[f*c + e ] = (float4)(0,0,0,0);
  }
}