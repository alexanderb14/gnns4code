kernel void A(global int* a, local int* b, const uint c, const uint d, global int* e, global int* f) {
  const uint g = get_global_id(0);
  const uint h = get_local_id(0);

  if (g < d) {
    if (h == 0) {
      b[h] = 0;
    } else {
      b[h] = e[g - 1];
    }
  } else {
    b[h] = 0;
  }

  barrier(1);

  for (uint i = 1; i < c; i <<= 1) {
    const int j = h >= i ? b[h - i] : 0;

    barrier(1);

    if (h >= i) {
      b[h] = b[h] + j;
    }

    barrier(1);
  }

  if (g < d) {
    f[g] = b[h];
  }

  if (h == c - 1 && g < d) {
    a[get_group_id(0)] = e[g] + b[h];
  }
}

kernel void B(global int* a, local int* b, const uint c, const uint d, global int* e, global int* f) {
  const uint g = get_global_id(0);
  const uint h = get_local_id(0);

  if (g < d) {
    b[h] = e[g];
  } else {
    b[h] = 0;
  }

  barrier(1);

  for (uint i = 1; i < c; i <<= 1) {
    const int j = h >= i ? b[h - i] : 0;

    barrier(1);

    if (h >= i) {
      b[h] = b[h] + j;
    }

    barrier(1);
  }

  if (g < d) {
    f[g] = b[h];
  }

  if (h == c - 1) {
    a[get_group_id(0)] = b[h];
  }
}

kernel void C(global int* a, global int* b, const uint c) {
  const uint d = get_global_id(0);
  const uint e = get_group_id(0);

  if (d < c) {
    a[d] += b[e];
  }
}