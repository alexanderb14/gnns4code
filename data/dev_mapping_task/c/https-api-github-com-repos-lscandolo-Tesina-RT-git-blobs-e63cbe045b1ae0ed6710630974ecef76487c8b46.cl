typedef struct {
  float3 position;
  float3 normal;
  float4 tangent;
  float3 bitangent;
  float2 texCoord;
} Vertex;

typedef unsigned int tri_id;

kernel void A(global Vertex* a, float b, float c, float d)

{
  int e = get_global_id(0);

  a[e].position.y = d * sin(0.33f * b + a[e].position.x) * cos(0.57f * b + a[e].position.z);

  float f = (0.33f + fmod(0.01238431 * e, 0.23467)) * b;
  float g = (0.57f + fmod(0.02173 * e, 0.3237247)) * b;

  a[e].normal.x = cos(f + a[e].position.x);
  a[e].normal.z = -sin(g + a[e].position.z);

  return;
}