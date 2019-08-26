typedef uint z; __kernel __attribute__((vec_type_hint(z))) __attribute__((reqd_work_group_size(128, 1, 1))) void A( const z a, const uint b, const uint c, const uint d, const uint e, const uint f, const uint g, const uint h, const uint i, const uint j, const uint k, const uint l, const uint m, const uint n, const uint o, const uint p, const uint q, const uint r, const uint s, const uint t, const uint u, const uint v, const uint w, const uint x, const uint y, const uint z, const uint aa, const uint ab, volatile __global uint* ac) {
  z ad[930];

  const z ae = a + (uint)(get_global_id(0));

  ad[15] = ae + b;

  ad[16] = (bitselect((z)o, (z)n, (z)ad[15]) + m) + ((rotate((z)(ad[15]), (z)26) ^ rotate((z)(ad[15]), (z)21) ^ rotate((z)(ad[15]), (z)7)));
  ad[26] = ae + d;

  ad[27] = bitselect((z)q, (z)r, (z)ad[26] ^ (z)q) + ((rotate((z)(ad[26]), (z)30) ^ rotate((z)(ad[26]), (z)19) ^ rotate((z)(ad[26]), (z)10)));
  ad[17] = ad[16] + p;

  ad[19] = (bitselect((z)n, (z)ad[15], (z)ad[17]) + s) + ((rotate((z)(ad[17]), (z)26) ^ rotate((z)(ad[17]), (z)21) ^ rotate((z)(ad[17]), (z)7)));
  ad[28] = ad[27] + ad[16];

  ad[548] = bitselect((z)ad[26], (z)q, (z)ad[28] ^ (z)ad[26]) + ((rotate((z)(ad[28]), (z)30) ^ rotate((z)(ad[28]), (z)19) ^ rotate((z)(ad[28]), (z)10)));
  ad[20] = ad[19] + r;

  ad[22] = (bitselect((z)ad[15], (z)ad[17], (z)ad[20]) + t) + ((rotate((z)(ad[20]), (z)26) ^ rotate((z)(ad[20]), (z)21) ^ rotate((z)(ad[20]), (z)7)));
  ad[29] = ad[548] + ad[19];

  ad[549] = bitselect((z)ad[28], (z)ad[26], (z)ad[29] ^ (z)ad[28]) + ((rotate((z)(ad[29]), (z)30) ^ rotate((z)(ad[29]), (z)19) ^ rotate((z)(ad[29]), (z)10)));
  ad[23] = ad[22] + q;

  ad[24] = bitselect((z)ad[17], (z)ad[20], (z)ad[23]) + ((rotate((z)(ad[23]), (z)26) ^ rotate((z)(ad[23]), (z)21) ^ rotate((z)(ad[23]), (z)7)));
  ad[180] = ae + c;
  ad[30] = ad[549] + ad[22];

  ad[31] = bitselect((z)ad[29], (z)ad[28], (z)ad[30] ^ (z)ad[29]) + ((rotate((z)(ad[30]), (z)30) ^ rotate((z)(ad[30]), (z)19) ^ rotate((z)(ad[30]), (z)10)));
  ad[181] = ad[180] + ad[24];

  ad[182] = ad[181] + ad[26];
  ad[183] = ad[181] + ad[31];
  ad[18] = ad[17] + 0xd807aa98U;

  ad[186] = (bitselect((z)ad[20], (z)ad[23], (z)ad[182]) + ad[18]) + ((rotate((z)(ad[182]), (z)26) ^ rotate((z)(ad[182]), (z)21) ^ rotate((z)(ad[182]), (z)7)));
  ad[184] = bitselect((z)ad[30], (z)ad[29], (z)ad[183] ^ (z)ad[30]) + ((rotate((z)(ad[183]), (z)30) ^ rotate((z)(ad[183]), (z)19) ^ rotate((z)(ad[183]), (z)10)));

  ad[187] = ad[186] + ad[28];
  ad[188] = ad[186] + ad[184];
  ad[21] = ad[20] + 0x12835b01U;

  ad[191] = (bitselect((z)ad[23], (z)ad[182], (z)ad[187]) + ad[21]) + ((rotate((z)(ad[187]), (z)26) ^ rotate((z)(ad[187]), (z)21) ^ rotate((z)(ad[187]), (z)7)));
  ad[189] = bitselect((z)ad[183], (z)ad[30], (z)ad[188] ^ (z)ad[183]) + ((rotate((z)(ad[188]), (z)30) ^ rotate((z)(ad[188]), (z)19) ^ rotate((z)(ad[188]), (z)10)));

  ad[192] = ad[191] + ad[29];
  ad[193] = ad[191] + ad[189];
  ad[25] = ad[23] + 0x243185beU;

  ad[196] = (bitselect((z)ad[182], (z)ad[187], (z)ad[192]) + ad[25]) + ((rotate((z)(ad[192]), (z)26) ^ rotate((z)(ad[192]), (z)21) ^ rotate((z)(ad[192]), (z)7)));
  ad[194] = bitselect((z)ad[188], (z)ad[183], (z)ad[193] ^ (z)ad[188]) + ((rotate((z)(ad[193]), (z)30) ^ rotate((z)(ad[193]), (z)19) ^ rotate((z)(ad[193]), (z)10)));

  ad[197] = ad[196] + ad[30];
  ad[198] = ad[196] + ad[194];
  ad[185] = ad[182] + 0x550c7dc3U;

  ad[201] = (bitselect((z)ad[187], (z)ad[192], (z)ad[197]) + ad[185]) + ((rotate((z)(ad[197]), (z)26) ^ rotate((z)(ad[197]), (z)21) ^ rotate((z)(ad[197]), (z)7)));
  ad[199] = bitselect((z)ad[193], (z)ad[188], (z)ad[198] ^ (z)ad[193]) + ((rotate((z)(ad[198]), (z)30) ^ rotate((z)(ad[198]), (z)19) ^ rotate((z)(ad[198]), (z)10)));

  ad[202] = ad[201] + ad[183];
  ad[203] = ad[201] + ad[199];
  ad[190] = ad[187] + 0x72be5d74U;

  ad[206] = (bitselect((z)ad[192], (z)ad[197], (z)ad[202]) + ad[190]) + ((rotate((z)(ad[202]), (z)26) ^ rotate((z)(ad[202]), (z)21) ^ rotate((z)(ad[202]), (z)7)));
  ad[204] = bitselect((z)ad[198], (z)ad[193], (z)ad[203] ^ (z)ad[198]) + ((rotate((z)(ad[203]), (z)30) ^ rotate((z)(ad[203]), (z)19) ^ rotate((z)(ad[203]), (z)10)));

  ad[207] = ad[206] + ad[188];
  ad[208] = ad[206] + ad[204];
  ad[195] = ad[192] + 0x80deb1feU;

  ad[211] = (bitselect((z)ad[197], (z)ad[202], (z)ad[207]) + ad[195]) + ((rotate((z)(ad[207]), (z)26) ^ rotate((z)(ad[207]), (z)21) ^ rotate((z)(ad[207]), (z)7)));
  ad[209] = bitselect((z)ad[203], (z)ad[198], (z)ad[208] ^ (z)ad[203]) + ((rotate((z)(ad[208]), (z)30) ^ rotate((z)(ad[208]), (z)19) ^ rotate((z)(ad[208]), (z)10)));

  ad[212] = ad[193] + ad[211];
  ad[213] = ad[211] + ad[209];
  ad[200] = ad[197] + 0x9bdc06a7U;

  ad[216] = (bitselect((z)ad[202], (z)ad[207], (z)ad[212]) + ad[200]) + ((rotate((z)(ad[212]), (z)26) ^ rotate((z)(ad[212]), (z)21) ^ rotate((z)(ad[212]), (z)7)));
  ad[214] = bitselect((z)ad[208], (z)ad[203], (z)ad[213] ^ (z)ad[208]) + ((rotate((z)(ad[213]), (z)30) ^ rotate((z)(ad[213]), (z)19) ^ rotate((z)(ad[213]), (z)10)));

  ad[217] = ad[198] + ad[216];
  ad[218] = ad[216] + ad[214];
  ad[205] = ad[202] + 0xc19bf3f4U;

  ad[220] = (bitselect((z)ad[207], (z)ad[212], (z)ad[217]) + ad[205]) + ((rotate((z)(ad[217]), (z)26) ^ rotate((z)(ad[217]), (z)21) ^ rotate((z)(ad[217]), (z)7)));
  ad[219] = bitselect((z)ad[213], (z)ad[208], (z)ad[218] ^ (z)ad[213]) + ((rotate((z)(ad[218]), (z)30) ^ rotate((z)(ad[218]), (z)19) ^ rotate((z)(ad[218]), (z)10)));

  ad[222] = ad[203] + ad[220];
  ad[223] = ad[220] + ad[219];
  ad[210] = ad[207] + i;

  ad[226] = (bitselect((z)ad[212], (z)ad[217], (z)ad[222]) + ad[210]) + ((rotate((z)(ad[222]), (z)26) ^ rotate((z)(ad[222]), (z)21) ^ rotate((z)(ad[222]), (z)7)));
  ad[225] = bitselect((z)ad[218], (z)ad[213], (z)ad[223] ^ (z)ad[218]) + ((rotate((z)(ad[223]), (z)30) ^ rotate((z)(ad[223]), (z)19) ^ rotate((z)(ad[223]), (z)10)));

  ad[0] = ((rotate((z)(ae), (z)25) ^ rotate((z)(ae), (z)14) ^ ((ae) >> 3U))) + e;
  ad[228] = ad[226] + ad[225];
  ad[227] = ad[208] + ad[226];
  ad[215] = ad[212] + j;

  ad[231] = (bitselect((z)ad[217], (z)ad[222], (z)ad[227]) + ad[215]) + ((rotate((z)(ad[227]), (z)26) ^ rotate((z)(ad[227]), (z)21) ^ rotate((z)(ad[227]), (z)7)));
  ad[229] = bitselect((z)ad[223], (z)ad[218], (z)ad[228] ^ (z)ad[223]) + ((rotate((z)(ad[228]), (z)30) ^ rotate((z)(ad[228]), (z)19) ^ rotate((z)(ad[228]), (z)10)));
  ad[1] = ad[0] + 0x0fc19dc6U;

  ad[232] = ad[213] + ad[231];
  ad[233] = ad[231] + ad[229];
  ad[221] = ad[217] + ad[1];
  ad[32] = ae + f;

  ad[236] = (bitselect((z)ad[222], (z)ad[227], (z)ad[232]) + ad[221]) + ((rotate((z)(ad[232]), (z)26) ^ rotate((z)(ad[232]), (z)21) ^ rotate((z)(ad[232]), (z)7)));
  ad[234] = bitselect((z)ad[228], (z)ad[223], (z)ad[233] ^ (z)ad[228]) + ((rotate((z)(ad[233]), (z)30) ^ rotate((z)(ad[233]), (z)19) ^ rotate((z)(ad[233]), (z)10)));
  ad[33] = ad[32] + 0x240ca1ccU;

  ad[3] = ((rotate((z)(ad[0]), (z)15) ^ rotate((z)(ad[0]), (z)13) ^ ((ad[0]) >> 10U))) + 0x80000000U;
  ad[238] = ad[236] + ad[234];
  ad[237] = ad[218] + ad[236];
  ad[224] = ad[222] + ad[33];

  ad[241] = (bitselect((z)ad[227], (z)ad[232], (z)ad[237]) + ad[224]) + ((rotate((z)(ad[237]), (z)26) ^ rotate((z)(ad[237]), (z)21) ^ rotate((z)(ad[237]), (z)7)));
  ad[239] = bitselect((z)ad[233], (z)ad[228], (z)ad[238] ^ (z)ad[233]) + ((rotate((z)(ad[238]), (z)30) ^ rotate((z)(ad[238]), (z)19) ^ rotate((z)(ad[238]), (z)10)));
  ad[4] = ad[3] + 0x2de92c6fU;

  ad[35] = ((rotate((z)(ad[32]), (z)15) ^ rotate((z)(ad[32]), (z)13) ^ ((ad[32]) >> 10U)));
  ad[243] = ad[241] + ad[239];
  ad[242] = ad[223] + ad[241];
  ad[230] = ad[227] + ad[4];

  ad[246] = (bitselect((z)ad[232], (z)ad[237], (z)ad[242]) + ad[230]) + ((rotate((z)(ad[242]), (z)26) ^ rotate((z)(ad[242]), (z)21) ^ rotate((z)(ad[242]), (z)7)));
  ad[244] = bitselect((z)ad[238], (z)ad[233], (z)ad[243] ^ (z)ad[238]) + ((rotate((z)(ad[243]), (z)30) ^ rotate((z)(ad[243]), (z)19) ^ rotate((z)(ad[243]), (z)10)));
  ad[36] = ad[35] + 0x4a7484aaU;

  ad[7] = ((rotate((z)(ad[3]), (z)15) ^ rotate((z)(ad[3]), (z)13) ^ ((ad[3]) >> 10U))) + 0x00000280U;
  ad[248] = ad[246] + ad[244];
  ad[247] = ad[228] + ad[246];
  ad[235] = ad[232] + ad[36];

  ad[251] = (bitselect((z)ad[237], (z)ad[242], (z)ad[247]) + ad[235]) + ((rotate((z)(ad[247]), (z)26) ^ rotate((z)(ad[247]), (z)21) ^ rotate((z)(ad[247]), (z)7)));
  ad[249] = bitselect((z)ad[243], (z)ad[238], (z)ad[248] ^ (z)ad[243]) + ((rotate((z)(ad[248]), (z)30) ^ rotate((z)(ad[248]), (z)19) ^ rotate((z)(ad[248]), (z)10)));
  ad[8] = ad[7] + 0x5cb0a9dcU;

  ad[38] = ((rotate((z)(ad[35]), (z)15) ^ rotate((z)(ad[35]), (z)13) ^ ((ad[35]) >> 10U))) + g;
  ad[253] = ad[251] + ad[249];
  ad[252] = ad[233] + ad[251];
  ad[240] = ad[237] + ad[8];

  ad[256] = (bitselect((z)ad[242], (z)ad[247], (z)ad[252]) + ad[240]) + ((rotate((z)(ad[252]), (z)26) ^ rotate((z)(ad[252]), (z)21) ^ rotate((z)(ad[252]), (z)7)));
  ad[254] = bitselect((z)ad[248], (z)ad[243], (z)ad[253] ^ (z)ad[248]) + ((rotate((z)(ad[253]), (z)30) ^ rotate((z)(ad[253]), (z)19) ^ rotate((z)(ad[253]), (z)10)));
  ad[40] = ad[38] + 0x76f988daU;

  ad[10] = ((rotate((z)(ad[7]), (z)15) ^ rotate((z)(ad[7]), (z)13) ^ ((ad[7]) >> 10U))) + h;
  ad[258] = ad[256] + ad[254];
  ad[257] = ad[238] + ad[256];
  ad[245] = ad[242] + ad[40];

  ad[261] = (bitselect((z)ad[247], (z)ad[252], (z)ad[257]) + ad[245]) + ((rotate((z)(ad[257]), (z)26) ^ rotate((z)(ad[257]), (z)21) ^ rotate((z)(ad[257]), (z)7)));
  ad[259] = bitselect((z)ad[253], (z)ad[248], (z)ad[258] ^ (z)ad[253]) + ((rotate((z)(ad[258]), (z)30) ^ rotate((z)(ad[258]), (z)19) ^ rotate((z)(ad[258]), (z)10)));
  ad[13] = ad[10] + 0x983e5152U;

  ad[43] = ((rotate((z)(ad[38]), (z)15) ^ rotate((z)(ad[38]), (z)13) ^ ((ad[38]) >> 10U))) + ad[0];
  ad[263] = ad[261] + ad[259];
  ad[262] = ad[243] + ad[261];
  ad[250] = ad[247] + ad[13];

  ad[266] = (bitselect((z)ad[252], (z)ad[257], (z)ad[262]) + ad[250]) + ((rotate((z)(ad[262]), (z)26) ^ rotate((z)(ad[262]), (z)21) ^ rotate((z)(ad[262]), (z)7)));
  ad[264] = bitselect((z)ad[258], (z)ad[253], (z)ad[263] ^ (z)ad[258]) + ((rotate((z)(ad[263]), (z)30) ^ rotate((z)(ad[263]), (z)19) ^ rotate((z)(ad[263]), (z)10)));
  ad[11] = ((rotate((z)(ad[10]), (z)15) ^ rotate((z)(ad[10]), (z)13) ^ ((ad[10]) >> 10U)));
  ad[45] = ad[43] + 0xa831c66dU;

  ad[52] = ad[11] + ad[32];
  ad[267] = ad[248] + ad[266];
  ad[255] = ad[252] + ad[45];
  ad[268] = ad[266] + ad[264];

  ad[271] = (bitselect((z)ad[257], (z)ad[262], (z)ad[267]) + ad[255]) + ((rotate((z)(ad[267]), (z)26) ^ rotate((z)(ad[267]), (z)21) ^ rotate((z)(ad[267]), (z)7)));
  ad[269] = bitselect((z)ad[263], (z)ad[258], (z)ad[268] ^ (z)ad[263]) + ((rotate((z)(ad[268]), (z)30) ^ rotate((z)(ad[268]), (z)19) ^ rotate((z)(ad[268]), (z)10)));
  ad[54] = ad[52] + 0xb00327c8U;

  ad[48] = ((rotate((z)(ad[43]), (z)15) ^ rotate((z)(ad[43]), (z)13) ^ ((ad[43]) >> 10U))) + ad[3];
  ad[273] = ad[271] + ad[269];
  ad[272] = ad[253] + ad[271];
  ad[260] = ad[257] + ad[54];

  ad[276] = (bitselect((z)ad[262], (z)ad[267], (z)ad[272]) + ad[260]) + ((rotate((z)(ad[272]), (z)26) ^ rotate((z)(ad[272]), (z)21) ^ rotate((z)(ad[272]), (z)7)));
  ad[274] = bitselect((z)ad[268], (z)ad[263], (z)ad[273] ^ (z)ad[268]) + ((rotate((z)(ad[273]), (z)30) ^ rotate((z)(ad[273]), (z)19) ^ rotate((z)(ad[273]), (z)10)));
  ad[49] = ad[48] + 0xbf597fc7U;

  ad[61] = ((rotate((z)(ad[52]), (z)15) ^ rotate((z)(ad[52]), (z)13) ^ ((ad[52]) >> 10U))) + ad[35];
  ad[278] = ad[276] + ad[274];
  ad[277] = ad[258] + ad[276];
  ad[265] = ad[262] + ad[49];

  ad[281] = (bitselect((z)ad[267], (z)ad[272], (z)ad[277]) + ad[265]) + ((rotate((z)(ad[277]), (z)26) ^ rotate((z)(ad[277]), (z)21) ^ rotate((z)(ad[277]), (z)7)));
  ad[279] = bitselect((z)ad[273], (z)ad[268], (z)ad[278] ^ (z)ad[273]) + ((rotate((z)(ad[278]), (z)30) ^ rotate((z)(ad[278]), (z)19) ^ rotate((z)(ad[278]), (z)10)));
  ad[62] = ad[61] + 0xc6e00bf3U;

  ad[53] = ((rotate((z)(ad[48]), (z)15) ^ rotate((z)(ad[48]), (z)13) ^ ((ad[48]) >> 10U))) + ad[7];
  ad[283] = ad[281] + ad[279];
  ad[282] = ad[263] + ad[281];
  ad[270] = ad[267] + ad[62];

  ad[286] = (bitselect((z)ad[272], (z)ad[277], (z)ad[282]) + ad[270]) + ((rotate((z)(ad[282]), (z)26) ^ rotate((z)(ad[282]), (z)21) ^ rotate((z)(ad[282]), (z)7)));
  ad[284] = bitselect((z)ad[278], (z)ad[273], (z)ad[283] ^ (z)ad[278]) + ((rotate((z)(ad[283]), (z)30) ^ rotate((z)(ad[283]), (z)19) ^ rotate((z)(ad[283]), (z)10)));
  ad[39] = ad[38] + 0x00A00055U;
  ad[55] = ad[53] + 0xd5a79147U;

  ad[66] = ((rotate((z)(ad[61]), (z)15) ^ rotate((z)(ad[61]), (z)13) ^ ((ad[61]) >> 10U))) + ad[39];
  ad[288] = ad[286] + ad[284];
  ad[287] = ad[268] + ad[286];
  ad[275] = ad[272] + ad[55];

  ad[291] = (bitselect((z)ad[277], (z)ad[282], (z)ad[287]) + ad[275]) + ((rotate((z)(ad[287]), (z)26) ^ rotate((z)(ad[287]), (z)21) ^ rotate((z)(ad[287]), (z)7)));
  ad[289] = bitselect((z)ad[283], (z)ad[278], (z)ad[288] ^ (z)ad[283]) + ((rotate((z)(ad[288]), (z)30) ^ rotate((z)(ad[288]), (z)19) ^ rotate((z)(ad[288]), (z)10)));
  ad[12] = ad[10] + k;
  ad[68] = ad[66] + 0x06ca6351U;

  ad[67] = ((rotate((z)(ad[53]), (z)15) ^ rotate((z)(ad[53]), (z)13) ^ ((ad[53]) >> 10U))) + ad[12];
  ad[293] = ad[291] + ad[289];
  ad[292] = ad[273] + ad[291];
  ad[280] = ad[277] + ad[68];

  ad[296] = (bitselect((z)ad[282], (z)ad[287], (z)ad[292]) + ad[280]) + ((rotate((z)(ad[292]), (z)26) ^ rotate((z)(ad[292]), (z)21) ^ rotate((z)(ad[292]), (z)7)));
  ad[294] = bitselect((z)ad[288], (z)ad[283], (z)ad[293] ^ (z)ad[288]) + ((rotate((z)(ad[293]), (z)30) ^ rotate((z)(ad[293]), (z)19) ^ rotate((z)(ad[293]), (z)10)));
  ad[2] = ((rotate((z)(ad[0]), (z)25) ^ rotate((z)(ad[0]), (z)14) ^ ((ad[0]) >> 3U)));
  ad[69] = ad[67] + 0x14292967U;
  ad[44] = ad[43] + l;

  ad[75] = ((rotate((z)(ad[66]), (z)15) ^ rotate((z)(ad[66]), (z)13) ^ ((ad[66]) >> 10U))) + ad[44];
  ad[298] = ad[296] + ad[294];
  ad[297] = ad[278] + ad[296];
  ad[285] = ad[282] + ad[69];
  ad[5] = ad[2] + h;

  ad[301] = (bitselect((z)ad[287], (z)ad[292], (z)ad[297]) + ad[285]) + ((rotate((z)(ad[297]), (z)26) ^ rotate((z)(ad[297]), (z)21) ^ rotate((z)(ad[297]), (z)7)));
  ad[299] = bitselect((z)ad[293], (z)ad[288], (z)ad[298] ^ (z)ad[293]) + ((rotate((z)(ad[298]), (z)30) ^ rotate((z)(ad[298]), (z)19) ^ rotate((z)(ad[298]), (z)10)));
  ad[56] = ad[52] + ad[5];
  ad[76] = ad[75] + 0x27b70a85U;

  ad[34] = ((rotate((z)(ad[32]), (z)25) ^ rotate((z)(ad[32]), (z)14) ^ ((ad[32]) >> 3U))) + ad[0];
  ad[70] = ((rotate((z)(ad[67]), (z)15) ^ rotate((z)(ad[67]), (z)13) ^ ((ad[67]) >> 10U))) + ad[56];
  ad[302] = ad[283] + ad[301];
  ad[303] = ad[301] + ad[299];
  ad[290] = ad[287] + ad[76];

  ad[306] = (bitselect((z)ad[292], (z)ad[297], (z)ad[302]) + ad[290]) + ((rotate((z)(ad[302]), (z)26) ^ rotate((z)(ad[302]), (z)21) ^ rotate((z)(ad[302]), (z)7)));
  ad[304] = bitselect((z)ad[298], (z)ad[293], (z)ad[303] ^ (z)ad[298]) + ((rotate((z)(ad[303]), (z)30) ^ rotate((z)(ad[303]), (z)19) ^ rotate((z)(ad[303]), (z)10)));
  ad[6] = ((rotate((z)(ad[3]), (z)25) ^ rotate((z)(ad[3]), (z)14) ^ ((ad[3]) >> 3U)));
  ad[77] = ad[70] + 0x2e1b2138U;
  ad[50] = ad[34] + ad[48];

  ad[78] = ((rotate((z)(ad[75]), (z)15) ^ rotate((z)(ad[75]), (z)13) ^ ((ad[75]) >> 10U))) + ad[50];
  ad[308] = ad[306] + ad[304];
  ad[307] = ad[288] + ad[306];
  ad[295] = ad[292] + ad[77];
  ad[41] = ad[32] + ad[6];

  ad[311] = (bitselect((z)ad[297], (z)ad[302], (z)ad[307]) + ad[295]) + ((rotate((z)(ad[307]), (z)26) ^ rotate((z)(ad[307]), (z)21) ^ rotate((z)(ad[307]), (z)7)));
  ad[309] = bitselect((z)ad[303], (z)ad[298], (z)ad[308] ^ (z)ad[303]) + ((rotate((z)(ad[308]), (z)30) ^ rotate((z)(ad[308]), (z)19) ^ rotate((z)(ad[308]), (z)10)));
  ad[63] = ad[41] + ad[61];
  ad[85] = ad[78] + 0x4d2c6dfcU;

  ad[37] = ((rotate((z)(ad[35]), (z)25) ^ rotate((z)(ad[35]), (z)14) ^ ((ad[35]) >> 3U))) + ad[3];
  ad[79] = ((rotate((z)(ad[70]), (z)15) ^ rotate((z)(ad[70]), (z)13) ^ ((ad[70]) >> 10U))) + ad[63];
  ad[312] = ad[293] + ad[311];
  ad[313] = ad[311] + ad[309];
  ad[300] = ad[297] + ad[85];

  ad[316] = (bitselect((z)ad[302], (z)ad[307], (z)ad[312]) + ad[300]) + ((rotate((z)(ad[312]), (z)26) ^ rotate((z)(ad[312]), (z)21) ^ rotate((z)(ad[312]), (z)7)));
  ad[314] = bitselect((z)ad[308], (z)ad[303], (z)ad[313] ^ (z)ad[308]) + ((rotate((z)(ad[313]), (z)30) ^ rotate((z)(ad[313]), (z)19) ^ rotate((z)(ad[313]), (z)10)));
  ad[9] = ((rotate((z)(ad[7]), (z)25) ^ rotate((z)(ad[7]), (z)14) ^ ((ad[7]) >> 3U)));
  ad[86] = ad[79] + 0x53380d13U;
  ad[57] = ad[37] + ad[53];

  ad[87] = ((rotate((z)(ad[78]), (z)15) ^ rotate((z)(ad[78]), (z)13) ^ ((ad[78]) >> 10U))) + ad[57];
  ad[318] = ad[316] + ad[314];
  ad[317] = ad[298] + ad[316];
  ad[305] = ad[302] + ad[86];
  ad[46] = ad[35] + ad[9];

  ad[321] = (bitselect((z)ad[307], (z)ad[312], (z)ad[317]) + ad[305]) + ((rotate((z)(ad[317]), (z)26) ^ rotate((z)(ad[317]), (z)21) ^ rotate((z)(ad[317]), (z)7)));
  ad[319] = bitselect((z)ad[313], (z)ad[308], (z)ad[318] ^ (z)ad[313]) + ((rotate((z)(ad[318]), (z)30) ^ rotate((z)(ad[318]), (z)19) ^ rotate((z)(ad[318]), (z)10)));
  ad[71] = ad[46] + ad[66];
  ad[92] = ad[87] + 0x650a7354U;

  ad[42] = ((rotate((z)(ad[38]), (z)25) ^ rotate((z)(ad[38]), (z)14) ^ ((ad[38]) >> 3U))) + ad[7];
  ad[88] = ((rotate((z)(ad[79]), (z)15) ^ rotate((z)(ad[79]), (z)13) ^ ((ad[79]) >> 10U))) + ad[71];
  ad[322] = ad[303] + ad[321];
  ad[323] = ad[321] + ad[319];
  ad[310] = ad[307] + ad[92];

  ad[326] = (bitselect((z)ad[312], (z)ad[317], (z)ad[322]) + ad[310]) + ((rotate((z)(ad[322]), (z)26) ^ rotate((z)(ad[322]), (z)21) ^ rotate((z)(ad[322]), (z)7)));
  ad[324] = bitselect((z)ad[318], (z)ad[313], (z)ad[323] ^ (z)ad[318]) + ((rotate((z)(ad[323]), (z)30) ^ rotate((z)(ad[323]), (z)19) ^ rotate((z)(ad[323]), (z)10)));
  ad[14] = ((rotate((z)(ad[10]), (z)25) ^ rotate((z)(ad[10]), (z)14) ^ ((ad[10]) >> 3U)));
  ad[93] = ad[88] + 0x766a0abbU;
  ad[72] = ad[42] + ad[67];

  ad[94] = ((rotate((z)(ad[87]), (z)15) ^ rotate((z)(ad[87]), (z)13) ^ ((ad[87]) >> 10U))) + ad[72];
  ad[328] = ad[326] + ad[324];
  ad[327] = ad[308] + ad[326];
  ad[315] = ad[312] + ad[93];
  ad[51] = ad[38] + ad[14];

  ad[331] = (bitselect((z)ad[317], (z)ad[322], (z)ad[327]) + ad[315]) + ((rotate((z)(ad[327]), (z)26) ^ rotate((z)(ad[327]), (z)21) ^ rotate((z)(ad[327]), (z)7)));
  ad[329] = bitselect((z)ad[323], (z)ad[318], (z)ad[328] ^ (z)ad[323]) + ((rotate((z)(ad[328]), (z)30) ^ rotate((z)(ad[328]), (z)19) ^ rotate((z)(ad[328]), (z)10)));
  ad[80] = ad[51] + ad[75];
  ad[100] = ad[94] + 0x81c2c92eU;

  ad[47] = ((rotate((z)(ad[43]), (z)25) ^ rotate((z)(ad[43]), (z)14) ^ ((ad[43]) >> 3U))) + ad[10];
  ad[95] = ((rotate((z)(ad[88]), (z)15) ^ rotate((z)(ad[88]), (z)13) ^ ((ad[88]) >> 10U))) + ad[80];
  ad[332] = ad[313] + ad[331];
  ad[333] = ad[331] + ad[329];
  ad[320] = ad[317] + ad[100];

  ad[336] = (bitselect((z)ad[322], (z)ad[327], (z)ad[332]) + ad[320]) + ((rotate((z)(ad[332]), (z)26) ^ rotate((z)(ad[332]), (z)21) ^ rotate((z)(ad[332]), (z)7)));
  ad[334] = bitselect((z)ad[328], (z)ad[323], (z)ad[333] ^ (z)ad[328]) + ((rotate((z)(ad[333]), (z)30) ^ rotate((z)(ad[333]), (z)19) ^ rotate((z)(ad[333]), (z)10)));
  ad[81] = ad[47] + ad[70];
  ad[101] = ad[95] + 0x92722c85U;

  ad[58] = ((rotate((z)(ad[52]), (z)25) ^ rotate((z)(ad[52]), (z)14) ^ ((ad[52]) >> 3U))) + ad[43];
  ad[102] = ((rotate((z)(ad[94]), (z)15) ^ rotate((z)(ad[94]), (z)13) ^ ((ad[94]) >> 10U))) + ad[81];
  ad[337] = ad[318] + ad[336];
  ad[338] = ad[336] + ad[334];
  ad[325] = ad[322] + ad[101];

  ad[341] = (bitselect((z)ad[327], (z)ad[332], (z)ad[337]) + ad[325]) + ((rotate((z)(ad[337]), (z)26) ^ rotate((z)(ad[337]), (z)21) ^ rotate((z)(ad[337]), (z)7)));
  ad[339] = bitselect((z)ad[333], (z)ad[328], (z)ad[338] ^ (z)ad[333]) + ((rotate((z)(ad[338]), (z)30) ^ rotate((z)(ad[338]), (z)19) ^ rotate((z)(ad[338]), (z)10)));
  ad[89] = ad[58] + ad[78];
  ad[108] = ad[102] + 0xa2bfe8a1U;

  ad[59] = ((rotate((z)(ad[48]), (z)25) ^ rotate((z)(ad[48]), (z)14) ^ ((ad[48]) >> 3U))) + ad[52];
  ad[103] = ((rotate((z)(ad[95]), (z)15) ^ rotate((z)(ad[95]), (z)13) ^ ((ad[95]) >> 10U))) + ad[89];
  ad[342] = ad[323] + ad[341];
  ad[343] = ad[341] + ad[339];
  ad[330] = ad[327] + ad[108];

  ad[346] = (bitselect((z)ad[332], (z)ad[337], (z)ad[342]) + ad[330]) + ((rotate((z)(ad[342]), (z)26) ^ rotate((z)(ad[342]), (z)21) ^ rotate((z)(ad[342]), (z)7)));
  ad[344] = bitselect((z)ad[338], (z)ad[333], (z)ad[343] ^ (z)ad[338]) + ((rotate((z)(ad[343]), (z)30) ^ rotate((z)(ad[343]), (z)19) ^ rotate((z)(ad[343]), (z)10)));
  ad[90] = ad[59] + ad[79];
  ad[109] = ad[103] + 0xa81a664bU;

  ad[64] = ((rotate((z)(ad[61]), (z)25) ^ rotate((z)(ad[61]), (z)14) ^ ((ad[61]) >> 3U))) + ad[48];
  ad[110] = ((rotate((z)(ad[102]), (z)15) ^ rotate((z)(ad[102]), (z)13) ^ ((ad[102]) >> 10U))) + ad[90];
  ad[347] = ad[328] + ad[346];
  ad[348] = ad[346] + ad[344];
  ad[335] = ad[332] + ad[109];

  ad[351] = (bitselect((z)ad[337], (z)ad[342], (z)ad[347]) + ad[335]) + ((rotate((z)(ad[347]), (z)26) ^ rotate((z)(ad[347]), (z)21) ^ rotate((z)(ad[347]), (z)7)));
  ad[349] = bitselect((z)ad[343], (z)ad[338], (z)ad[348] ^ (z)ad[343]) + ((rotate((z)(ad[348]), (z)30) ^ rotate((z)(ad[348]), (z)19) ^ rotate((z)(ad[348]), (z)10)));
  ad[60] = ((rotate((z)(ad[53]), (z)25) ^ rotate((z)(ad[53]), (z)14) ^ ((ad[53]) >> 3U)));
  ad[116] = ad[110] + 0xc24b8b70U;
  ad[96] = ad[87] + ad[64];

  ad[111] = ((rotate((z)(ad[103]), (z)15) ^ rotate((z)(ad[103]), (z)13) ^ ((ad[103]) >> 10U))) + ad[96];
  ad[353] = ad[351] + ad[349];
  ad[352] = ad[333] + ad[351];
  ad[340] = ad[337] + ad[116];
  ad[65] = ad[60] + ad[61];

  ad[356] = (bitselect((z)ad[342], (z)ad[347], (z)ad[352]) + ad[340]) + ((rotate((z)(ad[352]), (z)26) ^ rotate((z)(ad[352]), (z)21) ^ rotate((z)(ad[352]), (z)7)));
  ad[354] = bitselect((z)ad[348], (z)ad[343], (z)ad[353] ^ (z)ad[348]) + ((rotate((z)(ad[353]), (z)30) ^ rotate((z)(ad[353]), (z)19) ^ rotate((z)(ad[353]), (z)10)));
  ad[97] = ad[88] + ad[65];
  ad[117] = ad[111] + 0xc76c51a3U;

  ad[73] = ((rotate((z)(ad[66]), (z)25) ^ rotate((z)(ad[66]), (z)14) ^ ((ad[66]) >> 3U))) + ad[53];
  ad[118] = ((rotate((z)(ad[110]), (z)15) ^ rotate((z)(ad[110]), (z)13) ^ ((ad[110]) >> 10U))) + ad[97];
  ad[357] = ad[338] + ad[356];
  ad[358] = ad[356] + ad[354];
  ad[345] = ad[342] + ad[117];

  ad[361] = (bitselect((z)ad[347], (z)ad[352], (z)ad[357]) + ad[345]) + ((rotate((z)(ad[357]), (z)26) ^ rotate((z)(ad[357]), (z)21) ^ rotate((z)(ad[357]), (z)7)));
  ad[359] = bitselect((z)ad[353], (z)ad[348], (z)ad[358] ^ (z)ad[353]) + ((rotate((z)(ad[358]), (z)30) ^ rotate((z)(ad[358]), (z)19) ^ rotate((z)(ad[358]), (z)10)));
  ad[104] = ad[73] + ad[94];
  ad[124] = ad[118] + 0xd192e819U;

  ad[74] = ((rotate((z)(ad[67]), (z)25) ^ rotate((z)(ad[67]), (z)14) ^ ((ad[67]) >> 3U))) + ad[66];
  ad[119] = ((rotate((z)(ad[111]), (z)15) ^ rotate((z)(ad[111]), (z)13) ^ ((ad[111]) >> 10U))) + ad[104];
  ad[362] = ad[343] + ad[361];
  ad[363] = ad[361] + ad[359];
  ad[350] = ad[347] + ad[124];

  ad[366] = (bitselect((z)ad[352], (z)ad[357], (z)ad[362]) + ad[350]) + ((rotate((z)(ad[362]), (z)26) ^ rotate((z)(ad[362]), (z)21) ^ rotate((z)(ad[362]), (z)7)));
  ad[364] = bitselect((z)ad[358], (z)ad[353], (z)ad[363] ^ (z)ad[358]) + ((rotate((z)(ad[363]), (z)30) ^ rotate((z)(ad[363]), (z)19) ^ rotate((z)(ad[363]), (z)10)));
  ad[105] = ad[74] + ad[95];
  ad[125] = ad[119] + 0xd6990624U;

  ad[82] = ((rotate((z)(ad[75]), (z)25) ^ rotate((z)(ad[75]), (z)14) ^ ((ad[75]) >> 3U))) + ad[67];
  ad[126] = ((rotate((z)(ad[118]), (z)15) ^ rotate((z)(ad[118]), (z)13) ^ ((ad[118]) >> 10U))) + ad[105];
  ad[367] = ad[348] + ad[366];
  ad[368] = ad[366] + ad[364];
  ad[355] = ad[352] + ad[125];

  ad[371] = (bitselect((z)ad[357], (z)ad[362], (z)ad[367]) + ad[355]) + ((rotate((z)(ad[367]), (z)26) ^ rotate((z)(ad[367]), (z)21) ^ rotate((z)(ad[367]), (z)7)));
  ad[369] = bitselect((z)ad[363], (z)ad[358], (z)ad[368] ^ (z)ad[363]) + ((rotate((z)(ad[368]), (z)30) ^ rotate((z)(ad[368]), (z)19) ^ rotate((z)(ad[368]), (z)10)));
  ad[112] = ad[102] + ad[82];
  ad[132] = ad[126] + 0xf40e3585U;

  ad[83] = ((rotate((z)(ad[70]), (z)25) ^ rotate((z)(ad[70]), (z)14) ^ ((ad[70]) >> 3U))) + ad[75];
  ad[127] = ((rotate((z)(ad[119]), (z)15) ^ rotate((z)(ad[119]), (z)13) ^ ((ad[119]) >> 10U))) + ad[112];
  ad[372] = ad[353] + ad[371];
  ad[373] = ad[371] + ad[369];
  ad[360] = ad[357] + ad[132];

  ad[376] = (bitselect((z)ad[362], (z)ad[367], (z)ad[372]) + ad[360]) + ((rotate((z)(ad[372]), (z)26) ^ rotate((z)(ad[372]), (z)21) ^ rotate((z)(ad[372]), (z)7)));
  ad[374] = bitselect((z)ad[368], (z)ad[363], (z)ad[373] ^ (z)ad[368]) + ((rotate((z)(ad[373]), (z)30) ^ rotate((z)(ad[373]), (z)19) ^ rotate((z)(ad[373]), (z)10)));
  ad[113] = ad[103] + ad[83];
  ad[133] = ad[127] + 0x106aa070U;

  ad[84] = ((rotate((z)(ad[78]), (z)25) ^ rotate((z)(ad[78]), (z)14) ^ ((ad[78]) >> 3U))) + ad[70];
  ad[134] = ((rotate((z)(ad[126]), (z)15) ^ rotate((z)(ad[126]), (z)13) ^ ((ad[126]) >> 10U))) + ad[113];
  ad[377] = ad[358] + ad[376];
  ad[378] = ad[376] + ad[374];
  ad[365] = ad[362] + ad[133];

  ad[381] = (bitselect((z)ad[367], (z)ad[372], (z)ad[377]) + ad[365]) + ((rotate((z)(ad[377]), (z)26) ^ rotate((z)(ad[377]), (z)21) ^ rotate((z)(ad[377]), (z)7)));
  ad[379] = bitselect((z)ad[373], (z)ad[368], (z)ad[378] ^ (z)ad[373]) + ((rotate((z)(ad[378]), (z)30) ^ rotate((z)(ad[378]), (z)19) ^ rotate((z)(ad[378]), (z)10)));
  ad[120] = ad[110] + ad[84];
  ad[140] = ad[134] + 0x19a4c116U;

  ad[91] = ((rotate((z)(ad[79]), (z)25) ^ rotate((z)(ad[79]), (z)14) ^ ((ad[79]) >> 3U))) + ad[78];
  ad[135] = ((rotate((z)(ad[127]), (z)15) ^ rotate((z)(ad[127]), (z)13) ^ ((ad[127]) >> 10U))) + ad[120];
  ad[382] = ad[363] + ad[381];
  ad[383] = ad[381] + ad[379];
  ad[370] = ad[367] + ad[140];

  ad[386] = (bitselect((z)ad[372], (z)ad[377], (z)ad[382]) + ad[370]) + ((rotate((z)(ad[382]), (z)26) ^ rotate((z)(ad[382]), (z)21) ^ rotate((z)(ad[382]), (z)7)));
  ad[384] = bitselect((z)ad[378], (z)ad[373], (z)ad[383] ^ (z)ad[378]) + ((rotate((z)(ad[383]), (z)30) ^ rotate((z)(ad[383]), (z)19) ^ rotate((z)(ad[383]), (z)10)));
  ad[121] = ad[111] + ad[91];
  ad[141] = ad[135] + 0x1e376c08U;

  ad[98] = ((rotate((z)(ad[87]), (z)25) ^ rotate((z)(ad[87]), (z)14) ^ ((ad[87]) >> 3U))) + ad[79];
  ad[142] = ((rotate((z)(ad[134]), (z)15) ^ rotate((z)(ad[134]), (z)13) ^ ((ad[134]) >> 10U))) + ad[121];
  ad[387] = ad[368] + ad[386];
  ad[388] = ad[386] + ad[384];
  ad[375] = ad[372] + ad[141];

  ad[391] = (bitselect((z)ad[377], (z)ad[382], (z)ad[387]) + ad[375]) + ((rotate((z)(ad[387]), (z)26) ^ rotate((z)(ad[387]), (z)21) ^ rotate((z)(ad[387]), (z)7)));
  ad[389] = bitselect((z)ad[383], (z)ad[378], (z)ad[388] ^ (z)ad[383]) + ((rotate((z)(ad[388]), (z)30) ^ rotate((z)(ad[388]), (z)19) ^ rotate((z)(ad[388]), (z)10)));
  ad[128] = ad[118] + ad[98];
  ad[147] = ad[142] + 0x2748774cU;

  ad[99] = ((rotate((z)(ad[88]), (z)25) ^ rotate((z)(ad[88]), (z)14) ^ ((ad[88]) >> 3U))) + ad[87];
  ad[143] = ((rotate((z)(ad[135]), (z)15) ^ rotate((z)(ad[135]), (z)13) ^ ((ad[135]) >> 10U))) + ad[128];
  ad[392] = ad[373] + ad[391];
  ad[393] = ad[391] + ad[389];
  ad[380] = ad[377] + ad[147];

  ad[396] = (bitselect((z)ad[382], (z)ad[387], (z)ad[392]) + ad[380]) + ((rotate((z)(ad[392]), (z)26) ^ rotate((z)(ad[392]), (z)21) ^ rotate((z)(ad[392]), (z)7)));
  ad[394] = bitselect((z)ad[388], (z)ad[383], (z)ad[393] ^ (z)ad[388]) + ((rotate((z)(ad[393]), (z)30) ^ rotate((z)(ad[393]), (z)19) ^ rotate((z)(ad[393]), (z)10)));
  ad[129] = ad[119] + ad[99];
  ad[148] = ad[143] + 0x34b0bcb5U;

  ad[106] = ((rotate((z)(ad[94]), (z)25) ^ rotate((z)(ad[94]), (z)14) ^ ((ad[94]) >> 3U))) + ad[88];
  ad[149] = ((rotate((z)(ad[142]), (z)15) ^ rotate((z)(ad[142]), (z)13) ^ ((ad[142]) >> 10U))) + ad[129];
  ad[397] = ad[378] + ad[396];
  ad[398] = ad[396] + ad[394];
  ad[385] = ad[382] + ad[148];

  ad[401] = (bitselect((z)ad[387], (z)ad[392], (z)ad[397]) + ad[385]) + ((rotate((z)(ad[397]), (z)26) ^ rotate((z)(ad[397]), (z)21) ^ rotate((z)(ad[397]), (z)7)));
  ad[399] = bitselect((z)ad[393], (z)ad[388], (z)ad[398] ^ (z)ad[393]) + ((rotate((z)(ad[398]), (z)30) ^ rotate((z)(ad[398]), (z)19) ^ rotate((z)(ad[398]), (z)10)));
  ad[136] = ad[126] + ad[106];
  ad[153] = ad[149] + 0x391c0cb3U;

  ad[107] = ((rotate((z)(ad[95]), (z)25) ^ rotate((z)(ad[95]), (z)14) ^ ((ad[95]) >> 3U))) + ad[94];
  ad[150] = ((rotate((z)(ad[143]), (z)15) ^ rotate((z)(ad[143]), (z)13) ^ ((ad[143]) >> 10U))) + ad[136];
  ad[402] = ad[383] + ad[401];
  ad[403] = ad[401] + ad[399];
  ad[390] = ad[387] + ad[153];

  ad[406] = (bitselect((z)ad[392], (z)ad[397], (z)ad[402]) + ad[390]) + ((rotate((z)(ad[402]), (z)26) ^ rotate((z)(ad[402]), (z)21) ^ rotate((z)(ad[402]), (z)7)));
  ad[404] = bitselect((z)ad[398], (z)ad[393], (z)ad[403] ^ (z)ad[398]) + ((rotate((z)(ad[403]), (z)30) ^ rotate((z)(ad[403]), (z)19) ^ rotate((z)(ad[403]), (z)10)));
  ad[137] = ad[127] + ad[107];
  ad[154] = ad[150] + 0x4ed8aa4aU;

  ad[114] = ((rotate((z)(ad[102]), (z)25) ^ rotate((z)(ad[102]), (z)14) ^ ((ad[102]) >> 3U))) + ad[95];
  ad[155] = ((rotate((z)(ad[149]), (z)15) ^ rotate((z)(ad[149]), (z)13) ^ ((ad[149]) >> 10U))) + ad[137];
  ad[407] = ad[388] + ad[406];
  ad[408] = ad[406] + ad[404];
  ad[395] = ad[392] + ad[154];

  ad[411] = (bitselect((z)ad[397], (z)ad[402], (z)ad[407]) + ad[395]) + ((rotate((z)(ad[407]), (z)26) ^ rotate((z)(ad[407]), (z)21) ^ rotate((z)(ad[407]), (z)7)));
  ad[409] = bitselect((z)ad[403], (z)ad[398], (z)ad[408] ^ (z)ad[403]) + ((rotate((z)(ad[408]), (z)30) ^ rotate((z)(ad[408]), (z)19) ^ rotate((z)(ad[408]), (z)10)));
  ad[144] = ad[134] + ad[114];
  ad[159] = ad[155] + 0x5b9cca4fU;

  ad[115] = ((rotate((z)(ad[103]), (z)25) ^ rotate((z)(ad[103]), (z)14) ^ ((ad[103]) >> 3U))) + ad[102];
  ad[156] = ((rotate((z)(ad[150]), (z)15) ^ rotate((z)(ad[150]), (z)13) ^ ((ad[150]) >> 10U))) + ad[144];
  ad[412] = ad[393] + ad[411];
  ad[413] = ad[411] + ad[409];
  ad[400] = ad[397] + ad[159];

  ad[416] = (bitselect((z)ad[402], (z)ad[407], (z)ad[412]) + ad[400]) + ((rotate((z)(ad[412]), (z)26) ^ rotate((z)(ad[412]), (z)21) ^ rotate((z)(ad[412]), (z)7)));
  ad[414] = bitselect((z)ad[408], (z)ad[403], (z)ad[413] ^ (z)ad[408]) + ((rotate((z)(ad[413]), (z)30) ^ rotate((z)(ad[413]), (z)19) ^ rotate((z)(ad[413]), (z)10)));
  ad[145] = ad[135] + ad[115];
  ad[160] = ad[156] + 0x682e6ff3U;

  ad[122] = ((rotate((z)(ad[110]), (z)25) ^ rotate((z)(ad[110]), (z)14) ^ ((ad[110]) >> 3U))) + ad[103];
  ad[161] = ((rotate((z)(ad[155]), (z)15) ^ rotate((z)(ad[155]), (z)13) ^ ((ad[155]) >> 10U))) + ad[145];
  ad[417] = ad[398] + ad[416];
  ad[418] = ad[416] + ad[414];
  ad[405] = ad[402] + ad[160];

  ad[421] = (bitselect((z)ad[407], (z)ad[412], (z)ad[417]) + ad[405]) + ((rotate((z)(ad[417]), (z)26) ^ rotate((z)(ad[417]), (z)21) ^ rotate((z)(ad[417]), (z)7)));
  ad[419] = bitselect((z)ad[413], (z)ad[408], (z)ad[418] ^ (z)ad[413]) + ((rotate((z)(ad[418]), (z)30) ^ rotate((z)(ad[418]), (z)19) ^ rotate((z)(ad[418]), (z)10)));
  ad[151] = ad[142] + ad[122];
  ad[165] = ad[161] + 0x748f82eeU;

  ad[123] = ((rotate((z)(ad[111]), (z)25) ^ rotate((z)(ad[111]), (z)14) ^ ((ad[111]) >> 3U))) + ad[110];
  ad[162] = ((rotate((z)(ad[156]), (z)15) ^ rotate((z)(ad[156]), (z)13) ^ ((ad[156]) >> 10U))) + ad[151];
  ad[422] = ad[403] + ad[421];
  ad[423] = ad[421] + ad[419];
  ad[410] = ad[407] + ad[165];

  ad[426] = (bitselect((z)ad[412], (z)ad[417], (z)ad[422]) + ad[410]) + ((rotate((z)(ad[422]), (z)26) ^ rotate((z)(ad[422]), (z)21) ^ rotate((z)(ad[422]), (z)7)));
  ad[424] = bitselect((z)ad[418], (z)ad[413], (z)ad[423] ^ (z)ad[418]) + ((rotate((z)(ad[423]), (z)30) ^ rotate((z)(ad[423]), (z)19) ^ rotate((z)(ad[423]), (z)10)));
  ad[152] = ad[143] + ad[123];
  ad[166] = ad[162] + 0x78a5636fU;

  ad[130] = ((rotate((z)(ad[118]), (z)25) ^ rotate((z)(ad[118]), (z)14) ^ ((ad[118]) >> 3U))) + ad[111];
  ad[167] = ((rotate((z)(ad[161]), (z)15) ^ rotate((z)(ad[161]), (z)13) ^ ((ad[161]) >> 10U))) + ad[152];
  ad[427] = ad[408] + ad[426];
  ad[428] = ad[426] + ad[424];
  ad[415] = ad[412] + ad[166];

  ad[431] = (bitselect((z)ad[417], (z)ad[422], (z)ad[427]) + ad[415]) + ((rotate((z)(ad[427]), (z)26) ^ rotate((z)(ad[427]), (z)21) ^ rotate((z)(ad[427]), (z)7)));
  ad[429] = bitselect((z)ad[423], (z)ad[418], (z)ad[428] ^ (z)ad[423]) + ((rotate((z)(ad[428]), (z)30) ^ rotate((z)(ad[428]), (z)19) ^ rotate((z)(ad[428]), (z)10)));
  ad[157] = ad[149] + ad[130];
  ad[170] = ad[167] + 0x84c87814U;

  ad[131] = ((rotate((z)(ad[119]), (z)25) ^ rotate((z)(ad[119]), (z)14) ^ ((ad[119]) >> 3U))) + ad[118];
  ad[168] = ((rotate((z)(ad[162]), (z)15) ^ rotate((z)(ad[162]), (z)13) ^ ((ad[162]) >> 10U))) + ad[157];
  ad[432] = ad[413] + ad[431];
  ad[433] = ad[431] + ad[429];
  ad[420] = ad[417] + ad[170];

  ad[436] = (bitselect((z)ad[422], (z)ad[427], (z)ad[432]) + ad[420]) + ((rotate((z)(ad[432]), (z)26) ^ rotate((z)(ad[432]), (z)21) ^ rotate((z)(ad[432]), (z)7)));
  ad[434] = bitselect((z)ad[428], (z)ad[423], (z)ad[433] ^ (z)ad[428]) + ((rotate((z)(ad[433]), (z)30) ^ rotate((z)(ad[433]), (z)19) ^ rotate((z)(ad[433]), (z)10)));
  ad[158] = ad[150] + ad[131];
  ad[171] = ad[168] + 0x8cc70208U;

  ad[138] = ((rotate((z)(ad[126]), (z)25) ^ rotate((z)(ad[126]), (z)14) ^ ((ad[126]) >> 3U))) + ad[119];
  ad[172] = ((rotate((z)(ad[167]), (z)15) ^ rotate((z)(ad[167]), (z)13) ^ ((ad[167]) >> 10U))) + ad[158];
  ad[437] = ad[418] + ad[436];
  ad[438] = ad[436] + ad[434];
  ad[425] = ad[422] + ad[171];

  ad[441] = (bitselect((z)ad[427], (z)ad[432], (z)ad[437]) + ad[425]) + ((rotate((z)(ad[437]), (z)26) ^ rotate((z)(ad[437]), (z)21) ^ rotate((z)(ad[437]), (z)7)));
  ad[439] = bitselect((z)ad[433], (z)ad[428], (z)ad[438] ^ (z)ad[433]) + ((rotate((z)(ad[438]), (z)30) ^ rotate((z)(ad[438]), (z)19) ^ rotate((z)(ad[438]), (z)10)));
  ad[163] = ad[155] + ad[138];
  ad[174] = ad[172] + 0x90befffaU;

  ad[139] = ((rotate((z)(ad[127]), (z)25) ^ rotate((z)(ad[127]), (z)14) ^ ((ad[127]) >> 3U))) + ad[126];
  ad[173] = ((rotate((z)(ad[168]), (z)15) ^ rotate((z)(ad[168]), (z)13) ^ ((ad[168]) >> 10U))) + ad[163];
  ad[442] = ad[423] + ad[441];
  ad[443] = ad[441] + ad[439];
  ad[430] = ad[427] + ad[174];

  ad[445] = (bitselect((z)ad[432], (z)ad[437], (z)ad[442]) + ad[430]) + ((rotate((z)(ad[442]), (z)26) ^ rotate((z)(ad[442]), (z)21) ^ rotate((z)(ad[442]), (z)7)));
  ad[444] = bitselect((z)ad[438], (z)ad[433], (z)ad[443] ^ (z)ad[438]) + ((rotate((z)(ad[443]), (z)30) ^ rotate((z)(ad[443]), (z)19) ^ rotate((z)(ad[443]), (z)10)));
  ad[164] = ad[156] + ad[139];
  ad[175] = ad[173] + 0xa4506cebU;

  ad[146] = ((rotate((z)(ad[134]), (z)25) ^ rotate((z)(ad[134]), (z)14) ^ ((ad[134]) >> 3U))) + ad[127];
  ad[176] = ((rotate((z)(ad[172]), (z)15) ^ rotate((z)(ad[172]), (z)13) ^ ((ad[172]) >> 10U))) + ad[164];
  ad[446] = ad[428] + ad[445];
  ad[447] = ad[445] + ad[444];
  ad[435] = ad[432] + ad[175];

  ad[449] = (bitselect((z)ad[437], (z)ad[442], (z)ad[446]) + ad[435]) + ((rotate((z)(ad[446]), (z)26) ^ rotate((z)(ad[446]), (z)21) ^ rotate((z)(ad[446]), (z)7)));
  ad[448] = bitselect((z)ad[443], (z)ad[438], (z)ad[447] ^ (z)ad[443]) + ((rotate((z)(ad[447]), (z)30) ^ rotate((z)(ad[447]), (z)19) ^ rotate((z)(ad[447]), (z)10)));
  ad[169] = ad[161] + ad[146];
  ad[178] = ad[176] + 0xbef9a3f7U;

  ad[177] = ((rotate((z)(ad[173]), (z)15) ^ rotate((z)(ad[173]), (z)13) ^ ((ad[173]) >> 10U))) + ad[169];
  ad[451] = ad[449] + ad[448];
  ad[450] = ad[433] + ad[449];
  ad[440] = ad[437] + ad[178];

  ad[453] = (bitselect((z)ad[442], (z)ad[446], (z)ad[450]) + ad[440]) + ((rotate((z)(ad[450]), (z)26) ^ rotate((z)(ad[450]), (z)21) ^ rotate((z)(ad[450]), (z)7)));
  ad[452] = bitselect((z)ad[447], (z)ad[443], (z)ad[451] ^ (z)ad[447]) + ((rotate((z)(ad[451]), (z)30) ^ rotate((z)(ad[451]), (z)19) ^ rotate((z)(ad[451]), (z)10)));
  ad[179] = ad[177] + 0xc67178f2U;

  ad[454] = ad[438] + ad[453];
  ad[494] = ad[442] + ad[179];
  ad[455] = ad[453] + ad[452];

  ad[457] = (bitselect((z)ad[446], (z)ad[450], (z)ad[454]) + ad[494]) + ((rotate((z)(ad[454]), (z)26) ^ rotate((z)(ad[454]), (z)21) ^ rotate((z)(ad[454]), (z)7)));
  ad[456] = bitselect((z)ad[451], (z)ad[447], (z)ad[455] ^ (z)ad[451]) + ((rotate((z)(ad[455]), (z)30) ^ rotate((z)(ad[455]), (z)19) ^ rotate((z)(ad[455]), (z)10)));

  ad[459] = ad[457] + ad[456];

  ad[461] = ad[455] + v;
  ad[460] = ad[459] + u;

  ad[495] = ad[460] + 0x98c7e2a2U;
  ad[469] = ad[461] + 0x90bb1e3cU;

  ad[498] = (bitselect((z)0x9b05688cU, (z)0x510e527fU, (z)ad[495]) + ad[469]) + ((rotate((z)(ad[495]), (z)26) ^ rotate((z)(ad[495]), (z)21) ^ rotate((z)(ad[495]), (z)7)));
  ad[462] = ad[451] + w;

  ad[496] = ad[460] + 0xfc08884dU;
  ad[506] = ad[498] + 0x3c6ef372U;
  ad[470] = ad[462] + 0x50c6645bU;

  ad[507] = (bitselect((z)0x510e527fU, (z)ad[495], (z)ad[506]) + ad[470]) + ((rotate((z)(ad[506]), (z)26) ^ rotate((z)(ad[506]), (z)21) ^ rotate((z)(ad[506]), (z)7)));
  ad[500] = bitselect((z)0x6a09e667U, (z)0xbb67ae85U, (z)ad[496] ^ (z)0x6a09e667U) + ((rotate((z)(ad[496]), (z)30) ^ rotate((z)(ad[496]), (z)19) ^ rotate((z)(ad[496]), (z)10)));
  ad[463] = ad[447] + x;

  ad[458] = ad[443] + ad[457];
  ad[499] = ad[498] + ad[500];
  ad[508] = ad[507] + 0xbb67ae85U;
  ad[473] = ad[463] + 0x3ac42e24U;

  ad[510] = (bitselect((z)ad[495], (z)ad[506], (z)ad[508]) + ad[473]) + ((rotate((z)(ad[508]), (z)26) ^ rotate((z)(ad[508]), (z)21) ^ rotate((z)(ad[508]), (z)7)));
  ad[928] = bitselect((z)ad[496], (z)0x6a09e667U, (z)ad[499] ^ (z)ad[496]) + ((rotate((z)(ad[499]), (z)30) ^ rotate((z)(ad[499]), (z)19) ^ rotate((z)(ad[499]), (z)10)));
  ad[464] = ad[458] + y;

  ad[476] = ad[464] + ad[460] + 0xd21ea4fdU;
  ad[511] = ad[510] + 0x6a09e667U;
  ad[509] = ad[928] + ad[507];
  ad[465] = ad[454] + z;

  ad[514] = (bitselect((z)ad[506], (z)ad[508], (z)ad[511]) + ad[476]) + ((rotate((z)(ad[511]), (z)26) ^ rotate((z)(ad[511]), (z)21) ^ rotate((z)(ad[511]), (z)7)));
  ad[512] = bitselect((z)ad[499], (z)ad[496], (z)ad[509] ^ (z)ad[499]) + ((rotate((z)(ad[509]), (z)30) ^ rotate((z)(ad[509]), (z)19) ^ rotate((z)(ad[509]), (z)10)));
  ad[478] = ad[465] + 0x59f111f1U;

  ad[519] = ad[506] + ad[478];
  ad[516] = ad[496] + ad[514];
  ad[513] = ad[510] + ad[512];
  ad[466] = ad[450] + aa;

  ad[520] = (bitselect((z)ad[508], (z)ad[511], (z)ad[516]) + ad[519]) + ((rotate((z)(ad[516]), (z)26) ^ rotate((z)(ad[516]), (z)21) ^ rotate((z)(ad[516]), (z)7)));
  ad[515] = bitselect((z)ad[509], (z)ad[499], (z)ad[513] ^ (z)ad[509]) + ((rotate((z)(ad[513]), (z)30) ^ rotate((z)(ad[513]), (z)19) ^ rotate((z)(ad[513]), (z)10)));
  ad[480] = ad[466] + 0x923f82a4U;

  ad[524] = ad[508] + ad[480];
  ad[521] = ad[499] + ad[520];
  ad[517] = ad[514] + ad[515];
  ad[467] = ad[446] + ab;

  ad[525] = (bitselect((z)ad[511], (z)ad[516], (z)ad[521]) + ad[524]) + ((rotate((z)(ad[521]), (z)26) ^ rotate((z)(ad[521]), (z)21) ^ rotate((z)(ad[521]), (z)7)));
  ad[522] = bitselect((z)ad[513], (z)ad[509], (z)ad[517] ^ (z)ad[513]) + ((rotate((z)(ad[517]), (z)30) ^ rotate((z)(ad[517]), (z)19) ^ rotate((z)(ad[517]), (z)10)));
  ad[484] = ad[467] + 0xab1c5ed5U;

  ad[529] = ad[511] + ad[484];
  ad[526] = ad[509] + ad[525];
  ad[523] = ad[520] + ad[522];

  ad[530] = (bitselect((z)ad[516], (z)ad[521], (z)ad[526]) + ad[529]) + ((rotate((z)(ad[526]), (z)26) ^ rotate((z)(ad[526]), (z)21) ^ rotate((z)(ad[526]), (z)7)));
  ad[550] = bitselect((z)ad[517], (z)ad[513], (z)ad[523] ^ (z)ad[517]) + ((rotate((z)(ad[523]), (z)30) ^ rotate((z)(ad[523]), (z)19) ^ rotate((z)(ad[523]), (z)10)));

  ad[531] = ad[513] + ad[530];
  ad[533] = ad[516] + 0x5807aa98U;
  ad[527] = ad[550] + ad[525];

  ad[534] = (bitselect((z)ad[521], (z)ad[526], (z)ad[531]) + ad[533]) + ((rotate((z)(ad[531]), (z)26) ^ rotate((z)(ad[531]), (z)21) ^ rotate((z)(ad[531]), (z)7)));
  ad[551] = bitselect((z)ad[523], (z)ad[517], (z)ad[527] ^ (z)ad[523]) + ((rotate((z)(ad[527]), (z)30) ^ rotate((z)(ad[527]), (z)19) ^ rotate((z)(ad[527]), (z)10)));

  ad[535] = ad[517] + ad[534];
  ad[538] = ad[521] + 0x12835b01U;
  ad[532] = ad[551] + ad[530];

  ad[539] = (bitselect((z)ad[526], (z)ad[531], (z)ad[535]) + ad[538]) + ((rotate((z)(ad[535]), (z)26) ^ rotate((z)(ad[535]), (z)21) ^ rotate((z)(ad[535]), (z)7)));
  ad[552] = bitselect((z)ad[527], (z)ad[523], (z)ad[532] ^ (z)ad[527]) + ((rotate((z)(ad[532]), (z)30) ^ rotate((z)(ad[532]), (z)19) ^ rotate((z)(ad[532]), (z)10)));

  ad[540] = ad[523] + ad[539];
  ad[542] = ad[526] + 0x243185beU;
  ad[536] = ad[552] + ad[534];

  ad[543] = (bitselect((z)ad[531], (z)ad[535], (z)ad[540]) + ad[542]) + ((rotate((z)(ad[540]), (z)26) ^ rotate((z)(ad[540]), (z)21) ^ rotate((z)(ad[540]), (z)7)));
  ad[553] = bitselect((z)ad[532], (z)ad[527], (z)ad[536] ^ (z)ad[532]) + ((rotate((z)(ad[536]), (z)30) ^ rotate((z)(ad[536]), (z)19) ^ rotate((z)(ad[536]), (z)10)));

  ad[544] = ad[527] + ad[543];
  ad[555] = ad[531] + 0x550c7dc3U;
  ad[541] = ad[553] + ad[539];

  ad[558] = (bitselect((z)ad[535], (z)ad[540], (z)ad[544]) + ad[555]) + ((rotate((z)(ad[544]), (z)26) ^ rotate((z)(ad[544]), (z)21) ^ rotate((z)(ad[544]), (z)7)));
  ad[547] = bitselect((z)ad[536], (z)ad[532], (z)ad[541] ^ (z)ad[536]) + ((rotate((z)(ad[541]), (z)30) ^ rotate((z)(ad[541]), (z)19) ^ rotate((z)(ad[541]), (z)10)));

  ad[559] = ad[532] + ad[558];
  ad[556] = ad[535] + 0x72be5d74U;
  ad[545] = ad[547] + ad[543];

  ad[562] = (bitselect((z)ad[540], (z)ad[544], (z)ad[559]) + ad[556]) + ((rotate((z)(ad[559]), (z)26) ^ rotate((z)(ad[559]), (z)21) ^ rotate((z)(ad[559]), (z)7)));
  ad[561] = bitselect((z)ad[541], (z)ad[536], (z)ad[545] ^ (z)ad[541]) + ((rotate((z)(ad[545]), (z)30) ^ rotate((z)(ad[545]), (z)19) ^ rotate((z)(ad[545]), (z)10)));

  ad[563] = ad[536] + ad[562];
  ad[560] = ad[561] + ad[558];
  ad[557] = ad[540] + 0x80deb1feU;

  ad[568] = (bitselect((z)ad[544], (z)ad[559], (z)ad[563]) + ad[557]) + ((rotate((z)(ad[563]), (z)26) ^ rotate((z)(ad[563]), (z)21) ^ rotate((z)(ad[563]), (z)7)));
  ad[564] = bitselect((z)ad[545], (z)ad[541], (z)ad[560] ^ (z)ad[545]) + ((rotate((z)(ad[560]), (z)30) ^ rotate((z)(ad[560]), (z)19) ^ rotate((z)(ad[560]), (z)10)));

  ad[569] = ad[541] + ad[568];
  ad[572] = ad[544] + 0x9bdc06a7U;
  ad[565] = ad[562] + ad[564];

  ad[574] = (bitselect((z)ad[559], (z)ad[563], (z)ad[569]) + ad[572]) + ((rotate((z)(ad[569]), (z)26) ^ rotate((z)(ad[569]), (z)21) ^ rotate((z)(ad[569]), (z)7)));
  ad[570] = bitselect((z)ad[560], (z)ad[545], (z)ad[565] ^ (z)ad[560]) + ((rotate((z)(ad[565]), (z)30) ^ rotate((z)(ad[565]), (z)19) ^ rotate((z)(ad[565]), (z)10)));
  ad[468] = ((rotate((z)(ad[461]), (z)25) ^ rotate((z)(ad[461]), (z)14) ^ ((ad[461]) >> 3U)));

  ad[497] = ad[468] + ad[460];
  ad[575] = ad[545] + ad[574];
  ad[571] = ad[568] + ad[570];
  ad[573] = ad[559] + 0xc19bf274U;

  ad[578] = (bitselect((z)ad[563], (z)ad[569], (z)ad[575]) + ad[573]) + ((rotate((z)(ad[575]), (z)26) ^ rotate((z)(ad[575]), (z)21) ^ rotate((z)(ad[575]), (z)7)));
  ad[576] = bitselect((z)ad[565], (z)ad[560], (z)ad[571] ^ (z)ad[565]) + ((rotate((z)(ad[571]), (z)30) ^ rotate((z)(ad[571]), (z)19) ^ rotate((z)(ad[571]), (z)10)));
  ad[929] = ((rotate((z)(ad[462]), (z)25) ^ rotate((z)(ad[462]), (z)14) ^ ((ad[462]) >> 3U)));
  ad[503] = ad[497] + 0xe49b69c1U;

  ad[471] = ad[929] + ad[461] + 0x00a00000U;
  ad[582] = ad[563] + ad[503];
  ad[579] = ad[560] + ad[578];
  ad[577] = ad[574] + ad[576];

  ad[583] = (bitselect((z)ad[569], (z)ad[575], (z)ad[579]) + ad[582]) + ((rotate((z)(ad[579]), (z)26) ^ rotate((z)(ad[579]), (z)21) ^ rotate((z)(ad[579]), (z)7)));
  ad[580] = bitselect((z)ad[571], (z)ad[565], (z)ad[577] ^ (z)ad[571]) + ((rotate((z)(ad[577]), (z)30) ^ rotate((z)(ad[577]), (z)19) ^ rotate((z)(ad[577]), (z)10)));
  ad[488] = ad[471] + 0xefbe4786U;

  ad[472] = ((rotate((z)(ad[463]), (z)25) ^ rotate((z)(ad[463]), (z)14) ^ ((ad[463]) >> 3U))) + ad[462];
  ad[587] = ad[569] + ad[488];
  ad[584] = ad[565] + ad[583];
  ad[581] = ad[578] + ad[580];

  ad[588] = (bitselect((z)ad[575], (z)ad[579], (z)ad[584]) + ad[587]) + ((rotate((z)(ad[584]), (z)26) ^ rotate((z)(ad[584]), (z)21) ^ rotate((z)(ad[584]), (z)7)));
  ad[586] = bitselect((z)ad[577], (z)ad[571], (z)ad[581] ^ (z)ad[577]) + ((rotate((z)(ad[581]), (z)30) ^ rotate((z)(ad[581]), (z)19) ^ rotate((z)(ad[581]), (z)10)));
  ad[501] = ((rotate((z)(ad[497]), (z)15) ^ rotate((z)(ad[497]), (z)13) ^ ((ad[497]) >> 10U))) + ad[472];
  ad[475] = ((rotate((z)(ad[471]), (z)15) ^ rotate((z)(ad[471]), (z)13) ^ ((ad[471]) >> 10U)));
  ad[926] = ad[575] + 0x0fc19dc6U;

  ad[474] = ad[475] + ad[463] + ((rotate((z)(ad[464]), (z)25) ^ rotate((z)(ad[464]), (z)14) ^ ((ad[464]) >> 3U)));
  ad[927] = ad[926] + ad[501];
  ad[589] = ad[571] + ad[588];
  ad[585] = ad[583] + ad[586];

  ad[592] = (bitselect((z)ad[579], (z)ad[584], (z)ad[589]) + ad[927]) + ((rotate((z)(ad[589]), (z)26) ^ rotate((z)(ad[589]), (z)21) ^ rotate((z)(ad[589]), (z)7)));
  ad[590] = bitselect((z)ad[581], (z)ad[577], (z)ad[585] ^ (z)ad[581]) + ((rotate((z)(ad[585]), (z)30) ^ rotate((z)(ad[585]), (z)19) ^ rotate((z)(ad[585]), (z)10)));
  ad[477] = ((rotate((z)(ad[465]), (z)25) ^ rotate((z)(ad[465]), (z)14) ^ ((ad[465]) >> 3U))) + ad[464];
  ad[489] = ad[474] + 0x240ca1ccU;

  ad[518] = ((rotate((z)(ad[501]), (z)15) ^ rotate((z)(ad[501]), (z)13) ^ ((ad[501]) >> 10U))) + ad[477];
  ad[479] = ((rotate((z)(ad[466]), (z)25) ^ rotate((z)(ad[466]), (z)14) ^ ((ad[466]) >> 3U)));
  ad[596] = ad[579] + ad[489];
  ad[593] = ad[577] + ad[592];
  ad[591] = ad[588] + ad[590];

  ad[597] = (bitselect((z)ad[584], (z)ad[589], (z)ad[593]) + ad[596]) + ((rotate((z)(ad[593]), (z)26) ^ rotate((z)(ad[593]), (z)21) ^ rotate((z)(ad[593]), (z)7)));
  ad[594] = bitselect((z)ad[585], (z)ad[581], (z)ad[591] ^ (z)ad[585]) + ((rotate((z)(ad[591]), (z)30) ^ rotate((z)(ad[591]), (z)19) ^ rotate((z)(ad[591]), (z)10)));
  ad[481] = ad[479] + ad[465];
  ad[601] = ad[518] + 0x2de92c6fU;

  ad[482] = ((rotate((z)(ad[474]), (z)15) ^ rotate((z)(ad[474]), (z)13) ^ ((ad[474]) >> 10U))) + ad[481];
  ad[602] = ad[584] + ad[601];
  ad[598] = ad[581] + ad[597];
  ad[595] = ad[592] + ad[594];

  ad[632] = (bitselect((z)ad[589], (z)ad[593], (z)ad[598]) + ad[602]) + ((rotate((z)(ad[598]), (z)26) ^ rotate((z)(ad[598]), (z)21) ^ rotate((z)(ad[598]), (z)7)));
  ad[599] = bitselect((z)ad[591], (z)ad[585], (z)ad[595] ^ (z)ad[591]) + ((rotate((z)(ad[595]), (z)30) ^ rotate((z)(ad[595]), (z)19) ^ rotate((z)(ad[595]), (z)10)));
  ad[483] = ad[466] + 0x00000100U + ((rotate((z)(ad[467]), (z)25) ^ rotate((z)(ad[467]), (z)14) ^ ((ad[467]) >> 3U)));
  ad[490] = ad[482] + 0x4a7484aaU;

  ad[528] = ((rotate((z)(ad[518]), (z)15) ^ rotate((z)(ad[518]), (z)13) ^ ((ad[518]) >> 10U))) + ad[483];
  ad[736] = ad[585] + ad[632];
  ad[605] = ad[589] + ad[490];
  ad[600] = ad[597] + ad[599];
  ad[485] = ad[467] + 0x11002000U;

  ad[738] = (bitselect((z)ad[593], (z)ad[598], (z)ad[736]) + ad[605]) + ((rotate((z)(ad[736]), (z)26) ^ rotate((z)(ad[736]), (z)21) ^ rotate((z)(ad[736]), (z)7)));
  ad[744] = bitselect((z)ad[595], (z)ad[591], (z)ad[600] ^ (z)ad[595]) + ((rotate((z)(ad[600]), (z)30) ^ rotate((z)(ad[600]), (z)19) ^ rotate((z)(ad[600]), (z)10)));
  ad[487] = ((rotate((z)(ad[482]), (z)15) ^ rotate((z)(ad[482]), (z)13) ^ ((ad[482]) >> 10U))) + ad[485];
  ad[603] = ad[528] + 0x5cb0a9dcU;

  ad[502] = ad[497] + ad[487];
  ad[739] = ad[591] + ad[738];
  ad[604] = ad[593] + ad[603];
  ad[737] = ad[744] + ad[632];

  ad[741] = (bitselect((z)ad[598], (z)ad[736], (z)ad[739]) + ad[604]) + ((rotate((z)(ad[739]), (z)26) ^ rotate((z)(ad[739]), (z)21) ^ rotate((z)(ad[739]), (z)7)));
  ad[745] = bitselect((z)ad[600], (z)ad[595], (z)ad[737] ^ (z)ad[600]) + ((rotate((z)(ad[737]), (z)30) ^ rotate((z)(ad[737]), (z)19) ^ rotate((z)(ad[737]), (z)10)));
  ad[486] = ad[471] + 0x80000000U;
  ad[606] = ad[502] + 0x76f988daU;

  ad[537] = ((rotate((z)(ad[528]), (z)15) ^ rotate((z)(ad[528]), (z)13) ^ ((ad[528]) >> 10U))) + ad[486];
  ad[742] = ad[595] + ad[741];
  ad[613] = ad[598] + ad[606];
  ad[740] = ad[745] + ad[738];

  ad[747] = (bitselect((z)ad[736], (z)ad[739], (z)ad[742]) + ad[613]) + ((rotate((z)(ad[742]), (z)26) ^ rotate((z)(ad[742]), (z)21) ^ rotate((z)(ad[742]), (z)7)));
  ad[746] = bitselect((z)ad[737], (z)ad[600], (z)ad[740] ^ (z)ad[737]) + ((rotate((z)(ad[740]), (z)30) ^ rotate((z)(ad[740]), (z)19) ^ rotate((z)(ad[740]), (z)10)));
  ad[607] = ad[537] + 0x983e5152U;

  ad[546] = ((rotate((z)(ad[502]), (z)15) ^ rotate((z)(ad[502]), (z)13) ^ ((ad[502]) >> 10U))) + ad[501];
  ad[751] = ad[736] + ad[607];
  ad[748] = ad[600] + ad[747];
  ad[743] = ad[746] + ad[741];

  ad[752] = (bitselect((z)ad[739], (z)ad[742], (z)ad[748]) + ad[751]) + ((rotate((z)(ad[748]), (z)26) ^ rotate((z)(ad[748]), (z)21) ^ rotate((z)(ad[748]), (z)7)));
  ad[749] = bitselect((z)ad[740], (z)ad[737], (z)ad[743] ^ (z)ad[740]) + ((rotate((z)(ad[743]), (z)30) ^ rotate((z)(ad[743]), (z)19) ^ rotate((z)(ad[743]), (z)10)));
  ad[608] = ad[546] + 0xa831c66dU;

  ad[554] = ((rotate((z)(ad[537]), (z)15) ^ rotate((z)(ad[537]), (z)13) ^ ((ad[537]) >> 10U))) + ad[474];
  ad[756] = ad[739] + ad[608];
  ad[753] = ad[737] + ad[752];
  ad[750] = ad[747] + ad[749];

  ad[757] = (bitselect((z)ad[742], (z)ad[748], (z)ad[753]) + ad[756]) + ((rotate((z)(ad[753]), (z)26) ^ rotate((z)(ad[753]), (z)21) ^ rotate((z)(ad[753]), (z)7)));
  ad[754] = bitselect((z)ad[743], (z)ad[740], (z)ad[750] ^ (z)ad[743]) + ((rotate((z)(ad[750]), (z)30) ^ rotate((z)(ad[750]), (z)19) ^ rotate((z)(ad[750]), (z)10)));
  ad[609] = ad[554] + 0xb00327c8U;

  ad[566] = ((rotate((z)(ad[546]), (z)15) ^ rotate((z)(ad[546]), (z)13) ^ ((ad[546]) >> 10U))) + ad[518];
  ad[761] = ad[742] + ad[609];
  ad[758] = ad[740] + ad[757];
  ad[755] = ad[752] + ad[754];

  ad[762] = (bitselect((z)ad[748], (z)ad[753], (z)ad[758]) + ad[761]) + ((rotate((z)(ad[758]), (z)26) ^ rotate((z)(ad[758]), (z)21) ^ rotate((z)(ad[758]), (z)7)));
  ad[759] = bitselect((z)ad[750], (z)ad[743], (z)ad[755] ^ (z)ad[750]) + ((rotate((z)(ad[755]), (z)30) ^ rotate((z)(ad[755]), (z)19) ^ rotate((z)(ad[755]), (z)10)));
  ad[610] = ad[566] + 0xbf597fc7U;

  ad[567] = ((rotate((z)(ad[554]), (z)15) ^ rotate((z)(ad[554]), (z)13) ^ ((ad[554]) >> 10U))) + ad[482];
  ad[766] = ad[748] + ad[610];
  ad[763] = ad[743] + ad[762];
  ad[760] = ad[757] + ad[759];

  ad[767] = (bitselect((z)ad[753], (z)ad[758], (z)ad[763]) + ad[766]) + ((rotate((z)(ad[763]), (z)26) ^ rotate((z)(ad[763]), (z)21) ^ rotate((z)(ad[763]), (z)7)));
  ad[764] = bitselect((z)ad[755], (z)ad[750], (z)ad[760] ^ (z)ad[755]) + ((rotate((z)(ad[760]), (z)30) ^ rotate((z)(ad[760]), (z)19) ^ rotate((z)(ad[760]), (z)10)));
  ad[611] = ad[567] + 0xc6e00bf3U;

  ad[614] = ((rotate((z)(ad[566]), (z)15) ^ rotate((z)(ad[566]), (z)13) ^ ((ad[566]) >> 10U))) + ad[528];
  ad[771] = ad[753] + ad[611];
  ad[768] = ad[750] + ad[767];
  ad[765] = ad[762] + ad[764];

  ad[772] = (bitselect((z)ad[758], (z)ad[763], (z)ad[768]) + ad[771]) + ((rotate((z)(ad[768]), (z)26) ^ rotate((z)(ad[768]), (z)21) ^ rotate((z)(ad[768]), (z)7)));
  ad[769] = bitselect((z)ad[760], (z)ad[755], (z)ad[765] ^ (z)ad[760]) + ((rotate((z)(ad[765]), (z)30) ^ rotate((z)(ad[765]), (z)19) ^ rotate((z)(ad[765]), (z)10)));
  ad[612] = ad[502] + 0x00400022U;
  ad[615] = ad[614] + 0xd5a79147U;

  ad[616] = ((rotate((z)(ad[567]), (z)15) ^ rotate((z)(ad[567]), (z)13) ^ ((ad[567]) >> 10U))) + ad[612];
  ad[504] = ((rotate((z)(ad[497]), (z)25) ^ rotate((z)(ad[497]), (z)14) ^ ((ad[497]) >> 3U))) + 0x00000100U;
  ad[776] = ad[758] + ad[615];
  ad[773] = ad[755] + ad[772];
  ad[770] = ad[767] + ad[769];

  ad[777] = (bitselect((z)ad[763], (z)ad[768], (z)ad[773]) + ad[776]) + ((rotate((z)(ad[773]), (z)26) ^ rotate((z)(ad[773]), (z)21) ^ rotate((z)(ad[773]), (z)7)));
  ad[774] = bitselect((z)ad[765], (z)ad[760], (z)ad[770] ^ (z)ad[765]) + ((rotate((z)(ad[770]), (z)30) ^ rotate((z)(ad[770]), (z)19) ^ rotate((z)(ad[770]), (z)10)));
  ad[492] = ((rotate((z)(ad[471]), (z)25) ^ rotate((z)(ad[471]), (z)14) ^ ((ad[471]) >> 3U)));
  ad[618] = ad[537] + ad[504];
  ad[617] = ad[616] + 0x06ca6351U;

  ad[619] = ((rotate((z)(ad[614]), (z)15) ^ rotate((z)(ad[614]), (z)13) ^ ((ad[614]) >> 10U))) + ad[618];
  ad[781] = ad[763] + ad[617];
  ad[778] = ad[760] + ad[777];
  ad[775] = ad[772] + ad[774];
  ad[505] = ad[492] + ad[497];

  ad[782] = (bitselect((z)ad[768], (z)ad[773], (z)ad[778]) + ad[781]) + ((rotate((z)(ad[778]), (z)26) ^ rotate((z)(ad[778]), (z)21) ^ rotate((z)(ad[778]), (z)7)));
  ad[779] = bitselect((z)ad[770], (z)ad[765], (z)ad[775] ^ (z)ad[770]) + ((rotate((z)(ad[775]), (z)30) ^ rotate((z)(ad[775]), (z)19) ^ rotate((z)(ad[775]), (z)10)));
  ad[621] = ad[505] + ad[546];
  ad[620] = ad[619] + 0x14292967U;

  ad[622] = ((rotate((z)(ad[616]), (z)15) ^ rotate((z)(ad[616]), (z)13) ^ ((ad[616]) >> 10U))) + ad[621];
  ad[625] = ((rotate((z)(ad[501]), (z)25) ^ rotate((z)(ad[501]), (z)14) ^ ((ad[501]) >> 3U)));
  ad[786] = ad[768] + ad[620];
  ad[783] = ad[765] + ad[782];
  ad[624] = ad[554] + ad[471];
  ad[780] = ad[777] + ad[779];

  ad[787] = (bitselect((z)ad[773], (z)ad[778], (z)ad[783]) + ad[786]) + ((rotate((z)(ad[783]), (z)26) ^ rotate((z)(ad[783]), (z)21) ^ rotate((z)(ad[783]), (z)7)));
  ad[784] = bitselect((z)ad[775], (z)ad[770], (z)ad[780] ^ (z)ad[775]) + ((rotate((z)(ad[780]), (z)30) ^ rotate((z)(ad[780]), (z)19) ^ rotate((z)(ad[780]), (z)10)));
  ad[493] = ((rotate((z)(ad[474]), (z)25) ^ rotate((z)(ad[474]), (z)14) ^ ((ad[474]) >> 3U)));
  ad[626] = ad[625] + ad[624];
  ad[623] = ad[622] + 0x27b70a85U;

  ad[627] = ((rotate((z)(ad[619]), (z)15) ^ rotate((z)(ad[619]), (z)13) ^ ((ad[619]) >> 10U))) + ad[626];
  ad[791] = ad[773] + ad[623];
  ad[788] = ad[770] + ad[787];
  ad[785] = ad[782] + ad[784];
  ad[629] = ad[493] + ad[501];

  ad[792] = (bitselect((z)ad[778], (z)ad[783], (z)ad[788]) + ad[791]) + ((rotate((z)(ad[788]), (z)26) ^ rotate((z)(ad[788]), (z)21) ^ rotate((z)(ad[788]), (z)7)));
  ad[789] = bitselect((z)ad[780], (z)ad[775], (z)ad[785] ^ (z)ad[780]) + ((rotate((z)(ad[785]), (z)30) ^ rotate((z)(ad[785]), (z)19) ^ rotate((z)(ad[785]), (z)10)));
  ad[630] = ad[566] + ad[629];
  ad[628] = ad[627] + 0x2e1b2138U;

  ad[634] = ((rotate((z)(ad[518]), (z)25) ^ rotate((z)(ad[518]), (z)14) ^ ((ad[518]) >> 3U))) + ad[474];
  ad[631] = ((rotate((z)(ad[622]), (z)15) ^ rotate((z)(ad[622]), (z)13) ^ ((ad[622]) >> 10U))) + ad[630];
  ad[796] = ad[778] + ad[628];
  ad[793] = ad[775] + ad[792];
  ad[790] = ad[787] + ad[789];

  ad[797] = (bitselect((z)ad[783], (z)ad[788], (z)ad[793]) + ad[796]) + ((rotate((z)(ad[793]), (z)26) ^ rotate((z)(ad[793]), (z)21) ^ rotate((z)(ad[793]), (z)7)));
  ad[794] = bitselect((z)ad[785], (z)ad[780], (z)ad[790] ^ (z)ad[785]) + ((rotate((z)(ad[790]), (z)30) ^ rotate((z)(ad[790]), (z)19) ^ rotate((z)(ad[790]), (z)10)));
  ad[491] = ((rotate((z)(ad[482]), (z)25) ^ rotate((z)(ad[482]), (z)14) ^ ((ad[482]) >> 3U)));
  ad[635] = ad[567] + ad[634];
  ad[633] = ad[631] + 0x4d2c6dfcU;

  ad[636] = ((rotate((z)(ad[627]), (z)15) ^ rotate((z)(ad[627]), (z)13) ^ ((ad[627]) >> 10U))) + ad[635];
  ad[801] = ad[783] + ad[633];
  ad[798] = ad[780] + ad[797];
  ad[795] = ad[792] + ad[794];
  ad[638] = ad[491] + ad[518];

  ad[802] = (bitselect((z)ad[788], (z)ad[793], (z)ad[798]) + ad[801]) + ((rotate((z)(ad[798]), (z)26) ^ rotate((z)(ad[798]), (z)21) ^ rotate((z)(ad[798]), (z)7)));
  ad[799] = bitselect((z)ad[790], (z)ad[785], (z)ad[795] ^ (z)ad[790]) + ((rotate((z)(ad[795]), (z)30) ^ rotate((z)(ad[795]), (z)19) ^ rotate((z)(ad[795]), (z)10)));
  ad[639] = ad[638] + ad[614];
  ad[637] = ad[636] + 0x53380d13U;

  ad[642] = ((rotate((z)(ad[528]), (z)25) ^ rotate((z)(ad[528]), (z)14) ^ ((ad[528]) >> 3U))) + ad[482];
  ad[640] = ((rotate((z)(ad[631]), (z)15) ^ rotate((z)(ad[631]), (z)13) ^ ((ad[631]) >> 10U))) + ad[639];
  ad[806] = ad[788] + ad[637];
  ad[803] = ad[785] + ad[802];
  ad[800] = ad[797] + ad[799];

  ad[807] = (bitselect((z)ad[793], (z)ad[798], (z)ad[803]) + ad[806]) + ((rotate((z)(ad[803]), (z)26) ^ rotate((z)(ad[803]), (z)21) ^ rotate((z)(ad[803]), (z)7)));
  ad[804] = bitselect((z)ad[795], (z)ad[790], (z)ad[800] ^ (z)ad[795]) + ((rotate((z)(ad[800]), (z)30) ^ rotate((z)(ad[800]), (z)19) ^ rotate((z)(ad[800]), (z)10)));
  ad[643] = ad[616] + ad[642];
  ad[641] = ad[640] + 0x650a7354U;

  ad[646] = ((rotate((z)(ad[502]), (z)25) ^ rotate((z)(ad[502]), (z)14) ^ ((ad[502]) >> 3U))) + ad[528];
  ad[644] = ((rotate((z)(ad[636]), (z)15) ^ rotate((z)(ad[636]), (z)13) ^ ((ad[636]) >> 10U))) + ad[643];
  ad[811] = ad[793] + ad[641];
  ad[808] = ad[790] + ad[807];
  ad[805] = ad[802] + ad[804];

  ad[812] = (bitselect((z)ad[798], (z)ad[803], (z)ad[808]) + ad[811]) + ((rotate((z)(ad[808]), (z)26) ^ rotate((z)(ad[808]), (z)21) ^ rotate((z)(ad[808]), (z)7)));
  ad[809] = bitselect((z)ad[800], (z)ad[795], (z)ad[805] ^ (z)ad[800]) + ((rotate((z)(ad[805]), (z)30) ^ rotate((z)(ad[805]), (z)19) ^ rotate((z)(ad[805]), (z)10)));
  ad[647] = ad[619] + ad[646];
  ad[645] = ad[644] + 0x766a0abbU;

  ad[650] = ((rotate((z)(ad[537]), (z)25) ^ rotate((z)(ad[537]), (z)14) ^ ((ad[537]) >> 3U))) + ad[502];
  ad[648] = ((rotate((z)(ad[640]), (z)15) ^ rotate((z)(ad[640]), (z)13) ^ ((ad[640]) >> 10U))) + ad[647];
  ad[816] = ad[798] + ad[645];
  ad[813] = ad[795] + ad[812];
  ad[810] = ad[807] + ad[809];

  ad[817] = (bitselect((z)ad[803], (z)ad[808], (z)ad[813]) + ad[816]) + ((rotate((z)(ad[813]), (z)26) ^ rotate((z)(ad[813]), (z)21) ^ rotate((z)(ad[813]), (z)7)));
  ad[814] = bitselect((z)ad[805], (z)ad[800], (z)ad[810] ^ (z)ad[805]) + ((rotate((z)(ad[810]), (z)30) ^ rotate((z)(ad[810]), (z)19) ^ rotate((z)(ad[810]), (z)10)));
  ad[925] = ad[622] + ad[650];
  ad[649] = ad[648] + 0x81c2c92eU;

  ad[653] = ((rotate((z)(ad[546]), (z)25) ^ rotate((z)(ad[546]), (z)14) ^ ((ad[546]) >> 3U))) + ad[537];
  ad[651] = ((rotate((z)(ad[644]), (z)15) ^ rotate((z)(ad[644]), (z)13) ^ ((ad[644]) >> 10U))) + ad[925];
  ad[821] = ad[803] + ad[649];
  ad[818] = ad[800] + ad[817];
  ad[815] = ad[812] + ad[814];

  ad[822] = (bitselect((z)ad[808], (z)ad[813], (z)ad[818]) + ad[821]) + ((rotate((z)(ad[818]), (z)26) ^ rotate((z)(ad[818]), (z)21) ^ rotate((z)(ad[818]), (z)7)));
  ad[819] = bitselect((z)ad[810], (z)ad[805], (z)ad[815] ^ (z)ad[810]) + ((rotate((z)(ad[815]), (z)30) ^ rotate((z)(ad[815]), (z)19) ^ rotate((z)(ad[815]), (z)10)));
  ad[654] = ad[627] + ad[653];
  ad[652] = ad[651] + 0x92722c85U;

  ad[657] = ((rotate((z)(ad[554]), (z)25) ^ rotate((z)(ad[554]), (z)14) ^ ((ad[554]) >> 3U))) + ad[546];
  ad[655] = ((rotate((z)(ad[648]), (z)15) ^ rotate((z)(ad[648]), (z)13) ^ ((ad[648]) >> 10U))) + ad[654];
  ad[826] = ad[808] + ad[652];
  ad[823] = ad[805] + ad[822];
  ad[820] = ad[817] + ad[819];

  ad[827] = (bitselect((z)ad[813], (z)ad[818], (z)ad[823]) + ad[826]) + ((rotate((z)(ad[823]), (z)26) ^ rotate((z)(ad[823]), (z)21) ^ rotate((z)(ad[823]), (z)7)));
  ad[824] = bitselect((z)ad[815], (z)ad[810], (z)ad[820] ^ (z)ad[815]) + ((rotate((z)(ad[820]), (z)30) ^ rotate((z)(ad[820]), (z)19) ^ rotate((z)(ad[820]), (z)10)));
  ad[658] = ad[631] + ad[657];
  ad[656] = ad[655] + 0xa2bfe8a1U;

  ad[661] = ((rotate((z)(ad[566]), (z)25) ^ rotate((z)(ad[566]), (z)14) ^ ((ad[566]) >> 3U))) + ad[554];
  ad[659] = ((rotate((z)(ad[651]), (z)15) ^ rotate((z)(ad[651]), (z)13) ^ ((ad[651]) >> 10U))) + ad[658];
  ad[831] = ad[813] + ad[656];
  ad[828] = ad[810] + ad[827];
  ad[825] = ad[822] + ad[824];

  ad[832] = (bitselect((z)ad[818], (z)ad[823], (z)ad[828]) + ad[831]) + ((rotate((z)(ad[828]), (z)26) ^ rotate((z)(ad[828]), (z)21) ^ rotate((z)(ad[828]), (z)7)));
  ad[829] = bitselect((z)ad[820], (z)ad[815], (z)ad[825] ^ (z)ad[820]) + ((rotate((z)(ad[825]), (z)30) ^ rotate((z)(ad[825]), (z)19) ^ rotate((z)(ad[825]), (z)10)));
  ad[662] = ad[636] + ad[661];
  ad[660] = ad[659] + 0xa81a664bU;

  ad[665] = ((rotate((z)(ad[567]), (z)25) ^ rotate((z)(ad[567]), (z)14) ^ ((ad[567]) >> 3U))) + ad[566];
  ad[663] = ((rotate((z)(ad[655]), (z)15) ^ rotate((z)(ad[655]), (z)13) ^ ((ad[655]) >> 10U))) + ad[662];
  ad[836] = ad[818] + ad[660];
  ad[833] = ad[815] + ad[832];
  ad[830] = ad[827] + ad[829];

  ad[837] = (bitselect((z)ad[823], (z)ad[828], (z)ad[833]) + ad[836]) + ((rotate((z)(ad[833]), (z)26) ^ rotate((z)(ad[833]), (z)21) ^ rotate((z)(ad[833]), (z)7)));
  ad[834] = bitselect((z)ad[825], (z)ad[820], (z)ad[830] ^ (z)ad[825]) + ((rotate((z)(ad[830]), (z)30) ^ rotate((z)(ad[830]), (z)19) ^ rotate((z)(ad[830]), (z)10)));
  ad[666] = ad[640] + ad[665];
  ad[664] = ad[663] + 0xc24b8b70U;

  ad[669] = ((rotate((z)(ad[614]), (z)25) ^ rotate((z)(ad[614]), (z)14) ^ ((ad[614]) >> 3U))) + ad[567];
  ad[667] = ((rotate((z)(ad[659]), (z)15) ^ rotate((z)(ad[659]), (z)13) ^ ((ad[659]) >> 10U))) + ad[666];
  ad[841] = ad[823] + ad[664];
  ad[838] = ad[820] + ad[837];
  ad[835] = ad[832] + ad[834];

  ad[842] = (bitselect((z)ad[828], (z)ad[833], (z)ad[838]) + ad[841]) + ((rotate((z)(ad[838]), (z)26) ^ rotate((z)(ad[838]), (z)21) ^ rotate((z)(ad[838]), (z)7)));
  ad[839] = bitselect((z)ad[830], (z)ad[825], (z)ad[835] ^ (z)ad[830]) + ((rotate((z)(ad[835]), (z)30) ^ rotate((z)(ad[835]), (z)19) ^ rotate((z)(ad[835]), (z)10)));
  ad[670] = ad[644] + ad[669];
  ad[668] = ad[667] + 0xc76c51a3U;

  ad[677] = ((rotate((z)(ad[616]), (z)25) ^ rotate((z)(ad[616]), (z)14) ^ ((ad[616]) >> 3U))) + ad[614];
  ad[671] = ((rotate((z)(ad[663]), (z)15) ^ rotate((z)(ad[663]), (z)13) ^ ((ad[663]) >> 10U))) + ad[670];
  ad[846] = ad[828] + ad[668];
  ad[843] = ad[825] + ad[842];
  ad[840] = ad[837] + ad[839];

  ad[847] = (bitselect((z)ad[833], (z)ad[838], (z)ad[843]) + ad[846]) + ((rotate((z)(ad[843]), (z)26) ^ rotate((z)(ad[843]), (z)21) ^ rotate((z)(ad[843]), (z)7)));
  ad[844] = bitselect((z)ad[835], (z)ad[830], (z)ad[840] ^ (z)ad[835]) + ((rotate((z)(ad[840]), (z)30) ^ rotate((z)(ad[840]), (z)19) ^ rotate((z)(ad[840]), (z)10)));
  ad[678] = ad[648] + ad[677];
  ad[676] = ad[671] + 0xd192e819U;

  ad[682] = ((rotate((z)(ad[619]), (z)25) ^ rotate((z)(ad[619]), (z)14) ^ ((ad[619]) >> 3U))) + ad[616];
  ad[679] = ((rotate((z)(ad[667]), (z)15) ^ rotate((z)(ad[667]), (z)13) ^ ((ad[667]) >> 10U))) + ad[678];
  ad[851] = ad[833] + ad[676];
  ad[848] = ad[830] + ad[847];
  ad[845] = ad[842] + ad[844];

  ad[852] = (bitselect((z)ad[838], (z)ad[843], (z)ad[848]) + ad[851]) + ((rotate((z)(ad[848]), (z)26) ^ rotate((z)(ad[848]), (z)21) ^ rotate((z)(ad[848]), (z)7)));
  ad[849] = bitselect((z)ad[840], (z)ad[835], (z)ad[845] ^ (z)ad[840]) + ((rotate((z)(ad[845]), (z)30) ^ rotate((z)(ad[845]), (z)19) ^ rotate((z)(ad[845]), (z)10)));
  ad[683] = ad[651] + ad[682];
  ad[680] = ad[679] + 0xd6990624U;

  ad[686] = ((rotate((z)(ad[622]), (z)25) ^ rotate((z)(ad[622]), (z)14) ^ ((ad[622]) >> 3U))) + ad[619];
  ad[684] = ((rotate((z)(ad[671]), (z)15) ^ rotate((z)(ad[671]), (z)13) ^ ((ad[671]) >> 10U))) + ad[683];
  ad[856] = ad[838] + ad[680];
  ad[853] = ad[835] + ad[852];
  ad[850] = ad[847] + ad[849];

  ad[857] = (bitselect((z)ad[843], (z)ad[848], (z)ad[853]) + ad[856]) + ((rotate((z)(ad[853]), (z)26) ^ rotate((z)(ad[853]), (z)21) ^ rotate((z)(ad[853]), (z)7)));
  ad[854] = bitselect((z)ad[845], (z)ad[840], (z)ad[850] ^ (z)ad[845]) + ((rotate((z)(ad[850]), (z)30) ^ rotate((z)(ad[850]), (z)19) ^ rotate((z)(ad[850]), (z)10)));
  ad[687] = ad[655] + ad[686];
  ad[685] = ad[684] + 0xf40e3585U;

  ad[690] = ((rotate((z)(ad[627]), (z)25) ^ rotate((z)(ad[627]), (z)14) ^ ((ad[627]) >> 3U))) + ad[622];
  ad[688] = ((rotate((z)(ad[679]), (z)15) ^ rotate((z)(ad[679]), (z)13) ^ ((ad[679]) >> 10U))) + ad[687];
  ad[861] = ad[843] + ad[685];
  ad[858] = ad[840] + ad[857];
  ad[855] = ad[852] + ad[854];

  ad[862] = (bitselect((z)ad[848], (z)ad[853], (z)ad[858]) + ad[861]) + ((rotate((z)(ad[858]), (z)26) ^ rotate((z)(ad[858]), (z)21) ^ rotate((z)(ad[858]), (z)7)));
  ad[859] = bitselect((z)ad[850], (z)ad[845], (z)ad[855] ^ (z)ad[850]) + ((rotate((z)(ad[855]), (z)30) ^ rotate((z)(ad[855]), (z)19) ^ rotate((z)(ad[855]), (z)10)));
  ad[691] = ad[659] + ad[690];
  ad[689] = ad[688] + 0x106aa070U;

  ad[694] = ((rotate((z)(ad[631]), (z)25) ^ rotate((z)(ad[631]), (z)14) ^ ((ad[631]) >> 3U))) + ad[627];
  ad[692] = ((rotate((z)(ad[684]), (z)15) ^ rotate((z)(ad[684]), (z)13) ^ ((ad[684]) >> 10U))) + ad[691];
  ad[866] = ad[848] + ad[689];
  ad[863] = ad[845] + ad[862];
  ad[860] = ad[857] + ad[859];

  ad[867] = (bitselect((z)ad[853], (z)ad[858], (z)ad[863]) + ad[866]) + ((rotate((z)(ad[863]), (z)26) ^ rotate((z)(ad[863]), (z)21) ^ rotate((z)(ad[863]), (z)7)));
  ad[864] = bitselect((z)ad[855], (z)ad[850], (z)ad[860] ^ (z)ad[855]) + ((rotate((z)(ad[860]), (z)30) ^ rotate((z)(ad[860]), (z)19) ^ rotate((z)(ad[860]), (z)10)));
  ad[695] = ad[663] + ad[694];
  ad[693] = ad[692] + 0x19a4c116U;

  ad[698] = ((rotate((z)(ad[636]), (z)25) ^ rotate((z)(ad[636]), (z)14) ^ ((ad[636]) >> 3U))) + ad[631];
  ad[696] = ((rotate((z)(ad[688]), (z)15) ^ rotate((z)(ad[688]), (z)13) ^ ((ad[688]) >> 10U))) + ad[695];
  ad[871] = ad[853] + ad[693];
  ad[868] = ad[850] + ad[867];
  ad[865] = ad[862] + ad[864];

  ad[873] = (bitselect((z)ad[858], (z)ad[863], (z)ad[868]) + ad[871]) + ((rotate((z)(ad[868]), (z)26) ^ rotate((z)(ad[868]), (z)21) ^ rotate((z)(ad[868]), (z)7)));
  ad[869] = bitselect((z)ad[860], (z)ad[855], (z)ad[865] ^ (z)ad[860]) + ((rotate((z)(ad[865]), (z)30) ^ rotate((z)(ad[865]), (z)19) ^ rotate((z)(ad[865]), (z)10)));
  ad[699] = ad[667] + ad[698];
  ad[697] = ad[696] + 0x1e376c08U;

  ad[702] = ((rotate((z)(ad[640]), (z)25) ^ rotate((z)(ad[640]), (z)14) ^ ((ad[640]) >> 3U))) + ad[636];
  ad[700] = ((rotate((z)(ad[692]), (z)15) ^ rotate((z)(ad[692]), (z)13) ^ ((ad[692]) >> 10U))) + ad[699];
  ad[877] = ad[858] + ad[697];
  ad[874] = ad[855] + ad[873];
  ad[870] = ad[867] + ad[869];

  ad[878] = (bitselect((z)ad[863], (z)ad[868], (z)ad[874]) + ad[877]) + ((rotate((z)(ad[874]), (z)26) ^ rotate((z)(ad[874]), (z)21) ^ rotate((z)(ad[874]), (z)7)));
  ad[875] = bitselect((z)ad[865], (z)ad[860], (z)ad[870] ^ (z)ad[865]) + ((rotate((z)(ad[870]), (z)30) ^ rotate((z)(ad[870]), (z)19) ^ rotate((z)(ad[870]), (z)10)));
  ad[703] = ad[671] + ad[702];
  ad[701] = ad[700] + 0x2748774cU;

  ad[706] = ((rotate((z)(ad[644]), (z)25) ^ rotate((z)(ad[644]), (z)14) ^ ((ad[644]) >> 3U))) + ad[640];
  ad[704] = ((rotate((z)(ad[696]), (z)15) ^ rotate((z)(ad[696]), (z)13) ^ ((ad[696]) >> 10U))) + ad[703];
  ad[882] = ad[863] + ad[701];
  ad[879] = ad[860] + ad[878];
  ad[876] = ad[873] + ad[875];

  ad[883] = (bitselect((z)ad[868], (z)ad[874], (z)ad[879]) + ad[882]) + ((rotate((z)(ad[879]), (z)26) ^ rotate((z)(ad[879]), (z)21) ^ rotate((z)(ad[879]), (z)7)));
  ad[880] = bitselect((z)ad[870], (z)ad[865], (z)ad[876] ^ (z)ad[870]) + ((rotate((z)(ad[876]), (z)30) ^ rotate((z)(ad[876]), (z)19) ^ rotate((z)(ad[876]), (z)10)));
  ad[707] = ad[679] + ad[706];
  ad[705] = ad[704] + 0x34b0bcb5U;

  ad[710] = ((rotate((z)(ad[648]), (z)25) ^ rotate((z)(ad[648]), (z)14) ^ ((ad[648]) >> 3U))) + ad[644];
  ad[708] = ((rotate((z)(ad[700]), (z)15) ^ rotate((z)(ad[700]), (z)13) ^ ((ad[700]) >> 10U))) + ad[707];
  ad[887] = ad[868] + ad[705];
  ad[884] = ad[865] + ad[883];
  ad[881] = ad[878] + ad[880];

  ad[888] = (bitselect((z)ad[874], (z)ad[879], (z)ad[884]) + ad[887]) + ((rotate((z)(ad[884]), (z)26) ^ rotate((z)(ad[884]), (z)21) ^ rotate((z)(ad[884]), (z)7)));
  ad[885] = bitselect((z)ad[876], (z)ad[870], (z)ad[881] ^ (z)ad[876]) + ((rotate((z)(ad[881]), (z)30) ^ rotate((z)(ad[881]), (z)19) ^ rotate((z)(ad[881]), (z)10)));
  ad[711] = ad[684] + ad[710];
  ad[709] = ad[708] + 0x391c0cb3U;

  ad[714] = ((rotate((z)(ad[651]), (z)25) ^ rotate((z)(ad[651]), (z)14) ^ ((ad[651]) >> 3U))) + ad[648];
  ad[712] = ((rotate((z)(ad[704]), (z)15) ^ rotate((z)(ad[704]), (z)13) ^ ((ad[704]) >> 10U))) + ad[711];
  ad[892] = ad[874] + ad[709];
  ad[889] = ad[870] + ad[888];
  ad[886] = ad[883] + ad[885];

  ad[893] = (bitselect((z)ad[879], (z)ad[884], (z)ad[889]) + ad[892]) + ((rotate((z)(ad[889]), (z)26) ^ rotate((z)(ad[889]), (z)21) ^ rotate((z)(ad[889]), (z)7)));
  ad[890] = bitselect((z)ad[881], (z)ad[876], (z)ad[886] ^ (z)ad[881]) + ((rotate((z)(ad[886]), (z)30) ^ rotate((z)(ad[886]), (z)19) ^ rotate((z)(ad[886]), (z)10)));
  ad[715] = ad[688] + ad[714];
  ad[713] = ad[712] + 0x4ed8aa4aU;

  ad[718] = ((rotate((z)(ad[655]), (z)25) ^ rotate((z)(ad[655]), (z)14) ^ ((ad[655]) >> 3U))) + ad[651];
  ad[716] = ((rotate((z)(ad[708]), (z)15) ^ rotate((z)(ad[708]), (z)13) ^ ((ad[708]) >> 10U))) + ad[715];
  ad[897] = ad[879] + ad[713];
  ad[894] = ad[876] + ad[893];
  ad[891] = ad[888] + ad[890];

  ad[898] = (bitselect((z)ad[884], (z)ad[889], (z)ad[894]) + ad[897]) + ((rotate((z)(ad[894]), (z)26) ^ rotate((z)(ad[894]), (z)21) ^ rotate((z)(ad[894]), (z)7)));
  ad[895] = bitselect((z)ad[886], (z)ad[881], (z)ad[891] ^ (z)ad[886]) + ((rotate((z)(ad[891]), (z)30) ^ rotate((z)(ad[891]), (z)19) ^ rotate((z)(ad[891]), (z)10)));
  ad[719] = ad[692] + ad[718];
  ad[717] = ad[716] + 0x5b9cca4fU;

  ad[722] = ((rotate((z)(ad[659]), (z)25) ^ rotate((z)(ad[659]), (z)14) ^ ((ad[659]) >> 3U))) + ad[655];
  ad[720] = ((rotate((z)(ad[712]), (z)15) ^ rotate((z)(ad[712]), (z)13) ^ ((ad[712]) >> 10U))) + ad[719];
  ad[902] = ad[884] + ad[717];
  ad[899] = ad[881] + ad[898];
  ad[896] = ad[893] + ad[895];

  ad[903] = (bitselect((z)ad[889], (z)ad[894], (z)ad[899]) + ad[902]) + ((rotate((z)(ad[899]), (z)26) ^ rotate((z)(ad[899]), (z)21) ^ rotate((z)(ad[899]), (z)7)));
  ad[900] = bitselect((z)ad[891], (z)ad[886], (z)ad[896] ^ (z)ad[891]) + ((rotate((z)(ad[896]), (z)30) ^ rotate((z)(ad[896]), (z)19) ^ rotate((z)(ad[896]), (z)10)));
  ad[723] = ad[696] + ad[722];
  ad[721] = ad[720] + 0x682e6ff3U;

  ad[672] = ((rotate((z)(ad[663]), (z)25) ^ rotate((z)(ad[663]), (z)14) ^ ((ad[663]) >> 3U))) + ad[659];
  ad[724] = ((rotate((z)(ad[716]), (z)15) ^ rotate((z)(ad[716]), (z)13) ^ ((ad[716]) >> 10U))) + ad[723];
  ad[907] = ad[889] + ad[721];
  ad[904] = ad[886] + ad[903];
  ad[901] = ad[898] + ad[900];

  ad[908] = (bitselect((z)ad[894], (z)ad[899], (z)ad[904]) + ad[907]) + ((rotate((z)(ad[904]), (z)26) ^ rotate((z)(ad[904]), (z)21) ^ rotate((z)(ad[904]), (z)7)));
  ad[905] = bitselect((z)ad[896], (z)ad[891], (z)ad[901] ^ (z)ad[896]) + ((rotate((z)(ad[901]), (z)30) ^ rotate((z)(ad[901]), (z)19) ^ rotate((z)(ad[901]), (z)10)));
  ad[673] = ((rotate((z)(ad[667]), (z)25) ^ rotate((z)(ad[667]), (z)14) ^ ((ad[667]) >> 3U))) + ad[663];
  ad[726] = ad[700] + ad[672];
  ad[725] = ad[724] + 0x748f82eeU;

  ad[727] = ((rotate((z)(ad[720]), (z)15) ^ rotate((z)(ad[720]), (z)13) ^ ((ad[720]) >> 10U))) + ad[726];
  ad[912] = ad[894] + ad[725];
  ad[909] = ad[891] + ad[908];
  ad[906] = ad[903] + ad[905];
  ad[675] = ad[667] + 0x8cc70208U;
  ad[729] = ad[704] + ad[673];

  ad[913] = (bitselect((z)ad[899], (z)ad[904], (z)ad[909]) + ad[912]) + ((rotate((z)(ad[909]), (z)26) ^ rotate((z)(ad[909]), (z)21) ^ rotate((z)(ad[909]), (z)7)));
  ad[910] = bitselect((z)ad[901], (z)ad[896], (z)ad[906] ^ (z)ad[901]) + ((rotate((z)(ad[906]), (z)30) ^ rotate((z)(ad[906]), (z)19) ^ rotate((z)(ad[906]), (z)10)));
  ad[674] = ((rotate((z)(ad[671]), (z)25) ^ rotate((z)(ad[671]), (z)14) ^ ((ad[671]) >> 3U))) + ad[675];
  ad[730] = ((rotate((z)(ad[724]), (z)15) ^ rotate((z)(ad[724]), (z)13) ^ ((ad[724]) >> 10U))) + ad[729];
  ad[728] = ad[727] + 0x78a5636fU;

  ad[681] = ((rotate((z)(ad[679]), (z)25) ^ rotate((z)(ad[679]), (z)14) ^ ((ad[679]) >> 3U))) + ad[671];
  ad[917] = ad[899] + ad[901] + ad[728];
  ad[914] = ad[896] + ad[913];
  ad[911] = ad[908] + ad[910];
  ad[732] = ad[708] + ad[674];
  ad[731] = ad[730] + 0x84c87814U;

  ad[918] = (bitselect((z)ad[904], (z)ad[909], (z)ad[914]) + ad[917]) + ((rotate((z)(ad[914]), (z)26) ^ rotate((z)(ad[914]), (z)21) ^ rotate((z)(ad[914]), (z)7)));
  ad[915] = bitselect((z)ad[906], (z)ad[901], (z)ad[911] ^ (z)ad[906]) + ((rotate((z)(ad[911]), (z)30) ^ rotate((z)(ad[911]), (z)19) ^ rotate((z)(ad[911]), (z)10)));
  ad[733] = ((rotate((z)(ad[727]), (z)15) ^ rotate((z)(ad[727]), (z)13) ^ ((ad[727]) >> 10U))) + ad[732];
  ad[919] = ad[906] + ad[904] + ad[731];
  ad[734] = ad[712] + ad[681];

  ad[920] = (bitselect((z)ad[909], (z)ad[914], (z)ad[918]) + ad[919]) + ((rotate((z)(ad[918]), (z)26) ^ rotate((z)(ad[918]), (z)21) ^ rotate((z)(ad[918]), (z)7)));
  ad[735] = ((rotate((z)(ad[730]), (z)15) ^ rotate((z)(ad[730]), (z)13) ^ ((ad[730]) >> 10U))) + ad[734];
  ad[921] = ad[911] + ad[909] + ad[733];
  ad[916] = ad[913] + ad[915];

  ad[922] = (bitselect((z)ad[914], (z)ad[918], (z)ad[920]) + ad[921]) + ((rotate((z)(ad[920]), (z)26) ^ rotate((z)(ad[920]), (z)21) ^ rotate((z)(ad[920]), (z)7)));
  ad[923] = ad[916] + ad[914] + ad[735];

  ad[924] = (bitselect((z)ad[918], (z)ad[920], (z)ad[922]) + ad[923]) + ((rotate((z)(ad[922]), (z)26) ^ rotate((z)(ad[922]), (z)21) ^ rotate((z)(ad[922]), (z)7)));
  if (ad[924] == 0x136032EDU)
    ac[ac[(0xFF)]++] = ae;
}