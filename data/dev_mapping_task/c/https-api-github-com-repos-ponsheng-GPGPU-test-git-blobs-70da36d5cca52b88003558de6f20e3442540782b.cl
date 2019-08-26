__kernel void A(__global unsigned int* a, volatile __global unsigned int* b) {
  int c = get_global_id(0);
  int d;

  d = a[3 * c];
  atomic_add(&b[d], 1);

  d = a[3 * c + 1];
  atomic_add(&(b + 256)[d], 1);

  d = a[3 * c + 2];
  atomic_add(&(b + 256 + 256)[d], 1);
}