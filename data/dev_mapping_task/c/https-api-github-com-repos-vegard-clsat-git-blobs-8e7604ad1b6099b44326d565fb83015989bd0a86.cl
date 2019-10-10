typedef uchar u8; typedef ushort u16; typedef uint u32; typedef ulong u64; struct thread_state {
  u32 rnd;
  u32 nr_sat_clauses;
};

struct clause {
  u32 literals[4];
};

inline u32 A(u32 a, const unsigned int b, const unsigned int c) {
  return (a >> b) & ((1U << c) - 1);
}

u8 B(__global u8* a, u32 b) {
  bool c = b & 1;
  u32 d = b >> 1;

  return a[d * 256 + get_local_id(0)] ^ c;
}

void C(__global u8* a, u32 b, u8 c) {
  bool d = b & 1;
  u32 e = b >> 1;

  a[e * 256 + get_local_id(0)] = c ^ d;
}

__kernel void D(__global struct thread_state* a, __global u8* b, unsigned int c, __global const struct clause* d, unsigned int e, unsigned int f) {
  struct thread_state g = a[get_global_id(0)];

  __local struct clause h[256];
  unsigned int i = 0;

  h[get_local_id(0)] = d[get_local_id(0)];
  barrier(1);

  for (unsigned int j = 0; j < f; ++j) {
    g.rnd ^= ((g.rnd << 4) | (g.rnd >> 28)) + 0xcafebabe;

    struct clause k = h[i];
    u8 l = B(b, k.literals[0]);
    u8 m = B(b, k.literals[1]);
    u8 n = B(b, k.literals[2]);
    u8 o = B(b, k.literals[3]);
    u8 p = l | m | n | o;

    u8 q = (!l && k.literals[0]) * (1 + A(g.rnd, 0, 4));
    u8 r = (!m && k.literals[1]) * (1 + A(g.rnd, 4, 4));
    u8 s = (!n && k.literals[2]) * (1 + A(g.rnd, 8, 4));
    u8 t = (!o && k.literals[3]) * (1 + A(g.rnd, 12, 4));

    u8 u = ((q < r) ? (1) : (0));
    u8 v = max(q, r);

    u = ((v < s) ? (2) : (u));
    v = max(v, s);

    u = ((v < t) ? (3) : (u));
    v = max(v, t);

    C(b, k.literals[0], l ^ (!p && u == 0));
    C(b, k.literals[1], m ^ (!p && u == 1));
    C(b, k.literals[2], n ^ (!p && u == 2));
    C(b, k.literals[3], o ^ (!p && u == 3));

    g.nr_sat_clauses = ((p) ? (g.nr_sat_clauses + 1) : (0));

    if (++i == 256) {
      i = 0;

      e += get_local_size(0);
      if (e == c)
        e = 0;

      h[get_local_id(0)] = d[e + get_local_id(0)];
      barrier(1);
    }
  }

  a[get_global_id(0)] = g;
}