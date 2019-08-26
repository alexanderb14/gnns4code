typedef uint u; __kernel __attribute__((reqd_work_group_size(128, 1, 1))) void A( const u a, const uint b, const uint c, const uint d, const uint e, const uint f, const uint g, const uint h, const uint i, const uint j, const uint k, const uint l, const uint m, const uint n, const uint o, const uint p, const uint q, const uint r, const uint s, const uint t, const uint u, const uint v, const uint w, const uint x, const uint y, const uint z, const uint aa, const uint ab, const uint ac, const uint ad, const uint ae, const uint af, const uint ag, const uint ah, const uint ai, const uint aj, const uint ak, volatile __global uint* al) {
  u am[8];
  u an[16];
  const u ao = (uint)(get_local_id(0)) + (uint)(get_group_id(0)) * (uint)(128) + a;

  am[0] = b + ao;
  am[1] = f;
  am[2] = g;
  am[3] = e;
  am[4] = c + ao;
  am[5] = h;
  am[6] = i;
  am[7] = d;

  am[7] += am[3] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U));
  am[3] = am[3] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U)) + (rotate(am[4], 30U) ^ rotate(am[4], 19U) ^ rotate(am[4], 10U)) + ((am[5] & am[4]) | (am[6] & (am[5] | am[4])));

  am[6] += j + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U));
  am[2] = j + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U)) + (rotate(am[3], 30U) ^ rotate(am[3], 19U) ^ rotate(am[3], 10U)) + ((am[4] & am[3]) | (am[5] & (am[4] | am[3])));

  am[5] += k + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U));
  am[1] = k + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U)) + (rotate(am[2], 30U) ^ rotate(am[2], 19U) ^ rotate(am[2], 10U)) + ((am[3] & am[2]) | (am[4] & (am[3] | am[2])));

  am[4] += l + ao + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U));
  am[0] = l + ao + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U)) + (rotate(am[1], 30U) ^ rotate(am[1], 19U) ^ rotate(am[1], 10U)) + ((am[2] & am[1]) | (am[3] & (am[2] | am[1])));

  am[3] += 0xd807aa98U + am[7] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U));
  am[7] = 0xd807aa98U + am[7] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U)) + (rotate(am[0], 30U) ^ rotate(am[0], 19U) ^ rotate(am[0], 10U)) + ((am[1] & am[0]) | (am[2] & (am[1] | am[0])));

  am[2] += 0x12835b01U + am[6] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U));
  am[6] = 0x12835b01U + am[6] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U)) + (rotate(am[7], 30U) ^ rotate(am[7], 19U) ^ rotate(am[7], 10U)) + ((am[0] & am[7]) | (am[1] & (am[0] | am[7])));

  am[1] += 0x243185beU + am[5] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U));
  am[5] = 0x243185beU + am[5] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U)) + (rotate(am[6], 30U) ^ rotate(am[6], 19U) ^ rotate(am[6], 10U)) + ((am[7] & am[6]) | (am[0] & (am[7] | am[6])));

  am[0] += 0x550c7dc3U + am[4] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U));
  am[4] = 0x550c7dc3U + am[4] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U)) + (rotate(am[5], 30U) ^ rotate(am[5], 19U) ^ rotate(am[5], 10U)) + ((am[6] & am[5]) | (am[7] & (am[6] | am[5])));

  am[7] += 0x72be5d74U + am[3] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U));
  am[3] = 0x72be5d74U + am[3] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U)) + (rotate(am[4], 30U) ^ rotate(am[4], 19U) ^ rotate(am[4], 10U)) + ((am[5] & am[4]) | (am[6] & (am[5] | am[4])));

  am[6] += 0x80deb1feU + am[2] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U));
  am[2] = 0x80deb1feU + am[2] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U)) + (rotate(am[3], 30U) ^ rotate(am[3], 19U) ^ rotate(am[3], 10U)) + ((am[4] & am[3]) | (am[5] & (am[4] | am[3])));

  am[5] += 0x9bdc06a7U + am[1] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U));
  am[1] = 0x9bdc06a7U + am[1] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U)) + (rotate(am[2], 30U) ^ rotate(am[2], 19U) ^ rotate(am[2], 10U)) + ((am[3] & am[2]) | (am[4] & (am[3] | am[2])));

  am[4] += 0xc19bf3f4U + am[0] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U));
  am[0] = 0xc19bf3f4U + am[0] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U)) + (rotate(am[1], 30U) ^ rotate(am[1], 19U) ^ rotate(am[1], 10U)) + ((am[2] & am[1]) | (am[3] & (am[2] | am[1])));

  am[3] += m + am[7] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U));
  am[7] = m + am[7] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U)) + (rotate(am[0], 30U) ^ rotate(am[0], 19U) ^ rotate(am[0], 10U)) + ((am[1] & am[0]) | (am[2] & (am[1] | am[0])));

  am[2] += n + am[6] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U));
  am[6] = n + am[6] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U)) + (rotate(am[7], 30U) ^ rotate(am[7], 19U) ^ rotate(am[7], 10U)) + ((am[0] & am[7]) | (am[1] & (am[0] | am[7])));
  an[0] = o + (rotate(ao, 25U) ^ rotate(ao, 14U) ^ (ao >> 3U));

  an[1] = p + ao;
  an[2] = 0x80000000U + (rotate(an[0], 15U) ^ rotate(an[0], 13U) ^ (an[0] >> 10U));
  an[3] = (rotate(an[1], 15U) ^ rotate(an[1], 13U) ^ (an[1] >> 10U));
  an[4] = 0x00000280U + (rotate(an[2], 15U) ^ rotate(an[2], 13U) ^ (an[2] >> 10U));
  an[5] = q + (rotate(an[3], 15U) ^ rotate(an[3], 13U) ^ (an[3] >> 10U));
  an[6] = r + (rotate(an[4], 15U) ^ rotate(an[4], 13U) ^ (an[4] >> 10U));
  an[7] = an[0] + (rotate(an[5], 15U) ^ rotate(an[5], 13U) ^ (an[5] >> 10U));
  an[8] = an[1] + (rotate(an[6], 15U) ^ rotate(an[6], 13U) ^ (an[6] >> 10U));
  an[9] = an[2] + (rotate(an[7], 15U) ^ rotate(an[7], 13U) ^ (an[7] >> 10U));
  an[10] = an[3] + (rotate(an[8], 15U) ^ rotate(an[8], 13U) ^ (an[8] >> 10U));
  an[11] = an[4] + (rotate(an[9], 15U) ^ rotate(an[9], 13U) ^ (an[9] >> 10U));
  an[12] = an[5] + 0x00a00055U + (rotate(an[10], 15U) ^ rotate(an[10], 13U) ^ (an[10] >> 10U));
  an[13] = an[6] + s + (rotate(an[11], 15U) ^ rotate(an[11], 13U) ^ (an[11] >> 10U));
  an[14] = an[7] + t + (rotate(an[12], 15U) ^ rotate(an[12], 13U) ^ (an[12] >> 10U));
  an[15] = an[8] + r + (rotate(an[13], 15U) ^ rotate(an[13], 13U) ^ (an[13] >> 10U)) + (rotate(an[0], 25U) ^ rotate(an[0], 14U) ^ (an[0] >> 3U));

  am[1] += 0x0fc19dc6U + am[5] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U)) + an[0];
  am[5] = 0x0fc19dc6U + am[5] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U)) + an[0] + (rotate(am[6], 30U) ^ rotate(am[6], 19U) ^ rotate(am[6], 10U)) + ((am[7] & am[6]) | (am[0] & (am[7] | am[6])));

  am[0] += 0x240ca1ccU + am[4] + an[1] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U));
  am[4] = 0x240ca1ccU + am[4] + an[1] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U)) + (rotate(am[5], 30U) ^ rotate(am[5], 19U) ^ rotate(am[5], 10U)) + ((am[6] & am[5]) | (am[7] & (am[6] | am[5])));

  am[7] += 0x2de92c6fU + am[3] + an[2] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U));
  am[3] = 0x2de92c6fU + am[3] + an[2] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U)) + (rotate(am[4], 30U) ^ rotate(am[4], 19U) ^ rotate(am[4], 10U)) + ((am[5] & am[4]) | (am[6] & (am[5] | am[4])));

  am[6] += 0x4a7484aaU + am[2] + an[3] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U));
  am[2] = 0x4a7484aaU + am[2] + an[3] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U)) + (rotate(am[3], 30U) ^ rotate(am[3], 19U) ^ rotate(am[3], 10U)) + ((am[4] & am[3]) | (am[5] & (am[4] | am[3])));

  am[5] += 0x5cb0a9dcU + am[1] + an[4] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U));
  am[1] = 0x5cb0a9dcU + am[1] + an[4] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U)) + (rotate(am[2], 30U) ^ rotate(am[2], 19U) ^ rotate(am[2], 10U)) + ((am[3] & am[2]) | (am[4] & (am[3] | am[2])));

  am[4] += 0x76f988daU + am[0] + an[5] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U));
  am[0] = 0x76f988daU + am[0] + an[5] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U)) + (rotate(am[1], 30U) ^ rotate(am[1], 19U) ^ rotate(am[1], 10U)) + ((am[2] & am[1]) | (am[3] & (am[2] | am[1])));

  am[3] += 0x983e5152U + am[7] + an[6] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U));
  am[7] = 0x983e5152U + am[7] + an[6] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U)) + (rotate(am[0], 30U) ^ rotate(am[0], 19U) ^ rotate(am[0], 10U)) + ((am[1] & am[0]) | (am[2] & (am[1] | am[0])));

  am[2] += 0xa831c66dU + am[6] + an[7] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U));
  am[6] = 0xa831c66dU + am[6] + an[7] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U)) + (rotate(am[7], 30U) ^ rotate(am[7], 19U) ^ rotate(am[7], 10U)) + ((am[0] & am[7]) | (am[1] & (am[0] | am[7])));

  am[1] += 0xb00327c8U + am[5] + an[8] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U));
  am[5] = 0xb00327c8U + am[5] + an[8] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U)) + (rotate(am[6], 30U) ^ rotate(am[6], 19U) ^ rotate(am[6], 10U)) + ((am[7] & am[6]) | (am[0] & (am[7] | am[6])));

  am[0] += 0xbf597fc7U + am[4] + an[9] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U));
  am[4] = 0xbf597fc7U + am[4] + an[9] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U)) + (rotate(am[5], 30U) ^ rotate(am[5], 19U) ^ rotate(am[5], 10U)) + ((am[6] & am[5]) | (am[7] & (am[6] | am[5])));

  am[7] += 0xc6e00bf3U + am[3] + an[10] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U));
  am[3] = 0xc6e00bf3U + am[3] + an[10] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U)) + (rotate(am[4], 30U) ^ rotate(am[4], 19U) ^ rotate(am[4], 10U)) + ((am[5] & am[4]) | (am[6] & (am[5] | am[4])));

  am[6] += 0xd5a79147U + am[2] + an[11] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U));
  am[2] = 0xd5a79147U + am[2] + an[11] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U)) + (rotate(am[3], 30U) ^ rotate(am[3], 19U) ^ rotate(am[3], 10U)) + ((am[4] & am[3]) | (am[5] & (am[4] | am[3])));

  am[5] += 0x06ca6351U + am[1] + an[12] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U));
  am[1] = 0x06ca6351U + am[1] + an[12] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U)) + (rotate(am[2], 30U) ^ rotate(am[2], 19U) ^ rotate(am[2], 10U)) + ((am[3] & am[2]) | (am[4] & (am[3] | am[2])));

  am[4] += 0x14292967U + am[0] + an[13] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U));
  am[0] = 0x14292967U + am[0] + an[13] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U)) + (rotate(am[1], 30U) ^ rotate(am[1], 19U) ^ rotate(am[1], 10U)) + ((am[2] & am[1]) | (am[3] & (am[2] | am[1])));

  am[3] += 0x27b70a85U + am[7] + an[14] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U));
  am[7] = 0x27b70a85U + am[7] + an[14] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U)) + (rotate(am[0], 30U) ^ rotate(am[0], 19U) ^ rotate(am[0], 10U)) + ((am[1] & am[0]) | (am[2] & (am[1] | am[0])));

  am[2] += 0x2e1b2138U + am[6] + an[15] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U));
  am[6] = 0x2e1b2138U + am[6] + an[15] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U)) + (rotate(am[7], 30U) ^ rotate(am[7], 19U) ^ rotate(am[7], 10U)) + ((am[0] & am[7]) | (am[1] & (am[0] | am[7])));

  an[0] = an[0] + an[9] + (rotate(an[14], 15U) ^ rotate(an[14], 13U) ^ (an[14] >> 10U)) + (rotate(an[1], 25U) ^ rotate(an[1], 14U) ^ (an[1] >> 3U));
  an[1] = an[1] + an[10] + (rotate(an[15], 15U) ^ rotate(an[15], 13U) ^ (an[15] >> 10U)) + (rotate(an[2], 25U) ^ rotate(an[2], 14U) ^ (an[2] >> 3U));
  an[2] = an[2] + an[11] + (rotate(an[0], 15U) ^ rotate(an[0], 13U) ^ (an[0] >> 10U)) + (rotate(an[3], 25U) ^ rotate(an[3], 14U) ^ (an[3] >> 3U));
  an[3] = an[3] + an[12] + (rotate(an[1], 15U) ^ rotate(an[1], 13U) ^ (an[1] >> 10U)) + (rotate(an[4], 25U) ^ rotate(an[4], 14U) ^ (an[4] >> 3U));
  an[4] = an[4] + an[13] + (rotate(an[2], 15U) ^ rotate(an[2], 13U) ^ (an[2] >> 10U)) + (rotate(an[5], 25U) ^ rotate(an[5], 14U) ^ (an[5] >> 3U));
  an[5] = an[5] + an[14] + (rotate(an[3], 15U) ^ rotate(an[3], 13U) ^ (an[3] >> 10U)) + (rotate(an[6], 25U) ^ rotate(an[6], 14U) ^ (an[6] >> 3U));
  an[6] = an[6] + an[15] + (rotate(an[4], 15U) ^ rotate(an[4], 13U) ^ (an[4] >> 10U)) + (rotate(an[7], 25U) ^ rotate(an[7], 14U) ^ (an[7] >> 3U));
  an[7] = an[7] + an[0] + (rotate(an[5], 15U) ^ rotate(an[5], 13U) ^ (an[5] >> 10U)) + (rotate(an[8], 25U) ^ rotate(an[8], 14U) ^ (an[8] >> 3U));
  an[8] = an[8] + an[1] + (rotate(an[6], 15U) ^ rotate(an[6], 13U) ^ (an[6] >> 10U)) + (rotate(an[9], 25U) ^ rotate(an[9], 14U) ^ (an[9] >> 3U));
  an[9] = an[9] + an[2] + (rotate(an[7], 15U) ^ rotate(an[7], 13U) ^ (an[7] >> 10U)) + (rotate(an[10], 25U) ^ rotate(an[10], 14U) ^ (an[10] >> 3U));
  an[10] = an[10] + an[3] + (rotate(an[8], 15U) ^ rotate(an[8], 13U) ^ (an[8] >> 10U)) + (rotate(an[11], 25U) ^ rotate(an[11], 14U) ^ (an[11] >> 3U));
  an[11] = an[11] + an[4] + (rotate(an[9], 15U) ^ rotate(an[9], 13U) ^ (an[9] >> 10U)) + (rotate(an[12], 25U) ^ rotate(an[12], 14U) ^ (an[12] >> 3U));
  an[12] = an[12] + an[5] + (rotate(an[10], 15U) ^ rotate(an[10], 13U) ^ (an[10] >> 10U)) + (rotate(an[13], 25U) ^ rotate(an[13], 14U) ^ (an[13] >> 3U));
  an[13] = an[13] + an[6] + (rotate(an[11], 15U) ^ rotate(an[11], 13U) ^ (an[11] >> 10U)) + (rotate(an[14], 25U) ^ rotate(an[14], 14U) ^ (an[14] >> 3U));
  an[14] = an[14] + an[7] + (rotate(an[12], 15U) ^ rotate(an[12], 13U) ^ (an[12] >> 10U)) + (rotate(an[15], 25U) ^ rotate(an[15], 14U) ^ (an[15] >> 3U));
  an[15] = an[15] + an[8] + (rotate(an[13], 15U) ^ rotate(an[13], 13U) ^ (an[13] >> 10U)) + (rotate(an[0], 25U) ^ rotate(an[0], 14U) ^ (an[0] >> 3U));

  am[1] += 0x4d2c6dfcU + am[5] + an[0] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U));
  am[5] = 0x4d2c6dfcU + am[5] + an[0] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U)) + (rotate(am[6], 30U) ^ rotate(am[6], 19U) ^ rotate(am[6], 10U)) + ((am[7] & am[6]) | (am[0] & (am[7] | am[6])));

  am[0] += 0x53380d13U + am[4] + an[1] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U));
  am[4] = 0x53380d13U + am[4] + an[1] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U)) + (rotate(am[5], 30U) ^ rotate(am[5], 19U) ^ rotate(am[5], 10U)) + ((am[6] & am[5]) | (am[7] & (am[6] | am[5])));

  am[7] += 0x650a7354U + am[3] + an[2] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U));
  am[3] = 0x650a7354U + am[3] + an[2] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U)) + (rotate(am[4], 30U) ^ rotate(am[4], 19U) ^ rotate(am[4], 10U)) + ((am[5] & am[4]) | (am[6] & (am[5] | am[4])));

  am[6] += 0x766a0abbU + am[2] + an[3] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U));
  am[2] = 0x766a0abbU + am[2] + an[3] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U)) + (rotate(am[3], 30U) ^ rotate(am[3], 19U) ^ rotate(am[3], 10U)) + ((am[4] & am[3]) | (am[5] & (am[4] | am[3])));

  am[5] += 0x81c2c92eU + am[1] + an[4] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U));
  am[1] = 0x81c2c92eU + am[1] + an[4] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U)) + (rotate(am[2], 30U) ^ rotate(am[2], 19U) ^ rotate(am[2], 10U)) + ((am[3] & am[2]) | (am[4] & (am[3] | am[2])));

  am[4] += 0x92722c85U + am[0] + an[5] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U));
  am[0] = 0x92722c85U + am[0] + an[5] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U)) + (rotate(am[1], 30U) ^ rotate(am[1], 19U) ^ rotate(am[1], 10U)) + ((am[2] & am[1]) | (am[3] & (am[2] | am[1])));

  am[3] += 0xa2bfe8a1U + am[7] + an[6] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U));
  am[7] = 0xa2bfe8a1U + am[7] + an[6] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U)) + (rotate(am[0], 30U) ^ rotate(am[0], 19U) ^ rotate(am[0], 10U)) + ((am[1] & am[0]) | (am[2] & (am[1] | am[0])));

  am[2] += 0xa81a664bU + am[6] + an[7] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U));
  am[6] = 0xa81a664bU + am[6] + an[7] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U)) + (rotate(am[7], 30U) ^ rotate(am[7], 19U) ^ rotate(am[7], 10U)) + ((am[0] & am[7]) | (am[1] & (am[0] | am[7])));

  am[1] += 0xc24b8b70U + am[5] + an[8] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U));
  am[5] = 0xc24b8b70U + am[5] + an[8] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U)) + (rotate(am[6], 30U) ^ rotate(am[6], 19U) ^ rotate(am[6], 10U)) + ((am[7] & am[6]) | (am[0] & (am[7] | am[6])));

  am[0] += 0xc76c51a3U + am[4] + an[9] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U));
  am[4] = 0xc76c51a3U + am[4] + an[9] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U)) + (rotate(am[5], 30U) ^ rotate(am[5], 19U) ^ rotate(am[5], 10U)) + ((am[6] & am[5]) | (am[7] & (am[6] | am[5])));

  am[7] += 0xd192e819U + am[3] + an[10] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U));
  am[3] = 0xd192e819U + am[3] + an[10] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U)) + (rotate(am[4], 30U) ^ rotate(am[4], 19U) ^ rotate(am[4], 10U)) + ((am[5] & am[4]) | (am[6] & (am[5] | am[4])));

  am[6] += 0xd6990624U + am[2] + an[11] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U));
  am[2] = 0xd6990624U + am[2] + an[11] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U)) + (rotate(am[3], 30U) ^ rotate(am[3], 19U) ^ rotate(am[3], 10U)) + ((am[4] & am[3]) | (am[5] & (am[4] | am[3])));

  am[5] += 0xf40e3585U + am[1] + an[12] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U));
  am[1] = 0xf40e3585U + am[1] + an[12] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U)) + (rotate(am[2], 30U) ^ rotate(am[2], 19U) ^ rotate(am[2], 10U)) + ((am[3] & am[2]) | (am[4] & (am[3] | am[2])));

  am[4] += 0x106aa070U + am[0] + an[13] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U));
  am[0] = 0x106aa070U + am[0] + an[13] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U)) + (rotate(am[1], 30U) ^ rotate(am[1], 19U) ^ rotate(am[1], 10U)) + ((am[2] & am[1]) | (am[3] & (am[2] | am[1])));

  am[3] += 0x19a4c116U + am[7] + an[14] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U));
  am[7] = 0x19a4c116U + am[7] + an[14] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U)) + (rotate(am[0], 30U) ^ rotate(am[0], 19U) ^ rotate(am[0], 10U)) + ((am[1] & am[0]) | (am[2] & (am[1] | am[0])));

  am[2] += 0x1e376c08U + am[6] + an[15] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U));
  am[6] = 0x1e376c08U + am[6] + an[15] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U)) + (rotate(am[7], 30U) ^ rotate(am[7], 19U) ^ rotate(am[7], 10U)) + ((am[0] & am[7]) | (am[1] & (am[0] | am[7])));

  an[0] = an[0] + an[9] + (rotate(an[14], 15U) ^ rotate(an[14], 13U) ^ (an[14] >> 10U)) + (rotate(an[1], 25U) ^ rotate(an[1], 14U) ^ (an[1] >> 3U));
  an[1] = an[1] + an[10] + (rotate(an[15], 15U) ^ rotate(an[15], 13U) ^ (an[15] >> 10U)) + (rotate(an[2], 25U) ^ rotate(an[2], 14U) ^ (an[2] >> 3U));
  an[2] = an[2] + an[11] + (rotate(an[0], 15U) ^ rotate(an[0], 13U) ^ (an[0] >> 10U)) + (rotate(an[3], 25U) ^ rotate(an[3], 14U) ^ (an[3] >> 3U));
  an[3] = an[3] + an[12] + (rotate(an[1], 15U) ^ rotate(an[1], 13U) ^ (an[1] >> 10U)) + (rotate(an[4], 25U) ^ rotate(an[4], 14U) ^ (an[4] >> 3U));
  an[4] = an[4] + an[13] + (rotate(an[2], 15U) ^ rotate(an[2], 13U) ^ (an[2] >> 10U)) + (rotate(an[5], 25U) ^ rotate(an[5], 14U) ^ (an[5] >> 3U));
  an[5] = an[5] + an[14] + (rotate(an[3], 15U) ^ rotate(an[3], 13U) ^ (an[3] >> 10U)) + (rotate(an[6], 25U) ^ rotate(an[6], 14U) ^ (an[6] >> 3U));
  an[6] = an[6] + an[15] + (rotate(an[4], 15U) ^ rotate(an[4], 13U) ^ (an[4] >> 10U)) + (rotate(an[7], 25U) ^ rotate(an[7], 14U) ^ (an[7] >> 3U));
  an[7] = an[7] + an[0] + (rotate(an[5], 15U) ^ rotate(an[5], 13U) ^ (an[5] >> 10U)) + (rotate(an[8], 25U) ^ rotate(an[8], 14U) ^ (an[8] >> 3U));
  an[8] = an[8] + an[1] + (rotate(an[6], 15U) ^ rotate(an[6], 13U) ^ (an[6] >> 10U)) + (rotate(an[9], 25U) ^ rotate(an[9], 14U) ^ (an[9] >> 3U));
  an[9] = an[9] + an[2] + (rotate(an[7], 15U) ^ rotate(an[7], 13U) ^ (an[7] >> 10U)) + (rotate(an[10], 25U) ^ rotate(an[10], 14U) ^ (an[10] >> 3U));
  an[10] = an[10] + an[3] + (rotate(an[8], 15U) ^ rotate(an[8], 13U) ^ (an[8] >> 10U)) + (rotate(an[11], 25U) ^ rotate(an[11], 14U) ^ (an[11] >> 3U));
  an[11] = an[11] + an[4] + (rotate(an[9], 15U) ^ rotate(an[9], 13U) ^ (an[9] >> 10U)) + (rotate(an[12], 25U) ^ rotate(an[12], 14U) ^ (an[12] >> 3U));
  an[12] = an[12] + an[5] + (rotate(an[10], 15U) ^ rotate(an[10], 13U) ^ (an[10] >> 10U)) + (rotate(an[13], 25U) ^ rotate(an[13], 14U) ^ (an[13] >> 3U));
  an[13] = an[13] + an[6] + (rotate(an[11], 15U) ^ rotate(an[11], 13U) ^ (an[11] >> 10U)) + (rotate(an[14], 25U) ^ rotate(an[14], 14U) ^ (an[14] >> 3U));

  am[1] += 0x2748774cU + am[5] + an[0] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U));
  am[5] = 0x2748774cU + am[5] + an[0] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U)) + (rotate(am[6], 30U) ^ rotate(am[6], 19U) ^ rotate(am[6], 10U)) + ((am[7] & am[6]) | (am[0] & (am[7] | am[6])));

  am[0] += 0x34b0bcb5U + am[4] + an[1] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U));
  am[4] = 0x34b0bcb5U + am[4] + an[1] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U)) + (rotate(am[5], 30U) ^ rotate(am[5], 19U) ^ rotate(am[5], 10U)) + ((am[6] & am[5]) | (am[7] & (am[6] | am[5])));

  am[7] += 0x391c0cb3U + am[3] + an[2] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U));
  am[3] = 0x391c0cb3U + am[3] + an[2] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U)) + (rotate(am[4], 30U) ^ rotate(am[4], 19U) ^ rotate(am[4], 10U)) + ((am[5] & am[4]) | (am[6] & (am[5] | am[4])));

  am[6] += 0x4ed8aa4aU + am[2] + an[3] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U));
  am[2] = 0x4ed8aa4aU + am[2] + an[3] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U)) + (rotate(am[3], 30U) ^ rotate(am[3], 19U) ^ rotate(am[3], 10U)) + ((am[4] & am[3]) | (am[5] & (am[4] | am[3])));

  am[5] += 0x5b9cca4fU + am[1] + an[4] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U));
  am[1] = 0x5b9cca4fU + am[1] + an[4] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U)) + (rotate(am[2], 30U) ^ rotate(am[2], 19U) ^ rotate(am[2], 10U)) + ((am[3] & am[2]) | (am[4] & (am[3] | am[2])));

  am[4] += 0x682e6ff3U + am[0] + an[5] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U));
  am[0] = 0x682e6ff3U + am[0] + an[5] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U)) + (rotate(am[1], 30U) ^ rotate(am[1], 19U) ^ rotate(am[1], 10U)) + ((am[2] & am[1]) | (am[3] & (am[2] | am[1])));

  am[3] += 0x748f82eeU + am[7] + an[6] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U));
  am[7] = 0x748f82eeU + am[7] + an[6] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U)) + (rotate(am[0], 30U) ^ rotate(am[0], 19U) ^ rotate(am[0], 10U)) + ((am[1] & am[0]) | (am[2] & (am[1] | am[0])));

  am[2] += 0x78a5636fU + am[6] + an[7] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U));
  am[6] = 0x78a5636fU + am[6] + an[7] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U)) + (rotate(am[7], 30U) ^ rotate(am[7], 19U) ^ rotate(am[7], 10U)) + ((am[0] & am[7]) | (am[1] & (am[0] | am[7])));

  am[1] += 0x84c87814U + am[5] + an[8] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U));
  am[5] = 0x84c87814U + am[5] + an[8] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U)) + (rotate(am[6], 30U) ^ rotate(am[6], 19U) ^ rotate(am[6], 10U)) + ((am[7] & am[6]) | (am[0] & (am[7] | am[6])));

  am[0] += 0x8cc70208U + am[4] + an[9] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U));
  am[4] = 0x8cc70208U + am[4] + an[9] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U)) + (rotate(am[5], 30U) ^ rotate(am[5], 19U) ^ rotate(am[5], 10U)) + ((am[6] & am[5]) | (am[7] & (am[6] | am[5])));

  am[7] += 0x90befffaU + am[3] + an[10] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U));
  am[3] = 0x90befffaU + am[3] + an[10] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U)) + (rotate(am[4], 30U) ^ rotate(am[4], 19U) ^ rotate(am[4], 10U)) + ((am[5] & am[4]) | (am[6] & (am[5] | am[4])));

  am[6] += 0xa4506cebU + am[2] + an[11] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U));
  am[2] = 0xa4506cebU + am[2] + an[11] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U)) + (rotate(am[3], 30U) ^ rotate(am[3], 19U) ^ rotate(am[3], 10U)) + ((am[4] & am[3]) | (am[5] & (am[4] | am[3])));

  am[5] += 0xbef9a3f7U + am[1] + an[12] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U));
  am[1] = 0xbef9a3f7U + am[1] + an[12] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U)) + (rotate(am[2], 30U) ^ rotate(am[2], 19U) ^ rotate(am[2], 10U)) + ((am[3] & am[2]) | (am[4] & (am[3] | am[2])));

  am[4] += 0xc67178f2U + am[0] + an[13] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U));
  am[0] = 0xc67178f2U + am[0] + an[13] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U)) + (rotate(am[1], 30U) ^ rotate(am[1], 19U) ^ rotate(am[1], 10U)) + ((am[2] & am[1]) | (am[3] & (am[2] | am[1])));

  an[0] = u + am[0] + (rotate(v + am[1], 25U) ^ rotate(v + am[1], 14U) ^ (v + am[1] >> 3U));
  an[1] = v + am[1] + 0x00a00000U + (rotate(w + am[2], 25U) ^ rotate(w + am[2], 14U) ^ (w + am[2] >> 3U));
  an[2] = w + am[2] + (rotate(an[0], 15U) ^ rotate(an[0], 13U) ^ (an[0] >> 10U)) + (rotate(x + am[3], 25U) ^ rotate(x + am[3], 14U) ^ (x + am[3] >> 3U));
  an[3] = x + am[3] + (rotate(an[1], 15U) ^ rotate(an[1], 13U) ^ (an[1] >> 10U)) + (rotate(y + am[4], 25U) ^ rotate(y + am[4], 14U) ^ (y + am[4] >> 3U));
  an[4] = y + am[4] + (rotate(an[2], 15U) ^ rotate(an[2], 13U) ^ (an[2] >> 10U)) + (rotate(z + am[5], 25U) ^ rotate(z + am[5], 14U) ^ (z + am[5] >> 3U));
  an[5] = z + am[5] + (rotate(an[3], 15U) ^ rotate(an[3], 13U) ^ (an[3] >> 10U)) + (rotate(aa + am[6], 25U) ^ rotate(aa + am[6], 14U) ^ (aa + am[6] >> 3U));
  an[6] = aa + am[6] + 0x00000100U + (rotate(an[4], 15U) ^ rotate(an[4], 13U) ^ (an[4] >> 10U)) + (rotate(ab + am[7], 25U) ^ rotate(ab + am[7], 14U) ^ (ab + am[7] >> 3U));
  an[7] = ab + am[7] + an[0] + 0x11002000U + (rotate(an[5], 15U) ^ rotate(an[5], 13U) ^ (an[5] >> 10U));
  an[8] = an[1] + 0x80000000U + (rotate(an[6], 15U) ^ rotate(an[6], 13U) ^ (an[6] >> 10U));
  an[9] = an[2] + (rotate(an[7], 15U) ^ rotate(an[7], 13U) ^ (an[7] >> 10U));
  an[10] = an[3] + (rotate(an[8], 15U) ^ rotate(an[8], 13U) ^ (an[8] >> 10U));
  an[11] = an[4] + (rotate(an[9], 15U) ^ rotate(an[9], 13U) ^ (an[9] >> 10U));
  an[12] = an[5] + (rotate(an[10], 15U) ^ rotate(an[10], 13U) ^ (an[10] >> 10U));
  an[13] = an[6] + (rotate(an[11], 15U) ^ rotate(an[11], 13U) ^ (an[11] >> 10U));
  an[14] = an[7] + 0x00400022U + (rotate(an[12], 15U) ^ rotate(an[12], 13U) ^ (an[12] >> 10U));
  an[15] = an[8] + 0x00000100U + (rotate(an[13], 15U) ^ rotate(an[13], 13U) ^ (an[13] >> 10U)) + (rotate(an[0], 25U) ^ rotate(an[0], 14U) ^ (an[0] >> 3U));

  const u ap = ae + am[1];

  const u aq = af + am[2];

  const u ar = ag + am[3];

  const u as = ah + am[4];

  const u at = ai + am[5];

  const u au = aj + am[6];

  const u av = ak + am[7];

  am[3] = ac + am[0];

  am[7] = ad + am[0];
  am[0] = 0x6a09e667U;
  am[1] = 0xbb67ae85U;
  am[2] = 0x3c6ef372U;
  am[4] = 0x510e527fU;
  am[5] = 0x9b05688cU;
  am[6] = 0x1f83d9abU;

  am[2] += ap + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U));
  am[6] = ap + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U)) + (rotate(am[7], 30U) ^ rotate(am[7], 19U) ^ rotate(am[7], 10U)) + ((am[0] & am[7]) | (am[1] & (am[0] | am[7])));

  am[1] += aq + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U));
  am[5] = aq + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U)) + (rotate(am[6], 30U) ^ rotate(am[6], 19U) ^ rotate(am[6], 10U)) + ((am[7] & am[6]) | (am[0] & (am[7] | am[6])));

  am[0] += ar + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U));
  am[4] = ar + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U)) + (rotate(am[5], 30U) ^ rotate(am[5], 19U) ^ rotate(am[5], 10U)) + ((am[6] & am[5]) | (am[7] & (am[6] | am[5])));

  am[7] += as + am[3] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U));
  am[3] = as + am[3] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U)) + (rotate(am[4], 30U) ^ rotate(am[4], 19U) ^ rotate(am[4], 10U)) + ((am[5] & am[4]) | (am[6] & (am[5] | am[4])));

  am[6] += at + am[2] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U));
  am[2] = at + am[2] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U)) + (rotate(am[3], 30U) ^ rotate(am[3], 19U) ^ rotate(am[3], 10U)) + ((am[4] & am[3]) | (am[5] & (am[4] | am[3])));

  am[5] += au + am[1] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U));
  am[1] = au + am[1] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U)) + (rotate(am[2], 30U) ^ rotate(am[2], 19U) ^ rotate(am[2], 10U)) + ((am[3] & am[2]) | (am[4] & (am[3] | am[2])));

  am[4] += av + am[0] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U));
  am[0] = av + am[0] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U)) + (rotate(am[1], 30U) ^ rotate(am[1], 19U) ^ rotate(am[1], 10U)) + ((am[2] & am[1]) | (am[3] & (am[2] | am[1])));

  am[3] += 0x5807aa98U + am[7] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U));
  am[7] = 0x5807aa98U + am[7] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U)) + (rotate(am[0], 30U) ^ rotate(am[0], 19U) ^ rotate(am[0], 10U)) + ((am[1] & am[0]) | (am[2] & (am[1] | am[0])));

  am[2] += 0x12835b01U + am[6] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U));
  am[6] = 0x12835b01U + am[6] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U)) + (rotate(am[7], 30U) ^ rotate(am[7], 19U) ^ rotate(am[7], 10U)) + ((am[0] & am[7]) | (am[1] & (am[0] | am[7])));

  am[1] += 0x243185beU + am[5] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U));
  am[5] = 0x243185beU + am[5] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U)) + (rotate(am[6], 30U) ^ rotate(am[6], 19U) ^ rotate(am[6], 10U)) + ((am[7] & am[6]) | (am[0] & (am[7] | am[6])));

  am[0] += 0x550c7dc3U + am[4] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U));
  am[4] = 0x550c7dc3U + am[4] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U)) + (rotate(am[5], 30U) ^ rotate(am[5], 19U) ^ rotate(am[5], 10U)) + ((am[6] & am[5]) | (am[7] & (am[6] | am[5])));

  am[7] += 0x72be5d74U + am[3] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U));
  am[3] = 0x72be5d74U + am[3] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U)) + (rotate(am[4], 30U) ^ rotate(am[4], 19U) ^ rotate(am[4], 10U)) + ((am[5] & am[4]) | (am[6] & (am[5] | am[4])));

  am[6] += 0x80deb1feU + am[2] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U));
  am[2] = 0x80deb1feU + am[2] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U)) + (rotate(am[3], 30U) ^ rotate(am[3], 19U) ^ rotate(am[3], 10U)) + ((am[4] & am[3]) | (am[5] & (am[4] | am[3])));

  am[5] += 0x9bdc06a7U + am[1] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U));
  am[1] = 0x9bdc06a7U + am[1] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U)) + (rotate(am[2], 30U) ^ rotate(am[2], 19U) ^ rotate(am[2], 10U)) + ((am[3] & am[2]) | (am[4] & (am[3] | am[2])));

  am[4] += 0xc19bf274U + am[0] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U));
  am[0] = 0xc19bf274U + am[0] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U)) + (rotate(am[1], 30U) ^ rotate(am[1], 19U) ^ rotate(am[1], 10U)) + ((am[2] & am[1]) | (am[3] & (am[2] | am[1])));

  am[3] += 0xe49b69c1U + am[7] + an[0] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U));
  am[7] = 0xe49b69c1U + am[7] + an[0] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U)) + (rotate(am[0], 30U) ^ rotate(am[0], 19U) ^ rotate(am[0], 10U)) + ((am[1] & am[0]) | (am[2] & (am[1] | am[0])));

  am[2] += 0xefbe4786U + am[6] + an[1] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U));
  am[6] = 0xefbe4786U + am[6] + an[1] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U)) + (rotate(am[7], 30U) ^ rotate(am[7], 19U) ^ rotate(am[7], 10U)) + ((am[0] & am[7]) | (am[1] & (am[0] | am[7])));

  am[1] += 0x0fc19dc6U + am[5] + an[2] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U));
  am[5] = 0x0fc19dc6U + am[5] + an[2] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U)) + (rotate(am[6], 30U) ^ rotate(am[6], 19U) ^ rotate(am[6], 10U)) + ((am[7] & am[6]) | (am[0] & (am[7] | am[6])));

  am[0] += 0x240ca1ccU + am[4] + an[3] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U));
  am[4] = 0x240ca1ccU + am[4] + an[3] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U)) + (rotate(am[5], 30U) ^ rotate(am[5], 19U) ^ rotate(am[5], 10U)) + ((am[6] & am[5]) | (am[7] & (am[6] | am[5])));

  am[7] += 0x2de92c6fU + am[3] + an[4] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U));
  am[3] = 0x2de92c6fU + am[3] + an[4] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U)) + (rotate(am[4], 30U) ^ rotate(am[4], 19U) ^ rotate(am[4], 10U)) + ((am[5] & am[4]) | (am[6] & (am[5] | am[4])));

  am[6] += 0x4a7484aaU + am[2] + an[5] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U));
  am[2] = 0x4a7484aaU + am[2] + an[5] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U)) + (rotate(am[3], 30U) ^ rotate(am[3], 19U) ^ rotate(am[3], 10U)) + ((am[4] & am[3]) | (am[5] & (am[4] | am[3])));

  am[5] += 0x5cb0a9dcU + am[1] + an[6] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U));
  am[1] = 0x5cb0a9dcU + am[1] + an[6] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U)) + (rotate(am[2], 30U) ^ rotate(am[2], 19U) ^ rotate(am[2], 10U)) + ((am[3] & am[2]) | (am[4] & (am[3] | am[2])));

  am[4] += 0x76f988daU + am[0] + an[7] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U));
  am[0] = 0x76f988daU + am[0] + an[7] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U)) + (rotate(am[1], 30U) ^ rotate(am[1], 19U) ^ rotate(am[1], 10U)) + ((am[2] & am[1]) | (am[3] & (am[2] | am[1])));

  am[3] += 0x983e5152U + am[7] + an[8] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U));
  am[7] = 0x983e5152U + am[7] + an[8] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U)) + (rotate(am[0], 30U) ^ rotate(am[0], 19U) ^ rotate(am[0], 10U)) + ((am[1] & am[0]) | (am[2] & (am[1] | am[0])));

  am[2] += 0xa831c66dU + am[6] + an[9] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U));
  am[6] = 0xa831c66dU + am[6] + an[9] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U)) + (rotate(am[7], 30U) ^ rotate(am[7], 19U) ^ rotate(am[7], 10U)) + ((am[0] & am[7]) | (am[1] & (am[0] | am[7])));

  am[1] += 0xb00327c8U + am[5] + an[10] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U));
  am[5] = 0xb00327c8U + am[5] + an[10] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U)) + (rotate(am[6], 30U) ^ rotate(am[6], 19U) ^ rotate(am[6], 10U)) + ((am[7] & am[6]) | (am[0] & (am[7] | am[6])));

  am[0] += 0xbf597fc7U + am[4] + an[11] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U));
  am[4] = 0xbf597fc7U + am[4] + an[11] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U)) + (rotate(am[5], 30U) ^ rotate(am[5], 19U) ^ rotate(am[5], 10U)) + ((am[6] & am[5]) | (am[7] & (am[6] | am[5])));

  am[7] += 0xc6e00bf3U + am[3] + an[12] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U));
  am[3] = 0xc6e00bf3U + am[3] + an[12] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U)) + (rotate(am[4], 30U) ^ rotate(am[4], 19U) ^ rotate(am[4], 10U)) + ((am[5] & am[4]) | (am[6] & (am[5] | am[4])));

  am[6] += 0xd5a79147U + am[2] + an[13] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U));
  am[2] = 0xd5a79147U + am[2] + an[13] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U)) + (rotate(am[3], 30U) ^ rotate(am[3], 19U) ^ rotate(am[3], 10U)) + ((am[4] & am[3]) | (am[5] & (am[4] | am[3])));

  am[5] += 0x06ca6351U + am[1] + an[14] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U));
  am[1] = 0x06ca6351U + am[1] + an[14] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U)) + (rotate(am[2], 30U) ^ rotate(am[2], 19U) ^ rotate(am[2], 10U)) + ((am[3] & am[2]) | (am[4] & (am[3] | am[2])));

  am[4] += 0x14292967U + am[0] + an[15] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U));
  am[0] = 0x14292967U + am[0] + an[15] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U)) + (rotate(am[1], 30U) ^ rotate(am[1], 19U) ^ rotate(am[1], 10U)) + ((am[2] & am[1]) | (am[3] & (am[2] | am[1])));

  an[0] = an[0] + an[9] + (rotate(an[14], 15U) ^ rotate(an[14], 13U) ^ (an[14] >> 10U)) + (rotate(an[1], 25U) ^ rotate(an[1], 14U) ^ (an[1] >> 3U));
  an[1] = an[1] + an[10] + (rotate(an[15], 15U) ^ rotate(an[15], 13U) ^ (an[15] >> 10U)) + (rotate(an[2], 25U) ^ rotate(an[2], 14U) ^ (an[2] >> 3U));
  an[2] = an[2] + an[11] + (rotate(an[0], 15U) ^ rotate(an[0], 13U) ^ (an[0] >> 10U)) + (rotate(an[3], 25U) ^ rotate(an[3], 14U) ^ (an[3] >> 3U));
  an[3] = an[3] + an[12] + (rotate(an[1], 15U) ^ rotate(an[1], 13U) ^ (an[1] >> 10U)) + (rotate(an[4], 25U) ^ rotate(an[4], 14U) ^ (an[4] >> 3U));
  an[4] = an[4] + an[13] + (rotate(an[2], 15U) ^ rotate(an[2], 13U) ^ (an[2] >> 10U)) + (rotate(an[5], 25U) ^ rotate(an[5], 14U) ^ (an[5] >> 3U));
  an[5] = an[5] + an[14] + (rotate(an[3], 15U) ^ rotate(an[3], 13U) ^ (an[3] >> 10U)) + (rotate(an[6], 25U) ^ rotate(an[6], 14U) ^ (an[6] >> 3U));
  an[6] = an[6] + an[15] + (rotate(an[4], 15U) ^ rotate(an[4], 13U) ^ (an[4] >> 10U)) + (rotate(an[7], 25U) ^ rotate(an[7], 14U) ^ (an[7] >> 3U));
  an[7] = an[7] + an[0] + (rotate(an[5], 15U) ^ rotate(an[5], 13U) ^ (an[5] >> 10U)) + (rotate(an[8], 25U) ^ rotate(an[8], 14U) ^ (an[8] >> 3U));
  an[8] = an[8] + an[1] + (rotate(an[6], 15U) ^ rotate(an[6], 13U) ^ (an[6] >> 10U)) + (rotate(an[9], 25U) ^ rotate(an[9], 14U) ^ (an[9] >> 3U));
  an[9] = an[9] + an[2] + (rotate(an[7], 15U) ^ rotate(an[7], 13U) ^ (an[7] >> 10U)) + (rotate(an[10], 25U) ^ rotate(an[10], 14U) ^ (an[10] >> 3U));
  an[10] = an[10] + an[3] + (rotate(an[8], 15U) ^ rotate(an[8], 13U) ^ (an[8] >> 10U)) + (rotate(an[11], 25U) ^ rotate(an[11], 14U) ^ (an[11] >> 3U));
  an[11] = an[11] + an[4] + (rotate(an[9], 15U) ^ rotate(an[9], 13U) ^ (an[9] >> 10U)) + (rotate(an[12], 25U) ^ rotate(an[12], 14U) ^ (an[12] >> 3U));
  an[12] = an[12] + an[5] + (rotate(an[10], 15U) ^ rotate(an[10], 13U) ^ (an[10] >> 10U)) + (rotate(an[13], 25U) ^ rotate(an[13], 14U) ^ (an[13] >> 3U));
  an[13] = an[13] + an[6] + (rotate(an[11], 15U) ^ rotate(an[11], 13U) ^ (an[11] >> 10U)) + (rotate(an[14], 25U) ^ rotate(an[14], 14U) ^ (an[14] >> 3U));
  an[14] = an[14] + an[7] + (rotate(an[12], 15U) ^ rotate(an[12], 13U) ^ (an[12] >> 10U)) + (rotate(an[15], 25U) ^ rotate(an[15], 14U) ^ (an[15] >> 3U));
  an[15] = an[15] + an[8] + (rotate(an[13], 15U) ^ rotate(an[13], 13U) ^ (an[13] >> 10U)) + (rotate(an[0], 25U) ^ rotate(an[0], 14U) ^ (an[0] >> 3U));

  am[3] += 0x27b70a85U + am[7] + an[0] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U));
  am[7] = 0x27b70a85U + am[7] + an[0] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U)) + (rotate(am[0], 30U) ^ rotate(am[0], 19U) ^ rotate(am[0], 10U)) + ((am[1] & am[0]) | (am[2] & (am[1] | am[0])));

  am[2] += 0x2e1b2138U + am[6] + an[1] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U));
  am[6] = 0x2e1b2138U + am[6] + an[1] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U)) + (rotate(am[7], 30U) ^ rotate(am[7], 19U) ^ rotate(am[7], 10U)) + ((am[0] & am[7]) | (am[1] & (am[0] | am[7])));

  am[1] += 0x4d2c6dfcU + am[5] + an[2] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U));
  am[5] = 0x4d2c6dfcU + am[5] + an[2] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U)) + (rotate(am[6], 30U) ^ rotate(am[6], 19U) ^ rotate(am[6], 10U)) + ((am[7] & am[6]) | (am[0] & (am[7] | am[6])));

  am[0] += 0x53380d13U + am[4] + an[3] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U));
  am[4] = 0x53380d13U + am[4] + an[3] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U)) + (rotate(am[5], 30U) ^ rotate(am[5], 19U) ^ rotate(am[5], 10U)) + ((am[6] & am[5]) | (am[7] & (am[6] | am[5])));

  am[7] += 0x650a7354U + am[3] + an[4] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U));
  am[3] = 0x650a7354U + am[3] + an[4] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U)) + (rotate(am[4], 30U) ^ rotate(am[4], 19U) ^ rotate(am[4], 10U)) + ((am[5] & am[4]) | (am[6] & (am[5] | am[4])));

  am[6] += 0x766a0abbU + am[2] + an[5] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U));
  am[2] = 0x766a0abbU + am[2] + an[5] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U)) + (rotate(am[3], 30U) ^ rotate(am[3], 19U) ^ rotate(am[3], 10U)) + ((am[4] & am[3]) | (am[5] & (am[4] | am[3])));

  am[5] += 0x81c2c92eU + am[1] + an[6] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U));
  am[1] = 0x81c2c92eU + am[1] + an[6] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U)) + (rotate(am[2], 30U) ^ rotate(am[2], 19U) ^ rotate(am[2], 10U)) + ((am[3] & am[2]) | (am[4] & (am[3] | am[2])));

  am[4] += 0x92722c85U + am[0] + an[7] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U));
  am[0] = 0x92722c85U + am[0] + an[7] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U)) + (rotate(am[1], 30U) ^ rotate(am[1], 19U) ^ rotate(am[1], 10U)) + ((am[2] & am[1]) | (am[3] & (am[2] | am[1])));

  am[3] += 0xa2bfe8a1U + am[7] + an[8] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U));
  am[7] = 0xa2bfe8a1U + am[7] + an[8] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U)) + (rotate(am[0], 30U) ^ rotate(am[0], 19U) ^ rotate(am[0], 10U)) + ((am[1] & am[0]) | (am[2] & (am[1] | am[0])));

  am[2] += 0xa81a664bU + am[6] + an[9] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U));
  am[6] = 0xa81a664bU + am[6] + an[9] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U)) + (rotate(am[7], 30U) ^ rotate(am[7], 19U) ^ rotate(am[7], 10U)) + ((am[0] & am[7]) | (am[1] & (am[0] | am[7])));

  am[1] += 0xc24b8b70U + am[5] + an[10] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U));
  am[5] = 0xc24b8b70U + am[5] + an[10] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U)) + (rotate(am[6], 30U) ^ rotate(am[6], 19U) ^ rotate(am[6], 10U)) + ((am[7] & am[6]) | (am[0] & (am[7] | am[6])));

  am[0] += 0xc76c51a3U + am[4] + an[11] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U));
  am[4] = 0xc76c51a3U + am[4] + an[11] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U)) + (rotate(am[5], 30U) ^ rotate(am[5], 19U) ^ rotate(am[5], 10U)) + ((am[6] & am[5]) | (am[7] & (am[6] | am[5])));

  am[7] += 0xd192e819U + am[3] + an[12] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U));
  am[3] = 0xd192e819U + am[3] + an[12] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U)) + (rotate(am[4], 30U) ^ rotate(am[4], 19U) ^ rotate(am[4], 10U)) + ((am[5] & am[4]) | (am[6] & (am[5] | am[4])));

  am[6] += 0xd6990624U + am[2] + an[13] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U));
  am[2] = 0xd6990624U + am[2] + an[13] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U)) + (rotate(am[3], 30U) ^ rotate(am[3], 19U) ^ rotate(am[3], 10U)) + ((am[4] & am[3]) | (am[5] & (am[4] | am[3])));

  am[5] += 0xf40e3585U + am[1] + an[14] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U));
  am[1] = 0xf40e3585U + am[1] + an[14] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U)) + (rotate(am[2], 30U) ^ rotate(am[2], 19U) ^ rotate(am[2], 10U)) + ((am[3] & am[2]) | (am[4] & (am[3] | am[2])));

  am[4] += 0x106aa070U + am[0] + an[15] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U));
  am[0] = 0x106aa070U + am[0] + an[15] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U)) + (rotate(am[1], 30U) ^ rotate(am[1], 19U) ^ rotate(am[1], 10U)) + ((am[2] & am[1]) | (am[3] & (am[2] | am[1])));

  an[0] = an[0] + an[9] + (rotate(an[14], 15U) ^ rotate(an[14], 13U) ^ (an[14] >> 10U)) + (rotate(an[1], 25U) ^ rotate(an[1], 14U) ^ (an[1] >> 3U));
  an[1] = an[1] + an[10] + (rotate(an[15], 15U) ^ rotate(an[15], 13U) ^ (an[15] >> 10U)) + (rotate(an[2], 25U) ^ rotate(an[2], 14U) ^ (an[2] >> 3U));
  an[2] = an[2] + an[11] + (rotate(an[0], 15U) ^ rotate(an[0], 13U) ^ (an[0] >> 10U)) + (rotate(an[3], 25U) ^ rotate(an[3], 14U) ^ (an[3] >> 3U));
  an[3] = an[3] + an[12] + (rotate(an[1], 15U) ^ rotate(an[1], 13U) ^ (an[1] >> 10U)) + (rotate(an[4], 25U) ^ rotate(an[4], 14U) ^ (an[4] >> 3U));
  an[4] = an[4] + an[13] + (rotate(an[2], 15U) ^ rotate(an[2], 13U) ^ (an[2] >> 10U)) + (rotate(an[5], 25U) ^ rotate(an[5], 14U) ^ (an[5] >> 3U));
  an[5] = an[5] + an[14] + (rotate(an[3], 15U) ^ rotate(an[3], 13U) ^ (an[3] >> 10U)) + (rotate(an[6], 25U) ^ rotate(an[6], 14U) ^ (an[6] >> 3U));
  an[6] = an[6] + an[15] + (rotate(an[4], 15U) ^ rotate(an[4], 13U) ^ (an[4] >> 10U)) + (rotate(an[7], 25U) ^ rotate(an[7], 14U) ^ (an[7] >> 3U));
  an[7] = an[7] + an[0] + (rotate(an[5], 15U) ^ rotate(an[5], 13U) ^ (an[5] >> 10U)) + (rotate(an[8], 25U) ^ rotate(an[8], 14U) ^ (an[8] >> 3U));
  an[8] = an[8] + an[1] + (rotate(an[6], 15U) ^ rotate(an[6], 13U) ^ (an[6] >> 10U)) + (rotate(an[9], 25U) ^ rotate(an[9], 14U) ^ (an[9] >> 3U));
  an[9] = an[9] + an[2] + (rotate(an[7], 15U) ^ rotate(an[7], 13U) ^ (an[7] >> 10U)) + (rotate(an[10], 25U) ^ rotate(an[10], 14U) ^ (an[10] >> 3U));
  an[10] = an[10] + an[3] + (rotate(an[8], 15U) ^ rotate(an[8], 13U) ^ (an[8] >> 10U)) + (rotate(an[11], 25U) ^ rotate(an[11], 14U) ^ (an[11] >> 3U));
  an[11] = an[11] + an[4] + (rotate(an[9], 15U) ^ rotate(an[9], 13U) ^ (an[9] >> 10U)) + (rotate(an[12], 25U) ^ rotate(an[12], 14U) ^ (an[12] >> 3U));
  an[12] = an[12] + an[5] + (rotate(an[10], 15U) ^ rotate(an[10], 13U) ^ (an[10] >> 10U)) + (rotate(an[13], 25U) ^ rotate(an[13], 14U) ^ (an[13] >> 3U));

  am[3] += 0x19a4c116U + am[7] + an[0] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U));
  am[7] = 0x19a4c116U + am[7] + an[0] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U)) + (rotate(am[0], 30U) ^ rotate(am[0], 19U) ^ rotate(am[0], 10U)) + ((am[1] & am[0]) | (am[2] & (am[1] | am[0])));

  am[2] += 0x1e376c08U + am[6] + an[1] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U));
  am[6] = 0x1e376c08U + am[6] + an[1] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U)) + (rotate(am[7], 30U) ^ rotate(am[7], 19U) ^ rotate(am[7], 10U)) + ((am[0] & am[7]) | (am[1] & (am[0] | am[7])));

  am[1] += 0x2748774cU + am[5] + an[2] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U));
  am[5] = 0x2748774cU + am[5] + an[2] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U)) + (rotate(am[6], 30U) ^ rotate(am[6], 19U) ^ rotate(am[6], 10U)) + ((am[7] & am[6]) | (am[0] & (am[7] | am[6])));

  am[0] += 0x34b0bcb5U + am[4] + an[3] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U));
  am[4] = 0x34b0bcb5U + am[4] + an[3] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U)) + (rotate(am[5], 30U) ^ rotate(am[5], 19U) ^ rotate(am[5], 10U)) + ((am[6] & am[5]) | (am[7] & (am[6] | am[5])));

  am[7] += 0x391c0cb3U + am[3] + an[4] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U));
  am[3] = 0x391c0cb3U + am[3] + an[4] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U)) + (rotate(am[4], 30U) ^ rotate(am[4], 19U) ^ rotate(am[4], 10U)) + ((am[5] & am[4]) | (am[6] & (am[5] | am[4])));

  am[6] += 0x4ed8aa4aU + am[2] + an[5] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U));
  am[2] = 0x4ed8aa4aU + am[2] + an[5] + (am[1] ^ (am[7] & (am[0] ^ am[1]))) + (rotate(am[7], 26U) ^ rotate(am[7], 21U) ^ rotate(am[7], 7U)) + (rotate(am[3], 30U) ^ rotate(am[3], 19U) ^ rotate(am[3], 10U)) + ((am[4] & am[3]) | (am[5] & (am[4] | am[3])));

  am[5] += 0x5b9cca4fU + am[1] + an[6] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U));
  am[1] = 0x5b9cca4fU + am[1] + an[6] + (am[0] ^ (am[6] & (am[7] ^ am[0]))) + (rotate(am[6], 26U) ^ rotate(am[6], 21U) ^ rotate(am[6], 7U)) + (rotate(am[2], 30U) ^ rotate(am[2], 19U) ^ rotate(am[2], 10U)) + ((am[3] & am[2]) | (am[4] & (am[3] | am[2])));

  am[4] += 0x682e6ff3U + am[0] + an[7] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U));
  am[0] = 0x682e6ff3U + am[0] + an[7] + (am[7] ^ (am[5] & (am[6] ^ am[7]))) + (rotate(am[5], 26U) ^ rotate(am[5], 21U) ^ rotate(am[5], 7U)) + (rotate(am[1], 30U) ^ rotate(am[1], 19U) ^ rotate(am[1], 10U)) + ((am[2] & am[1]) | (am[3] & (am[2] | am[1])));

  am[3] += 0x748f82eeU + am[7] + an[8] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U));
  am[7] = 0x748f82eeU + am[7] + an[8] + (am[6] ^ (am[4] & (am[5] ^ am[6]))) + (rotate(am[4], 26U) ^ rotate(am[4], 21U) ^ rotate(am[4], 7U)) + (rotate(am[0], 30U) ^ rotate(am[0], 19U) ^ rotate(am[0], 10U)) + ((am[1] & am[0]) | (am[2] & (am[1] | am[0])));

  am[2] += 0x78a5636fU + am[6] + an[9] + (am[5] ^ (am[3] & (am[4] ^ am[5]))) + (rotate(am[3], 26U) ^ rotate(am[3], 21U) ^ rotate(am[3], 7U));

  am[1] += 0x84c87814U + am[5] + an[10] + (am[4] ^ (am[2] & (am[3] ^ am[4]))) + (rotate(am[2], 26U) ^ rotate(am[2], 21U) ^ rotate(am[2], 7U));

  am[0] += 0x8cc70208U + am[4] + an[11] + (am[3] ^ (am[1] & (am[2] ^ am[3]))) + (rotate(am[1], 26U) ^ rotate(am[1], 21U) ^ rotate(am[1], 7U));

  am[7] += am[3] + an[12] + (am[2] ^ (am[0] & (am[1] ^ am[2]))) + (rotate(am[0], 26U) ^ rotate(am[0], 21U) ^ rotate(am[0], 7U));
  if (am[7] == 0x136032edU)
    al[al[(0xFF)]++] = ao;
}