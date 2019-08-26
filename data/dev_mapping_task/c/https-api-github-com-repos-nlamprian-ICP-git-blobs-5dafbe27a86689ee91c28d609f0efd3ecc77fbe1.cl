kernel void A(global int4* a, global int4* b, local int* c, global int* d, uint e) {
  uint f = get_local_size(0);
  uint g = get_num_groups(0);

  uint h = get_global_id(0);
  uint i = get_global_id(1);
  uint j = get_local_id(0);
  uint k = get_group_id(0);

  uint l = 1;

  int4 m = (int4)(2 * h) < (int4)(e);
  int4 n = ((m) ? (a[i * e + 2 * h]) : ((int4)(0)));
  m = (int4)(2 * h + 1) < (int4)(e);
  int4 o = ((m) ? (a[i * e + 2 * h + 1]) : ((int4)(0)));

  n.y += n.x;
  n.z += n.y;
  n.w += n.z;
  o.y += o.x;
  o.z += o.y;
  o.w += o.z;

  c[2 * j] = n.w;
  c[2 * j + 1] = o.w;

  for (uint p = f; p > 0; p >>= 1) {
    barrier(1);
    if (j < p) {
      uint q = l * (2 * j + 1) - 1;
      uint r = l * (2 * j + 2) - 1;
      c[r] += c[q];
    }
    l <<= 1;
  }

  if ((g != 1) && (j == f - 1))
    d[i * g + k] = c[2 * j + 1];

  if (j == (f - 1))
    c[2 * j + 1] = 0;

  for (uint p = 1; p < (2 * f); p <<= 1) {
    l >>= 1;
    barrier(1);
    if (j < p) {
      uint q = l * (2 * j + 1) - 1;
      uint r = l * (2 * j + 2) - 1;
      int s = c[q];
      c[q] = c[r];
      c[r] += s;
    }
  }
  barrier(1);

  if ((2 * h) < e) {
    n += c[2 * j];
    b[i * e + 2 * h] = n;
  }

  if ((2 * h + 1) < e) {
    o += c[2 * j + 1];
    b[i * e + 2 * h + 1] = o;
  }
}
kernel void B(global int4* a, global int4* b, local int* c, global int* d, uint e) {
  uint f = get_local_size(0);
  uint g = get_num_groups(0);

  uint h = get_global_id(0);
  uint i = get_global_id(1);
  uint j = get_local_id(0);
  uint k = get_group_id(0);

  uint l = 1;

  int4 m = (int4)(2 * h) < (int4)(e);
  int4 n = ((m) ? (a[i * e + 2 * h]) : ((int4)(0)));
  m = (int4)(2 * h + 1) < (int4)(e);
  int4 o = ((m) ? (a[i * e + 2 * h + 1]) : ((int4)(0)));

  n.y += n.x;
  n.z += n.y;
  n.w += n.z;
  o.y += o.x;
  o.z += o.y;
  o.w += o.z;

  c[2 * j] = n.w;
  c[2 * j + 1] = o.w;

  n = (int4)(0, n.xyz);
  o = (int4)(0, o.xyz);

  for (uint p = f; p > 0; p >>= 1) {
    barrier(1);
    if (j < p) {
      uint q = l * (2 * j + 1) - 1;
      uint r = l * (2 * j + 2) - 1;
      c[r] += c[q];
    }
    l <<= 1;
  }

  if ((g != 1) && (j == f - 1))
    d[i * g + k] = c[2 * j + 1];

  if (j == (f - 1))
    c[2 * j + 1] = 0;

  for (uint p = 1; p < (2 * f); p <<= 1) {
    l >>= 1;
    barrier(1);
    if (j < p) {
      uint q = l * (2 * j + 1) - 1;
      uint r = l * (2 * j + 2) - 1;
      int s = c[q];
      c[q] = c[r];
      c[r] += s;
    }
  }
  barrier(1);

  if ((2 * h) < e) {
    n += c[2 * j];
    b[i * e + 2 * h] = n;
  }

  if ((2 * h + 1) < e) {
    o += c[2 * j + 1];
    b[i * e + 2 * h + 1] = o;
  }
}
kernel void C(global int* a, global int4* b, uint c) {
  uint d = get_num_groups(0);

  uint e = get_global_id(0);
  uint f = get_global_id(1);
  uint g = get_group_id(0);

  int h = a[f * (d + 1) + g];

  if (e < c)
    b[f * c + e] += h;
}