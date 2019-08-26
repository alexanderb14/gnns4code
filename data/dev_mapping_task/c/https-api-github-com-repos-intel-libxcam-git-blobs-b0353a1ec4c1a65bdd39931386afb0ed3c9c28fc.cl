__constant float Ga[5] = {50.430166f, 20.376415f, 10.184031f, 6.640919f, 3.367972f};

__kernel void A(__global uint* a, __global uint* b, __global float* c, __global uint* d, int e, int f, uint g, uint h, int i, int j, float k, float l) {
  int m = get_global_id(0);
  int n = get_global_id(1);
  size_t o = get_global_size(0);
  size_t p = get_global_size(1);

  int q = o * 16;
  int r = p;

  float s = 0.0f;
  float t = 0.0f;
  float16 u = (float16)0.0f;

  i = (i > 1) ? i : 1;
  i = (i < j) ? i : j;

  a += e;
  d += f;

  int v = pown(2.0f, (i - 1));
  int w = v;

  v = ((m == 0) || (m > q / 16 - v)) ? 0 : v;
  w = ((n < w) || (n > r - w)) ? 0 : w;

  uint4 x;
  float16 y;

  __global uchar* z = (__global uchar*)(a);

  int aa = m * 16 + n * q;
  int ab = m * 4 + n * (q / 4);

  uint4 ac;
  int ad = m * 4 + (n / 2) * (q / 4);

  ushort16 ae;
  ushort16 af;
  ushort16 ag;
  ushort16 ah;
  ushort16 ai;
  ushort16 aj;
  ushort16 ak;
  ushort16 al;
  ushort16 am;

  float an = 1.0f / 16.0f;

    ae = (ushort16)(covv,
                   cov, cov,
                   cov, cov,
                   cov, cov,
                   cov, cov,
                   cov), cov),
                   cov), cov),
                   cov), cov)
                  );

    af = (ushort16)(convertqrtq convertqonvertq convertqonvertq convertqonvertq convertqonvertq convertqconvertq convertqconvertq convertqconvertq);

    ag = (ushort16)(covv,
                   cov, cov,
                   cov, cov,
                   cov, cov,
                   cov, cov,
                   cov), cov),
                   cov), cov),
                   cov), cov)
                  );

    ah = (ushort16)(convert_uvnvert_uv,
                   convert_uv, convert_uv,
                   convert_uv, convert_uv,
                   convert_uv, convert_uv,
                   convert_uv, convert_uv,
                   convert_uv), convert_uv),
                   convert_uv), convert_uv),
                   convert_uv), convert_uv)
                  );

    ai = (ushort16)(convert_ushoraart_ushoraa convert_ushoraaonvert_ushoraa convert_ushoraaonvert_ushoraa convert_ushoraaonvert_ushoraa convert_ushoraaonvert_ushoraa convert_ushoraaconvert_ushoraa convert_ushoraaconvert_ushoraa convert_ushoraaconvert_ushoraa);

    aj = (ushort16)(convert_uvnvert_uv,
                   convert_uv, convert_uv,
                   convert_uv, convert_uv,
                   convert_uv, convert_uv,
                   convert_uv, convert_uv,
                   convert_uv), convert_uv),
                   convert_uv), convert_uv),
                   convert_uv), convert_uv)
                  );

    ak = (ushort16)(covv,
                   cov, cov,
                   cov, cov,
                   cov, cov,
                   cov, cov,
                   cov), cov),
                   cov), cov),
                   cov), cov)
                  );

    al = (ushort16)(convertqrtq convertqonvertq convertqonvertq convertqonvertq convertqonvertq convertqconvertq convertqconvertq convertqconvertq);

    am = (ushort16)(covv,
                   cov, cov,
                   cov, cov,
                   cov, cov,
                   cov, cov,
                   cov), cov),
                   cov), cov),
                   cov), cov)
                  );

    ushort16 ao;
    ao = (ushort16)1 * ae + (ushort16)2 * af + (ushort16)1 * ag + (ushort16)2 * ah + (ushort16)4 * ai + (ushort16)2 * aj + (ushort16)1 * ak + (ushort16)2 * al + (ushort16)1 * am;

    x = __builtin_astype(convert_uchar16(((convert_float16(ao) + 0.5f / an) * an)), uint4);
    y = convert_float16(convert_char16(ai) - __builtin_astype(x, char16));

    t = k * Ga[i - 1];

    y = (y < -t) ? y + (t - t * l) : y;
    y = (y > t) ? y - (t - t * l) : y;
    y = (y > -t && y < t) ? y * l : y;

    __global float16* ap = (__global float16*)(&c[aa]);
    if (i == 1) {
      (*ap) = y;
      if (n % 2 == 0) {
        ac = vload4(0, a + ad + g * (q / 4));
        vstore4(ac, 0, d + ad + h * (q / 4));
      }

    } else {
      (*ap) += y;
    }

    if (i < j) {
      (*(__global uint4*)(b + ab)) = x;

    } else {
      __global uint4* aq = (__global uint4*)(&d[ab]);
      (*aq) = __builtin_astype(convert_uchar16(*ap + convert_float16(__builtin_astype(x, uchar16))), uint4);
    }
}