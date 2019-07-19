__kernel void A(__global uchar* a, __global uchar* b, __global uchar* c, uint d) {
  const int e = get_global_id(0);

  if (abs((int)a[e] - b[e - a[e]]) > d)
    c[e] = 0;
  else
    c[e] = a[e];
}