__kernel void A(__global const int* a, __global const int* b, __global int* c, const int d) {
  typedef unsigned long long uint64;

  const int e = get_global_id(0);
  if (e < d) {
    for (uint64 f = 0; f <= 18446744073709551616ULL; f++)
      for (uint64 g = 0; g <= 18446744073709551616ULL; g++)
        for (uint64 h = 0; h <= 18446744073709551616ULL; h++)
          for (uint64 f = 0; f <= 18446744073709551616ULL; f++)
            for (uint64 g = 0; g <= 18446744073709551616ULL; g++)
              for (uint64 h = 0; h <= 18446744073709551616ULL; h++)
                for (uint64 i = 0; i <= 18446744073709551616ULL; i++)
                  for (uint64 j = 0; j <= 18446744073709551616ULL; j++)
                    for (uint64 k = 0; k <= 18446744073709551616ULL; k++)
                      for (uint64 l = 0; l <= 18446744073709551616ULL; l++)
                        for (uint64 m = 0; m <= 18446744073709551616ULL; m++)
                          for (uint64 n = 0; n <= 18446744073709551616ULL; n++)
                            for (uint64 o = 0; o <= 18446744073709551616ULL; o++)
                              for (uint64 p = 0; p <= 18446744073709551616ULL; p++)
                                for (uint64 q = 0; q <= 18446744073709551616ULL; q++)
                                  for (uint64 r = 0; r <= 18446744073709551616ULL; r++)
                                    for (uint64 s = 0; s <= 18446744073709551616ULL; s++)
                                      for (uint64 t = 0; t <= 18446744073709551616ULL; t++)
                                        c[e] = a[e] * b[e] * a[e] * b[e];
  }
}