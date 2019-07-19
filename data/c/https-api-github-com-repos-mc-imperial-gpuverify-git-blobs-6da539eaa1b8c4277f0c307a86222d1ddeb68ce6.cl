typedef struct {
  float x;
  float y;
  float z;
  float w;
} my_float4;

kernel void A(global my_float4* a) {
  local my_float4 b[2][3][4][5];

  b[1][2][3][3].z = a[get_global_id(0)].x;
}