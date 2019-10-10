__kernel void A(__global const float4* a, __global float4* b, float c) {
  int d = get_global_id(0);

  switch (d % 5) {
    case 0:
      b[d] = cos(a[d]);
      break;
    case 1:
      b[d] = __clc_fabs(a[d]) + c;
      break;
    case 2:
      b[d] = sin(a[d]);
      break;
    case 3:
      b[d] = sqrt(a[d]);
      break;
    case 4:
      b[d] = tan(a[d]);
      break;
  }
}