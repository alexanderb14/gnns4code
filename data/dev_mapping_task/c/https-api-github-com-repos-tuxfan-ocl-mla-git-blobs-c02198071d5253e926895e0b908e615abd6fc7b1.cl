typedef struct position_ { float4 b; } position_t;

typedef struct acceleration_ { float4 a; } acceleration_t;

inline float4 A(float4 a, float4 b, float4 c) {
  float4 d;

  float4 e;
  const float4 f = {1.0f, 1.0f, 1.0f, 1.0f};
  const float4 g = {0.0f, 0.0f, 0.0f, 0.0f};

  e.x = a.x - a.x;
  e.y = a.y - a.y;
  e.z = a.z - a.z;

  d.x = b.x - a.x;
  d.y = b.y - a.y;
  d.z = b.z - a.z;

  float4 h = ((isnotequal(e, d)) ? (f) : (g));

  float i = (d.x) * (d.x) + (d.y) * (d.y) + (d.z) * (d.z) + .000001f;

  float j = 1.0f / sqrt(i);

  float k = (j) * (j) * (j);

  float l = b.w * k;

  c.x += d.x * l;
  c.y += d.y * l;
  c.z += d.z * l;

  c.w -= b.w * j * h.x;

  return c;
}

__kernel void B(__global position_t* a, __global acceleration_t* b, float c, __local float4* d) {
  size_t e = get_group_id(0);
  size_t f = get_num_groups(0);
  size_t g = get_local_id(0);
  size_t h = get_global_size(0);

  size_t i = e * 64 + g;
  float4 j = a[i].b;
  float4 k = {0.0f, 0.0f, 0.0f, 0.0f};
  floacsize_t m, n, o;

  for (m = 0, o = 0; m < h; m += 64, ++o) {
    size_t p = o * 64 + g;
    for (n = 0; n < 64; ++n) {
      k = A(j, a[p].b, k);
    }
  }

  b[i].a = k * l;
}