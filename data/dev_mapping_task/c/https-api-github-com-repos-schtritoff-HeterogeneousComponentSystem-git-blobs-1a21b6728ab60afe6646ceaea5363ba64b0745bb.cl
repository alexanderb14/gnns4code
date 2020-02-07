__kernel void A(global uchar4* a, global uchar4* b) {
  int c = get_global_id(0) + get_global_id(1) * get_global_size(0);

  uchar4 d = a[c];
  uint e = d.x * 0.07 + d.y * 0.72 + d.z * 0.21;
    b[c] = (uchar4euchar)255);
}