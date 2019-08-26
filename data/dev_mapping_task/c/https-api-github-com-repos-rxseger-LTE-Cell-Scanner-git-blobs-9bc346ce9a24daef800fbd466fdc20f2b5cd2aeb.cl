__constant float Ga[47] = {8.193313185354206e-04,  3.535548569572820e-04,  -1.453429245341695e-03, 1.042805860697287e-03,  1.264224526451337e-03,  -3.219586065044259e-03, 1.423981657254563e-03,  3.859884310477692e-03, -6.552708013395765e-03, 8.590509694961493e-04,  9.363722386299336e-03,  -1.120357391780316e-02, -2.423088424232164e-03, 1.927528718829535e-02,  -1.646405738285926e-02, -1.143040384534755e-02,
                           3.652830082843752e-02,  -2.132986170036144e-02, -3.396829121834471e-02, 7.273086636811442e-02,  -2.476823886110626e-02, -1.207789042999466e-01, 2.861583432079335e-01,  6.398255789896659e-01, 2.861583432079335e-01,  -1.207789042999466e-01, -2.476823886110626e-02, 7.273086636811442e-02,  -3.396829121834471e-02, -2.132986170036144e-02, 3.652830082843752e-02,  -1.143040384534755e-02,
                           -1.646405738285926e-02, 1.927528718829535e-02,  -2.423088424232164e-03, -1.120357391780316e-02, 9.363722386299336e-03,  8.590509694961493e-04,  -6.552708013395765e-03, 3.859884310477692e-03, 1.423981657254563e-03,  -3.219586065044259e-03, 1.264224526451337e-03,  1.042805860697287e-03,  -1.453429245341695e-03, 3.535548569572820e-04,  8.193313185354206e-04};

__kernel void A(__global float2* a, __global float2* b, uint c) {
  const size_t d = get_global_size(0);
  const size_t e = get_global_id(0);
  const size_t f = c / d;
  const size_t g = e * f;

  size_t h, i;
  for (h = 0; h < f; h++) {
    i = h * d;
    b[i + e] = a[g + h];
  }
}

__kernel void B(__global float2* a, __global float2* b, uint c) {
  const size_t d = get_global_size(0);
  const size_t e = get_global_id(0);
  const size_t f = sizeof(Ga) / sizeof(float);
  const size_t g = c / d;
  const size_t h = g + f - 1;

  size_t i, j, k;
  if (e == 0) {
    for (i = (h - f + 1); i < h; i++) {
      k = i * d;
      b[k] = (float2)(0.0f, 0.0f);
    }
  }

  float2 l;
  for (i = 0; i < f - 1; i++) {
    l = (float2)(0.0f, 0.0f);

    for (j = 0; j < i + 1; j++) {
      k = j * d;
      l = l + a[k + e] * Ga[(f - 1) - i + j];
    }

    k = i * d;
    b[k + e + 1] = l;
  }

  for (i = f - 1; i <= g - 1; i++) {
    l = (float2)(0.0f, 0.0f);

    for (j = 0; j < f; j++) {
      k = (i - (f - 1) + j) * d;
      l = l + a[k + e] * Ga[j];
    }

    k = i * d;
    b[k + e + 1] = l;
  }

  for (i = g; i < h; i++) {
    l = (float2)(0.0f, 0.0f);

    for (j = 0; j < h - i; j++) {
      k = (i - (f - 1) + j) * d;
      l = l + a[k + e] * Ga[j];
    }

    k = i * d;
    b[k + e + 1] = l;
  }
}

__kernel void C(__global float2* a, __global float2* b, uint c) {
  const size_t d = get_global_size(0);
  const size_t e = get_global_id(0);
  const size_t f = sizeof(Ga) / sizeof(float);
  const size_t g = c / d;

  size_t h = e * g;

  size_t i, j, k;
  for (i = 0; i < f - 1; i++) {
    j = i * d;
    k = (g + i) * d;
    b[h + i] = a[j + e + 1] + a[k + e];
  }

  for (i = f - 1; i < g; i++) {
    j = i * d;
    b[h + i] = a[j + e + 1];
  }
}