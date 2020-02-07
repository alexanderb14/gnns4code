struct s {
  __global int* p;
};

__kernel void A(__global int* a, struct s b) {
  b.p = a;
  b.p[get_global_id(0)] = 5;
}