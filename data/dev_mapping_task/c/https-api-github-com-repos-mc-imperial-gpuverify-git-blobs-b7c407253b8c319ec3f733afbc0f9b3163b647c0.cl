kernel void A(local int* a, local unsigned int* b, global int* c, global unsigned int* d) {
  atom_add(a, 10);
  atom_sub(a, 10);
  atom_xchg(a, 10);
  atom_min(a, 10);
  atom_max(a, 10);
  atom_and(a, 10);
  atom_or(a, 10);
  atom_xor(a, 10);
  atom_inc(a);
  atom_dec(a);
  atom_cmpxchg(a, 10, 10);

  atom_add(b, 10);
  atom_sub(b, 10);
  atom_xchg(b, 10);
  atom_min(b, 10);
  atom_max(b, 10);
  atom_and(b, 10);
  atom_or(b, 10);
  atom_xor(b, 10);
  atom_inc(b);
  atom_dec(b);
  atom_cmpxchg(b, 10, 10);

  atom_add(c, 10);
  atom_sub(c, 10);
  atom_xchg(c, 10);
  atom_min(c, 10);
  atom_max(c, 10);
  atom_and(c, 10);
  atom_or(c, 10);
  atom_xor(c, 10);
  atom_inc(c);
  atom_dec(c);
  atom_cmpxchg(c, 10, 10);

  atom_add(d, 10);
  atom_sub(d, 10);
  atom_xchg(d, 10);
  atom_min(d, 10);
  atom_max(d, 10);
  atom_and(d, 10);
  atom_or(d, 10);
  atom_xor(d, 10);
  atom_inc(d);
  atom_dec(d);
  atom_cmpxchg(d, 10, 10);
}