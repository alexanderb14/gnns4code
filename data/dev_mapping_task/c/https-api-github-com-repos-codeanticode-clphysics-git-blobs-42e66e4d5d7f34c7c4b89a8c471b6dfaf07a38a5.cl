kernel void A(global float4* a, global float4* b, global float4* c, float d) {
  int e = get_global_id(0);

  bool f = 0 < a[e].x;
  if (f) {
    return;
  }

  c[e] += -d * b[e];
}