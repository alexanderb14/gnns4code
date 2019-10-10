float A(size_t a) {
  switch (a) {
    case 0:
      return 10.50000f;
    case 1:
      return 3.15846f;
    case 2:
      return 0.39901f;
    case 3:
      return 0.50955f;
    case 4:
      return 2.98021f;
    case 5:
      return 7.85507f;
    case 6:
      return 15.74049f;
    case 7:
      return 27.02524f;
    case 8:
      return 43.28563f;
    case 9:
      return 66.63533f;
    case 10:
      return 95.10477f;
    case 11:
      return 126.26711f;
    case 12:
      return 157.66678f;
    case 13:
      return 186.96906f;
    case 14:
      return 211.81561f;
    case 15:
      return 229.84409f;
    case 16:
      return 239.00920f;
    case 17:
      return 244.51880f;
    case 18:
      return 248.55106f;
    case 19:
      return 251.45792f;
    case 20:
      return 253.30617f;
    case 21:
      return 254.38364f;
    case 22:
      return 254.87805f;
    case 23:
      return 254.50528f;
    case 24:
      return 242.28555f;
    case 25:
      return 216.25360f;
    case 26:
      return 181.10410f;
    case 27:
      return 141.51198f;
    case 28:
      return 102.12467f;
    case 29:
      return 67.43021f;
    case 30:
      return 41.82657f;
    case 31:
      return 23.33998f;
    default:
      return -1.0f;
  }
}

float B(size_t a) {
  switch (a) {
    case 0:
      return 2.24772f;
    case 1:
      return 4.38378f;
    case 2:
      return 6.41868f;
    case 3:
      return 11.69186f;
    case 4:
      return 25.28062f;
    case 5:
      return 45.46635f;
    case 6:
      return 70.00731f;
    case 7:
      return 97.07170f;
    case 8:
      return 124.60256f;
    case 9:
      return 151.26897f;
    case 10:
      return 176.37556f;
    case 11:
      return 199.12393f;
    case 12:
      return 218.84903f;
    case 13:
      return 234.93768f;
    case 14:
      return 246.77850f;
    case 15:
      return 253.58151f;
    case 16:
      return 254.53967f;
    case 17:
      return 251.94934f;
    case 18:
      return 245.78825f;
    case 19:
      return 236.19637f;
    case 20:
      return 223.36536f;
    case 21:
      return 207.15530f;
    case 22:
      return 187.81662f;
    case 23:
      return 165.01135f;
    case 24:
      return 136.81346f;
    case 25:
      return 105.00961f;
    case 26:
      return 72.90131f;
    case 27:
      return 43.46163f;
    case 28:
      return 19.82122f;
    case 29:
      return 5.26334f;
    case 30:
      return 2.20703f;
    case 31:
      return 2.29760f;
    default:
      return -1.0f;
  }
}

float C(size_t a) {
  switch (a) {
    case 0:
      return 68.50000f;
    case 1:
      return 79.36879f;
    case 2:
      return 95.08916f;
    case 3:
      return 116.73592f;
    case 4:
      return 138.96797f;
    case 5:
      return 160.55014f;
    case 6:
      return 180.41800f;
    case 7:
      return 197.60361f;
    case 8:
      return 211.45720f;
    case 9:
      return 223.10614f;
    case 10:
      return 232.60995f;
    case 11:
      return 240.26654f;
    case 12:
      return 246.22346f;
    case 13:
      return 250.50687f;
    case 14:
      return 253.26976f;
    case 15:
      return 254.57617f;
    case 16:
      return 253.42593f;
    case 17:
      return 231.85834f;
    case 18:
      return 191.35536f;
    case 19:
      return 140.38916f;
    case 20:
      return 87.35393f;
    case 21:
      return 40.69637f;
    case 22:
      return 9.10403f;
    case 23:
      return 0.47247f;
    case 24:
      return 1.70649f;
    case 25:
      return 5.54085f;
    case 26:
      return 11.43449f;
    case 27:
      return 19.26110f;
    case 28:
      return 28.73091f;
    case 29:
      return 39.77259f;
    case 30:
      return 51.72056f;
    case 31:
      return 60.93956f;
    default:
      return -1.0f;
  }
}

float D(double a) {
  float b = (float)(a * 32.0f);

  size_t c = (size_t)b;
  size_t d = (b + 1);

  if (d == 32)
    d = 0;

  float e = b - c;
  float f = 1.0f - e;

  float g = A(c);
  float h = A(d);

  float i = g * f + h * e;

  return i;
}

float E(double a) {
  float b = (float)(a * 32.0f);

  size_t c = (size_t)b;
  size_t d = (b + 1);

  if (d == 32)
    d = 0;

  float e = b - c;
  float f = 1.0f - e;

  float g = B(c);
  float h = B(d);

  float i = g * f + h * e;

  return i;
}

float F(double a) {
  float b = (float)(a * 32.0f);

  size_t c = (size_t)b;
  size_t d = (b + 1);

  if (d == 32)
    d = 0;

  float e = b - c;
  float f = 1.0f - e;

  float g = C(c);
  float h = C(d);

  float i = g * f + h * e;

  return i;
}

__kernel void G(global unsigned char* a, global double* b) {
  size_t c = get_global_id(0);
  size_t d = get_global_id(1);
  size_t e = get_global_size(0);
  size_t f = get_global_size(1);

  double g = b[0];
  double h = b[1];
  double i = b[2];
  double j = b[3];
  double k = b[4];
  double l = b[5];

  double m = g + (i * (((double)c) - 1)) + (k * (((double)d) - 1));
  double n = h + (j * (((double)c) - 1)) + (l * (((double)d) - 1));

  unsigned long o = 50000;
  double p = 10000.0;

  double q = 0.0;
  unsigned long r = 0;

  double s = 0.0;
  double t = 0.0;
  double u = m;
  double v = n;

  double w = s;
  double x = t;

  while (q <= p && r < o) {
    double y = w * w - x * x + u;
    double z = 2 * w * x + v;
    w = y;
    x = z;
    r = r + 1;
    q = w * w + x * x;
  }

  if (r == o) {
    a[e * d + c] = (unsigned char)0;
  } else {
    a[e * d + c] = (unsigned char)1;
  }
}

__kernel void H(global unsigned char* a, global unsigned char* b, global double* c) {
  __local float d[64];
  __local float e[64];
  __local float f[64];

  size_t g = get_group_id(0);
  size_t h = get_group_id(1);
  size_t i = get_num_groups(0);
  size_t j = get_num_groups(1);

  size_t k = get_local_id(0);
  size_t l = get_local_id(1);

  char m = a[(h + 0) * (i + 2) + (g + 0)];
  char n = a[(h + 0) * (i + 2) + (g + 1)];
  char o = a[(h + 0) * (i + 2) + (g + 2)];
  char p = a[(h + 1) * (i + 2) + (g + 0)];
  char q = a[(h + 1) * (i + 2) + (g + 1)];
  char r = a[(h + 1) * (i + 2) + (g + 2)];
  char s = a[(h + 2) * (i + 2) + (g + 0)];
  char t = a[(h + 2) * (i + 2) + (g + 1)];
  char u = a[(h + 2) * (i + 2) + (g + 2)];

  if (m == 0 && n == 0 && o == 0 && p == 0 && q == 0 && r == 0 && s == 0 && t == 0 && u == 0) {
    if (k == 0 && l == 0) {
      b[3 * (i * h + g) + 0] = (unsigned char)0;
      b[3 * (i * h + g) + 1] = (unsigned char)0;
      b[3 * (i * h + g) + 2] = (unsigned char)0;
    }

    return;
  }

  double v = c[0];
  double w = c[1];
  double x = c[2];
  double y = c[3];
  double z = c[4];
  double aa = c[5];

  double ab = v + (x * g) + (z * h);
  double ac = w + (y * g) + (aa * h);

  double ad = (k - 3.5) * 0.125;
  double ae = (l - 3.5) * 0.125;

  double af = ab + ad * x + ae * z;
  double ag = ac + ad * y + ae * aa;

  unsigned long ah = 50000;
  double ai = 10000.0;

  double aj = 0.0;
  unsigned long ak = 0;

  double al = 0.0;
  double am = 0.0;
  double an = af;
  double ao = ag;

  double ap = al;
  double aq = am;

  while (aj <= ai && ak < ah) {
    double ar = ap * ap - aq * aq + an;
    double as = 2 * ap * aq + ao;
    ap = ar;
    aq = as;
    ak = ak + 1;
    aj = ap * ap + aq * aq;
  }

  double at = sqrt(aj);

  double au = 1.0 / log(2.0);
  double av = log(log(128.0));

  double aw = 0.42 * 0.05 * (ak + au * av - au * log(log(at)));
  double ax = fmod(log(aw + 1.0), 1.0);

  if (ak == ah) {
    d[8 * l + k] = 0.0f;
    e[8 * l + k] = 0.0f;
    f[8 * l + k] = 0.0f;
  } else {
    d[8 * l + k] = D(ax);
    e[8 * l + k] = E(ax);
    f[8 * l + k] = F(ax);
  }

  barrier(1);

  if (k == 0 && l == 0) {
    float ay = 0.0f;
    float az = 0.0f;
    float ba = 0.0f;

    for (size_t bb = 0; bb < 64; bb++) {
      ay += d[bb];
      az += e[bb];
      ba += f[bb];
    }

    b[3 * (i * h + g) + 0] = (unsigned char)(ay / 64.0);
    b[3 * (i * h + g) + 1] = (unsigned char)(az / 64.0);
    b[3 * (i * h + g) + 2] = (unsigned char)(ba / 64.0);
  }
}