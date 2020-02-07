typedef struct __attribute__((aligned)) UserData {
  int x;
  int y;
  int z;
  int w;
  char c;
} UserData;

__kernel void A(__global UserData* a) {
  int b = get_global_id(0);
  a[b].w = a[b].x + a[b].y + a[b].z;
}