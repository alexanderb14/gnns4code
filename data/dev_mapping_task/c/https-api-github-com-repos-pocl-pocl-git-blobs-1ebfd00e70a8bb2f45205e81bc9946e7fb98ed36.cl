typedef struct grid_t {
  double dt;
  double dx, dy, dz;
  int ai, aj, ak;
  int ni, nj, nk;
} grid_t;

kernel void A(global double* restrict const a, global double const* restrict const b, global double const* restrict const c, constant grid_t* restrict const d) {
  double const e = d->dt;

  double const f = d->dx;
  double const g = d->dy;
  double const h = d->dz;

  double const i = pown(e, 2);

  double const j = pown(f, -2);
  double const k = pown(g, -2);
  double const l = pown(h, -2);

  size_t const m = d->ai;
  size_t const n = d->aj;
  size_t const o = d->ak;

  size_t const p = d->ni;
  size_t const q = d->nj;
  size_t const r = d->nk;

  size_t const s = 1;
  size_t const t = s * m;
  size_t const u = t * n;
  size_t const v = get_global_id(0);
  size_t const w = get_global_id(1);
  size_t const x = get_global_id(2);

  if (__builtin_expect(v >= p || w >= q || x >= r, false))
    return;

  size_t const y = s * v + t * w + u * x;

  if (__builtin_expect(v == 0 || w == 0 || x == 0 || v == p - 1 || w == q - 1 || x == r - 1, false)) {
    a[y] = 0.0;

  } else {
    a[y] = 2.0 * b[y] - c[y] + i * ((b[y - s] - 2.0 * b[y] + b[y + s]) * j + (b[y - t] - 2.0 * b[y] + b[y + t]) * k + (b[y - u] - 2.0 * b[y] + b[y + u]) * l);
  }
}