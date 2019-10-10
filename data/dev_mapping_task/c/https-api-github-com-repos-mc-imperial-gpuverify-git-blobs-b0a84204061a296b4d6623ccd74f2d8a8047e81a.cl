__kernel void A() {
  int a[5] = {10, 20, 30, 40, 50};
  int b[40];
  b[get_global_id(1) * get_global_id(0)] = a[get_global_id(1) % 5];
}