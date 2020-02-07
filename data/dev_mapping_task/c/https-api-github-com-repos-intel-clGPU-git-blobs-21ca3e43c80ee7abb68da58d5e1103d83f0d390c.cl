__kernel void A(uint a, float b, __global float* c, uint d, __global float* e, uint f, __global float* g, uint h) {
  h /= 4;
  const uint i = get_global_id(0);
  const uint j = get_global_id(1);

  uint k = j * h + i;

  bool l = (i + 1) * 4 > a;

  if (l) {
    k *= 4;
    float m = e[j * f];
    for (uint n = i * 4; n < a; n++) {
      float o = c[n * d];
      float p = g[k];
      float q = o * m;
      p = mad(b, q, p);
      g[k] = p;
      k++;
    }

  } else {
        float4 o = (float4)(ditd     float m = e[j * f];

        float4 p = vload4(k, g);
        float4 q = (float4)m * o;
        p = mad((float4)b, q, p);
        vstore4(p, k, g);
  }
}