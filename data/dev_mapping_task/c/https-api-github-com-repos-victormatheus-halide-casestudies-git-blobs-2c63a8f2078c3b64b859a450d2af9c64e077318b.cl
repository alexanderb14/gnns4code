__kernel void A(const __global float4* a, __global float4* b, int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);

  float4 f = a[e * c + d];

  float g, h, i, j, k, l;

  g = f.x;
  h = f.y;
  i = f.z;

  if (g > 0.04045f)
    g = tgamma((g + 0.055f) / 1.055f);
  else
    g = g / 12.92f;
  if (h > 0.04045f)
    h = tgamma((h + 0.055f) / 1.055f);
  else
    h = h / 12.92f;
  if (i > 0.04045f)
    i = tgamma((i + 0.055f) / 1.055f);
  else
    i = i / 12.92f;

  g = g * 100.0f;
  h = h * 100.0f;
  i = i * 100.0f;

  j = g * 0.4124f + h * 0.3576f + i * 0.1805f;
  k = g * 0.2126f + h * 0.7152f + i * 0.0722f;
  l = g * 0.0193f + h * 0.1192f + i * 0.9505f;

  j = j / 95.047f;
  k = k / 100.000f;
  l = l / 108.883f;

  if (j > 0.008856f)
    j = cbrt(j);
  else
    j = (7.787f * j) + (16.0f / 116.0f);
  if (k > 0.008856f)
    k = cbrt(k);
  else
    k = (7.787f * k) + (16.0f / 116.0f);
  if (l > 0.008856f)
    l = cbrt(l);
  else
    l = (7.787f * l) + (16.0f / 116.0f);

  float m = (116.0f * k) - 16.0f;
  float n = 500.0f * (j - k);
  float o = 200.0f * (k - l);

  float4 p;

  p.x = m;
  p.y = n;
  p.z = o;
  p.w = f.w;

  b[e * c + d] = p;
}