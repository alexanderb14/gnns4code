void A(const int a, const ulong b, const ulong c, const ulong d, const uint e, const ulong f, __global int* g); int B(const int a, const ulong b, const ulong c, const ulong d, const ulong e, __global const int* f); typedef float real; __constant ulong Ga = 4294967291; __constant uint Gb = 41; void A(const int a, const ulong b, const ulong c, const ulong d, const uint e, const ulong f, __global int* g) {
  uint h;
  int i = 0;
  uint j;
  int k;
  int l = 1000;

  switch (a) {
    case -1:

      g[f] = e;

      break;
    case 0:
      h = (f * c + d) % Ga % b;
      k = atomic_cmpxchg(&g[2 * h], -1, f);

      for (int i = 1; k != (int)f && k != -1 && i < l; i++) {
        h++;
        h %= b;

        k = atomic_cmpxchg(&g[2 * h], -1, f);
      }

      if (i < l)
        g[2 * h + 1] = e;
      break;
    case 1:
      h = (f * c + d) % Ga % b;
      k = atomic_cmpxchg(&g[2 * h], -1, f);

      for (int i = 1; k != (int)f && k != -1 && i < l; i++) {
        h += (i * i);
        h %= b;

        k = atomic_cmpxchg(&g[2 * h], -1, f);
      }

      if (i < l)
        g[2 * h + 1] = e;
      break;
    case 2:
      j = 1 + f % Gb;
      h = (f * c + d) % Ga % b;
      k = atomic_cmpxchg(&g[2 * h], -1, f);

      for (int i = 1; k != (int)f && k != -1 && i < l; i++) {
        h += (i * j);
        h %= b;

        k = atomic_cmpxchg(&g[2 * h], -1, f);
      }

      if (i < l)
        g[2 * h + 1] = e;
      break;
  }
}

int B(const int a, const ulong b, const ulong c, const ulong d, const ulong e, __global const int* f) {
  int g = -1;
  uint h;
  int i = 0;
  uint j;

  switch (a) {
    case -1:

      return (f[e]);

      break;
    case 0:
      for (h = (e * c + d) % Ga % b; f[2 * h] != (int)e && f[2 * h] != -1; h++, h %= b)
        ;
      if (f[2 * h] != -1)
        g = f[2 * h + 1];
      return (g);
      break;
    case 1:
      for (h = (e * c + d) % Ga % b; f[2 * h] != (int)e && f[2 * h] != -1; h += (i * i), h %= b) {
        i++;
      }
      if (f[2 * h] != -1)
        g = f[2 * h + 1];
      return (g);
      break;
    case 2:
      j = 1 + e % Gb;
      for (h = (e * c + d) % Ga % b; f[2 * h] != (int)e && f[2 * h] != -1; h += (i * j), h %= b) {
        i++;
      }
      if (f[2 * h] != -1)
        g = f[2 * h + 1];
      return (g);
      break;
  }

  return (g);
}