__kernel void A(__global uint* a, const int b, const int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);

  int f = a[e * b + c] + a[c * b + d];

  if (a[e * b + d] > f)
    a[e * b + d] = f;
}