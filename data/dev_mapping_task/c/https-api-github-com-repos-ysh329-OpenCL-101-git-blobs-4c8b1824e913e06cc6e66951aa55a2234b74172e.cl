__kernel void A(const int a, const int b, __global const float* c, __global float* d) {
  const int e = 4;
  const int f = get_global_id(0) * e;
  const int g = get_global_id(1) * e;

  if ((g < a) && (f < b)) {
    __global float* h = c + (g + 0) * b + (f + 0);
    __global float* i = c + (g + 1) * b + (f + 0);
    __global float* j = c + (g + 2) * b + (f + 0);
    __global float* k = c + (g + 3) * b + (f + 0);

    float4 l = *((__global float4*)h);
    float4 m = *((__global float4*)i);
    float4 n = *((__global float4*)j);
    float4 o = *((__global float4*)k);

    d[(f + 0) * a + (g + 0)] = l.x;
    d[(f + 1) * a + (g + 0)] = l.y;
    d[(f + 2) * a + (g + 0)] = l.z;
    d[(f + 3) * a + (g + 0)] = l.w;

    d[(f + 0) * a + (g + 1)] = m.x;
    d[(f + 1) * a + (g + 1)] = m.y;
    d[(f + 2) * a + (g + 1)] = m.z;
    d[(f + 3) * a + (g + 1)] = m.w;

    d[(f + 0) * a + (g + 2)] = n.x;
    d[(f + 1) * a + (g + 2)] = n.y;
    d[(f + 2) * a + (g + 2)] = n.z;
    d[(f + 3) * a + (g + 2)] = n.w;

    d[(f + 0) * a + (g + 3)] = o.x;
    d[(f + 1) * a + (g + 3)] = o.y;
    d[(f + 2) * a + (g + 3)] = o.z;
    d[(f + 3) * a + (g + 3)] = o.w;
  }
}