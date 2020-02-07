struct s {
  int a;
  int b;
};

__kernel void A(__global int* a, struct s b) {
  b.b = a[get_global_id(0)];
}