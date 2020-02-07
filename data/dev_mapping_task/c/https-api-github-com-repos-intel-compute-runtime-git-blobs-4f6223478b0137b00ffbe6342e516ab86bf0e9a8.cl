__kernel void A(__global int* a) {
  int b = get_global_id(0);
  int c = get_global_size(0);

  a[b] = c;
};

__kernel void B(__global int* a) {
  int b = get_global_id(0);
  int c = get_local_size(0);

  a[b] = c;
};