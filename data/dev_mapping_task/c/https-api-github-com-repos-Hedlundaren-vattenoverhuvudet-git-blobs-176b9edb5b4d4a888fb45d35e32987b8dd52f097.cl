struct __attribute__((packed)) Particle {
  float3 position;
  float3 velocity;

  float density;

  float3 force;
  float color_field;
};

__kernel void A(__global float3* a, __global float3* b, const float c) {
  const int d = get_global_id(0);

  a[d].x = a[d].x + c * b[d].x;
  a[d].y = a[d].y + c * b[d].y;
  a[d].z = a[d].z + c * b[d].z;
}