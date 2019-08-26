struct s {
  int _;
  struct t {
    int a;
  } a;
};

__kernel void A(__global int* a, struct s b) {
  a[get_global_id(0)] = b.a.a;
}