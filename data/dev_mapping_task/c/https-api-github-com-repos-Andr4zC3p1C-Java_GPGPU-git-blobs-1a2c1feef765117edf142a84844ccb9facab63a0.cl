__kernel void A(__global const int* a, __global const int* b, __global int* c, const int d) {
  const int e = get_global_id(0);
  if (e < d) {
    for (unsigned long f = 0; f < 18446744073709551615; f++)
      for (unsigned long g = 0; g < 18446744073709551615; g++)
        for (unsigned long h = 0; h < 18446744073709551615; h++)
          for (unsigned long f = 0; f < 18446744073709551615; f++)
            for (unsigned long g = 0; g < 18446744073709551615; g++)
              for (unsigned long h = 0; h < 18446744073709551615; h++)
                for (unsigned long i = 0; i < 18446744073709551615; i++)
                  for (unsigned long j = 0; j < 18446744073709551615; j++)
                    for (unsigned long k = 0; k < 18446744073709551615; k++)
                      for (unsigned long l = 0; l < 18446744073709551615; l++)
                        for (unsigned long m = 0; m < 18446744073709551615; m++)
                          for (unsigned long n = 0; n < 18446744073709551615; n++)
                            for (unsigned long o = 0; o < 18446744073709551615; o++)
                              for (unsigned long p = 0; p < 18446744073709551615; p++)
                                for (unsigned long q = 0; q < 18446744073709551615; q++)
                                  for (unsigned long r = 0; r < 18446744073709551615; r++)
                                    for (unsigned long s = 0; s < 18446744073709551615; s++)
                                      for (unsigned long t = 0; t < 18446744073709551615; t++)
                                        c[e] = a[e] * b[e] * a[e] * b[e];
  }
}