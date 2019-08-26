float A(__global float* a, uint b) {
  float c = 0.0f;
  for (uint d = 0; d < b; ++d) {
    c += a[d];
  }
  return c;
}

__kernel void B(__global float* restrict a, __global float* restrict b, const uint c) {
  float d = A(a, c);
  (*b) = d;
}

__kernel void C(__global uint* restrict a, __global uint* restrict b, const uint c) {
  uint d = 0;
  for (uint e = 0; e < c; ++e) {
    d += a[e];
  }
  (*b) = d;
}

__kernel void D(__global float* restrict a, __global const float* restrict b, const uint c, __global const uint* restrict d, const uint e) {
  for (uint f = 0; f < e; ++f) {
    uint g = d[f];
    __global float* h = a + f * c;

    uint i = g * c;
    __global const float* j = b + i;

    for (uint k = 0; k < c; ++k) {
      float l = j[k];
      h[k] = l;
    }
  }
}

__kernel void E(__global float* restrict a, __global const float* restrict b, const uint c, const uint d) {
  uint e = 0;
  for (uint f = 0; f < c; ++f) {
    for (uint g = 0; g < d; ++g) {
      float h = b[e];

      uint i = g * c + f;
      a[i] = h;

      ++e;
    }
  }
}

__kernel void F(__global float* restrict a, __global const float* restrict b, __global const float* restrict c, const uint d, const uint e, const uint f, const uint g) {
  for (uint h = 0; h < d; ++h) {
    for (uint i = 0; i < g; ++i) {
      float j = 0;

      for (uint k = 0; k < e; ++k) {
        float l = b[h * e + k];
        float m = c[k * g + i];
        j += l * m;
      }

      a[h * g + i] = j;
    }
  }
}

__kernel void G(__global float* restrict a, __global const float* restrict b, __global const float* restrict c, __global const float* restrict d, __global const float* restrict e, __global const float* restrict f, __global const float* restrict g, uint h, uint i) {
}

__kernel void H(__global float* restrict a, __global const float* restrict b, __global const float* restrict c, uint d, uint e) {
  uint f = d * e;
  for (uint g = 0; g < f; ++g) {
    a[g] = tanh(a[g] + b[g] * c[g]);
  }
}

__kernel void I(__global float* restrict a, __global const float* restrict b, __global const float* restrict c, uint d, uint e) {
  uint f = d * e;
  for (uint g = 0; g < f; ++g) {
    a[g] = tanh(a[g] + b[g] + c[g]);
  }
}

__kernel void J(__global float* restrict a, __global const float* restrict b, __global const float* restrict c, uint d, uint e) {
  uint f = d * e;
  for (uint g = 0; g < f; ++g) {
    a[g] = (1.0f - a[g]) * b[g] + a[g] * c[g];
  }
}

__kernel void K(__global float* restrict a, __global const float* restrict b, uint c, uint d, float e) {
  uint f = c * d;
  for (uint g = 0; g < f; ++g) {
    a[g] = a[g] + e * b[g];
  }
}

__kernel void L(__global float* restrict a, __global const float* restrict b, uint c, uint d) {
  for (uint e = 0; e < d; ++e) {
    float f = b[e];

    uint g = e;
    for (uint h = 0; h < c; ++h) {
      a[g] += f;
      g += d;
    }
  }
}

__kernel void M(__global float* restrict a, __global const float* restrict b, uint c, uint d) {
  for (uint e = 0; e < d; ++e) {
    float f = b[e];

    uint g = e;
    for (uint h = 0; h < c; ++h) {
      a[g] = tanh(a[g] + f);
      g += d;
    }
  }
}

__kernel void N(__global float* restrict a, __global const float* restrict b, __global const float* restrict c, uint d, uint e, __global const int* restrict f, uint g, uint h, uint i, uint j, uint k) {
  uint l = d * k * e;
  for (uint m = 0; m < l; ++m) {
    int n = m / e;
    int o = m % e;

    int p = n / d;
    int q = n % d;

    int r = f[p];

    float s = b[(r * d + q) * e + o];
    float t = c[p * e + o];
    a[m] = tanh(s + t);
  }
}

__kernel void O(__global float* restrict a, __global const float* restrict b, uint c, uint d, float e) {
  for (uint f = 0; f < d; ++f) {
    int g = f;
    for (int h = 0; h < c; ++h) {
      a[g] = e * a[g] + b[h];
      g += d;
    }
  }
}

__kernel void P(__global float* restrict a, __global const float* restrict b, uint c, uint d) {
  uint e = 0;

  for (uint f = 0; f < d; ++f) {
    for (uint g = 0; g < c; ++g) {
      float h = a[e] + b[e];
      a[e] = 1.0f / (1.0f + exp(-h));
      ++e;
    }
  }
}

__kernel void Q(__global float* restrict a, __global const float* restrict b, uint c, uint d, uint e, uint f) {
  uint g = c * d;

  for (uint h = 0; h < e; ++h) {
    for (uint i = 0; i < d; ++i) {
      uint j = g + i;

      uint k = h * f + j;
      uint l = h * d + i;

      a[l] = b[k];
    }
  }
}

__kernel void R(__global float* restrict a, uint b, uint c, __global const float* restrict d, uint e, uint f, uint g, uint h) {
  uint i = e * f;
  for (uint j = 0; j < i; ++j) {
    uint k = j / f;
    uint l = j % f;
    uint m = (b + h * k) * c + l + g;
    a[m] = d[j];
  }
}

__kernel void S(__global float* restrict a, uint b, uint c, uint d, __global const int* restrict e, uint f) {
  for (uint g = 0; g < b; ++g) {
    int h = e[d * g + f];
    if (h == 0) {
      for (uint i = 0; i < c; ++i) {
        uint j = g * c + i;
        a[j] = 0;
      }
    }
  }
}

__kernel void T(__global float* restrict a, __global const float* restrict b, __global const int* restrict c, uint d, uint e, uint f) {
  for (uint g = 0; g < f; ++g) {
    float h = 0.0f;
    int i = 0;

    for (int j = 0; j < d * e; ++j) {
      h += c[j] * b[j * f + g];
      i += c[j];

      if ((j + 1) % e == 0) {
        h /= i;
        a[(j / e) * f + g] = h;
        h = 0.0f;
        i = 0;
      }
    }
  }
}

__kernel void U(__global float* restrict a, uint b, uint c, __global const int* restrict d, uint e, __global const int* restrict f, uint g) {
  for (uint h = 0; h < b; ++h) {
    uint i = h * c;

    int j = d[h];
    uint k = j * g;

    float l = 0;
    for (uint m = 0; m < c; ++m) {
      int n = f[k + m];

      if (n) {
        float o = a[i + m];
        o = exp(o);

        l += o;
        a[i + m] = o;
      } else {
        a[i + m] = 0;
      }
    }

    for (uint m = 0; m < c; ++m) {
      a[i + m] /= l;
    }
  }
}

__kernel void V(__global float* restrict a, uint b, uint c) {
  for (uint d = 0; d < b; ++d) {
    uint e = d * c;

    float f = 0;
    for (uint g = 0; g < c; ++g) {
      float h = a[e + g];
      h = exp(h);

      f += h;
      a[e + g] = h;
    }

    for (uint g = 0; g < c; ++g) {
      float h = a[e + g];
      h /= f;

      a[e + g] = log(h);
    }
  }
}

__kernel void W(__global float* restrict a, __global const float* restrict b, __global const float* restrict c, __global const int* restrict d, uint e, uint f, uint g) {
  uint h = e * f;
  for (uint i = 0; i < h; ++i) {
    uint j = i / f;
    uint k = d[j];
    uint l = i % f;

    float m = 0.0f;
    for (uint n = 0; n < g; ++n) {
      m += b[j * g + n] * c[k * g * f + (n * f) + l];
    }

    a[i] = m;
  }
}

__kernel void X(__global float* restrict a, __global int* restrict b, __global float* restrict c, int d, __global int* restrict e) {
}

void Y(__global float* restrict a, __global unsigned* restrict b, uint c, float d, uint e, uint f) {
  uint g = c;
  for (uint h = 1; h < c; ++h) {
    if (d <= a[h]) {
      g = h;
      break;
    }
  }

  for (uint h = g; h < c; ++h) {
    a[h + 1] = a[h];
    b[h + 1] = b[h];
  }

  a[g] = d;
  b[g] = e + f;
}

void Z(__global float* restrict a, __global unsigned* restrict b, uint c, float d, uint e, uint f) {
  if (d < a[0]) {
    return;
  }

  uint g = c - 1;
  for (uint h = 1; h < c; ++h) {
    if (d <= a[h]) {
      g = h - 1;
      break;
    }
  }

  for (uint h = 0; h < g; ++h) {
    a[h] = a[h + 1];
    b[h] = b[h + 1];
  }

  a[g] = d;
  b[g] = e + f;
}

__kernel void AA(__global float* restrict a, uint b, uint c, __global uint* restrict d, uint e, __global uint* restrict f, __global uint* restrict g, uint h, __global float* restrict i, __global unsigned* restrict j) {
  uint k = 0;
  for (uint l = 0; l < e; ++l) {
    uint m = d[l];
    uint n = g[l];
    uint o = g[l + 1];
    uint p = o - n;

    for (uint q = 0; q < m; ++q) {
      float r = a[n + q];
      Y(i + k, j + k, q, r, q, n);
    }

    for (uint q = m; q < p; ++q) {
      float r = a[n + q];
      Z(i + k, j + k, m, r, q, n);
    }

    k += m;
  }
}