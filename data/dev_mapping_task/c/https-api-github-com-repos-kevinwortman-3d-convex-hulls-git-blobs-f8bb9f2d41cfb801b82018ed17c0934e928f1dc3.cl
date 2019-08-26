constant int Ga = -1; constant float Gb = 1e30; typedef struct {
  float x;
  float y;
  float z;
  int prev;
  int next;
} Point;

__kernel void A(__global Point* a, __global int* b, __global int* c, __global int* d) {
  int e = get_global_id(0);
  int f = d[0];
  int g = e * f;
  int h = (g + ((e + 1) * f)) / 2;
  int i = g * 2;
  int j;

  int k = g;
  int l = h;
  int m = g * 2;
  int n = h * 2;

  for (; a[k].next != Ga; k = a[k].next)
    ;

  for (;;) {
    int o, p, q;

    float r;
    o = k;
    p = l;
    q = a[l].next;
    if (o == Ga || p == Ga || q == Ga)
      r = 1.0;
    else
      r = (a[p].x - a[o].x) * (a[q].y - a[o].y) - (a[q].x - a[o].x) * (a[p].y - a[o].y);

    float s;
    o = a[k].prev;
    p = k;
    q = l;
    if (o == Ga || p == Ga || q == Ga)
      s = 1.0;
    else
      s = (a[p].x - a[o].x) * (a[q].y - a[o].y) - (a[q].x - a[o].x) * (a[p].y - a[o].y);

    if (r < 0)
      l = a[l].next;
    else if (s < 0)
      k = a[k].prev;
    else
      break;
  }

  int t = i;
  float u = -Gb;
  float v;
  float w[6];
  int x;

  for (;; u = v) {
    int o, p, q;

    o = a[c[m]].prev;
    p = c[m];
    q = a[c[m]].next;
    if (o == Ga || p == Ga || q == Ga)
      w[0] = Gb;
    else
      w[0] = ((a[p].x - a[o].x) * (a[q].z - a[o].z) - (a[q].x - a[o].x) * (a[p].z - a[o].z)) / ((a[p].x - a[o].x) * (a[q].y - a[o].y) - (a[q].x - a[o].x) * (a[p].y - a[o].y));

    o = a[c[n]].prev;
    p = c[n];
    q = a[c[n]].next;
    if (o == Ga || p == Ga || q == Ga)
      w[1] = Gb;
    else
      w[1] = ((a[p].x - a[o].x) * (a[q].z - a[o].z) - (a[q].x - a[o].x) * (a[p].z - a[o].z)) / ((a[p].x - a[o].x) * (a[q].y - a[o].y) - (a[q].x - a[o].x) * (a[p].y - a[o].y));

    o = a[k].prev;
    p = k;
    q = l;
    if (o == Ga || p == Ga || q == Ga)
      w[2] = Gb;
    else
      w[2] = ((a[p].x - a[o].x) * (a[q].z - a[o].z) - (a[q].x - a[o].x) * (a[p].z - a[o].z)) / ((a[p].x - a[o].x) * (a[q].y - a[o].y) - (a[q].x - a[o].x) * (a[p].y - a[o].y));

    o = k;
    p = a[k].next;
    q = l;
    if (o == Ga || p == Ga || q == Ga)
      w[3] = Gb;
    else
      w[3] = ((a[p].x - a[o].x) * (a[q].z - a[o].z) - (a[q].x - a[o].x) * (a[p].z - a[o].z)) / ((a[p].x - a[o].x) * (a[q].y - a[o].y) - (a[q].x - a[o].x) * (a[p].y - a[o].y));

    o = k;
    p = a[l].prev;
    q = l;
    if (o == Ga || p == Ga || q == Ga)
      w[4] = Gb;
    else
      w[4] = ((a[p].x - a[o].x) * (a[q].z - a[o].z) - (a[q].x - a[o].x) * (a[p].z - a[o].z)) / ((a[p].x - a[o].x) * (a[q].y - a[o].y) - (a[q].x - a[o].x) * (a[p].y - a[o].y));

    o = k;
    p = l;
    q = a[l].next;
    if (o == Ga || p == Ga || q == Ga)
      w[5] = Gb;
    else
      w[5] = ((a[p].x - a[o].x) * (a[q].z - a[o].z) - (a[q].x - a[o].x) * (a[p].z - a[o].z)) / ((a[p].x - a[o].x) * (a[q].y - a[o].y) - (a[q].x - a[o].x) * (a[p].y - a[o].y));

    v = Gb;

    for (int y = 0; y < 6; y++) {
      if (w[y] > u && w[y] < v) {
        x = y;
        v = w[y];
      }
    }

    if (v == Gb)
      break;

    switch (x) {
      case 0:
        if (a[c[m]].x < a[k].x)
          b[t++] = c[m];

        j = c[m++];
        if (a[a[j].prev].next != j) {
          a[a[j].prev].next = a[a[j].next].prev = j;
        } else {
          a[a[j].prev].next = a[j].next;
          a[a[j].next].prev = a[j].prev;
        }

        break;
      case 1:
        if (a[c[n]].x > a[l].x)
          b[t++] = c[n];

        j = c[n++];
        if (a[a[j].prev].next != j) {
          a[a[j].prev].next = a[a[j].next].prev = j;
        } else {
          a[a[j].prev].next = a[j].next;
          a[a[j].next].prev = a[j].prev;
        }

        break;
      case 2:
        b[t++] = k;
        k = a[k].prev;
        break;
      case 3:
        k = a[k].next;
        b[t++] = k;
        break;
      case 4:
        l = a[l].prev;
        b[t++] = l;
        break;
      case 5:
        b[t++] = l;
        l = a[l].next;
        break;
    }
  }

  b[t] = Ga;

  a[k].next = l;
  a[l].prev = k;

  for (t--; t >= i; t--) {
    if (a[b[t]].x <= a[k].x || a[b[t]].x >= a[l].x) {
      j = b[t];
      if (a[a[j].prev].next != j) {
        a[a[j].prev].next = a[a[j].next].prev = j;
      } else {
        a[a[j].prev].next = a[j].next;
        a[a[j].next].prev = a[j].prev;
      }

      if (b[t] == k)
        k = a[k].prev;
      else if (b[t] == l)
        l = a[l].next;
    } else {
      a[k].next = b[t];
      a[b[t]].prev = k;
      a[l].prev = b[t];
      a[b[t]].next = l;

      if (a[b[t]].x < a[h].x)
        k = b[t];
      else
        l = b[t];
    }
  }
}