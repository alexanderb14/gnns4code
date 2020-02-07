struct s {
  int a[5];
};

__kernel void A(__global int* a, struct s b) {
  b.a[3] = a[get_global_id(0)];
}