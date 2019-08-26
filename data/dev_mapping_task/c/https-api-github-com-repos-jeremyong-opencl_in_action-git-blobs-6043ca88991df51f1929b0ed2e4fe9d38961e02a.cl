__kernel void A(__local float* a, __global float* b, __global float* c, __global float* d, __global float* e) {
  local float f, g;
  float h, i = 0.0f;

  int j = get_local_id(0);
  int k = get_global_size(0);

  a[j] = b[j * k];
  barrier(1);

  if (j == 0) {
    for (int l = 1; l < k; l++) {
      i += a[l] * a[l];
    }
    f = i;
    i = sqrt(i + a[0] * a[0]);
    b[0] = i;
    a[0] -= i;
    f += a[0] * a[0];
  } else {
    b[j * k] = 0.0f;
  }
  barrier(2);

  for (int l = 1; l < k; l++) {
    g = 0.0f;
    if (j == 0) {
      for (int m = 0; m < k; m++) {
        g += b[m * k + l] * a[m];
      }
    }
    barrier(1);
    b[j * k + l] -= 2 * a[j] * g / f;
  }

  for (int l = 0; l < k; l++) {
    c[j * k + l] = -2 * a[l] * a[j] / f;
  }
  c[j * k + j] += 1;
  barrier(2);

  for (int n = 1; n < k - 1; n++) {
    a[j] = b[j * k + n];
    barrier(1);

    if (j == n) {
      i = 0.0f;
      for (int l = n + 1; l < k; l++) {
        i += a[l] * a[l];
      }
      f = i;
      i = sqrt(i + a[n] * a[n]);
      a[n] -= i;
      f += a[n] * a[n];
      b[n * k + n] = i;
    } else if (j > n) {
      b[j * k + n] = 0.0f;
    }
    barrier(2);

    for (int l = n + 1; l < k; l++) {
      if (j == 0) {
        g = 0.0f;
        for (int m = n; m < k; m++) {
          g += b[m * k + l] * a[m];
        }
      }
      barrier(1);

      if (j >= n)
        b[j * k + l] -= 2 * a[j] * g / f;
      barrier(2);
    }

    if (j >= n) {
      for (int l = n; l < k; l++) {
        d[j * k + l] = -2 * a[l] * a[j] / f;
      }
      d[j * k + j] += 1;
    }
    barrier(2);

    for (int l = n; l < k; l++) {
      h = 0.0f;
      for (int m = n; m < k; m++) {
        h += c[j * k + m] * d[m * k + l];
      }
      e[j * k + l] = h;
    }
    barrier(2);

    for (int l = n; l < k; l++) {
      c[j * k + l] = e[j * k + l];
    }
    barrier(2);
  }
}