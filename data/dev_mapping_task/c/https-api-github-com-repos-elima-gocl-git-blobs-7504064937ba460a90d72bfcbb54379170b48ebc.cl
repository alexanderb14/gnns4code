__kernel void A(__global char* a, const int b) {
  int2 c = {get_local_id(0), get_local_id(1)};
  int2 d = {get_global_id(0), get_global_id(1)};

  a[d.y * get_global_size(0) + d.x] = (c.y << 4) + c.x;
}