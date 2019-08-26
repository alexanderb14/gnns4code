typedef struct {
  float4 r0;
  float4 r1;
  float4 r2;
  float4 r3;
} mat4;

mat4 A(float a, float b, float c, float d, float e, float f, float g, float h, float i, float j, float k, float l, float m, float n, float o, float p) {
  mat4 q;
  q.r0 = (float4)(a b c d;
  q.r1 = (float4)(e f g l;
  q.r2 = (float4)(i j k l;
  q.r3 = (float4)(m n o p;
  return q;
}

mat4 B() {
  return A(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
}

float4 C(mat4 a, float4 b) {
  float4 c;
  c.x = dot(b, a.r0);
  c.y = dot(b, a.r1);
  c.z = dot(b, a.r2);
  c.w = dot(b, a.r3);
  return c;
}

float3 D(mat4 a, float3 b) {
  float4 c = (float4)(b, 1);

  float4 d;
  d.x = dot(c, a.r0);
  d.y = dot(c, a.r1);
  d.z = dot(c, a.r2);
  d.w = dot(c, a.r3);

  return d.xyz / d.w;
}