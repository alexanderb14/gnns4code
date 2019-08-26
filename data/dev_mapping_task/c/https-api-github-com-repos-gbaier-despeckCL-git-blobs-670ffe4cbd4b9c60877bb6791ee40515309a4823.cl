__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, const int e, const int f) {
  const int g = get_group_id(0) * get_local_size(0) + get_local_id(0);
  const int h = get_group_id(1) * get_local_size(1) + get_local_id(1);

  if ((g < e) && (h < f)) {
    const int i = g * f + h;

    const float j = a[i] * a[i];
    const float k = 0.0f;

    const float l = a[i] * b[i] * cos(c[i]);
    const float m = a[i] * b[i] * sin(c[i]);

    const float n = l;
    const float o = -m;

    const float p = b[i] * b[i];
    const float q = 0.0f;

    d[i] = j;
    d[i + 1 * e * f] = k;

    d[i + 2 * e * f] = l;
    d[i + 3 * e * f] = m;

    d[i + 4 * e * f] = n;
    d[i + 5 * e * f] = o;

    d[i + 6 * e * f] = p;
    d[i + 7 * e * f] = q;
  }
}