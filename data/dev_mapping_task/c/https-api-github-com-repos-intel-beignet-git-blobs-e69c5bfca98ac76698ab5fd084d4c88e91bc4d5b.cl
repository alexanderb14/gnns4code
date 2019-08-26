kernel void A(global long* a, global long* b, global long* c, long d) {
  int e = get_global_id(0);

  if (e < 5)
    c[e] = a[e] + b[e] + b[e] * d;
  if (e > 5)
    c[e] = a[e] - b[e] - d;
}