__kernel void A(__global int* a) {
  int b = (int)get_global_id(0);

  int3 c = (int3) (b b;
  int d = b % 5;
  if (d == 1){
    c.x = c.y;
  }
  global int * e = a + b;
  *e = c.x;
}