__constant uint Ga = 0x9E3779B1; __constant uint Gb = 0x85EBCA77; __constant uint Gc = 0xC2B2AE3D; __constant uint Gd = 0x27D4EB2F; __constant uint Ge = 0x165667B1; uint A(uint* a, uint b, uint c) {
  {
    int d = 0;
    int e = 0;
    const uchar* f = (const uchar*)(a);
    const uint* g = (const uint*)(a);

    uint h;
    if (b >= 16) {
      {
        uint i = b - 16;
        uint j[4];
        j[0] = c + Ga + Gb;
        j[1] = c + Gb;
        j[2] = c;
        j[3] = c - Ga;
        while (d <= i) {
          {
            for (int k = 0; k < 3; k++) {
              {
                j[k] = j[k] + g[e] * Gb;
                j[k] = rotate(j[k], (uint)13);
                j[k] = j[k] * Ga;
                d = d + 4;
                e = e + 1;
              }
            }
          }
        }
        h = rotate(j[0], (uint)1) + rotate(j[1], (uint)7) + rotate(j[2], (uint)12) + rotate(j[3], (uint)18);
      }
    } else {
      { h = c + Ge; }
    }
    h = h + b;

    int i = b - 4;

    while (d < i) {
      {
        h = (h + (g[e] * Gc));
        h = rotate(h, (uint)17) * Gd;
        d += 4;
        e++;
      }
    }

    while (d < b) {
      {
        h = h + f[d << 2] * Ge;
        h = rotate(h, (uint)11) * Ga;
        d++;
      }
    }

    h = h ^ (h >> 15);
    h = h * Gb;
    h = h ^ (h >> 13);
    h = h * Gc;

    return h ^ (h >> 16);
  }
}

float B(uint a) {
  {
    float b = a * (1.0 / 4294967295);
    float c = sqrt(-2.0 * log(b));
    if (a & 1) {
      { return c; }
    }
    return -c;
  }
}

float C(uint a, float b, float c) {
  {
    float d = a * (1.0 / 4294967295);
    float e = sqrt(-2.0 * log(d));
    if (a & 1) {
      { return e * c + b; }
    }
    return -e * c + b;
  }
}
uchar D(const uint a, const uint b, const uint c, const uint d, const uint e, int3 f, const __global uchar* g, uchar h) {
  {
    if (f.x < 0 || f.y < 0 || f.x > a || f.y > b) {
      { return h; }
    } else {
      { return (g[f.x * b * e + f.y * e + f.z]); }
    }
  }
}

uchar E(const uint a, const uint b, const uint c, const uint d, const uint e, float2 f, int g, const __global uchar* h, uchar i) {
  {
    uchar j = D(a, b, c, d, e,
                                         (int3)((int)(f), (int)(f), g                                        h, i);
    uchar k = D(a, b, c, d, e,
                                         (int3)((int)(f+1), (int)(f), g                                        h, i);
    uchar l = D(a, b, c, d, e,
                                         (int3)((int)(f), (int)(f+1), g                                        h, i);
    uchar m = D(a, b, c, d, e,
                                         (int3)((int)(f+1), (int)(f+1), g                                        h, i);

    float n = f.x - (int)(f.x);
    float o = f.y - (int)(f.y);

    float p = ((
    (j+l)*(1-n) +
    (k+m)*n)/2 +
                      ((j+k)*(1-o) + (l+m)*o)/2)/2;

    return (uchar)(p);
  }
}

uchar F(const uint a, const uint b, const uint c, const uint d, const uint e, float2 f, int g, uint h, const __global uchar* i, uchar j) {
  {
    uint k = 0;
    uint l = 0;

    for (int m = 0; m < 2 * h + 1; ++m) {
      {
        float2 n = f+(float2)(m-hh
        float2 o = f+(float2)(m-h

        k += E(a, b, c, d, e,n, g, i, j);
        k += E(a, b, c, d, e,o, g, i, j);

        l+=2;
      }
    }
    for (int p = 1; p < 2 * h; ++p) {
      {
        float2 q = f+(float2)(-p-h
        float2 r = f+(float2)(p-h

        k += E(a, b, c, d, e,q, g, i, j);
        k += E(a, b, c, d, e,r, g, i, j);

        l+=2;
      }
    }
    return k / l;
  }
}
__kernel void G(const uint a, const uint b, const uint c, const uint d, const uint e, const __global uchar* f, __global uchar* g)

{
  {
    int3 h = (int3)(get_global_id(0), get_global_id(1), get_global_id(2));
    float2 i = (float2)((float)(h(float)(a(cfloat)(h(float)(b(d
    uchar j = E(a, b, c, d, e,i, h.z, f, (uchar)(0));

    g[h.x*d*e+h.y*e+h.z] = j;
  }
}