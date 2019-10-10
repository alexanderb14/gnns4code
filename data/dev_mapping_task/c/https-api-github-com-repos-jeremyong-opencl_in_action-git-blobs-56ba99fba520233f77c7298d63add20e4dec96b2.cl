__kernel void A(int a, int b, __local float* c, __local float* d, __local float* e, __global int* f, __global int* g, __global float* h, __global float* i, __global float* j) {
  local float k, l, m;

  int n = get_local_id(0);
  int o = 0;
  int p = 0;
  float q, r;

  for (int s = n; s < b; s++) {
    if ((f[s] == n) && (o == 0))
      o = s;
    else if ((f[s] == n + 1) && (p == 0)) {
      p = s - 1;
      break;
    } else if ((s == b - 1) && (p == 0)) {
      p = s;
    }
  }

  c[n] = i[n];
  d[n] = 0.0f;
  barrier(1);

  m = 0;
  while ((m < 1000) && (l >= 0.01)) {
    e[n] = 0.0f;
    for (int s = o; s <= p; s++) {
      e[n] += h[s] * c[g[s]];
    }
    barrier(1);

    if (n == 0) {
      q = 0.0f;
      r = 0.0f;
      for (int s = 0; s < a; s++) {
        q += c[s] * c[s];
        r += e[s] * c[s];
      }
      k = q / r;
    }
    barrier(1);

    d[n] += k * c[n];
    c[n] -= k * e[n];
    barrier(1);

    if (n == 0) {
      l = sqrt(q);
      m++;
    }
    barrier(1);
  }

  j[0] = m * 1.0f;
  j[1] = l;
}