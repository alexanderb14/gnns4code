__kernel void A(__global float* a, __global float* b, __local float* c) {
  int d = get_group_id(0);
  int e = get_group_id(1);

  int f = get_local_id(0) & ((32) - 1);
  int g = get_local_id(0) >> (5);

  int h = mad24(g, (32) + 1, f);
  int i = mad24(f, (32) + 1, g);

  int j = mad24(d, (32), f);
  int k = mad24(e, (32), g);
  int l = mad24(k, (256), j);

  int m = mad24(e, (32), f);
  int n = mad24(d, (32), g);

  int o = mad24(n, (4096) + (32), m);

  int p = (256) * (2);
  int q = ((4096) + (32)) * (2);

  int r = (2) * ((32) + 1);
  int s = (2);

  c[h] = b[l];
  h += r;
  l += p;
  c[h] = b[l];
  h += r;
  l += p;
  c[h] = b[l];
  h += r;
  l += p;
  c[h] = b[l];
  h += r;
  l += p;
  c[h] = b[l];
  h += r;
  l += p;
  c[h] = b[l];
  h += r;
  l += p;
  c[h] = b[l];
  h += r;
  l += p;
  c[h] = b[l];
  h += r;
  l += p;
  c[h] = b[l];
  h += r;
  l += p;
  c[h] = b[l];
  h += r;
  l += p;
  c[h] = b[l];
  h += r;
  l += p;
  c[h] = b[l];
  h += r;
  l += p;
  c[h] = b[l];
  h += r;
  l += p;
  c[h] = b[l];
  h += r;
  l += p;
  c[h] = b[l];
  h += r;
  l += p;
  c[h] = b[l];

  barrier(1);

  a[o] = c[i];
  i += s;
  o += q;
  a[o] = c[i];
  i += s;
  o += q;
  a[o] = c[i];
  i += s;
  o += q;
  a[o] = c[i];
  i += s;
  o += q;
  a[o] = c[i];
  i += s;
  o += q;
  a[o] = c[i];
  i += s;
  o += q;
  a[o] = c[i];
  i += s;
  o += q;
  a[o] = c[i];
  i += s;
  o += q;
  a[o] = c[i];
  i += s;
  o += q;
  a[o] = c[i];
  i += s;
  o += q;
  a[o] = c[i];
  i += s;
  o += q;
  a[o] = c[i];
  i += s;
  o += q;
  a[o] = c[i];
  i += s;
  o += q;
  a[o] = c[i];
  i += s;
  o += q;
  a[o] = c[i];
  i += s;
  o += q;
  a[o] = c[i];
}