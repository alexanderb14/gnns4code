typedef struct {
  int x;
  int y;
} S;

kernel void A(global S* a) {
  a[3].y = get_global_id(0);
}