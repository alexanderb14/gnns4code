struct hop {
  int x[16];
};

__kernel void A(__global int* a, struct hop b) {
  int c = (int)get_global_id(0);
  a[c] = b.x[get_local_id(0)];
}