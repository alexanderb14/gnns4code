inline float A(uint4 a, __global float4* b) {
  const float4 c = b[a.x];
  const float4 d = b[a.y];
  const float4 e = b[a.z];
  return length(cross(d - c, e - c)) / 2;
}

__kernel void B(__global float* a, __global uint4* b, __global float4* c, const uint d) {
  uint e = get_local_id(0) + (512 * get_group_id(0));
  for (uint f = 0; f < 4; f++) {
    if (e < d) {
      a[e] = A(b[e], c);
      e += 128;
    }
  }
}