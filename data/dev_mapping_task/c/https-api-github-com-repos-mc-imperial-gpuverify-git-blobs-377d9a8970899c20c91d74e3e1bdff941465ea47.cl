__kernel void A(__global unsigned* a, __local unsigned* b, __global float* c, __local float* d) {
  unsigned e;
  unsigned f;

  e = atomic_add(a, 1);
  f = atomic_add(b, 1);
  c[e] = get_global_id(0);
  d[f] = get_local_id(0);

  e = atomic_add(a, 1);
  f = atomic_add(b, 1);
  c[e] = get_global_id(0);
  d[f] = get_local_id(0);

  e = atomic_add(a, 1);
  f = atomic_add(b, 1);
  c[e] = get_global_id(0);
  d[f] = get_local_id(0);

  e = atomic_add(a, 1);
  f = atomic_add(b, 1);
  c[e] = get_global_id(0);
  d[f] = get_local_id(0);

  e = atomic_add(a, 1);
  f = atomic_add(b, 1);
  c[e] = get_global_id(0);
  d[f] = get_local_id(0);
}