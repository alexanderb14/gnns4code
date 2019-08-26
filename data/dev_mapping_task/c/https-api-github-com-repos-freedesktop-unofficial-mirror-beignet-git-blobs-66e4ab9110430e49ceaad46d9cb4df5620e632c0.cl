kernel void A(global long* a, global long* b, long c, long d) {
  int e = get_local_id(0);
  long f;

  if (e % 2 == 0) {
    f = mul_hi(a[e], c);
  } else {
    f = mul_hi(a[e], d);
  }
  b[e] = f;
}

kernel void B(global long* a, global long* b, long c, long d) {
  int e = get_local_id(0);
  long f;

  f = mad_sat(a[e], c, d);
  b[e] = f;
}