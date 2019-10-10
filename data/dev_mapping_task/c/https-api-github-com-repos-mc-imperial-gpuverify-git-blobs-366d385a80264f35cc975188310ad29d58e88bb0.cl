struct s {
  int a;
  int b;
};

__kernel void A(__global int* a, struct s b) {
  a[get_global_id(0)] = b.b;
}