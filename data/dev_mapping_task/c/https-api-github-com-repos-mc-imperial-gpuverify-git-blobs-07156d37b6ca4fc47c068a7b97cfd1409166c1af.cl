kernel void A(global float4* a) {
  local float4 b[2][3][4][5];

  b[1][2][3][3].z = a[get_global_id(0)].x;
}