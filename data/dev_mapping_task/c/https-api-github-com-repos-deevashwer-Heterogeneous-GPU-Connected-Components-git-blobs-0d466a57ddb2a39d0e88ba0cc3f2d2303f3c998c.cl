struct Edge {
  int u, v;
};

struct Auxiliary {
  int num_threads;
  int group_size;
  bool flag;
  bool iter_flag;
  bool pointer_jumping_flag;
};

kernel void A(global int* a, int b, global struct Auxiliary* c) {
  int d = get_global_id(0);
  for (int e = d; e < b; e += c->num_threads)
    a[e] = e;
}

kernel void B(global int* a, global struct Edge* b, global int* c, global bool* d, int e, global struct Auxiliary* f) {
  int g = get_global_id(0);
  int h, i, j;
  int k, l;
  for (int m = g; m < e; m += f->num_threads) {
    j = c[m];
    h = b[j].u;
    i = b[j].v;
    if (d[j] && (a[h] != a[i])) {
      f->flag = false;
      k = (a[h] > a[i]) ? a[h] : a[i];
      l = (a[h] < a[i]) ? a[h] : a[i];

      a[l] = k;

    } else
      d[j] = false;
  }
}

kernel void C(global int* a, int b, global struct Auxiliary* c, int d) {
  int e = get_global_id(0);
  int f = get_local_id(0);
  int g, h;
  __local bool i;
  if (f == 0)
    i = false;
  barrier(1);
  for (int j = e; j < b; j += c->num_threads) {
    g = a[j + d];
    h = a[g];
    if (h != g) {
      i = true;
      a[j + d] = h;
    }
  }
  if (f == 0)
    if (i)
      c->pointer_jumping_flag = true;
}

kernel void D(global int* a, global int* b, int c, global struct Auxiliary* d, int e) {
  int f = get_global_id(0);
  for (int g = f; g < c; g += d->num_threads) {
    if (a[g + e] == (g + e))
      b[g + e] = 0;
    else
      b[g + e] = 1;
  }
}

kernel void E(global int* a, global int* b, global int* c, int d, global struct Auxiliary* e) {
  int f = get_global_id(0);
  int g = get_local_id(0);
  int h, i, j;
  __local bool k;
  if (g == 0)
    k = false;
  barrier(1);
  for (int l = f; l < d; l += e->num_threads) {
    j = c[l];
    if (b[j] == 0) {
      h = a[j];
      i = a[h];
      if (i != h) {
        k = true;
        a[j] = i;
      } else
        b[j] = -1;
    }
  }
  if (g == 0)
    if (k)
      e->pointer_jumping_flag = true;
}

kernel void F(global int* a, global int* b, global int* c, int d, global struct Auxiliary* e) {
  int f = get_global_id(0);
  int g = get_local_id(0);
  int h, i;
  for (int j = f; j < d; j += e->num_threads) {
    if (b[j] == 1) {
      h = a[j];
      i = a[h];
      if (i != h)
        a[j] = i;
    }
  }
}
kernel void G(global int* a, global struct Edge* b, global bool* c, int d, global struct Auxiliary* e) {
  int f = get_global_id(0);
  int g, h;
  int i, j;
  for (int k = f; k < d; k += e->num_threads) {
    g = b[k].u;
    h = b[k].v;
    if (c[k] && (a[g] != a[h])) {
      e->flag = false;

      j = (a[g] < a[h]) ? a[g] : a[h];
      a[a[g]] = j;
      a[a[h]] = j;
    } else
      c[k] = false;
  }
}