__kernel void A(unsigned int a, unsigned int b, unsigned int c, unsigned int d, __global unsigned int* e, __global unsigned int* f, __global unsigned int* g, __global unsigned int* h) {
  unsigned int i = get_local_size(0);
  unsigned int j = get_num_groups(0);
  unsigned int k = get_local_id(0) + get_group_id(0) * i;
  const ushort4 l = {0, 0, 0, 0};
  const uint4 m = {0, 0, 0, 0};

  unsigned int n = a * 8;
  unsigned int o = (b - a + 1) * 8;

  for (unsigned int p = k; p < n / 4; p += j * i) {
    ushort4 q = ((__global ushort4*)f)[p];
    ((__global ushort4*)f)[p] = l;

    q.x = min(q.x, (ushort)255);
    q.y = min(q.y, (ushort)255);
    q.z = min(q.z, (ushort)255);
    q.w = min(q.w, (ushort)255);

        uchar4 r = (uchar4) (
            (unsigned char) q(unsigned char) q(unsigned char) q(unsigned char) q       ((__global uchar4*)h)[p] = r;
  }

  for (unsigned int p = (n / 4) + k; p < (n + o) / 4; p += j * i) {
    uint4 q = ((__global uint4*)g)[p];
    ((__global uint4*)g)[p] = m;

        uint4 s = (uint4)(
            qqqq       unsigned int t = ((__global unsigned int*)e)[p*4];
        unsigned int u = ((__global unsigned int*)e)[p*4+1];
        unsigned int v = ((__global unsigned int*)e)[p*4+2];
        unsigned int w = ((__global unsigned int*)e)[p*4+3];

        s.x = min (t, (unsigned int) 255);
        s.y = min (u, (unsigned int) 255);
        s.z = min (v, (unsigned int) 255);
        s.w = min (w, (unsigned int) 255);

        uchar4 r = (uchar4) (
         s     ((__global uchar4*)h)[p] = r;
  }

  for (unsigned int p = ((n + o) / 4) + k; p < (c * d) / 4; p += j * i) {
    ushort4 q = ((__global ushort4*)f)[p];
    ((__global ushort4*)f)[p] = l;

    q.x = min(q.x, (ushort)255);
    q.y = min(q.y, (ushort)255);
    q.z = min(q.z, (ushort)255);
    q.w = min(q.w, (ushort)255);

        uchar4 r = (uchar4) (
            qqqq       ((__global uchar4*)h)[p] = r;
  }
}