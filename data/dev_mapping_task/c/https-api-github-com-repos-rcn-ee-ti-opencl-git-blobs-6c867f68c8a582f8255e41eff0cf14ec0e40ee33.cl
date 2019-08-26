kernel void A(global char* a) {
  a[get_global_id(0)] = 'x';
}