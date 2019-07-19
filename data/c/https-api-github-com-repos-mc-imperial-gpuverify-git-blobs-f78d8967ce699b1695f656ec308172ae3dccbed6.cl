struct s {
  __global int* p[5];
};

__kernel void A(__global int* a, struct s b) {
  b.p[3] = a;
  b.p[3][get_global_id(0)] = 5;
}