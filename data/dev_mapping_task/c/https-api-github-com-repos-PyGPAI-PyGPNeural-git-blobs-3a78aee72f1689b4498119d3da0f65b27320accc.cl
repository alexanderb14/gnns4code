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