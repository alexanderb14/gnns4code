typedef struct UserData {
  int x;
  int y;
  int z;
  int w;
} UserData;

__kernel void A(__global UserData* a) {
  int b = get_global_id(0);
  a[b].w = a[b].x + a[b].y + a[b].z;
}