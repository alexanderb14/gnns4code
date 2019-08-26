kernel void A(int a, global float* b, local float* c) {
  if ((int)get_global_id(0) < a) {
    b[get_global_id(0)] += 1.0f;
  }
}

kernel void B(int a, global float* b) {
  if ((int)get_global_id(0) < a) {
    b[get_global_id(0)] += 1.0f;
  }
}

kernel void C(global float* a) {
  int b = get_local_id(0);
  int c = get_local_size(0);

  for (int d = (c >> 1); d > 0; d >>= 1) {
    if (b < d) {
      a[b] = a[b] + a[b + d];
    }
    barrier(1);
  }
}

kernel void D(global float* a, local float* b) {
  int c = get_local_id(0);
  int d = get_local_size(0);

  b[c] = a[c];
  barrier(1);

  for (int e = (d >> 1); e > 0; e >>= 1) {
    if (c < e) {
      b[c] = b[c] + b[c + e];
    }
    barrier(1);
  }

  a[c] = b[c];
}

kernel void E(global float* a, local float* b) {
  int c = get_local_id(0);
  int d = get_local_size(0);
  b[c] = a[c];

  for (int e = (d >> 1); e > 0; e >>= 1) {
    b[c] = c < e ? b[c] + b[c + e] : b[c];
    barrier(1);
  }

  a[c] = b[c];
}

kernel void F(global float* a, local float* b) {
  int c = get_local_id(0);
  int d = get_local_size(0);
  b[c] = a[c];

  for (int e = (d >> 1); e > 0; e >>= 1) {
    b[c] = b[c] + b[c + e];
    barrier(1);
  }

  a[c] = b[c];
}

kernel void G(global float* a, global float* b, local float* c) {
  int d = get_global_id(0);
  int e = get_local_id(0);
  int f = get_local_size(0);
  int g = get_group_id(0);

  c[e] = a[d];
  barrier(1);
  for (int h = (f >> 1); h > 0; h >>= 1) {
    if (e < h) {
      c[e] = c[e] + c[e + h];
    }
    barrier(1);
  }

  a[d] = c[e];
  if (e == 0) {
    b[g] = c[0];
  }
}

kernel void H(global int* a, global int* b, local int* c) {
  int d = get_global_id(0);
  int e = get_local_id(0);
  int f = get_local_size(0);
  int g = get_group_id(0);

  c[e] = a[d];
  barrier(1);
  for (int h = (f >> 1); h > 0; h >>= 1) {
    if (e < h) {
      c[e] = c[e] + c[e + h];
    }
    barrier(1);
  }

  a[d] = c[e];
  if (e == 0) {
    b[g] = c[0];
  }
}

kernel void I(global int* a, global int* b) {
  int c = get_global_id(0);
  int d = get_local_id(0);
  int e = get_local_size(0);
  int f = get_group_id(0);

  barrier(1);
  for (int g = (e >> 1); g > 0; g >>= 1) {
    if (d < g) {
      a[c] = a[c] + a[c + g];
    }
    barrier(1);
  }

  if (d == 0) {
    b[f] = a[c];
  }
}

kernel void J(global int* a, global int* b, local int* c, local int* d) {
  int e = get_global_id(0);
  int f = get_local_id(0);
  int g = get_local_size(0);
  int h = get_group_id(0);

  c[f] = a[e];
  barrier(1);
  int i = 0;
  int j = c[f];
  for (int k = 0; k < g; k++) {
    i += j * c[k];
  }
  d[f] = i;
  barrier(1);
  for (int l = (g >> 1); l > 0; l >>= 1) {
    if (f < l) {
      d[f] = d[f] + d[f + l];
    }
    barrier(1);
  }

  if (f == 0) {
    b[h] = d[0];
  }
}

kernel void K(global int* a, global int* b, global int* c) {
  int d = get_global_id(0);
  int e = get_local_id(0);
  int f = get_local_size(0);
  int g = get_group_id(0);

  const int h = g * f;

  int i = 0;
  int j = a[d];
  for (int k = 0; k < f; k++) {
    i += a[h + k] * j;
  }
  b[d] = i;
  barrier(1);
  for (int l = (f >> 1); l > 0; l >>= 1) {
    if (e < l) {
      b[d] = b[d] + b[d + l];
    }
    barrier(1);
  }

  if (e == 0) {
    c[g] = b[d];
  }
}