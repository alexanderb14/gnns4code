void A(__global int* a) {
}

void B(__global int* a) {
  A(a);
}

__kernel void C(__global int* a) {
  if (get_local_id(0)) {
    B(a);
  }
}