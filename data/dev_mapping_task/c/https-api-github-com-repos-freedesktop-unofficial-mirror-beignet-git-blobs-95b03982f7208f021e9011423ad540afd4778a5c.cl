kernel void A(global float* a, global float* b, global float* c, global float* d) {
  int e = get_global_id(0);
  const float f = b[e], g = c[e], h = d[e];
  switch (e) {
    case 0:
      a[e] = mad(f, g, h);
      break;
    case 1:
      a[e] = __clc_fma(f, g, h);
      break;
    default:
      a[e] = 1.f;
      break;
  };
}