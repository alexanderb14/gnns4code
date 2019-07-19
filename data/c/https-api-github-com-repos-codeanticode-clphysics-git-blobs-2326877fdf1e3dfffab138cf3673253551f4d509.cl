kernel void A(global float4* a, global float4* b, global float4* c, local float4* d, float e, float f) {
  int g = get_global_id(0);
  int h = get_local_id(0);

  int i = get_global_size(0);
  int j = get_local_size(0);

  int k = i / j;

  float4 l = c[g];
  float4 m = (float4)(0, 0, 0, 0);
  float4 n = b[g];
  float o = a[g].y;

  for (int p = 0; p < k; p++) {
    d[h].xyz = b[p * j + h].xyz;
    d[h].w = a[p * j + h].y;

    barrier(1);

    for (int q = 0; q < j; q++) {
      float4 r = (floatq)(dyz, 0);
      float s = d[q].w;
      float4 t = r - n;

      float u = (1.f / sqrt(t.x * t.x + t.y * t.y + t.z * t.z));
      if (u > f) {
        u = f;
      }

      float v = e * o * s * u * u * u;
      m += v * t;
    }

    barrier(1);
  }

  c[g] = l + m;
}