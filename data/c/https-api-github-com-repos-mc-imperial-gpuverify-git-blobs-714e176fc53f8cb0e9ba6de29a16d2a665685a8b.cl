struct s {
  int a[6];
};

__kernel void A(__global int* a, struct s b) {
  a[get_global_id(0)] = b.a[3];
}