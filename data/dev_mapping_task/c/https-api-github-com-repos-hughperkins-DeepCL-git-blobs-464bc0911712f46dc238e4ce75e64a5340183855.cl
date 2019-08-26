void kernel A(global const int* a, global const int* b, global const int* c, global const int* d, global int* e) {
  int f = get_global_id(0);
  int g = a[0];
  int h = b[0];
  int i = f / (g * g) * (g * g);
  int j = f % (g * g);
  int k = j / g;
  int l = j % g;
  int m = h >> 1;
  int n = 0;
  int o = max(-m, -k);
  int p = min(m, g - 1 - k);
  int q = max(-m, -l);
  int r = min(m, g - 1 - l);
  int s = o;
  while (s <= p) {
    int t = (k + s);
    int u = i + t * g;
    int v = (s + m) * h + m;
    int w = q;
    while (w <= r) {
      int x = l + w;
      n += c[u + x] * d[v + w];
      w++;
    }
    s++;
  }
  e[f] = n;
}

void kernel B(global const int* a, global const int* b, global const float* c, global const float* d, global float* e) {
  int f = get_global_id(0);
  int g = a[0];
  int h = b[0];
  int i = f / (g * g) * (g * g);
  int j = f % (g * g);
  int k = j / g;
  int l = j % g;
  int m = h >> 1;
  float n = 0;
  int o = max(-m, -k);
  int p = min(m, g - 1 - k);
  int q = max(-m, -l);
  int r = min(m, g - 1 - l);
  int s = o;
  while (s <= p) {
    int t = (k + s);
    int u = i + t * g;
    int v = (s + m) * h + m;
    int w = q;
    while (w <= r) {
      int x = l + w;
      n += c[u + x] * d[v + w];
      w++;
    }
    s++;
  }
  e[f] = n;
}

void kernel C(global const int* a, global const int* b, global const int* c, global const int* d, global const int* e, global const int* f, global int* g) {
  int h = get_global_id(0);

  int i = a[0];
  int j = b[0];
  int k = c[0];
  int l = d[0];
  int m = k * k;

  int n = h / m;
  int o = n % j;
  int p = n / j;

  int q = o * l * l;
  int r = p * i * m;

  int s = h % m;
  int t = s / k;
  int u = s % k;

  int v = l >> 1;
  int w = 0;
  int x = max(-v, -t);
  int y = min(v, k - 1 - t);
  int z = max(-v, -u);
  int aa = min(v, k - 1 - u);
  int ab = 0;
  while (ab < i) {
    int ac = r + ab * m;
    int ad = q + ab * l * l;
    int ae = x;
    while (ae <= y) {
      int af = t + ae;
      int ag = ac + af * k;
      int ah = ad + (ae + v) * l + v;
      int ai = z;
      while (ai <= aa) {
        int aj = u + ai;
        w += e[ag + aj] * f[ah + ai];
        ai++;
      }
      ae++;
    }
    ab++;
  }
  g[h] = w;
}
void kernel D(const int a, const int b, const int c, const int d, global const float* e, global const float* f, global float* g) {
  int h = get_global_id(0);

  int i = c * c;

  int j = h / i;
  int k = j % b;
  int l = j / b;

  int m = k * d * d;
  int n = l * a * i;

  int o = h % i;
  int p = o / c;
  int q = o % c;

  int r = d >> 1;
  float s = 0;

  int t = max(-r, -p);
  int u = min(r, c - 1 - p);
  int v = max(-r, -q);
  int w = min(r, c - 1 - q);
  int x = 0;
  while (x < a) {
    int y = n + x * i;
    int z = t;
    while (z <= u) {
      int aa = p + z;
      int ab = y + aa * c;
      int ac = m + (z + r) * d + r;
      int ad = v;
      while (ad <= w) {
        int ae = q + ad;
        s += e[ab + ae] * f[ac + ad];
        ad++;
      }
      z++;
    }
    x++;
  }

  g[h] = s;
}

void kernel E(const int a, const int b, const int c, const int d, global const float* e, global const float* f, global float* g) {
  int h = get_global_id(0);

  int i = c * c;
  int j = c - d + 1;
  int k = j * j;

  int l = h / k;
  int m = l % b;
  int n = l / b;

  int o = m * d * d;
  int p = n * a * i;

  int q = h % k;
  int r = q / j;
  int s = q % j;

  int t = d >> 1;
  float u = 0;
  int v = -t;
  int w = t;
  int x = -t;
  int y = t;
  int z = 0;
  while (z < a) {
    int aa = p + z * i;
    int ab = v;
    while (ab <= w) {
      int ac = r + ab + t;
      int ad = aa + ac * c;
      int ae = o + (ab + t) * d + t;
      int af = x;
      while (af <= y) {
        int ag = s + af + t;
        u += e[ad + ag] * f[ae + af];
        af++;
      }
      ab++;
    }
    z++;
  }
  g[h] = u;
}