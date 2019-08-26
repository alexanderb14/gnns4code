typedef struct _env_t {
  long cols;
  long rows;
} env_t;

long A(__global uchar* a, long b, long c, long d) {
  return a[(((d - 1) * (b)) + (c - 1))] + 2 * a[(((d) * (b)) + (c - 1))] + a[(((d + 1) * (b)) + (c - 1))] - a[(((d - 1) * (b)) + (c + 1))] - 2 * a[(((d) * (b)) + (c + 1))] - a[(((d + 1) * (b)) + (c + 1))];
}

long B(__global uchar* a, long b, long c, long d) {
  return a[(((d - 1) * (b)) + (c - 1))] + 2 * a[(((d - 1) * (b)) + (c))] + a[(((d - 1) * (b)) + (c + 1))] - a[(((d + 1) * (b)) + (c - 1))] - 2 * a[(((d + 1) * (b)) + (c))] - a[(((d + 1) * (b)) + (c + 1))];
}