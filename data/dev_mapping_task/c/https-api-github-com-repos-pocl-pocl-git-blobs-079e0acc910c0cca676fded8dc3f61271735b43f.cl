struct fakecomplex {
  int x;
  int y;
};

__kernel void A(__global float* a, struct fakecomplex b) {
  int c = get_global_id(0);
  a[c] = b.x;
}