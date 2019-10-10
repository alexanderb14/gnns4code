struct s {
  struct t {
    int a;
  } a;
};

__kernel void A(__global int* a, struct s b) {
  b.a.a = a[get_global_id(0)];
}