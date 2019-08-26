__kernel void A(__global float* a, int b, int c) {
  int d, e;
  int f = c * b + c;

  for (d = 0; d < 64; d++) {
    if (get_local_id(0) > d) {
      for (e = 0; e < d; e++)
        a[f + get_local_id(0) * b + d] -= a[f + get_local_id(0) * b + e] * a[f + e * b + d];
      a[f + get_local_id(0) * b + d] /= a[f + d * b + d];
    }
    barrier(2);
    if (get_local_id(0) > d) {
      for (e = 0; e < d + 1; e++)
        a[f + (d + 1) * b + get_local_id(0)] -= a[f + (d + 1) * b + e] * a[f + e * b + get_local_id(0)];
    }
    barrier(2);
  }
}

__kernel void B(__global float* a, int b, int c) {
  int d, e, f;

  int g;
  int h;
  if (get_local_id(0) < 64) {
    h = get_local_id(0);

    f = c * b + c;

    for (d = 1; d < 64; d++) {
      for (e = 0; e < d; e++)
        a[f + d * b + (get_group_id(0) + 1) * 64 + h] -= a[f + d * b + e] * a[f + e * b + (get_group_id(0) + 1) * 64 + h];
    }

  } else {
    h = get_local_id(0) - 64;

    g = (c + (get_group_id(0) + 1) * 64) * b + c;

    f = c * b + c;

    for (d = 0; d < 64; d++) {
      for (e = 0; e < d; e++)
        a[g + h * b + d] -= a[g + h * b + e] * a[f + e * b + d];

      a[g + h * b + d] /= a[f + d * b + d];
    }
  }
}

__kernel void C(__global float* a, int b, int c) {
  int d;
  float e;

  int f = c + (get_group_id(1) + 1) * 64;
  int g = c + (get_group_id(0) + 1) * 64;

  e = 0;
  for (d = 0; d < 64; d++)
    e += a[(f + get_local_id(1)) * b + c + d] * a[(c + d) * b + g + get_local_id(0)];
  a[(f + get_local_id(1)) * b + g + get_local_id(0)] -= e;
}