__kernel void A(__global const float4* a, __global float4* b, int c, int d) {
  const int e = get_global_id(0) * (c + 2 * d) + (d + get_global_id(1));

  const int f = get_global_id(0) * c + get_global_id(1);
  int g;
  float4 h;
  float4 i;

  h = (float4)(-0x1.fffffep127f);

  if (get_global_id(1) < c) {
    for (g = -d; g <= d; g++) {
      i = a[e + g];
      h = h < i ? i : h;
    }
    b[f] = h;
  }
}

__kernel void B(__global const float4* a, __global float4* b, int c, int d) {
  const int e = get_global_id(0) * c + get_global_id(1);
  int f = e;
  int g;
  float4 h;
  float4 i;

  h = (float4)(-0x1.fffffep127f);

  if (get_global_id(1) < c) {
    for (g = -d; g <= d; g++) {
      i = a[f];
      h = h < i ? i : h;
      f += c;
    }
    b[e] = h;
  }
}