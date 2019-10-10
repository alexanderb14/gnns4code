__kernel void A(__global uint* a, const uint b, const uint c, const uint d) {
  uint e = get_global_id(0);
  uint f = d;

  uint g = 1 << (b - c);
  uint h = g << 1;

  uint i = (e % g) + (e / g) * h;

  uint j = i + g;

  uint k = a[i];
  uint l = a[j];

  uint m = 1 << b;

  if ((e / m) % 2 == 1)
    f = 1 - f;

  uint n;
  uint o;
  if (k > l) {
    n = k;
    o = l;
  } else {
    n = l;
    o = k;
  }

  if (f) {
    a[i] = o;
    a[j] = n;
  } else {
    a[i] = n;
    a[j] = o;
  }
}

__kernel void B(__global uint* a, const uint b, const uint c, const uint d, __local uint* e) {
  uint f = get_global_id(0);
  uint g = d;

  uint h = 1 << (b - c);
  uint i = h << 1;

  uint j = (f % h) + (f / h) * i;

  uint k = j + h;

  if (f == 0) {
    e[f] = a[j];
    e[f + 1] = a[k];
  } else {
    e[f + 1] = a[j];
    e[f + 2] = a[k];
  }
  barrier(1);

  uint l = 1 << b;

  if ((f / l) % 2 == 1)
    g = 1 - g;

  uint m;
  uint n;

  if (f == 0) {
    if (e[f] > e[f + 1]) {
      m = e[f];
      n = e[f + 1];
    } else {
      m = e[f + 1];
      n = e[f];
    }
  } else {
    if (e[f + 1] > e[f + 2]) {
      m = e[f + 1];
      n = e[f + 2];
    } else {
      m = e[f + 2];
      n = e[f + 1];
    }
  }

  if (g) {
    a[j] = n;
    a[k] = m;
  } else {
    a[j] = m;
    a[k] = n;
  }
}

__kernel void C(__global uint* a, const uint b, const uint c, const uint d, __local uint* e, __local uint* f) {
  uint g = get_global_id(0);
  uint h = d;

  uint i = 1 << (b - c);
  uint j = i << 1;

  uint k = (g % i) + (g / i) * j;

  uint l = k + i;

  if (g == 0) {
    e[g] = a[k];
    e[g + 1] = a[l];
  } else {
    e[g + 1] = a[k];
    e[g + 2] = a[l];
  }
  barrier(1);

  uint m = 1 << b;

  if ((g / m) % 2 == 1)
    h = 1 - h;

  uint n;
  uint o;

  if (g == 0) {
    if (e[g] > e[g + 1]) {
      n = e[g];
      o = e[g + 1];
    } else {
      n = e[g + 1];
      o = e[g];
    }
  } else {
    if (e[g + 1] > e[g + 2]) {
      n = e[g + 1];
      o = e[g + 2];
    } else {
      n = e[g + 2];
      o = e[g + 1];
    }
  }

  const uint p = 4;
  if (h) {
    f[g * p] = k;
    f[g * p + 1] = o;
    f[g * p + 2] = l;
    f[g * p + 3] = n;
  } else {
    f[g * p] = k;
    f[g * p + 1] = n;
    f[g * p + 2] = l;
    f[g * p + 3] = o;
  }
  barrier(1);

  if (g == 0) {
    for (int q = 0; q < 256 * p; ++q) {
      a[f[q * p]] = f[q * p + 1];
      a[f[q * p + 2]] = f[q * p + 3];
    }
  }
}