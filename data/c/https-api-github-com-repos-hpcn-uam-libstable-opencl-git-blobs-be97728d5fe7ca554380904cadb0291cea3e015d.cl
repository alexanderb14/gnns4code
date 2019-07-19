struct stable_info {
  double k1;
  double theta0;
  double alfa;
  double alfainvalfa1;
  double mu_0;
  double sigma;
  double xi;
  double xxi_th;
  double c2_part;
  double c1;
  double THETA_TH;
  double beta;
  double xi_coef;
  short is_xxi_negative;
  unsigned int integrand;
  double final_pdf_factor;
  double final_cdf_factor;
  double final_cdf_addition;
  double quantile_tolerance;
  size_t max_reevaluations;
  uint rng_seed_a;
  uint rng_seed_b;
};

kernel void A(global int* a, local int* b) {
  size_t c = get_local_id(0);
  size_t d = get_group_id(0);
  size_t e = get_global_size(0);
  size_t f = get_global_id(0);

  if (f == 0) {
    int g = 0;

    for (int h = 0; h < e; h++) {
      g += a[h];
    }

    a[0] = g;
  }

  barrier(2);
}

kernel void B(global int* a, local int* b) {
  size_t c = get_local_id(0);
  size_t d = get_group_id(0);
  size_t e = get_global_size(0);
  size_t f = get_global_id(0);

  barrier(2);

  for (size_t g = e / 2; g > 0; g >>= 1) {
    if (f < g)
      a[f] += a[f + g];

    barrier(2);
  }
}

kernel void C(global int* a, local int* b) {
  size_t c = get_local_id(0);
  size_t d = get_group_id(0);
  size_t e = get_global_size(0);
  size_t f = get_global_id(0);
  size_t g = get_local_size(0);
  size_t h = d * g;
  size_t i = get_num_groups(0);

  barrier(1);

  for (size_t j = g / 2; j > 0; j >>= 1) {
    if (c < j)
      a[h + c] += a[h + c + j];

    barrier(1);
  }

  barrier(2);

  if (f == 0) {
    int k = 0;
    for (size_t l = 0; l < e; l += g) {
      k += a[l];
    }

    a[0] = k;
  }
}

kernel void D(global int* a, local int* b) {
  size_t c = get_local_id(0);
  size_t d = get_group_id(0);
  size_t e = get_global_size(0);
  size_t f = get_global_id(0);
  size_t g = get_local_size(0);
  size_t h = d * g;
  size_t i = get_num_groups(0);

  barrier(1);

  for (size_t j = g / 2; j > 0; j >>= 1) {
    if (c < j)
      a[h + c] += a[h + c + j];

    barrier(1);
  }

  barrier(2);

  for (size_t j = i / 2; j > 0; j >>= 1) {
    if (c == 0 && d < j)
      a[d] += a[d + j];

    barrier(2);
  }
}

kernel void E(global int* a, local int* b) {
  size_t c = get_local_id(0);
  size_t d = get_group_id(0);
  size_t e = get_global_size(0);
  size_t f = get_global_id(0);
  size_t g = get_local_size(0);
  size_t h;
  size_t i = get_num_groups(0);
  size_t j = 2;
  int k;

  barrier(1);

  if (d < j) {
    for (size_t l = d; l < i; l += j) {
      h = l * g;

      for (size_t m = g / 2; m > 0; m >>= 1) {
        if (c < m)
          a[h + c] += a[h + c + m];

        barrier(1);
      }

      if (c == 0 && l != d)
        a[d * g] += a[h];

      barrier(1);
    }

    barrier(2);

    if (d == 0 && c == 0)
      a[0] += a[g];
  }
}

kernel void F(global int* a, local int* b) {
  size_t c = get_local_id(0);
  size_t d = get_group_id(0);
  size_t e = get_global_size(0);
  size_t f = get_global_id(0);
  size_t g = get_local_size(0);
  size_t h;
  size_t i = get_num_groups(0);
  size_t j = i / 2;
  size_t k = j / g;
  int l;

  if (j % g != 0)
    k += 1;

  barrier(1);

  if (d < j) {
    for (size_t m = d; m < i; m += j) {
      h = m * g;

      for (size_t n = g / 2; n > 0; n >>= 1) {
        if (c < n)
          a[h + c] += a[h + c + n];

        barrier(1);
      }

      if (c == 0)
        a[d] += a[h];

      barrier(1);
    }
  }

  barrier(2);

  while (k > 0) {
    if (d < k) {
      size_t o = g;

      if (d == k - 1)
        o = o - k * g;

      for (size_t n = g / 2; n > 0; n >>= 1) {
        if (c < n && c + n < o)
          a[c] += a[(c + d) * g];

        barrier(1);
      }
    }

    if (k > 1)
      k /= g;
    else
      k = 0;

    barrier(2);
  }
}

kernel void G(global int* a, local volatile int* b) {
  size_t c = get_local_id(0);
  size_t d = get_group_id(0);
  size_t e = get_global_size(0);
  size_t f = get_global_id(0);
  size_t g = get_local_size(0);
  size_t h = d * g;
  size_t i = get_num_groups(0);
  size_t j;

  barrier(1);

  j = g / 2;

  if (c < j)
    b[c] = a[h + c + j] + a[h + c];

  j >>= 1;
  barrier(1);

  for (; j > 0; j >>= 1) {
    if (c < j)
      b[c] += b[c + j];

    barrier(1);
  }

  barrier(2);

  for (j = i / 2; j > 0; j >>= 1) {
    if (c == 0 && d < j)
      a[d] += a[d + j];

    barrier(2);
  }
}

kernel void H(global int* a, local int* b) {
  size_t c = get_local_id(0);
  size_t d = get_group_id(0);
  size_t e = get_global_size(0);
  size_t f = get_global_id(0);
  size_t g = get_local_size(0);
  size_t h = d * g;
  size_t i = get_num_groups(0);
  size_t j;

  barrier(1);

  j = g / 2;

  if (c < j)
    b[c] = a[h + c + j] + a[h + c];

  j >>= 1;
  barrier(1);

  for (; j > 0; j >>= 1) {
    if (c < j)
      b[c] += b[c + j];

    barrier(1);
  }

  if (c == 0)
    a[d] = b[0];

  barrier(2);

  if (f == 0) {
    int k = 0;
    for (size_t l = 0; l < e; l += g) {
      k += a[l];
    }

    a[0] = k;
  }
}