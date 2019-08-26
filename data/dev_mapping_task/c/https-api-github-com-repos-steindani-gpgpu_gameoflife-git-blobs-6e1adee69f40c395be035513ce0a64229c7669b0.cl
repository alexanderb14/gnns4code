__kernel void A(int a, int b, __global unsigned char* c, __global unsigned char* d) {
  int e = get_global_id(0);
  if (e <= a * b) {
    int f = e % a;
    int g = e / a;

    int h = (f == 0 ? a - 1 : f - 1) * 4 + 3;
    int i = f * 4 + 3;
    int j = ((f + 1) == a ? 0 : f + 1) * 4 + 3;

    int k = (g == 0 ? b - 1 : g - 1) * a * 4;
    int l = g * a * 4;
    int m = ((g + 1) == b ? 0 : g + 1) * a * 4;

    int n = c[k + h] / 255 + c[k + i] / 255 + c[k + j] / 255 + c[l + h] / 255 + c[l + j] / 255 + c[m + h] / 255 + c[m + i] / 255 + c[m + j] / 255;

    int o = c[l + i - 3];
    int p = c[l + i];
    bool q = (n == 3 || (n == 2 && p == 255));

    d[l + i - 3] = q ? (p == 255 ? 10 + o * 0.90f : 255) : p * 0.90f;
    d[l + i - 2] = q ? (p == 255 ? 10 + o * 0.90f : 255) : p * 0.45f;
    d[l + i - 1] = q ? (p == 255 ? 10 + o * 0.90f : 255) : p * 0.45f;
    d[l + i] = q ? 255 : p * 0.75f;
  }
}