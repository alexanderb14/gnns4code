typedef struct def_Vertex {
  float position[3];
  float normal[3];
  float texCoord[2];
  float color[4];
} Vertex;

typedef struct def_ClothVertexData {
  uint vertexID;
  float mass;
  float invmass;
} ClothVertexData;

inline float3 A(float a, float b, float c) {
  float3 d;
  d.x = a;
  d.y = b;
  d.z = c;
  return d;
}
__kernel void B(__global const Vertex* a, __global float* b, const float3 c, const float3 d) {
  float3 e = A(a[get_global_id(0)].position[0], a[get_global_id(0)].position[1], a[get_global_id(0)].position[2]);
  e.y = -e.y;

  const float3 f = e - c;

  const float3 g = d * dot(d, f);
  const float3 h = f - g;

  b[get_global_id(0)] = length(h);
}

__kernel void C(__global float3* a, __global float3* b, __global const Vertex* c, __global const ClothVertexData* d, const float e) {
  const float3 f = A(c[get_global_id(0)].position[0], c[get_global_id(0)].position[1], c[get_global_id(0)].position[2]);
  ;

  const float g = d[get_global_id(0)].invmass * d[get_global_id(0)].mass;
  ;

  float3 h = b[get_global_id(0)];
  ;

  h.y -= g * e * 9.82f;
  ;

  h = 0.99f * h;

  const float3 i = f + g * e * h;

  a[get_global_id(0)] = i;
}

__kernel void D(__global const float3* a, __global Vertex* b, __global float3* c, const float d) {
  const float3 e = A(b[get_global_id(0)].position[0], b[get_global_id(0)].position[1], b[get_global_id(0)].position[2]);
  const float3 f = a[get_global_id(0)];
  const float3 g = (f - e) / d;

  ;
  ;
  ;

  c[get_global_id(0)] = g;

  b[get_global_id(0)].position[0] = f.x;
  b[get_global_id(0)].position[1] = f.y;
  b[get_global_id(0)].position[2] = f.z;
}