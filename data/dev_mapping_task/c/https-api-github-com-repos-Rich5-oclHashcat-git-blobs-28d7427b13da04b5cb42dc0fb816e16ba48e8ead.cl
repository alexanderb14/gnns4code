typedef uchar u8; typedef ushort u16; typedef uint u32; typedef ulong u64; typedef uchar u8x; typedef ushort u16x; typedef uint u32x; typedef ulong u64x; inline u32 A(u64 a) {
  const u32 b = (u32)(a);

  return b;
}

inline u32 B(u64 a) {
  a >>= 32;

  const u32 b = (u32)(a);

  return b;
}

inline u64 C(const u32 a, const u32 b) {
  return __builtin_astype((uint2)(b, a), ulong);
}

inline u32x D(u64x a) {
  u32x b;

  b = (u32)a;
  return b;
}

inline u32x E(u64x a) {
  a >>= 32;

  u32x b;

  b = (u32)a;
  return b;
}

inline u64x F(const u32x a, const u32x b) {
  u64x c;

  c = __builtin_astype((uint2)(b, a), ulong);
  return c;
}
inline u32 G(const u32 a) {
  return (__builtin_astype(__builtin_astype(a, uchar4).s3210, uint));
}

inline u64 H(const u64 a) {
  return (__builtin_astype(__builtin_astype(a, uchar8).s76543210, ulong));
}

inline u32 I(const u32 a, const u32 b) {
  return rotate(a, 32 - b);
}

inline u32 J(const u32 a, const u32 b) {
  return rotate(a, b);
}

inline u64 K(const u64 a, const u32 b) {
  return rotate(a, (u64)64 - b);
}

inline u64 L(const u64 a, const u32 b) {
  return rotate(a, (u64)b);
}

inline u32x M(const u32x a) {
  return ((a >> 24) & 0x000000ff) | ((a >> 8) & 0x0000ff00) | ((a << 8) & 0x00ff0000) | ((a << 24) & 0xff000000);
}

inline u64x N(const u64x a) {
  return ((a >> 56) & 0x00000000000000ff) | ((a >> 40) & 0x000000000000ff00) | ((a >> 24) & 0x0000000000ff0000) | ((a >> 8) & 0x00000000ff000000) | ((a << 8) & 0x000000ff00000000) | ((a << 24) & 0x0000ff0000000000) | ((a << 40) & 0x00ff000000000000) | ((a << 56) & 0xff00000000000000);
}

inline u32x O(const u32x a, const u32 b) {
  return rotate(a, 32 - b);
}

inline u32x P(const u32x a, const u32 b) {
  return rotate(a, b);
}

inline u64x Q(const u64x a, const u32 b) {
  return rotate(a, (u64)64 - b);
}

inline u64x R(const u64x a, const u32 b) {
  return rotate(a, (u64)b);
}

inline u32x S(const u32x a, const u32x b, const u32x c) {
  return (((a) >> (b)) & (((u32x)(1u) << (c)) - 1));
}

inline u32 T(const u32 a, const u32 b, const u32 c) {
  return (((a) >> (b)) & ((1u << (c)) - 1));
}

inline u32x U(const u32x a, const u32x b, const u32 c) {
  const u64x d = ((((u64x)(a)) << 32) | ((u64x)(b))) >> ((c & 3) * 8);

  return (u32x)(d);
}

inline u32 V(const u32 a, const u32 b, const u32 c) {
  const u64 d = ((((u64)a) << 32) | ((u64)b)) >> ((c & 3) * 8);

  return (u32)(d);
}

typedef struct { u32 digest_buf[5]; } digest_t;

typedef struct {
  u32 salt_buf[16];
  u32 salt_buf_pc[8];

  u32 salt_len;
  u32 salt_iter;
  u32 salt_sign[2];

  u32 keccak_mdlen;
  u32 truecrypt_mdlen;

  u32 digests_cnt;
  u32 digests_done;

  u32 digests_offset;

  u32 scrypt_N;
  u32 scrypt_r;
  u32 scrypt_p;
  u32 scrypt_tmto;
  u32 scrypt_phy;

} salt_t;

typedef struct {
  int V;
  int R;
  int P;

  int enc_md;

  u32 id_buf[8];
  u32 u_buf[32];
  u32 o_buf[32];

  int id_len;
  int o_len;
  int u_len;

  u32 rc4key[2];
  u32 rc4data[2];

} pdf_t;

typedef struct {
  u32 pke[25];
  u32 eapol[64];
  int eapol_size;
  int keyver;
  u8 orig_mac1[6];
  u8 orig_mac2[6];
  u8 orig_nonce1[32];
  u8 orig_nonce2[32];

} wpa_t;

typedef struct {
  u32 cry_master_buf[64];
  u32 ckey_buf[64];
  u32 public_key_buf[64];

  u32 cry_master_len;
  u32 ckey_len;
  u32 public_key_len;

} bitcoin_wallet_t;

typedef struct {
  u32 salt_buf[30];
  u32 salt_len;

  u32 esalt_buf[38];
  u32 esalt_len;

} sip_t;

typedef struct { u32 data[384]; } androidfde_t;

typedef struct {
  u32 nr_buf[16];
  u32 nr_len;

  u32 msg_buf[128];
  u32 msg_len;

} ikepsk_t;

typedef struct {
  u32 user_len;
  u32 domain_len;
  u32 srvchall_len;
  u32 clichall_len;

  u32 userdomain_buf[64];
  u32 chall_buf[256];

} netntlm_t;

typedef struct {
  u32 user[16];
  u32 realm[16];
  u32 salt[32];
  u32 timestamp[16];
  u32 checksum[4];

} krb5pa_t;

typedef struct {
  u32 account_info[512];
  u32 checksum[4];
  u32 edata2[2560];
  u32 edata2_len;

} krb5tgs_t;

typedef struct {
  u32 salt_buf[16];
  u32 data_buf[112];
  u32 keyfile_buf[16];
  u32 signature;

} tc_t;

typedef struct { u32 salt_buf[16]; } pbkdf2_md5_t;

typedef struct { u32 salt_buf[16]; } pbkdf2_sha1_t;

typedef struct { u32 salt_buf[16]; } pbkdf2_sha256_t;

typedef struct { u32 salt_buf[32]; } pbkdf2_sha512_t;

typedef struct {
  u32 salt_buf[128];
  u32 salt_len;

} rakp_t;

typedef struct {
  u32 data_len;
  u32 data_buf[512];

} cloudkey_t;

typedef struct {
  u32 encryptedVerifier[4];
  u32 encryptedVerifierHash[5];

  u32 keySize;

} office2007_t;

typedef struct {
  u32 encryptedVerifier[4];
  u32 encryptedVerifierHash[8];

} office2010_t;

typedef struct {
  u32 encryptedVerifier[4];
  u32 encryptedVerifierHash[8];

} office2013_t;

typedef struct {
  u32 version;
  u32 encryptedVerifier[4];
  u32 encryptedVerifierHash[4];
  u32 rc4key[2];

} oldoffice01_t;

typedef struct {
  u32 version;
  u32 encryptedVerifier[4];
  u32 encryptedVerifierHash[5];
  u32 rc4key[2];

} oldoffice34_t;

typedef struct {
  u32 salt_buf[128];
  u32 salt_len;

  u32 pc_digest[5];
  u32 pc_offset;

} pstoken_t;

typedef struct {
  u32 type;
  u32 mode;
  u32 magic;
  u32 salt_len;
  u32 salt_buf[4];
  u32 verify_bytes;
  u32 compress_length;
  u32 data_len;
  u32 data_buf[2048];
  u32 auth_len;
  u32 auth_buf[4];

} zip2_t;

typedef struct { u32 salt_buf[32]; } win8phone_t;

typedef struct {
  u32 version;
  u32 algorithm;

  u32 keyfile_len;
  u32 keyfile[8];

  u32 final_random_seed[8];
  u32 transf_random_seed[8];
  u32 enc_iv[4];
  u32 contents_hash[8];

  u32 contents_len;
  u32 contents[75000];

  u32 expected_bytes[8];

} keepass_t;

typedef struct {
  u32 digest[4];
  u32 out[4];

} pdf14_tmp_t;

typedef struct {
  union {
    u32 dgst32[16];
    u64 dgst64[8];
  };

  u32 dgst_len;
  u32 W_len;

} pdf17l8_tmp_t;

typedef struct { u32 digest_buf[4]; } phpass_tmp_t;

typedef struct { u32 digest_buf[4]; } md5crypt_tmp_t;

typedef struct {
  u32 alt_result[8];

  u32 p_bytes[4];
  u32 s_bytes[4];

} sha256crypt_tmp_t;

typedef struct {
  u64 l_alt_result[8];

  u64 l_p_bytes[2];
  u64 l_s_bytes[2];

} sha512crypt_tmp_t;

typedef struct {
  u32 ipad[5];
  u32 opad[5];

  u32 dgst[10];
  u32 out[10];

} wpa_tmp_t;

typedef struct { u64 dgst[8]; } bitcoin_wallet_tmp_t;

typedef struct {
  u32 ipad[5];
  u32 opad[5];

  u32 dgst[5];
  u32 out[4];

} dcc2_tmp_t;

typedef struct {
  u32 E[18];

  u32 P[18];

  u32 S0[256];
  u32 S1[256];
  u32 S2[256];
  u32 S3[256];

} bcrypt_tmp_t;

typedef struct {
  u32 digest[2];

  u32 P[18];

  u32 S0[256];
  u32 S1[256];
  u32 S2[256];
  u32 S3[256];

} pwsafe2_tmp_t;

typedef struct { u32 digest_buf[8]; } pwsafe3_tmp_t;

typedef struct { u32 digest_buf[5]; } androidpin_tmp_t;

typedef struct {
  u32 ipad[5];
  u32 opad[5];

  u32 dgst[10];
  u32 out[10];

} androidfde_tmp_t;

typedef struct {
  u32 ipad[16];
  u32 opad[16];

  u32 dgst[64];
  u32 out[64];

} tc_tmp_t;

typedef struct {
  u64 ipad[8];
  u64 opad[8];

  u64 dgst[32];
  u64 out[32];

} tc64_tmp_t;

typedef struct {
  u32 ipad[4];
  u32 opad[4];

  u32 dgst[32];
  u32 out[32];

} pbkdf2_md5_tmp_t;

typedef struct {
  u32 ipad[5];
  u32 opad[5];

  u32 dgst[32];
  u32 out[32];

} pbkdf2_sha1_tmp_t;

typedef struct {
  u32 ipad[8];
  u32 opad[8];

  u32 dgst[32];
  u32 out[32];

} pbkdf2_sha256_tmp_t;

typedef struct {
  u64 ipad[8];
  u64 opad[8];

  u64 dgst[16];
  u64 out[16];

} pbkdf2_sha512_tmp_t;

typedef struct { u64 out[8]; } ecryptfs_tmp_t;

typedef struct {
  u64 ipad[8];
  u64 opad[8];

  u64 dgst[16];
  u64 out[16];

} oraclet_tmp_t;

typedef struct {
  u32 ipad[5];
  u32 opad[5];

  u32 dgst[5];
  u32 out[5];

} agilekey_tmp_t;

typedef struct {
  u32 ipad[5];
  u32 opad[5];

  u32 dgst1[5];
  u32 out1[5];

  u32 dgst2[5];
  u32 out2[5];

} mywallet_tmp_t;

typedef struct {
  u32 ipad[5];
  u32 opad[5];

  u32 dgst[5];
  u32 out[5];

} sha1aix_tmp_t;

typedef struct {
  u32 ipad[8];
  u32 opad[8];

  u32 dgst[8];
  u32 out[8];

} sha256aix_tmp_t;

typedef struct {
  u64 ipad[8];
  u64 opad[8];

  u64 dgst[8];
  u64 out[8];

} sha512aix_tmp_t;

typedef struct {
  u32 ipad[8];
  u32 opad[8];

  u32 dgst[8];
  u32 out[8];

} lastpass_tmp_t;

typedef struct { u64 digest_buf[8]; } drupal7_tmp_t;

typedef struct {
  u32 ipad[5];
  u32 opad[5];

  u32 dgst[5];
  u32 out[5];

} lotus8_tmp_t;

typedef struct { u32 out[5]; } office2007_tmp_t;

typedef struct { u32 out[5]; } office2010_tmp_t;

typedef struct { u64 out[8]; } office2013_tmp_t;

typedef struct { u32 digest_buf[5]; } saph_sha1_tmp_t;

typedef struct {
  u32 block[16];

  u32 dgst[8];

  u32 block_len;
  u32 final_len;

} seven_zip_tmp_t;

typedef struct {
  u32 KEK[4];
  u32 lsb[4];
  u32 cipher[4];

} axcrypt_tmp_t;

typedef struct { u32 tmp_digest[8]; } keepass_tmp_t;

typedef struct {
  u32 Kc[16];
  u32 Kd[16];

  u32 iv[2];

} bsdicrypt_tmp_t;

typedef struct { u32 dgst[17][5]; } rar3_tmp_t;

typedef struct { u32 user[16]; } cram_md5_t;

typedef struct {
  u32 iv_buf[4];
  u32 iv_len;

  u32 salt_buf[4];
  u32 salt_len;

  u32 crc;

  u32 data_buf[96];
  u32 data_len;

  u32 unpack_size;

} seven_zip_t;

typedef struct {
  u32 key;
  u64 val;

} hcstat_table_t;

typedef struct {
  u32 cs_buf[0x100];
  u32 cs_len;

} cs_t;

typedef struct { u32 cmds[0x100]; } kernel_rule_t;

typedef struct {
  u32 salt_pos;
  u32 digest_pos;
  u32 hash_pos;
  u32 gidvid;
  u32 il_pos;

} plain_t;

typedef struct {
  u32 i[16];

  u32 pw_len;

  u32 alignment_placeholder_1;
  u32 alignment_placeholder_2;
  u32 alignment_placeholder_3;

} pw_t;

typedef struct { u32 i; } bf_t;

typedef struct {
  u32 i[8];

  u32 pw_len;

} comb_t;

typedef struct { u32 b[32]; } bs_word_t;

typedef struct { uint4 P[64]; } scrypt_tmp_t;
inline int W(const u32 a[4], __global u32* b) {
  if (a[3] > b[1])
    return (1);
  if (a[3] < b[1])
    return (-1);
  if (a[2] > b[2])
    return (1);
  if (a[2] < b[2])
    return (-1);
  if (a[1] > b[4])
    return (1);
  if (a[1] < b[4])
    return (-1);
  if (a[0] > b[3])
    return (1);
  if (a[0] < b[3])
    return (-1);

  return (0);
}

inline int X(const u32 a[4], const u32 b, __global digest_t* c) {
  for (u32 d = 0, e = b; e; e >>= 1) {
    const u32 f = e >> 1;

    const u32 g = d + f;

    const int h = W(a, c[g].digest_buf);

    if (h > 0) {
      d += f + 1;

      e--;
    }

    if (h == 0)
      return (g);
  }

  return (-1);
}

inline u32 Y(__global u32* a, const u32 b, const u32 c, const u32 d) {
  return (a[(d >> c) & b] & (1 << (d & 0x1f)));
}

inline u32 Z(const u32 a[2], __global u32* b, __global u32* c, __global u32* d, __global u32* e, __global u32* f, __global u32* g, __global u32* h, __global u32* i, const u32 j, const u32 k, const u32 l) {
  if (Y(b, j, k, a[0]) == 0)
    return (0);
  if (Y(c, j, k, a[1]) == 0)
    return (0);
  if (Y(d, j, k, a[2]) == 0)
    return (0);
  if (Y(e, j, k, a[3]) == 0)
    return (0);

  if (Y(f, j, l, a[0]) == 0)
    return (0);
  if (Y(g, j, l, a[1]) == 0)
    return (0);
  if (Y(h, j, l, a[2]) == 0)
    return (0);
  if (Y(i, j, l, a[3]) == 0)
    return (0);

  return (1);
}

inline void AA(__global plain_t* a, __global u32* b, const int c, const int d, const int e, const u32 f, const u32 g) {
  const u32 h = atomic_add(b, 1);

  a[h].salt_pos = c;
  a[h].digest_pos = d;
  a[h].hash_pos = e;
  a[h].gidvid = f;
  a[h].il_pos = g;
}

inline void AB(u32x a[4], const u32 b) {
  switch (b) {
    case 0:
      a[0] &= 0;
      a[1] &= 0;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 1:
      a[0] &= 0x000000FF;
      a[1] &= 0;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 2:
      a[0] &= 0x0000FFFF;
      a[1] &= 0;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 3:
      a[0] &= 0x00FFFFFF;
      a[1] &= 0;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 4:
      a[1] &= 0;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 5:
      a[1] &= 0x000000FF;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 6:
      a[1] &= 0x0000FFFF;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 7:
      a[1] &= 0x00FFFFFF;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 8:
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 9:
      a[2] &= 0x000000FF;
      a[3] &= 0;
      break;
    case 10:
      a[2] &= 0x0000FFFF;
      a[3] &= 0;
      break;
    case 11:
      a[2] &= 0x00FFFFFF;
      a[3] &= 0;
      break;
    case 12:
      a[3] &= 0;
      break;
    case 13:
      a[3] &= 0x000000FF;
      break;
    case 14:
      a[3] &= 0x0000FFFF;
      break;
    case 15:
      a[3] &= 0x00FFFFFF;
      break;
  }
}

inline void AC(const u32x a[4], u32x b[4], u32x c[4]) {
  c[3] = ((a[3] >> 8) & 0x00FF0000) | ((a[3] >> 16) & 0x000000FF);
  c[2] = ((a[3] << 8) & 0x00FF0000) | ((a[3] >> 0) & 0x000000FF);
  c[1] = ((a[2] >> 8) & 0x00FF0000) | ((a[2] >> 16) & 0x000000FF);
  c[0] = ((a[2] << 8) & 0x00FF0000) | ((a[2] >> 0) & 0x000000FF);
  b[3] = ((a[1] >> 8) & 0x00FF0000) | ((a[1] >> 16) & 0x000000FF);
  b[2] = ((a[1] << 8) & 0x00FF0000) | ((a[1] >> 0) & 0x000000FF);
  b[1] = ((a[0] >> 8) & 0x00FF0000) | ((a[0] >> 16) & 0x000000FF);
  b[0] = ((a[0] << 8) & 0x00FF0000) | ((a[0] >> 0) & 0x000000FF);
}

inline void AD(const u32x a[4], const u32x b[4], u32x c[4]) {
  c[0] = ((a[0] & 0x000000ff) >> 0) | ((a[0] & 0x00ff0000) >> 8) | ((a[1] & 0x000000ff) << 16) | ((a[1] & 0x00ff0000) << 8);
  c[1] = ((a[2] & 0x000000ff) >> 0) | ((a[2] & 0x00ff0000) >> 8) | ((a[3] & 0x000000ff) << 16) | ((a[3] & 0x00ff0000) << 8);
  c[2] = ((b[0] & 0x000000ff) >> 0) | ((b[0] & 0x00ff0000) >> 8) | ((b[1] & 0x000000ff) << 16) | ((b[1] & 0x00ff0000) << 8);
  c[3] = ((b[2] & 0x000000ff) >> 0) | ((b[2] & 0x00ff0000) >> 8) | ((b[3] & 0x000000ff) << 16) | ((b[3] & 0x00ff0000) << 8);
}

inline void AE(u32x a[4], const u32 b) {
  switch (b) {
    case 0:
      a[0] = 0x01;
      break;

    case 1:
      a[0] = a[0] | 0x0100;
      break;

    case 2:
      a[0] = a[0] | 0x010000;
      break;

    case 3:
      a[0] = a[0] | 0x01000000;
      break;

    case 4:
      a[1] = 0x01;
      break;

    case 5:
      a[1] = a[1] | 0x0100;
      break;

    case 6:
      a[1] = a[1] | 0x010000;
      break;

    case 7:
      a[1] = a[1] | 0x01000000;
      break;

    case 8:
      a[2] = 0x01;
      break;

    case 9:
      a[2] = a[2] | 0x0100;
      break;

    case 10:
      a[2] = a[2] | 0x010000;
      break;

    case 11:
      a[2] = a[2] | 0x01000000;
      break;

    case 12:
      a[3] = 0x01;
      break;

    case 13:
      a[3] = a[3] | 0x0100;
      break;

    case 14:
      a[3] = a[3] | 0x010000;
      break;

    case 15:
      a[3] = a[3] | 0x01000000;
      break;
  }
}

inline void AF(u32x a[4], u32x b[4], const u32 c) {
  switch (c) {
    case 0:
      a[0] = 0x01;
      break;

    case 1:
      a[0] = a[0] | 0x0100;
      break;

    case 2:
      a[0] = a[0] | 0x010000;
      break;

    case 3:
      a[0] = a[0] | 0x01000000;
      break;

    case 4:
      a[1] = 0x01;
      break;

    case 5:
      a[1] = a[1] | 0x0100;
      break;

    case 6:
      a[1] = a[1] | 0x010000;
      break;

    case 7:
      a[1] = a[1] | 0x01000000;
      break;

    case 8:
      a[2] = 0x01;
      break;

    case 9:
      a[2] = a[2] | 0x0100;
      break;

    case 10:
      a[2] = a[2] | 0x010000;
      break;

    case 11:
      a[2] = a[2] | 0x01000000;
      break;

    case 12:
      a[3] = 0x01;
      break;

    case 13:
      a[3] = a[3] | 0x0100;
      break;

    case 14:
      a[3] = a[3] | 0x010000;
      break;

    case 15:
      a[3] = a[3] | 0x01000000;
      break;

    case 16:
      b[0] = 0x01;
      break;

    case 17:
      b[0] = b[0] | 0x0100;
      break;

    case 18:
      b[0] = b[0] | 0x010000;
      break;

    case 19:
      b[0] = b[0] | 0x01000000;
      break;

    case 20:
      b[1] = 0x01;
      break;

    case 21:
      b[1] = b[1] | 0x0100;
      break;

    case 22:
      b[1] = b[1] | 0x010000;
      break;

    case 23:
      b[1] = b[1] | 0x01000000;
      break;

    case 24:
      b[2] = 0x01;
      break;

    case 25:
      b[2] = b[2] | 0x0100;
      break;

    case 26:
      b[2] = b[2] | 0x010000;
      break;

    case 27:
      b[2] = b[2] | 0x01000000;
      break;

    case 28:
      b[3] = 0x01;
      break;

    case 29:
      b[3] = b[3] | 0x0100;
      break;

    case 30:
      b[3] = b[3] | 0x010000;
      break;

    case 31:
      b[3] = b[3] | 0x01000000;
      break;
  }
}

inline void AG(u32x a[4], u32x b[4], u32x c[4], const u32 d) {
  switch (d) {
    case 0:
      a[0] = 0x01;
      break;

    case 1:
      a[0] = a[0] | 0x0100;
      break;

    case 2:
      a[0] = a[0] | 0x010000;
      break;

    case 3:
      a[0] = a[0] | 0x01000000;
      break;

    case 4:
      a[1] = 0x01;
      break;

    case 5:
      a[1] = a[1] | 0x0100;
      break;

    case 6:
      a[1] = a[1] | 0x010000;
      break;

    case 7:
      a[1] = a[1] | 0x01000000;
      break;

    case 8:
      a[2] = 0x01;
      break;

    case 9:
      a[2] = a[2] | 0x0100;
      break;

    case 10:
      a[2] = a[2] | 0x010000;
      break;

    case 11:
      a[2] = a[2] | 0x01000000;
      break;

    case 12:
      a[3] = 0x01;
      break;

    case 13:
      a[3] = a[3] | 0x0100;
      break;

    case 14:
      a[3] = a[3] | 0x010000;
      break;

    case 15:
      a[3] = a[3] | 0x01000000;
      break;

    case 16:
      b[0] = 0x01;
      break;

    case 17:
      b[0] = b[0] | 0x0100;
      break;

    case 18:
      b[0] = b[0] | 0x010000;
      break;

    case 19:
      b[0] = b[0] | 0x01000000;
      break;

    case 20:
      b[1] = 0x01;
      break;

    case 21:
      b[1] = b[1] | 0x0100;
      break;

    case 22:
      b[1] = b[1] | 0x010000;
      break;

    case 23:
      b[1] = b[1] | 0x01000000;
      break;

    case 24:
      b[2] = 0x01;
      break;

    case 25:
      b[2] = b[2] | 0x0100;
      break;

    case 26:
      b[2] = b[2] | 0x010000;
      break;

    case 27:
      b[2] = b[2] | 0x01000000;
      break;

    case 28:
      b[3] = 0x01;
      break;

    case 29:
      b[3] = b[3] | 0x0100;
      break;

    case 30:
      b[3] = b[3] | 0x010000;
      break;

    case 31:
      b[3] = b[3] | 0x01000000;
      break;

    case 32:
      c[0] = 0x01;
      break;

    case 33:
      c[0] = c[0] | 0x0100;
      break;

    case 34:
      c[0] = c[0] | 0x010000;
      break;

    case 35:
      c[0] = c[0] | 0x01000000;
      break;

    case 36:
      c[1] = 0x01;
      break;

    case 37:
      c[1] = c[1] | 0x0100;
      break;

    case 38:
      c[1] = c[1] | 0x010000;
      break;

    case 39:
      c[1] = c[1] | 0x01000000;
      break;

    case 40:
      c[2] = 0x01;
      break;

    case 41:
      c[2] = c[2] | 0x0100;
      break;

    case 42:
      c[2] = c[2] | 0x010000;
      break;

    case 43:
      c[2] = c[2] | 0x01000000;
      break;

    case 44:
      c[3] = 0x01;
      break;

    case 45:
      c[3] = c[3] | 0x0100;
      break;

    case 46:
      c[3] = c[3] | 0x010000;
      break;

    case 47:
      c[3] = c[3] | 0x01000000;
      break;
  }
}

inline void AH(u32x a[4], u32x b[4], u32x c[4], u32x d[4], const u32 e) {
  switch (e) {
    case 0:
      a[0] = 0x01;
      break;

    case 1:
      a[0] = a[0] | 0x0100;
      break;

    case 2:
      a[0] = a[0] | 0x010000;
      break;

    case 3:
      a[0] = a[0] | 0x01000000;
      break;

    case 4:
      a[1] = 0x01;
      break;

    case 5:
      a[1] = a[1] | 0x0100;
      break;

    case 6:
      a[1] = a[1] | 0x010000;
      break;

    case 7:
      a[1] = a[1] | 0x01000000;
      break;

    case 8:
      a[2] = 0x01;
      break;

    case 9:
      a[2] = a[2] | 0x0100;
      break;

    case 10:
      a[2] = a[2] | 0x010000;
      break;

    case 11:
      a[2] = a[2] | 0x01000000;
      break;

    case 12:
      a[3] = 0x01;
      break;

    case 13:
      a[3] = a[3] | 0x0100;
      break;

    case 14:
      a[3] = a[3] | 0x010000;
      break;

    case 15:
      a[3] = a[3] | 0x01000000;
      break;

    case 16:
      b[0] = 0x01;
      break;

    case 17:
      b[0] = b[0] | 0x0100;
      break;

    case 18:
      b[0] = b[0] | 0x010000;
      break;

    case 19:
      b[0] = b[0] | 0x01000000;
      break;

    case 20:
      b[1] = 0x01;
      break;

    case 21:
      b[1] = b[1] | 0x0100;
      break;

    case 22:
      b[1] = b[1] | 0x010000;
      break;

    case 23:
      b[1] = b[1] | 0x01000000;
      break;

    case 24:
      b[2] = 0x01;
      break;

    case 25:
      b[2] = b[2] | 0x0100;
      break;

    case 26:
      b[2] = b[2] | 0x010000;
      break;

    case 27:
      b[2] = b[2] | 0x01000000;
      break;

    case 28:
      b[3] = 0x01;
      break;

    case 29:
      b[3] = b[3] | 0x0100;
      break;

    case 30:
      b[3] = b[3] | 0x010000;
      break;

    case 31:
      b[3] = b[3] | 0x01000000;
      break;

    case 32:
      c[0] = 0x01;
      break;

    case 33:
      c[0] = c[0] | 0x0100;
      break;

    case 34:
      c[0] = c[0] | 0x010000;
      break;

    case 35:
      c[0] = c[0] | 0x01000000;
      break;

    case 36:
      c[1] = 0x01;
      break;

    case 37:
      c[1] = c[1] | 0x0100;
      break;

    case 38:
      c[1] = c[1] | 0x010000;
      break;

    case 39:
      c[1] = c[1] | 0x01000000;
      break;

    case 40:
      c[2] = 0x01;
      break;

    case 41:
      c[2] = c[2] | 0x0100;
      break;

    case 42:
      c[2] = c[2] | 0x010000;
      break;

    case 43:
      c[2] = c[2] | 0x01000000;
      break;

    case 44:
      c[3] = 0x01;
      break;

    case 45:
      c[3] = c[3] | 0x0100;
      break;

    case 46:
      c[3] = c[3] | 0x010000;
      break;

    case 47:
      c[3] = c[3] | 0x01000000;
      break;

    case 48:
      d[0] = 0x01;
      break;

    case 49:
      d[0] = d[0] | 0x0100;
      break;

    case 50:
      d[0] = d[0] | 0x010000;
      break;

    case 51:
      d[0] = d[0] | 0x01000000;
      break;

    case 52:
      d[1] = 0x01;
      break;

    case 53:
      d[1] = d[1] | 0x0100;
      break;

    case 54:
      d[1] = d[1] | 0x010000;
      break;

    case 55:
      d[1] = d[1] | 0x01000000;
      break;

    case 56:
      d[2] = 0x01;
      break;

    case 57:
      d[2] = d[2] | 0x0100;
      break;

    case 58:
      d[2] = d[2] | 0x010000;
      break;

    case 59:
      d[2] = d[2] | 0x01000000;
      break;

    case 60:
      d[3] = 0x01;
      break;

    case 61:
      d[3] = d[3] | 0x0100;
      break;

    case 62:
      d[3] = d[3] | 0x010000;
      break;

    case 63:
      d[3] = d[3] | 0x01000000;
      break;
  }
}

inline void AI(u32x a[4], u32x b[4], u32x c[4], u32x d[4], u32x e[4], u32x f[4], u32x g[4], u32x h[4], const u32 i) {
  switch (i) {
    case 0:
      a[0] = 0x01;
      break;

    case 1:
      a[0] = a[0] | 0x0100;
      break;

    case 2:
      a[0] = a[0] | 0x010000;
      break;

    case 3:
      a[0] = a[0] | 0x01000000;
      break;

    case 4:
      a[1] = 0x01;
      break;

    case 5:
      a[1] = a[1] | 0x0100;
      break;

    case 6:
      a[1] = a[1] | 0x010000;
      break;

    case 7:
      a[1] = a[1] | 0x01000000;
      break;

    case 8:
      a[2] = 0x01;
      break;

    case 9:
      a[2] = a[2] | 0x0100;
      break;

    case 10:
      a[2] = a[2] | 0x010000;
      break;

    case 11:
      a[2] = a[2] | 0x01000000;
      break;

    case 12:
      a[3] = 0x01;
      break;

    case 13:
      a[3] = a[3] | 0x0100;
      break;

    case 14:
      a[3] = a[3] | 0x010000;
      break;

    case 15:
      a[3] = a[3] | 0x01000000;
      break;

    case 16:
      b[0] = 0x01;
      break;

    case 17:
      b[0] = b[0] | 0x0100;
      break;

    case 18:
      b[0] = b[0] | 0x010000;
      break;

    case 19:
      b[0] = b[0] | 0x01000000;
      break;

    case 20:
      b[1] = 0x01;
      break;

    case 21:
      b[1] = b[1] | 0x0100;
      break;

    case 22:
      b[1] = b[1] | 0x010000;
      break;

    case 23:
      b[1] = b[1] | 0x01000000;
      break;

    case 24:
      b[2] = 0x01;
      break;

    case 25:
      b[2] = b[2] | 0x0100;
      break;

    case 26:
      b[2] = b[2] | 0x010000;
      break;

    case 27:
      b[2] = b[2] | 0x01000000;
      break;

    case 28:
      b[3] = 0x01;
      break;

    case 29:
      b[3] = b[3] | 0x0100;
      break;

    case 30:
      b[3] = b[3] | 0x010000;
      break;

    case 31:
      b[3] = b[3] | 0x01000000;
      break;

    case 32:
      c[0] = 0x01;
      break;

    case 33:
      c[0] = c[0] | 0x0100;
      break;

    case 34:
      c[0] = c[0] | 0x010000;
      break;

    case 35:
      c[0] = c[0] | 0x01000000;
      break;

    case 36:
      c[1] = 0x01;
      break;

    case 37:
      c[1] = c[1] | 0x0100;
      break;

    case 38:
      c[1] = c[1] | 0x010000;
      break;

    case 39:
      c[1] = c[1] | 0x01000000;
      break;

    case 40:
      c[2] = 0x01;
      break;

    case 41:
      c[2] = c[2] | 0x0100;
      break;

    case 42:
      c[2] = c[2] | 0x010000;
      break;

    case 43:
      c[2] = c[2] | 0x01000000;
      break;

    case 44:
      c[3] = 0x01;
      break;

    case 45:
      c[3] = c[3] | 0x0100;
      break;

    case 46:
      c[3] = c[3] | 0x010000;
      break;

    case 47:
      c[3] = c[3] | 0x01000000;
      break;

    case 48:
      d[0] = 0x01;
      break;

    case 49:
      d[0] = d[0] | 0x0100;
      break;

    case 50:
      d[0] = d[0] | 0x010000;
      break;

    case 51:
      d[0] = d[0] | 0x01000000;
      break;

    case 52:
      d[1] = 0x01;
      break;

    case 53:
      d[1] = d[1] | 0x0100;
      break;

    case 54:
      d[1] = d[1] | 0x010000;
      break;

    case 55:
      d[1] = d[1] | 0x01000000;
      break;

    case 56:
      d[2] = 0x01;
      break;

    case 57:
      d[2] = d[2] | 0x0100;
      break;

    case 58:
      d[2] = d[2] | 0x010000;
      break;

    case 59:
      d[2] = d[2] | 0x01000000;
      break;

    case 60:
      d[3] = 0x01;
      break;

    case 61:
      d[3] = d[3] | 0x0100;
      break;

    case 62:
      d[3] = d[3] | 0x010000;
      break;

    case 63:
      d[3] = d[3] | 0x01000000;
      break;

    case 64:
      e[0] = 0x01;
      break;

    case 65:
      e[0] = e[0] | 0x0100;
      break;

    case 66:
      e[0] = e[0] | 0x010000;
      break;

    case 67:
      e[0] = e[0] | 0x01000000;
      break;

    case 68:
      e[1] = 0x01;
      break;

    case 69:
      e[1] = e[1] | 0x0100;
      break;

    case 70:
      e[1] = e[1] | 0x010000;
      break;

    case 71:
      e[1] = e[1] | 0x01000000;
      break;

    case 72:
      e[2] = 0x01;
      break;

    case 73:
      e[2] = e[2] | 0x0100;
      break;

    case 74:
      e[2] = e[2] | 0x010000;
      break;

    case 75:
      e[2] = e[2] | 0x01000000;
      break;

    case 76:
      e[3] = 0x01;
      break;

    case 77:
      e[3] = e[3] | 0x0100;
      break;

    case 78:
      e[3] = e[3] | 0x010000;
      break;

    case 79:
      e[3] = e[3] | 0x01000000;
      break;

    case 80:
      f[0] = 0x01;
      break;

    case 81:
      f[0] = f[0] | 0x0100;
      break;

    case 82:
      f[0] = f[0] | 0x010000;
      break;

    case 83:
      f[0] = f[0] | 0x01000000;
      break;

    case 84:
      f[1] = 0x01;
      break;

    case 85:
      f[1] = f[1] | 0x0100;
      break;

    case 86:
      f[1] = f[1] | 0x010000;
      break;

    case 87:
      f[1] = f[1] | 0x01000000;
      break;

    case 88:
      f[2] = 0x01;
      break;

    case 89:
      f[2] = f[2] | 0x0100;
      break;

    case 90:
      f[2] = f[2] | 0x010000;
      break;

    case 91:
      f[2] = f[2] | 0x01000000;
      break;

    case 92:
      f[3] = 0x01;
      break;

    case 93:
      f[3] = f[3] | 0x0100;
      break;

    case 94:
      f[3] = f[3] | 0x010000;
      break;

    case 95:
      f[3] = f[3] | 0x01000000;
      break;

    case 96:
      g[0] = 0x01;
      break;

    case 97:
      g[0] = g[0] | 0x0100;
      break;

    case 98:
      g[0] = g[0] | 0x010000;
      break;

    case 99:
      g[0] = g[0] | 0x01000000;
      break;

    case 100:
      g[1] = 0x01;
      break;

    case 101:
      g[1] = g[1] | 0x0100;
      break;

    case 102:
      g[1] = g[1] | 0x010000;
      break;

    case 103:
      g[1] = g[1] | 0x01000000;
      break;

    case 104:
      g[2] = 0x01;
      break;

    case 105:
      g[2] = g[2] | 0x0100;
      break;

    case 106:
      g[2] = g[2] | 0x010000;
      break;

    case 107:
      g[2] = g[2] | 0x01000000;
      break;

    case 108:
      g[3] = 0x01;
      break;

    case 109:
      g[3] = g[3] | 0x0100;
      break;

    case 110:
      g[3] = g[3] | 0x010000;
      break;

    case 111:
      g[3] = g[3] | 0x01000000;
      break;

    case 112:
      h[0] = 0x01;
      break;

    case 113:
      h[0] = h[0] | 0x0100;
      break;

    case 114:
      h[0] = h[0] | 0x010000;
      break;

    case 115:
      h[0] = h[0] | 0x01000000;
      break;

    case 116:
      h[1] = 0x01;
      break;

    case 117:
      h[1] = h[1] | 0x0100;
      break;

    case 118:
      h[1] = h[1] | 0x010000;
      break;

    case 119:
      h[1] = h[1] | 0x01000000;
      break;

    case 120:
      h[2] = 0x01;
      break;

    case 121:
      h[2] = h[2] | 0x0100;
      break;

    case 122:
      h[2] = h[2] | 0x010000;
      break;

    case 123:
      h[2] = h[2] | 0x01000000;
      break;

    case 124:
      h[3] = 0x01;
      break;

    case 125:
      h[3] = h[3] | 0x0100;
      break;

    case 126:
      h[3] = h[3] | 0x010000;
      break;

    case 127:
      h[3] = h[3] | 0x01000000;
      break;
  }
}

inline void AJ(u32x a[4], const u32 b) {
  switch (b) {
    case 0:
      a[0] = 0x02;
      break;

    case 1:
      a[0] = a[0] | 0x0200;
      break;

    case 2:
      a[0] = a[0] | 0x020000;
      break;

    case 3:
      a[0] = a[0] | 0x02000000;
      break;

    case 4:
      a[1] = 0x02;
      break;

    case 5:
      a[1] = a[1] | 0x0200;
      break;

    case 6:
      a[1] = a[1] | 0x020000;
      break;

    case 7:
      a[1] = a[1] | 0x02000000;
      break;

    case 8:
      a[2] = 0x02;
      break;

    case 9:
      a[2] = a[2] | 0x0200;
      break;

    case 10:
      a[2] = a[2] | 0x020000;
      break;

    case 11:
      a[2] = a[2] | 0x02000000;
      break;

    case 12:
      a[3] = 0x02;
      break;

    case 13:
      a[3] = a[3] | 0x0200;
      break;

    case 14:
      a[3] = a[3] | 0x020000;
      break;

    case 15:
      a[3] = a[3] | 0x02000000;
      break;
  }
}

inline void AK(u32x a[4], u32x b[4], const u32 c) {
  switch (c) {
    case 0:
      a[0] = 0x02;
      break;

    case 1:
      a[0] = a[0] | 0x0200;
      break;

    case 2:
      a[0] = a[0] | 0x020000;
      break;

    case 3:
      a[0] = a[0] | 0x02000000;
      break;

    case 4:
      a[1] = 0x02;
      break;

    case 5:
      a[1] = a[1] | 0x0200;
      break;

    case 6:
      a[1] = a[1] | 0x020000;
      break;

    case 7:
      a[1] = a[1] | 0x02000000;
      break;

    case 8:
      a[2] = 0x02;
      break;

    case 9:
      a[2] = a[2] | 0x0200;
      break;

    case 10:
      a[2] = a[2] | 0x020000;
      break;

    case 11:
      a[2] = a[2] | 0x02000000;
      break;

    case 12:
      a[3] = 0x02;
      break;

    case 13:
      a[3] = a[3] | 0x0200;
      break;

    case 14:
      a[3] = a[3] | 0x020000;
      break;

    case 15:
      a[3] = a[3] | 0x02000000;
      break;

    case 16:
      b[0] = 0x02;
      break;

    case 17:
      b[0] = b[0] | 0x0200;
      break;

    case 18:
      b[0] = b[0] | 0x020000;
      break;

    case 19:
      b[0] = b[0] | 0x02000000;
      break;

    case 20:
      b[1] = 0x02;
      break;

    case 21:
      b[1] = b[1] | 0x0200;
      break;

    case 22:
      b[1] = b[1] | 0x020000;
      break;

    case 23:
      b[1] = b[1] | 0x02000000;
      break;

    case 24:
      b[2] = 0x02;
      break;

    case 25:
      b[2] = b[2] | 0x0200;
      break;

    case 26:
      b[2] = b[2] | 0x020000;
      break;

    case 27:
      b[2] = b[2] | 0x02000000;
      break;

    case 28:
      b[3] = 0x02;
      break;

    case 29:
      b[3] = b[3] | 0x0200;
      break;

    case 30:
      b[3] = b[3] | 0x020000;
      break;

    case 31:
      b[3] = b[3] | 0x02000000;
      break;
  }
}

inline void AL(u32x a[4], u32x b[4], u32x c[4], const u32 d) {
  switch (d) {
    case 0:
      a[0] = 0x02;
      break;

    case 1:
      a[0] = a[0] | 0x0200;
      break;

    case 2:
      a[0] = a[0] | 0x020000;
      break;

    case 3:
      a[0] = a[0] | 0x02000000;
      break;

    case 4:
      a[1] = 0x02;
      break;

    case 5:
      a[1] = a[1] | 0x0200;
      break;

    case 6:
      a[1] = a[1] | 0x020000;
      break;

    case 7:
      a[1] = a[1] | 0x02000000;
      break;

    case 8:
      a[2] = 0x02;
      break;

    case 9:
      a[2] = a[2] | 0x0200;
      break;

    case 10:
      a[2] = a[2] | 0x020000;
      break;

    case 11:
      a[2] = a[2] | 0x02000000;
      break;

    case 12:
      a[3] = 0x02;
      break;

    case 13:
      a[3] = a[3] | 0x0200;
      break;

    case 14:
      a[3] = a[3] | 0x020000;
      break;

    case 15:
      a[3] = a[3] | 0x02000000;
      break;

    case 16:
      b[0] = 0x02;
      break;

    case 17:
      b[0] = b[0] | 0x0200;
      break;

    case 18:
      b[0] = b[0] | 0x020000;
      break;

    case 19:
      b[0] = b[0] | 0x02000000;
      break;

    case 20:
      b[1] = 0x02;
      break;

    case 21:
      b[1] = b[1] | 0x0200;
      break;

    case 22:
      b[1] = b[1] | 0x020000;
      break;

    case 23:
      b[1] = b[1] | 0x02000000;
      break;

    case 24:
      b[2] = 0x02;
      break;

    case 25:
      b[2] = b[2] | 0x0200;
      break;

    case 26:
      b[2] = b[2] | 0x020000;
      break;

    case 27:
      b[2] = b[2] | 0x02000000;
      break;

    case 28:
      b[3] = 0x02;
      break;

    case 29:
      b[3] = b[3] | 0x0200;
      break;

    case 30:
      b[3] = b[3] | 0x020000;
      break;

    case 31:
      b[3] = b[3] | 0x02000000;
      break;

    case 32:
      c[0] = 0x02;
      break;

    case 33:
      c[0] = c[0] | 0x0200;
      break;

    case 34:
      c[0] = c[0] | 0x020000;
      break;

    case 35:
      c[0] = c[0] | 0x02000000;
      break;

    case 36:
      c[1] = 0x02;
      break;

    case 37:
      c[1] = c[1] | 0x0200;
      break;

    case 38:
      c[1] = c[1] | 0x020000;
      break;

    case 39:
      c[1] = c[1] | 0x02000000;
      break;

    case 40:
      c[2] = 0x02;
      break;

    case 41:
      c[2] = c[2] | 0x0200;
      break;

    case 42:
      c[2] = c[2] | 0x020000;
      break;

    case 43:
      c[2] = c[2] | 0x02000000;
      break;

    case 44:
      c[3] = 0x02;
      break;

    case 45:
      c[3] = c[3] | 0x0200;
      break;

    case 46:
      c[3] = c[3] | 0x020000;
      break;

    case 47:
      c[3] = c[3] | 0x02000000;
      break;
  }
}

inline void AM(u32x a[4], u32x b[4], u32x c[4], u32x d[4], const u32 e) {
  switch (e) {
    case 0:
      a[0] = 0x02;
      break;

    case 1:
      a[0] = a[0] | 0x0200;
      break;

    case 2:
      a[0] = a[0] | 0x020000;
      break;

    case 3:
      a[0] = a[0] | 0x02000000;
      break;

    case 4:
      a[1] = 0x02;
      break;

    case 5:
      a[1] = a[1] | 0x0200;
      break;

    case 6:
      a[1] = a[1] | 0x020000;
      break;

    case 7:
      a[1] = a[1] | 0x02000000;
      break;

    case 8:
      a[2] = 0x02;
      break;

    case 9:
      a[2] = a[2] | 0x0200;
      break;

    case 10:
      a[2] = a[2] | 0x020000;
      break;

    case 11:
      a[2] = a[2] | 0x02000000;
      break;

    case 12:
      a[3] = 0x02;
      break;

    case 13:
      a[3] = a[3] | 0x0200;
      break;

    case 14:
      a[3] = a[3] | 0x020000;
      break;

    case 15:
      a[3] = a[3] | 0x02000000;
      break;

    case 16:
      b[0] = 0x02;
      break;

    case 17:
      b[0] = b[0] | 0x0200;
      break;

    case 18:
      b[0] = b[0] | 0x020000;
      break;

    case 19:
      b[0] = b[0] | 0x02000000;
      break;

    case 20:
      b[1] = 0x02;
      break;

    case 21:
      b[1] = b[1] | 0x0200;
      break;

    case 22:
      b[1] = b[1] | 0x020000;
      break;

    case 23:
      b[1] = b[1] | 0x02000000;
      break;

    case 24:
      b[2] = 0x02;
      break;

    case 25:
      b[2] = b[2] | 0x0200;
      break;

    case 26:
      b[2] = b[2] | 0x020000;
      break;

    case 27:
      b[2] = b[2] | 0x02000000;
      break;

    case 28:
      b[3] = 0x02;
      break;

    case 29:
      b[3] = b[3] | 0x0200;
      break;

    case 30:
      b[3] = b[3] | 0x020000;
      break;

    case 31:
      b[3] = b[3] | 0x02000000;
      break;

    case 32:
      c[0] = 0x02;
      break;

    case 33:
      c[0] = c[0] | 0x0200;
      break;

    case 34:
      c[0] = c[0] | 0x020000;
      break;

    case 35:
      c[0] = c[0] | 0x02000000;
      break;

    case 36:
      c[1] = 0x02;
      break;

    case 37:
      c[1] = c[1] | 0x0200;
      break;

    case 38:
      c[1] = c[1] | 0x020000;
      break;

    case 39:
      c[1] = c[1] | 0x02000000;
      break;

    case 40:
      c[2] = 0x02;
      break;

    case 41:
      c[2] = c[2] | 0x0200;
      break;

    case 42:
      c[2] = c[2] | 0x020000;
      break;

    case 43:
      c[2] = c[2] | 0x02000000;
      break;

    case 44:
      c[3] = 0x02;
      break;

    case 45:
      c[3] = c[3] | 0x0200;
      break;

    case 46:
      c[3] = c[3] | 0x020000;
      break;

    case 47:
      c[3] = c[3] | 0x02000000;
      break;

    case 48:
      d[0] = 0x02;
      break;

    case 49:
      d[0] = d[0] | 0x0200;
      break;

    case 50:
      d[0] = d[0] | 0x020000;
      break;

    case 51:
      d[0] = d[0] | 0x02000000;
      break;

    case 52:
      d[1] = 0x02;
      break;

    case 53:
      d[1] = d[1] | 0x0200;
      break;

    case 54:
      d[1] = d[1] | 0x020000;
      break;

    case 55:
      d[1] = d[1] | 0x02000000;
      break;

    case 56:
      d[2] = 0x02;
      break;

    case 57:
      d[2] = d[2] | 0x0200;
      break;

    case 58:
      d[2] = d[2] | 0x020000;
      break;

    case 59:
      d[2] = d[2] | 0x02000000;
      break;

    case 60:
      d[3] = 0x02;
      break;

    case 61:
      d[3] = d[3] | 0x0200;
      break;

    case 62:
      d[3] = d[3] | 0x020000;
      break;

    case 63:
      d[3] = d[3] | 0x02000000;
      break;
  }
}

inline void AN(u32x a[4], u32x b[4], u32x c[4], u32x d[4], u32x e[4], u32x f[4], u32x g[4], u32x h[4], const u32 i) {
  switch (i) {
    case 0:
      a[0] = 0x02;
      break;

    case 1:
      a[0] = a[0] | 0x0200;
      break;

    case 2:
      a[0] = a[0] | 0x020000;
      break;

    case 3:
      a[0] = a[0] | 0x02000000;
      break;

    case 4:
      a[1] = 0x02;
      break;

    case 5:
      a[1] = a[1] | 0x0200;
      break;

    case 6:
      a[1] = a[1] | 0x020000;
      break;

    case 7:
      a[1] = a[1] | 0x02000000;
      break;

    case 8:
      a[2] = 0x02;
      break;

    case 9:
      a[2] = a[2] | 0x0200;
      break;

    case 10:
      a[2] = a[2] | 0x020000;
      break;

    case 11:
      a[2] = a[2] | 0x02000000;
      break;

    case 12:
      a[3] = 0x02;
      break;

    case 13:
      a[3] = a[3] | 0x0200;
      break;

    case 14:
      a[3] = a[3] | 0x020000;
      break;

    case 15:
      a[3] = a[3] | 0x02000000;
      break;

    case 16:
      b[0] = 0x02;
      break;

    case 17:
      b[0] = b[0] | 0x0200;
      break;

    case 18:
      b[0] = b[0] | 0x020000;
      break;

    case 19:
      b[0] = b[0] | 0x02000000;
      break;

    case 20:
      b[1] = 0x02;
      break;

    case 21:
      b[1] = b[1] | 0x0200;
      break;

    case 22:
      b[1] = b[1] | 0x020000;
      break;

    case 23:
      b[1] = b[1] | 0x02000000;
      break;

    case 24:
      b[2] = 0x02;
      break;

    case 25:
      b[2] = b[2] | 0x0200;
      break;

    case 26:
      b[2] = b[2] | 0x020000;
      break;

    case 27:
      b[2] = b[2] | 0x02000000;
      break;

    case 28:
      b[3] = 0x02;
      break;

    case 29:
      b[3] = b[3] | 0x0200;
      break;

    case 30:
      b[3] = b[3] | 0x020000;
      break;

    case 31:
      b[3] = b[3] | 0x02000000;
      break;

    case 32:
      c[0] = 0x02;
      break;

    case 33:
      c[0] = c[0] | 0x0200;
      break;

    case 34:
      c[0] = c[0] | 0x020000;
      break;

    case 35:
      c[0] = c[0] | 0x02000000;
      break;

    case 36:
      c[1] = 0x02;
      break;

    case 37:
      c[1] = c[1] | 0x0200;
      break;

    case 38:
      c[1] = c[1] | 0x020000;
      break;

    case 39:
      c[1] = c[1] | 0x02000000;
      break;

    case 40:
      c[2] = 0x02;
      break;

    case 41:
      c[2] = c[2] | 0x0200;
      break;

    case 42:
      c[2] = c[2] | 0x020000;
      break;

    case 43:
      c[2] = c[2] | 0x02000000;
      break;

    case 44:
      c[3] = 0x02;
      break;

    case 45:
      c[3] = c[3] | 0x0200;
      break;

    case 46:
      c[3] = c[3] | 0x020000;
      break;

    case 47:
      c[3] = c[3] | 0x02000000;
      break;

    case 48:
      d[0] = 0x02;
      break;

    case 49:
      d[0] = d[0] | 0x0200;
      break;

    case 50:
      d[0] = d[0] | 0x020000;
      break;

    case 51:
      d[0] = d[0] | 0x02000000;
      break;

    case 52:
      d[1] = 0x02;
      break;

    case 53:
      d[1] = d[1] | 0x0200;
      break;

    case 54:
      d[1] = d[1] | 0x020000;
      break;

    case 55:
      d[1] = d[1] | 0x02000000;
      break;

    case 56:
      d[2] = 0x02;
      break;

    case 57:
      d[2] = d[2] | 0x0200;
      break;

    case 58:
      d[2] = d[2] | 0x020000;
      break;

    case 59:
      d[2] = d[2] | 0x02000000;
      break;

    case 60:
      d[3] = 0x02;
      break;

    case 61:
      d[3] = d[3] | 0x0200;
      break;

    case 62:
      d[3] = d[3] | 0x020000;
      break;

    case 63:
      d[3] = d[3] | 0x02000000;
      break;

    case 64:
      e[0] = 0x02;
      break;

    case 65:
      e[0] = e[0] | 0x0200;
      break;

    case 66:
      e[0] = e[0] | 0x020000;
      break;

    case 67:
      e[0] = e[0] | 0x02000000;
      break;

    case 68:
      e[1] = 0x02;
      break;

    case 69:
      e[1] = e[1] | 0x0200;
      break;

    case 70:
      e[1] = e[1] | 0x020000;
      break;

    case 71:
      e[1] = e[1] | 0x02000000;
      break;

    case 72:
      e[2] = 0x02;
      break;

    case 73:
      e[2] = e[2] | 0x0200;
      break;

    case 74:
      e[2] = e[2] | 0x020000;
      break;

    case 75:
      e[2] = e[2] | 0x02000000;
      break;

    case 76:
      e[3] = 0x02;
      break;

    case 77:
      e[3] = e[3] | 0x0200;
      break;

    case 78:
      e[3] = e[3] | 0x020000;
      break;

    case 79:
      e[3] = e[3] | 0x02000000;
      break;

    case 80:
      f[0] = 0x02;
      break;

    case 81:
      f[0] = f[0] | 0x0200;
      break;

    case 82:
      f[0] = f[0] | 0x020000;
      break;

    case 83:
      f[0] = f[0] | 0x02000000;
      break;

    case 84:
      f[1] = 0x02;
      break;

    case 85:
      f[1] = f[1] | 0x0200;
      break;

    case 86:
      f[1] = f[1] | 0x020000;
      break;

    case 87:
      f[1] = f[1] | 0x02000000;
      break;

    case 88:
      f[2] = 0x02;
      break;

    case 89:
      f[2] = f[2] | 0x0200;
      break;

    case 90:
      f[2] = f[2] | 0x020000;
      break;

    case 91:
      f[2] = f[2] | 0x02000000;
      break;

    case 92:
      f[3] = 0x02;
      break;

    case 93:
      f[3] = f[3] | 0x0200;
      break;

    case 94:
      f[3] = f[3] | 0x020000;
      break;

    case 95:
      f[3] = f[3] | 0x02000000;
      break;

    case 96:
      g[0] = 0x02;
      break;

    case 97:
      g[0] = g[0] | 0x0200;
      break;

    case 98:
      g[0] = g[0] | 0x020000;
      break;

    case 99:
      g[0] = g[0] | 0x02000000;
      break;

    case 100:
      g[1] = 0x02;
      break;

    case 101:
      g[1] = g[1] | 0x0200;
      break;

    case 102:
      g[1] = g[1] | 0x020000;
      break;

    case 103:
      g[1] = g[1] | 0x02000000;
      break;

    case 104:
      g[2] = 0x02;
      break;

    case 105:
      g[2] = g[2] | 0x0200;
      break;

    case 106:
      g[2] = g[2] | 0x020000;
      break;

    case 107:
      g[2] = g[2] | 0x02000000;
      break;

    case 108:
      g[3] = 0x02;
      break;

    case 109:
      g[3] = g[3] | 0x0200;
      break;

    case 110:
      g[3] = g[3] | 0x020000;
      break;

    case 111:
      g[3] = g[3] | 0x02000000;
      break;

    case 112:
      h[0] = 0x02;
      break;

    case 113:
      h[0] = h[0] | 0x0200;
      break;

    case 114:
      h[0] = h[0] | 0x020000;
      break;

    case 115:
      h[0] = h[0] | 0x02000000;
      break;

    case 116:
      h[1] = 0x02;
      break;

    case 117:
      h[1] = h[1] | 0x0200;
      break;

    case 118:
      h[1] = h[1] | 0x020000;
      break;

    case 119:
      h[1] = h[1] | 0x02000000;
      break;

    case 120:
      h[2] = 0x02;
      break;

    case 121:
      h[2] = h[2] | 0x0200;
      break;

    case 122:
      h[2] = h[2] | 0x020000;
      break;

    case 123:
      h[2] = h[2] | 0x02000000;
      break;

    case 124:
      h[3] = 0x02;
      break;

    case 125:
      h[3] = h[3] | 0x0200;
      break;

    case 126:
      h[3] = h[3] | 0x020000;
      break;

    case 127:
      h[3] = h[3] | 0x02000000;
      break;
  }
}

inline void AO(u32x a[4], const u32 b) {
  switch (b) {
    case 0:
      a[0] = 0x80;
      break;

    case 1:
      a[0] = a[0] | 0x8000;
      break;

    case 2:
      a[0] = a[0] | 0x800000;
      break;

    case 3:
      a[0] = a[0] | 0x80000000;
      break;

    case 4:
      a[1] = 0x80;
      break;

    case 5:
      a[1] = a[1] | 0x8000;
      break;

    case 6:
      a[1] = a[1] | 0x800000;
      break;

    case 7:
      a[1] = a[1] | 0x80000000;
      break;

    case 8:
      a[2] = 0x80;
      break;

    case 9:
      a[2] = a[2] | 0x8000;
      break;

    case 10:
      a[2] = a[2] | 0x800000;
      break;

    case 11:
      a[2] = a[2] | 0x80000000;
      break;

    case 12:
      a[3] = 0x80;
      break;

    case 13:
      a[3] = a[3] | 0x8000;
      break;

    case 14:
      a[3] = a[3] | 0x800000;
      break;

    case 15:
      a[3] = a[3] | 0x80000000;
      break;
  }
}

inline void AP(u32x a[4], u32x b[4], const u32 c) {
  switch (c) {
    case 0:
      a[0] = 0x80;
      break;

    case 1:
      a[0] = a[0] | 0x8000;
      break;

    case 2:
      a[0] = a[0] | 0x800000;
      break;

    case 3:
      a[0] = a[0] | 0x80000000;
      break;

    case 4:
      a[1] = 0x80;
      break;

    case 5:
      a[1] = a[1] | 0x8000;
      break;

    case 6:
      a[1] = a[1] | 0x800000;
      break;

    case 7:
      a[1] = a[1] | 0x80000000;
      break;

    case 8:
      a[2] = 0x80;
      break;

    case 9:
      a[2] = a[2] | 0x8000;
      break;

    case 10:
      a[2] = a[2] | 0x800000;
      break;

    case 11:
      a[2] = a[2] | 0x80000000;
      break;

    case 12:
      a[3] = 0x80;
      break;

    case 13:
      a[3] = a[3] | 0x8000;
      break;

    case 14:
      a[3] = a[3] | 0x800000;
      break;

    case 15:
      a[3] = a[3] | 0x80000000;
      break;

    case 16:
      b[0] = 0x80;
      break;

    case 17:
      b[0] = b[0] | 0x8000;
      break;

    case 18:
      b[0] = b[0] | 0x800000;
      break;

    case 19:
      b[0] = b[0] | 0x80000000;
      break;

    case 20:
      b[1] = 0x80;
      break;

    case 21:
      b[1] = b[1] | 0x8000;
      break;

    case 22:
      b[1] = b[1] | 0x800000;
      break;

    case 23:
      b[1] = b[1] | 0x80000000;
      break;

    case 24:
      b[2] = 0x80;
      break;

    case 25:
      b[2] = b[2] | 0x8000;
      break;

    case 26:
      b[2] = b[2] | 0x800000;
      break;

    case 27:
      b[2] = b[2] | 0x80000000;
      break;

    case 28:
      b[3] = 0x80;
      break;

    case 29:
      b[3] = b[3] | 0x8000;
      break;

    case 30:
      b[3] = b[3] | 0x800000;
      break;

    case 31:
      b[3] = b[3] | 0x80000000;
      break;
  }
}

inline void AQ(u32x a[4], u32x b[4], u32x c[4], const u32 d) {
  switch (d) {
    case 0:
      a[0] = 0x80;
      break;

    case 1:
      a[0] = a[0] | 0x8000;
      break;

    case 2:
      a[0] = a[0] | 0x800000;
      break;

    case 3:
      a[0] = a[0] | 0x80000000;
      break;

    case 4:
      a[1] = 0x80;
      break;

    case 5:
      a[1] = a[1] | 0x8000;
      break;

    case 6:
      a[1] = a[1] | 0x800000;
      break;

    case 7:
      a[1] = a[1] | 0x80000000;
      break;

    case 8:
      a[2] = 0x80;
      break;

    case 9:
      a[2] = a[2] | 0x8000;
      break;

    case 10:
      a[2] = a[2] | 0x800000;
      break;

    case 11:
      a[2] = a[2] | 0x80000000;
      break;

    case 12:
      a[3] = 0x80;
      break;

    case 13:
      a[3] = a[3] | 0x8000;
      break;

    case 14:
      a[3] = a[3] | 0x800000;
      break;

    case 15:
      a[3] = a[3] | 0x80000000;
      break;

    case 16:
      b[0] = 0x80;
      break;

    case 17:
      b[0] = b[0] | 0x8000;
      break;

    case 18:
      b[0] = b[0] | 0x800000;
      break;

    case 19:
      b[0] = b[0] | 0x80000000;
      break;

    case 20:
      b[1] = 0x80;
      break;

    case 21:
      b[1] = b[1] | 0x8000;
      break;

    case 22:
      b[1] = b[1] | 0x800000;
      break;

    case 23:
      b[1] = b[1] | 0x80000000;
      break;

    case 24:
      b[2] = 0x80;
      break;

    case 25:
      b[2] = b[2] | 0x8000;
      break;

    case 26:
      b[2] = b[2] | 0x800000;
      break;

    case 27:
      b[2] = b[2] | 0x80000000;
      break;

    case 28:
      b[3] = 0x80;
      break;

    case 29:
      b[3] = b[3] | 0x8000;
      break;

    case 30:
      b[3] = b[3] | 0x800000;
      break;

    case 31:
      b[3] = b[3] | 0x80000000;
      break;

    case 32:
      c[0] = 0x80;
      break;

    case 33:
      c[0] = c[0] | 0x8000;
      break;

    case 34:
      c[0] = c[0] | 0x800000;
      break;

    case 35:
      c[0] = c[0] | 0x80000000;
      break;

    case 36:
      c[1] = 0x80;
      break;

    case 37:
      c[1] = c[1] | 0x8000;
      break;

    case 38:
      c[1] = c[1] | 0x800000;
      break;

    case 39:
      c[1] = c[1] | 0x80000000;
      break;

    case 40:
      c[2] = 0x80;
      break;

    case 41:
      c[2] = c[2] | 0x8000;
      break;

    case 42:
      c[2] = c[2] | 0x800000;
      break;

    case 43:
      c[2] = c[2] | 0x80000000;
      break;

    case 44:
      c[3] = 0x80;
      break;

    case 45:
      c[3] = c[3] | 0x8000;
      break;

    case 46:
      c[3] = c[3] | 0x800000;
      break;

    case 47:
      c[3] = c[3] | 0x80000000;
      break;
  }
}

inline void AR(u32x a[4], u32x b[4], u32x c[4], u32x d[4], const u32 e) {
  switch (e) {
    case 0:
      a[0] = 0x80;
      break;

    case 1:
      a[0] = a[0] | 0x8000;
      break;

    case 2:
      a[0] = a[0] | 0x800000;
      break;

    case 3:
      a[0] = a[0] | 0x80000000;
      break;

    case 4:
      a[1] = 0x80;
      break;

    case 5:
      a[1] = a[1] | 0x8000;
      break;

    case 6:
      a[1] = a[1] | 0x800000;
      break;

    case 7:
      a[1] = a[1] | 0x80000000;
      break;

    case 8:
      a[2] = 0x80;
      break;

    case 9:
      a[2] = a[2] | 0x8000;
      break;

    case 10:
      a[2] = a[2] | 0x800000;
      break;

    case 11:
      a[2] = a[2] | 0x80000000;
      break;

    case 12:
      a[3] = 0x80;
      break;

    case 13:
      a[3] = a[3] | 0x8000;
      break;

    case 14:
      a[3] = a[3] | 0x800000;
      break;

    case 15:
      a[3] = a[3] | 0x80000000;
      break;

    case 16:
      b[0] = 0x80;
      break;

    case 17:
      b[0] = b[0] | 0x8000;
      break;

    case 18:
      b[0] = b[0] | 0x800000;
      break;

    case 19:
      b[0] = b[0] | 0x80000000;
      break;

    case 20:
      b[1] = 0x80;
      break;

    case 21:
      b[1] = b[1] | 0x8000;
      break;

    case 22:
      b[1] = b[1] | 0x800000;
      break;

    case 23:
      b[1] = b[1] | 0x80000000;
      break;

    case 24:
      b[2] = 0x80;
      break;

    case 25:
      b[2] = b[2] | 0x8000;
      break;

    case 26:
      b[2] = b[2] | 0x800000;
      break;

    case 27:
      b[2] = b[2] | 0x80000000;
      break;

    case 28:
      b[3] = 0x80;
      break;

    case 29:
      b[3] = b[3] | 0x8000;
      break;

    case 30:
      b[3] = b[3] | 0x800000;
      break;

    case 31:
      b[3] = b[3] | 0x80000000;
      break;

    case 32:
      c[0] = 0x80;
      break;

    case 33:
      c[0] = c[0] | 0x8000;
      break;

    case 34:
      c[0] = c[0] | 0x800000;
      break;

    case 35:
      c[0] = c[0] | 0x80000000;
      break;

    case 36:
      c[1] = 0x80;
      break;

    case 37:
      c[1] = c[1] | 0x8000;
      break;

    case 38:
      c[1] = c[1] | 0x800000;
      break;

    case 39:
      c[1] = c[1] | 0x80000000;
      break;

    case 40:
      c[2] = 0x80;
      break;

    case 41:
      c[2] = c[2] | 0x8000;
      break;

    case 42:
      c[2] = c[2] | 0x800000;
      break;

    case 43:
      c[2] = c[2] | 0x80000000;
      break;

    case 44:
      c[3] = 0x80;
      break;

    case 45:
      c[3] = c[3] | 0x8000;
      break;

    case 46:
      c[3] = c[3] | 0x800000;
      break;

    case 47:
      c[3] = c[3] | 0x80000000;
      break;

    case 48:
      d[0] = 0x80;
      break;

    case 49:
      d[0] = d[0] | 0x8000;
      break;

    case 50:
      d[0] = d[0] | 0x800000;
      break;

    case 51:
      d[0] = d[0] | 0x80000000;
      break;

    case 52:
      d[1] = 0x80;
      break;

    case 53:
      d[1] = d[1] | 0x8000;
      break;

    case 54:
      d[1] = d[1] | 0x800000;
      break;

    case 55:
      d[1] = d[1] | 0x80000000;
      break;

    case 56:
      d[2] = 0x80;
      break;

    case 57:
      d[2] = d[2] | 0x8000;
      break;

    case 58:
      d[2] = d[2] | 0x800000;
      break;

    case 59:
      d[2] = d[2] | 0x80000000;
      break;

    case 60:
      d[3] = 0x80;
      break;

    case 61:
      d[3] = d[3] | 0x8000;
      break;

    case 62:
      d[3] = d[3] | 0x800000;
      break;

    case 63:
      d[3] = d[3] | 0x80000000;
      break;
  }
}

inline void AS(u32x a[4], u32x b[4], u32x c[4], u32x d[4], u32x e[4], u32x f[4], u32x g[4], u32x h[4], const u32 i) {
  switch (i) {
    case 0:
      a[0] = 0x80;
      break;

    case 1:
      a[0] = a[0] | 0x8000;
      break;

    case 2:
      a[0] = a[0] | 0x800000;
      break;

    case 3:
      a[0] = a[0] | 0x80000000;
      break;

    case 4:
      a[1] = 0x80;
      break;

    case 5:
      a[1] = a[1] | 0x8000;
      break;

    case 6:
      a[1] = a[1] | 0x800000;
      break;

    case 7:
      a[1] = a[1] | 0x80000000;
      break;

    case 8:
      a[2] = 0x80;
      break;

    case 9:
      a[2] = a[2] | 0x8000;
      break;

    case 10:
      a[2] = a[2] | 0x800000;
      break;

    case 11:
      a[2] = a[2] | 0x80000000;
      break;

    case 12:
      a[3] = 0x80;
      break;

    case 13:
      a[3] = a[3] | 0x8000;
      break;

    case 14:
      a[3] = a[3] | 0x800000;
      break;

    case 15:
      a[3] = a[3] | 0x80000000;
      break;

    case 16:
      b[0] = 0x80;
      break;

    case 17:
      b[0] = b[0] | 0x8000;
      break;

    case 18:
      b[0] = b[0] | 0x800000;
      break;

    case 19:
      b[0] = b[0] | 0x80000000;
      break;

    case 20:
      b[1] = 0x80;
      break;

    case 21:
      b[1] = b[1] | 0x8000;
      break;

    case 22:
      b[1] = b[1] | 0x800000;
      break;

    case 23:
      b[1] = b[1] | 0x80000000;
      break;

    case 24:
      b[2] = 0x80;
      break;

    case 25:
      b[2] = b[2] | 0x8000;
      break;

    case 26:
      b[2] = b[2] | 0x800000;
      break;

    case 27:
      b[2] = b[2] | 0x80000000;
      break;

    case 28:
      b[3] = 0x80;
      break;

    case 29:
      b[3] = b[3] | 0x8000;
      break;

    case 30:
      b[3] = b[3] | 0x800000;
      break;

    case 31:
      b[3] = b[3] | 0x80000000;
      break;

    case 32:
      c[0] = 0x80;
      break;

    case 33:
      c[0] = c[0] | 0x8000;
      break;

    case 34:
      c[0] = c[0] | 0x800000;
      break;

    case 35:
      c[0] = c[0] | 0x80000000;
      break;

    case 36:
      c[1] = 0x80;
      break;

    case 37:
      c[1] = c[1] | 0x8000;
      break;

    case 38:
      c[1] = c[1] | 0x800000;
      break;

    case 39:
      c[1] = c[1] | 0x80000000;
      break;

    case 40:
      c[2] = 0x80;
      break;

    case 41:
      c[2] = c[2] | 0x8000;
      break;

    case 42:
      c[2] = c[2] | 0x800000;
      break;

    case 43:
      c[2] = c[2] | 0x80000000;
      break;

    case 44:
      c[3] = 0x80;
      break;

    case 45:
      c[3] = c[3] | 0x8000;
      break;

    case 46:
      c[3] = c[3] | 0x800000;
      break;

    case 47:
      c[3] = c[3] | 0x80000000;
      break;

    case 48:
      d[0] = 0x80;
      break;

    case 49:
      d[0] = d[0] | 0x8000;
      break;

    case 50:
      d[0] = d[0] | 0x800000;
      break;

    case 51:
      d[0] = d[0] | 0x80000000;
      break;

    case 52:
      d[1] = 0x80;
      break;

    case 53:
      d[1] = d[1] | 0x8000;
      break;

    case 54:
      d[1] = d[1] | 0x800000;
      break;

    case 55:
      d[1] = d[1] | 0x80000000;
      break;

    case 56:
      d[2] = 0x80;
      break;

    case 57:
      d[2] = d[2] | 0x8000;
      break;

    case 58:
      d[2] = d[2] | 0x800000;
      break;

    case 59:
      d[2] = d[2] | 0x80000000;
      break;

    case 60:
      d[3] = 0x80;
      break;

    case 61:
      d[3] = d[3] | 0x8000;
      break;

    case 62:
      d[3] = d[3] | 0x800000;
      break;

    case 63:
      d[3] = d[3] | 0x80000000;
      break;

    case 64:
      e[0] = 0x80;
      break;

    case 65:
      e[0] = e[0] | 0x8000;
      break;

    case 66:
      e[0] = e[0] | 0x800000;
      break;

    case 67:
      e[0] = e[0] | 0x80000000;
      break;

    case 68:
      e[1] = 0x80;
      break;

    case 69:
      e[1] = e[1] | 0x8000;
      break;

    case 70:
      e[1] = e[1] | 0x800000;
      break;

    case 71:
      e[1] = e[1] | 0x80000000;
      break;

    case 72:
      e[2] = 0x80;
      break;

    case 73:
      e[2] = e[2] | 0x8000;
      break;

    case 74:
      e[2] = e[2] | 0x800000;
      break;

    case 75:
      e[2] = e[2] | 0x80000000;
      break;

    case 76:
      e[3] = 0x80;
      break;

    case 77:
      e[3] = e[3] | 0x8000;
      break;

    case 78:
      e[3] = e[3] | 0x800000;
      break;

    case 79:
      e[3] = e[3] | 0x80000000;
      break;

    case 80:
      f[0] = 0x80;
      break;

    case 81:
      f[0] = f[0] | 0x8000;
      break;

    case 82:
      f[0] = f[0] | 0x800000;
      break;

    case 83:
      f[0] = f[0] | 0x80000000;
      break;

    case 84:
      f[1] = 0x80;
      break;

    case 85:
      f[1] = f[1] | 0x8000;
      break;

    case 86:
      f[1] = f[1] | 0x800000;
      break;

    case 87:
      f[1] = f[1] | 0x80000000;
      break;

    case 88:
      f[2] = 0x80;
      break;

    case 89:
      f[2] = f[2] | 0x8000;
      break;

    case 90:
      f[2] = f[2] | 0x800000;
      break;

    case 91:
      f[2] = f[2] | 0x80000000;
      break;

    case 92:
      f[3] = 0x80;
      break;

    case 93:
      f[3] = f[3] | 0x8000;
      break;

    case 94:
      f[3] = f[3] | 0x800000;
      break;

    case 95:
      f[3] = f[3] | 0x80000000;
      break;

    case 96:
      g[0] = 0x80;
      break;

    case 97:
      g[0] = g[0] | 0x8000;
      break;

    case 98:
      g[0] = g[0] | 0x800000;
      break;

    case 99:
      g[0] = g[0] | 0x80000000;
      break;

    case 100:
      g[1] = 0x80;
      break;

    case 101:
      g[1] = g[1] | 0x8000;
      break;

    case 102:
      g[1] = g[1] | 0x800000;
      break;

    case 103:
      g[1] = g[1] | 0x80000000;
      break;

    case 104:
      g[2] = 0x80;
      break;

    case 105:
      g[2] = g[2] | 0x8000;
      break;

    case 106:
      g[2] = g[2] | 0x800000;
      break;

    case 107:
      g[2] = g[2] | 0x80000000;
      break;

    case 108:
      g[3] = 0x80;
      break;

    case 109:
      g[3] = g[3] | 0x8000;
      break;

    case 110:
      g[3] = g[3] | 0x800000;
      break;

    case 111:
      g[3] = g[3] | 0x80000000;
      break;

    case 112:
      h[0] = 0x80;
      break;

    case 113:
      h[0] = h[0] | 0x8000;
      break;

    case 114:
      h[0] = h[0] | 0x800000;
      break;

    case 115:
      h[0] = h[0] | 0x80000000;
      break;

    case 116:
      h[1] = 0x80;
      break;

    case 117:
      h[1] = h[1] | 0x8000;
      break;

    case 118:
      h[1] = h[1] | 0x800000;
      break;

    case 119:
      h[1] = h[1] | 0x80000000;
      break;

    case 120:
      h[2] = 0x80;
      break;

    case 121:
      h[2] = h[2] | 0x8000;
      break;

    case 122:
      h[2] = h[2] | 0x800000;
      break;

    case 123:
      h[2] = h[2] | 0x80000000;
      break;

    case 124:
      h[3] = 0x80;
      break;

    case 125:
      h[3] = h[3] | 0x8000;
      break;

    case 126:
      h[3] = h[3] | 0x800000;
      break;

    case 127:
      h[3] = h[3] | 0x80000000;
      break;
  }
}

inline void AT(u32x a[16], const u32 b) {
  switch (b) {
    case 0:
      a[0] = 0x80;
      break;

    case 1:
      a[0] = a[0] | 0x8000;
      break;

    case 2:
      a[0] = a[0] | 0x800000;
      break;

    case 3:
      a[0] = a[0] | 0x80000000;
      break;

    case 4:
      a[1] = 0x80;
      break;

    case 5:
      a[1] = a[1] | 0x8000;
      break;

    case 6:
      a[1] = a[1] | 0x800000;
      break;

    case 7:
      a[1] = a[1] | 0x80000000;
      break;

    case 8:
      a[2] = 0x80;
      break;

    case 9:
      a[2] = a[2] | 0x8000;
      break;

    case 10:
      a[2] = a[2] | 0x800000;
      break;

    case 11:
      a[2] = a[2] | 0x80000000;
      break;

    case 12:
      a[3] = 0x80;
      break;

    case 13:
      a[3] = a[3] | 0x8000;
      break;

    case 14:
      a[3] = a[3] | 0x800000;
      break;

    case 15:
      a[3] = a[3] | 0x80000000;
      break;

    case 16:
      a[4] = 0x80;
      break;

    case 17:
      a[4] = a[4] | 0x8000;
      break;

    case 18:
      a[4] = a[4] | 0x800000;
      break;

    case 19:
      a[4] = a[4] | 0x80000000;
      break;

    case 20:
      a[5] = 0x80;
      break;

    case 21:
      a[5] = a[5] | 0x8000;
      break;

    case 22:
      a[5] = a[5] | 0x800000;
      break;

    case 23:
      a[5] = a[5] | 0x80000000;
      break;

    case 24:
      a[6] = 0x80;
      break;

    case 25:
      a[6] = a[6] | 0x8000;
      break;

    case 26:
      a[6] = a[6] | 0x800000;
      break;

    case 27:
      a[6] = a[6] | 0x80000000;
      break;

    case 28:
      a[7] = 0x80;
      break;

    case 29:
      a[7] = a[7] | 0x8000;
      break;

    case 30:
      a[7] = a[7] | 0x800000;
      break;

    case 31:
      a[7] = a[7] | 0x80000000;
      break;

    case 32:
      a[8] = 0x80;
      break;

    case 33:
      a[8] = a[8] | 0x8000;
      break;

    case 34:
      a[8] = a[8] | 0x800000;
      break;

    case 35:
      a[8] = a[8] | 0x80000000;
      break;

    case 36:
      a[9] = 0x80;
      break;

    case 37:
      a[9] = a[9] | 0x8000;
      break;

    case 38:
      a[9] = a[9] | 0x800000;
      break;

    case 39:
      a[9] = a[9] | 0x80000000;
      break;

    case 40:
      a[10] = 0x80;
      break;

    case 41:
      a[10] = a[10] | 0x8000;
      break;

    case 42:
      a[10] = a[10] | 0x800000;
      break;

    case 43:
      a[10] = a[10] | 0x80000000;
      break;

    case 44:
      a[11] = 0x80;
      break;

    case 45:
      a[11] = a[11] | 0x8000;
      break;

    case 46:
      a[11] = a[11] | 0x800000;
      break;

    case 47:
      a[11] = a[11] | 0x80000000;
      break;

    case 48:
      a[12] = 0x80;
      break;

    case 49:
      a[12] = a[12] | 0x8000;
      break;

    case 50:
      a[12] = a[12] | 0x800000;
      break;

    case 51:
      a[12] = a[12] | 0x80000000;
      break;

    case 52:
      a[13] = 0x80;
      break;

    case 53:
      a[13] = a[13] | 0x8000;
      break;

    case 54:
      a[13] = a[13] | 0x800000;
      break;

    case 55:
      a[13] = a[13] | 0x80000000;
      break;

    case 56:
      a[14] = 0x80;
      break;

    case 57:
      a[14] = a[14] | 0x8000;
      break;

    case 58:
      a[14] = a[14] | 0x800000;
      break;

    case 59:
      a[14] = a[14] | 0x80000000;
      break;

    case 60:
      a[15] = 0x80;
      break;

    case 61:
      a[15] = a[15] | 0x8000;
      break;

    case 62:
      a[15] = a[15] | 0x800000;
      break;

    case 63:
      a[15] = a[15] | 0x80000000;
      break;
  }
}

inline void AU(u32x a[4], u32x b[4], u32x c[4], u32x d[4], const u32 e) {
  const int f = e & 3;

  const int g = 4 - e;

  switch (e / 4) {
    case 0:
      d[2] = U(0, d[1], g);
      d[1] = U(d[1], d[0], g);
      d[0] = U(d[0], c[3], g);
      c[3] = U(c[3], c[2], g);
      c[2] = U(c[2], c[1], g);
      c[1] = U(c[1], c[0], g);
      c[0] = U(c[0], b[3], g);
      b[3] = U(b[3], b[2], g);
      b[2] = U(b[2], b[1], g);
      b[1] = U(b[1], b[0], g);
      b[0] = U(b[0], a[3], g);
      a[3] = U(a[3], a[2], g);
      a[2] = U(a[2], a[1], g);
      a[1] = U(a[1], a[0], g);
      a[0] = U(a[0], 0, g);

      if (f == 0) {
        a[0] = a[1];
        a[1] = a[2];
        a[2] = a[3];
        a[3] = b[0];
        b[0] = b[1];
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 1:
      d[2] = U(0, d[0], g);
      d[1] = U(d[0], c[3], g);
      d[0] = U(c[3], c[2], g);
      c[3] = U(c[2], c[1], g);
      c[2] = U(c[1], c[0], g);
      c[1] = U(c[0], b[3], g);
      c[0] = U(b[3], b[2], g);
      b[3] = U(b[2], b[1], g);
      b[2] = U(b[1], b[0], g);
      b[1] = U(b[0], a[3], g);
      b[0] = U(a[3], a[2], g);
      a[3] = U(a[2], a[1], g);
      a[2] = U(a[1], a[0], g);
      a[1] = U(a[0], 0, g);
      a[0] = 0;

      if (f == 0) {
        a[1] = a[2];
        a[2] = a[3];
        a[3] = b[0];
        b[0] = b[1];
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 2:
      d[2] = U(0, c[3], g);
      d[1] = U(c[3], c[2], g);
      d[0] = U(c[2], c[1], g);
      c[3] = U(c[1], c[0], g);
      c[2] = U(c[0], b[3], g);
      c[1] = U(b[3], b[2], g);
      c[0] = U(b[2], b[1], g);
      b[3] = U(b[1], b[0], g);
      b[2] = U(b[0], a[3], g);
      b[1] = U(a[3], a[2], g);
      b[0] = U(a[2], a[1], g);
      a[3] = U(a[1], a[0], g);
      a[2] = U(a[0], 0, g);
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        a[2] = a[3];
        a[3] = b[0];
        b[0] = b[1];
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 3:
      d[2] = U(0, c[2], g);
      d[1] = U(c[2], c[1], g);
      d[0] = U(c[1], c[0], g);
      c[3] = U(c[0], b[3], g);
      c[2] = U(b[3], b[2], g);
      c[1] = U(b[2], b[1], g);
      c[0] = U(b[1], b[0], g);
      b[3] = U(b[0], a[3], g);
      b[2] = U(a[3], a[2], g);
      b[1] = U(a[2], a[1], g);
      b[0] = U(a[1], a[0], g);
      a[3] = U(a[0], 0, g);
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        a[3] = b[0];
        b[0] = b[1];
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 4:
      d[2] = U(0, c[1], g);
      d[1] = U(c[1], c[0], g);
      d[0] = U(c[0], b[3], g);
      c[3] = U(b[3], b[2], g);
      c[2] = U(b[2], b[1], g);
      c[1] = U(b[1], b[0], g);
      c[0] = U(b[0], a[3], g);
      b[3] = U(a[3], a[2], g);
      b[2] = U(a[2], a[1], g);
      b[1] = U(a[1], a[0], g);
      b[0] = U(a[0], 0, g);
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        b[0] = b[1];
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 5:
      d[2] = U(0, c[0], g);
      d[1] = U(c[0], b[3], g);
      d[0] = U(b[3], b[2], g);
      c[3] = U(b[2], b[1], g);
      c[2] = U(b[1], b[0], g);
      c[1] = U(b[0], a[3], g);
      c[0] = U(a[3], a[2], g);
      b[3] = U(a[2], a[1], g);
      b[2] = U(a[1], a[0], g);
      b[1] = U(a[0], 0, g);
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 6:
      d[2] = U(0, b[3], g);
      d[1] = U(b[3], b[2], g);
      d[0] = U(b[2], b[1], g);
      c[3] = U(b[1], b[0], g);
      c[2] = U(b[0], a[3], g);
      c[1] = U(a[3], a[2], g);
      c[0] = U(a[2], a[1], g);
      b[3] = U(a[1], a[0], g);
      b[2] = U(a[0], 0, g);
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 7:
      d[2] = U(0, b[2], g);
      d[1] = U(b[2], b[1], g);
      d[0] = U(b[1], b[0], g);
      c[3] = U(b[0], a[3], g);
      c[2] = U(a[3], a[2], g);
      c[1] = U(a[2], a[1], g);
      c[0] = U(a[1], a[0], g);
      b[3] = U(a[0], 0, g);
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 8:
      d[2] = U(0, b[1], g);
      d[1] = U(b[1], b[0], g);
      d[0] = U(b[0], a[3], g);
      c[3] = U(a[3], a[2], g);
      c[2] = U(a[2], a[1], g);
      c[1] = U(a[1], a[0], g);
      c[0] = U(a[0], 0, g);
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 9:
      d[2] = U(0, b[0], g);
      d[1] = U(b[0], a[3], g);
      d[0] = U(a[3], a[2], g);
      c[3] = U(a[2], a[1], g);
      c[2] = U(a[1], a[0], g);
      c[1] = U(a[0], 0, g);
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 10:
      d[2] = U(0, a[3], g);
      d[1] = U(a[3], a[2], g);
      d[0] = U(a[2], a[1], g);
      c[3] = U(a[1], a[0], g);
      c[2] = U(a[0], 0, g);
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 11:
      d[2] = U(0, a[2], g);
      d[1] = U(a[2], a[1], g);
      d[0] = U(a[1], a[0], g);
      c[3] = U(a[0], 0, g);
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 12:
      d[2] = U(0, a[1], g);
      d[1] = U(a[1], a[0], g);
      d[0] = U(a[0], 0, g);
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 13:
      d[2] = U(0, a[0], g);
      d[1] = U(a[0], 0, g);
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        d[1] = d[2];
        d[2] = 0;
      }

      break;
  }
}

inline void AV(u32x a[4], u32x b[4], u32x c[4], u32x d[4], const u32 e) {
  switch (e / 4) {
    case 0:
      d[2] = U(d[1], 0, e);
      d[1] = U(d[0], d[1], e);
      d[0] = U(c[3], d[0], e);
      c[3] = U(c[2], c[3], e);
      c[2] = U(c[1], c[2], e);
      c[1] = U(c[0], c[1], e);
      c[0] = U(b[3], c[0], e);
      b[3] = U(b[2], b[3], e);
      b[2] = U(b[1], b[2], e);
      b[1] = U(b[0], b[1], e);
      b[0] = U(a[3], b[0], e);
      a[3] = U(a[2], a[3], e);
      a[2] = U(a[1], a[2], e);
      a[1] = U(a[0], a[1], e);
      a[0] = U(0, a[0], e);
      break;

    case 1:
      d[2] = U(d[0], 0, e);
      d[1] = U(c[3], d[0], e);
      d[0] = U(c[2], c[3], e);
      c[3] = U(c[1], c[2], e);
      c[2] = U(c[0], c[1], e);
      c[1] = U(b[3], c[0], e);
      c[0] = U(b[2], b[3], e);
      b[3] = U(b[1], b[2], e);
      b[2] = U(b[0], b[1], e);
      b[1] = U(a[3], b[0], e);
      b[0] = U(a[2], a[3], e);
      a[3] = U(a[1], a[2], e);
      a[2] = U(a[0], a[1], e);
      a[1] = U(0, a[0], e);
      a[0] = 0;
      break;

    case 2:
      d[2] = U(c[3], 0, e);
      d[1] = U(c[2], c[3], e);
      d[0] = U(c[1], c[2], e);
      c[3] = U(c[0], c[1], e);
      c[2] = U(b[3], c[0], e);
      c[1] = U(b[2], b[3], e);
      c[0] = U(b[1], b[2], e);
      b[3] = U(b[0], b[1], e);
      b[2] = U(a[3], b[0], e);
      b[1] = U(a[2], a[3], e);
      b[0] = U(a[1], a[2], e);
      a[3] = U(a[0], a[1], e);
      a[2] = U(0, a[0], e);
      a[1] = 0;
      a[0] = 0;
      break;

    case 3:
      d[2] = U(c[2], 0, e);
      d[1] = U(c[1], c[2], e);
      d[0] = U(c[0], c[1], e);
      c[3] = U(b[3], c[0], e);
      c[2] = U(b[2], b[3], e);
      c[1] = U(b[1], b[2], e);
      c[0] = U(b[0], b[1], e);
      b[3] = U(a[3], b[0], e);
      b[2] = U(a[2], a[3], e);
      b[1] = U(a[1], a[2], e);
      b[0] = U(a[0], a[1], e);
      a[3] = U(0, a[0], e);
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 4:
      d[2] = U(c[1], 0, e);
      d[1] = U(c[0], c[1], e);
      d[0] = U(b[3], c[0], e);
      c[3] = U(b[2], b[3], e);
      c[2] = U(b[1], b[2], e);
      c[1] = U(b[0], b[1], e);
      c[0] = U(a[3], b[0], e);
      b[3] = U(a[2], a[3], e);
      b[2] = U(a[1], a[2], e);
      b[1] = U(a[0], a[1], e);
      b[0] = U(0, a[0], e);
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 5:
      d[2] = U(c[0], 0, e);
      d[1] = U(b[3], c[0], e);
      d[0] = U(b[2], b[3], e);
      c[3] = U(b[1], b[2], e);
      c[2] = U(b[0], b[1], e);
      c[1] = U(a[3], b[0], e);
      c[0] = U(a[2], a[3], e);
      b[3] = U(a[1], a[2], e);
      b[2] = U(a[0], a[1], e);
      b[1] = U(0, a[0], e);
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 6:
      d[2] = U(b[3], 0, e);
      d[1] = U(b[2], b[3], e);
      d[0] = U(b[1], b[2], e);
      c[3] = U(b[0], b[1], e);
      c[2] = U(a[3], b[0], e);
      c[1] = U(a[2], a[3], e);
      c[0] = U(a[1], a[2], e);
      b[3] = U(a[0], a[1], e);
      b[2] = U(0, a[0], e);
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 7:
      d[2] = U(b[2], 0, e);
      d[1] = U(b[1], b[2], e);
      d[0] = U(b[0], b[1], e);
      c[3] = U(a[3], b[0], e);
      c[2] = U(a[2], a[3], e);
      c[1] = U(a[1], a[2], e);
      c[0] = U(a[0], a[1], e);
      b[3] = U(0, a[0], e);
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 8:
      d[2] = U(b[1], 0, e);
      d[1] = U(b[0], b[1], e);
      d[0] = U(a[3], b[0], e);
      c[3] = U(a[2], a[3], e);
      c[2] = U(a[1], a[2], e);
      c[1] = U(a[0], a[1], e);
      c[0] = U(0, a[0], e);
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 9:
      d[2] = U(b[0], 0, e);
      d[1] = U(a[3], b[0], e);
      d[0] = U(a[2], a[3], e);
      c[3] = U(a[1], a[2], e);
      c[2] = U(a[0], a[1], e);
      c[1] = U(0, a[0], e);
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 10:
      d[2] = U(a[3], 0, e);
      d[1] = U(a[2], a[3], e);
      d[0] = U(a[1], a[2], e);
      c[3] = U(a[0], a[1], e);
      c[2] = U(0, a[0], e);
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 11:
      d[2] = U(a[2], 0, e);
      d[1] = U(a[1], a[2], e);
      d[0] = U(a[0], a[1], e);
      c[3] = U(0, a[0], e);
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 12:
      d[2] = U(a[1], 0, e);
      d[1] = U(a[0], a[1], e);
      d[0] = U(0, a[0], e);
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 13:
      d[2] = U(a[0], 0, e);
      d[1] = U(0, a[0], e);
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;
  }
}

inline void AW(u32x a[16], const u32x b, const u32 c) {
  switch (c) {
    case 0:
      a[0] = b;
      break;
    case 1:
      a[0] = (a[0] & 0x000000ff) | (b << 8);
      a[1] = (a[1] & 0xffffff00) | (b >> 24);
      break;
    case 2:
      a[0] = (a[0] & 0x0000ffff) | (b << 16);
      a[1] = (a[1] & 0xffff0000) | (b >> 16);
      break;
    case 3:
      a[0] = (a[0] & 0x00ffffff) | (b << 24);
      a[1] = (a[1] & 0xff000000) | (b >> 8);
      break;
    case 4:
      a[1] = b;
      break;
    case 5:
      a[1] = (a[1] & 0x000000ff) | (b << 8);
      a[2] = (a[2] & 0xffffff00) | (b >> 24);
      break;
    case 6:
      a[1] = (a[1] & 0x0000ffff) | (b << 16);
      a[2] = (a[2] & 0xffff0000) | (b >> 16);
      break;
    case 7:
      a[1] = (a[1] & 0x00ffffff) | (b << 24);
      a[2] = (a[2] & 0xff000000) | (b >> 8);
      break;
    case 8:
      a[2] = b;
      break;
    case 9:
      a[2] = (a[2] & 0x000000ff) | (b << 8);
      a[3] = (a[3] & 0xffffff00) | (b >> 24);
      break;
    case 10:
      a[2] = (a[2] & 0x0000ffff) | (b << 16);
      a[3] = (a[3] & 0xffff0000) | (b >> 16);
      break;
    case 11:
      a[2] = (a[2] & 0x00ffffff) | (b << 24);
      a[3] = (a[3] & 0xff000000) | (b >> 8);
      break;
    case 12:
      a[3] = b;
      break;
    case 13:
      a[3] = (a[3] & 0x000000ff) | (b << 8);
      a[4] = (a[4] & 0xffffff00) | (b >> 24);
      break;
    case 14:
      a[3] = (a[3] & 0x0000ffff) | (b << 16);
      a[4] = (a[4] & 0xffff0000) | (b >> 16);
      break;
    case 15:
      a[3] = (a[3] & 0x00ffffff) | (b << 24);
      a[4] = (a[4] & 0xff000000) | (b >> 8);
      break;
    case 16:
      a[4] = b;
      break;
    case 17:
      a[4] = (a[4] & 0x000000ff) | (b << 8);
      a[5] = (a[5] & 0xffffff00) | (b >> 24);
      break;
    case 18:
      a[4] = (a[4] & 0x0000ffff) | (b << 16);
      a[5] = (a[5] & 0xffff0000) | (b >> 16);
      break;
    case 19:
      a[4] = (a[4] & 0x00ffffff) | (b << 24);
      a[5] = (a[5] & 0xff000000) | (b >> 8);
      break;
    case 20:
      a[5] = b;
      break;
    case 21:
      a[5] = (a[5] & 0x000000ff) | (b << 8);
      a[6] = (a[6] & 0xffffff00) | (b >> 24);
      break;
    case 22:
      a[5] = (a[5] & 0x0000ffff) | (b << 16);
      a[6] = (a[6] & 0xffff0000) | (b >> 16);
      break;
    case 23:
      a[5] = (a[5] & 0x00ffffff) | (b << 24);
      a[6] = (a[6] & 0xff000000) | (b >> 8);
      break;
    case 24:
      a[6] = b;
      break;
    case 25:
      a[6] = (a[6] & 0x000000ff) | (b << 8);
      a[7] = (a[7] & 0xffffff00) | (b >> 24);
      break;
    case 26:
      a[6] = (a[6] & 0x0000ffff) | (b << 16);
      a[7] = (a[7] & 0xffff0000) | (b >> 16);
      break;
    case 27:
      a[6] = (a[6] & 0x00ffffff) | (b << 24);
      a[7] = (a[7] & 0xff000000) | (b >> 8);
      break;
    case 28:
      a[7] = b;
      break;
    case 29:
      a[7] = (a[7] & 0x000000ff) | (b << 8);
      a[8] = (a[8] & 0xffffff00) | (b >> 24);
      break;
    case 30:
      a[7] = (a[7] & 0x0000ffff) | (b << 16);
      a[8] = (a[8] & 0xffff0000) | (b >> 16);
      break;
    case 31:
      a[7] = (a[7] & 0x00ffffff) | (b << 24);
      a[8] = (a[8] & 0xff000000) | (b >> 8);
      break;
  }
}

inline void AX(u32x a[16], const u32x b, const u32 c) {
  switch (c) {
    case 0:
      a[0] = b;
      break;
    case 1:
      a[0] = (a[0] & 0xff000000) | (b >> 8);
      a[1] = (a[1] & 0x00ffffff) | (b << 24);
      break;
    case 2:
      a[0] = (a[0] & 0xffff0000) | (b >> 16);
      a[1] = (a[1] & 0x0000ffff) | (b << 16);
      break;
    case 3:
      a[0] = (a[0] & 0xffffff00) | (b >> 24);
      a[1] = (a[1] & 0x000000ff) | (b << 8);
      break;
    case 4:
      a[1] = b;
      break;
    case 5:
      a[1] = (a[1] & 0xff000000) | (b >> 8);
      a[2] = (a[2] & 0x00ffffff) | (b << 24);
      break;
    case 6:
      a[1] = (a[1] & 0xffff0000) | (b >> 16);
      a[2] = (a[2] & 0x0000ffff) | (b << 16);
      break;
    case 7:
      a[1] = (a[1] & 0xffffff00) | (b >> 24);
      a[2] = (a[2] & 0x000000ff) | (b << 8);
      break;
    case 8:
      a[2] = b;
      break;
    case 9:
      a[2] = (a[2] & 0xff000000) | (b >> 8);
      a[3] = (a[3] & 0x00ffffff) | (b << 24);
      break;
    case 10:
      a[2] = (a[2] & 0xffff0000) | (b >> 16);
      a[3] = (a[3] & 0x0000ffff) | (b << 16);
      break;
    case 11:
      a[2] = (a[2] & 0xffffff00) | (b >> 24);
      a[3] = (a[3] & 0x000000ff) | (b << 8);
      break;
    case 12:
      a[3] = b;
      break;
    case 13:
      a[3] = (a[3] & 0xff000000) | (b >> 8);
      a[4] = (a[4] & 0x00ffffff) | (b << 24);
      break;
    case 14:
      a[3] = (a[3] & 0xffff0000) | (b >> 16);
      a[4] = (a[4] & 0x0000ffff) | (b << 16);
      break;
    case 15:
      a[3] = (a[3] & 0xffffff00) | (b >> 24);
      a[4] = (a[4] & 0x000000ff) | (b << 8);
      break;
    case 16:
      a[4] = b;
      break;
    case 17:
      a[4] = (a[4] & 0xff000000) | (b >> 8);
      a[5] = (a[5] & 0x00ffffff) | (b << 24);
      break;
    case 18:
      a[4] = (a[4] & 0xffff0000) | (b >> 16);
      a[5] = (a[5] & 0x0000ffff) | (b << 16);
      break;
    case 19:
      a[4] = (a[4] & 0xffffff00) | (b >> 24);
      a[5] = (a[5] & 0x000000ff) | (b << 8);
      break;
    case 20:
      a[5] = b;
      break;
    case 21:
      a[5] = (a[5] & 0xff000000) | (b >> 8);
      a[6] = (a[6] & 0x00ffffff) | (b << 24);
      break;
    case 22:
      a[5] = (a[5] & 0xffff0000) | (b >> 16);
      a[6] = (a[6] & 0x0000ffff) | (b << 16);
      break;
    case 23:
      a[5] = (a[5] & 0xffffff00) | (b >> 24);
      a[6] = (a[6] & 0x000000ff) | (b << 8);
      break;
    case 24:
      a[6] = b;
      break;
    case 25:
      a[6] = (a[6] & 0xff000000) | (b >> 8);
      a[7] = (a[7] & 0x00ffffff) | (b << 24);
      break;
    case 26:
      a[6] = (a[6] & 0xffff0000) | (b >> 16);
      a[7] = (a[7] & 0x0000ffff) | (b << 16);
      break;
    case 27:
      a[6] = (a[6] & 0xffffff00) | (b >> 24);
      a[7] = (a[7] & 0x000000ff) | (b << 8);
      break;
    case 28:
      a[7] = b;
      break;
    case 29:
      a[7] = (a[7] & 0xff000000) | (b >> 8);
      a[8] = (a[8] & 0x00ffffff) | (b << 24);
      break;
    case 30:
      a[7] = (a[7] & 0xffff0000) | (b >> 16);
      a[8] = (a[8] & 0x0000ffff) | (b << 16);
      break;
    case 31:
      a[7] = (a[7] & 0xffffff00) | (b >> 24);
      a[8] = (a[8] & 0x000000ff) | (b << 8);
      break;
  }
}

inline void AY(u32x a[4], u32x b[4], u32x c[4], u32x d[4], const u32x e, const u32 f) {
  switch (f) {
    case 0:
      a[0] = e;
      break;
    case 1:
      a[0] = (a[0] & 0x000000ff) | (e << 8);
      a[1] = (a[1] & 0xffffff00) | (e >> 24);
      break;
    case 2:
      a[0] = (a[0] & 0x0000ffff) | (e << 16);
      a[1] = (a[1] & 0xffff0000) | (e >> 16);
      break;
    case 3:
      a[0] = (a[0] & 0x00ffffff) | (e << 24);
      a[1] = (a[1] & 0xff000000) | (e >> 8);
      break;
    case 4:
      a[1] = e;
      break;
    case 5:
      a[1] = (a[1] & 0x000000ff) | (e << 8);
      a[2] = (a[2] & 0xffffff00) | (e >> 24);
      break;
    case 6:
      a[1] = (a[1] & 0x0000ffff) | (e << 16);
      a[2] = (a[2] & 0xffff0000) | (e >> 16);
      break;
    case 7:
      a[1] = (a[1] & 0x00ffffff) | (e << 24);
      a[2] = (a[2] & 0xff000000) | (e >> 8);
      break;
    case 8:
      a[2] = e;
      break;
    case 9:
      a[2] = (a[2] & 0x000000ff) | (e << 8);
      a[3] = (a[3] & 0xffffff00) | (e >> 24);
      break;
    case 10:
      a[2] = (a[2] & 0x0000ffff) | (e << 16);
      a[3] = (a[3] & 0xffff0000) | (e >> 16);
      break;
    case 11:
      a[2] = (a[2] & 0x00ffffff) | (e << 24);
      a[3] = (a[3] & 0xff000000) | (e >> 8);
      break;
    case 12:
      a[3] = e;
      break;
    case 13:
      a[3] = (a[3] & 0x000000ff) | (e << 8);
      b[0] = (b[0] & 0xffffff00) | (e >> 24);
      break;
    case 14:
      a[3] = (a[3] & 0x0000ffff) | (e << 16);
      b[0] = (b[0] & 0xffff0000) | (e >> 16);
      break;
    case 15:
      a[3] = (a[3] & 0x00ffffff) | (e << 24);
      b[0] = (b[0] & 0xff000000) | (e >> 8);
      break;
    case 16:
      b[0] = e;
      break;
    case 17:
      b[0] = (b[0] & 0x000000ff) | (e << 8);
      b[1] = (b[1] & 0xffffff00) | (e >> 24);
      break;
    case 18:
      b[0] = (b[0] & 0x0000ffff) | (e << 16);
      b[1] = (b[1] & 0xffff0000) | (e >> 16);
      break;
    case 19:
      b[0] = (b[0] & 0x00ffffff) | (e << 24);
      b[1] = (b[1] & 0xff000000) | (e >> 8);
      break;
    case 20:
      b[1] = e;
      break;
    case 21:
      b[1] = (b[1] & 0x000000ff) | (e << 8);
      b[2] = (b[2] & 0xffffff00) | (e >> 24);
      break;
    case 22:
      b[1] = (b[1] & 0x0000ffff) | (e << 16);
      b[2] = (b[2] & 0xffff0000) | (e >> 16);
      break;
    case 23:
      b[1] = (b[1] & 0x00ffffff) | (e << 24);
      b[2] = (b[2] & 0xff000000) | (e >> 8);
      break;
    case 24:
      b[2] = e;
      break;
    case 25:
      b[2] = (b[2] & 0x000000ff) | (e << 8);
      b[3] = (b[3] & 0xffffff00) | (e >> 24);
      break;
    case 26:
      b[2] = (b[2] & 0x0000ffff) | (e << 16);
      b[3] = (b[3] & 0xffff0000) | (e >> 16);
      break;
    case 27:
      b[2] = (b[2] & 0x00ffffff) | (e << 24);
      b[3] = (b[3] & 0xff000000) | (e >> 8);
      break;
    case 28:
      b[3] = e;
      break;
    case 29:
      b[3] = (b[3] & 0x000000ff) | (e << 8);
      c[0] = (c[0] & 0xffffff00) | (e >> 24);
      break;
    case 30:
      b[3] = (b[3] & 0x0000ffff) | (e << 16);
      c[0] = (c[0] & 0xffff0000) | (e >> 16);
      break;
    case 31:
      b[3] = (b[3] & 0x00ffffff) | (e << 24);
      c[0] = (c[0] & 0xff000000) | (e >> 8);
      break;
    case 32:
      c[0] = e;
      break;
    case 33:
      c[0] = (c[0] & 0x000000ff) | (e << 8);
      c[1] = (c[1] & 0xffffff00) | (e >> 24);
      break;
    case 34:
      c[0] = (c[0] & 0x0000ffff) | (e << 16);
      c[1] = (c[1] & 0xffff0000) | (e >> 16);
      break;
    case 35:
      c[0] = (c[0] & 0x00ffffff) | (e << 24);
      c[1] = (c[1] & 0xff000000) | (e >> 8);
      break;
    case 36:
      c[1] = e;
      break;
    case 37:
      c[1] = (c[1] & 0x000000ff) | (e << 8);
      c[2] = (c[2] & 0xffffff00) | (e >> 24);
      break;
    case 38:
      c[1] = (c[1] & 0x0000ffff) | (e << 16);
      c[2] = (c[2] & 0xffff0000) | (e >> 16);
      break;
    case 39:
      c[1] = (c[1] & 0x00ffffff) | (e << 24);
      c[2] = (c[2] & 0xff000000) | (e >> 8);
      break;
    case 40:
      c[2] = e;
      break;
    case 41:
      c[2] = (c[2] & 0x000000ff) | (e << 8);
      c[3] = (c[3] & 0xffffff00) | (e >> 24);
      break;
    case 42:
      c[2] = (c[2] & 0x0000ffff) | (e << 16);
      c[3] = (c[3] & 0xffff0000) | (e >> 16);
      break;
    case 43:
      c[2] = (c[2] & 0x00ffffff) | (e << 24);
      c[3] = (c[3] & 0xff000000) | (e >> 8);
      break;
    case 44:
      c[3] = e;
      break;
    case 45:
      c[3] = (c[3] & 0x000000ff) | (e << 8);
      d[0] = (d[0] & 0xffffff00) | (e >> 24);
      break;
    case 46:
      c[3] = (c[3] & 0x0000ffff) | (e << 16);
      d[0] = (d[0] & 0xffff0000) | (e >> 16);
      break;
    case 47:
      c[3] = (c[3] & 0x00ffffff) | (e << 24);
      d[0] = (d[0] & 0xff000000) | (e >> 8);
      break;
    case 48:
      d[0] = e;
      break;
    case 49:
      d[0] = (d[0] & 0x000000ff) | (e << 8);
      d[1] = (d[1] & 0xffffff00) | (e >> 24);
      break;
    case 50:
      d[0] = (d[0] & 0x0000ffff) | (e << 16);
      d[1] = (d[1] & 0xffff0000) | (e >> 16);
      break;
    case 51:
      d[0] = (d[0] & 0x00ffffff) | (e << 24);
      d[1] = (d[1] & 0xff000000) | (e >> 8);
      break;
    case 52:
      d[1] = e;
      break;
    case 53:
      d[1] = (d[1] & 0x000000ff) | (e << 8);
      d[2] = (d[2] & 0xffffff00) | (e >> 24);
      break;
    case 54:
      d[1] = (d[1] & 0x0000ffff) | (e << 16);
      d[2] = (d[2] & 0xffff0000) | (e >> 16);
      break;
    case 55:
      d[1] = (d[1] & 0x00ffffff) | (e << 24);
      d[2] = (d[2] & 0xff000000) | (e >> 8);
      break;
    case 56:
      d[2] = e;
      break;
    case 57:
      d[2] = (d[2] & 0x000000ff) | (e << 8);
      d[3] = (d[3] & 0xffffff00) | (e >> 24);
      break;
    case 58:
      d[2] = (d[2] & 0x0000ffff) | (e << 16);
      d[3] = (d[3] & 0xffff0000) | (e >> 16);
      break;
    case 59:
      d[2] = (d[2] & 0x00ffffff) | (e << 24);
      d[3] = (d[3] & 0xff000000) | (e >> 8);
      break;
    case 60:
      d[3] = e;
      break;
    case 61:
      d[3] = (d[3] & 0x000000ff) | (e << 8);

      break;
    case 62:
      d[3] = (d[3] & 0x0000ffff) | (e << 16);

      break;
    case 63:
      d[3] = (d[3] & 0x00ffffff) | (e << 24);

      break;
  }
}

inline void AZ(u32x a[4], u32x b[4], u32x c[4], u32x d[4], const u32x e, const u32 f) {
  switch (f) {
    case 0:
      a[0] = e;
      break;
    case 1:
      a[0] = (a[0] & 0xff000000) | (e >> 8);
      a[1] = (a[1] & 0x00ffffff) | (e << 24);
      break;
    case 2:
      a[0] = (a[0] & 0xffff0000) | (e >> 16);
      a[1] = (a[1] & 0x0000ffff) | (e << 16);
      break;
    case 3:
      a[0] = (a[0] & 0xffffff00) | (e >> 24);
      a[1] = (a[1] & 0x000000ff) | (e << 8);
      break;
    case 4:
      a[1] = e;
      break;
    case 5:
      a[1] = (a[1] & 0xff000000) | (e >> 8);
      a[2] = (a[2] & 0x00ffffff) | (e << 24);
      break;
    case 6:
      a[1] = (a[1] & 0xffff0000) | (e >> 16);
      a[2] = (a[2] & 0x0000ffff) | (e << 16);
      break;
    case 7:
      a[1] = (a[1] & 0xffffff00) | (e >> 24);
      a[2] = (a[2] & 0x000000ff) | (e << 8);
      break;
    case 8:
      a[2] = e;
      break;
    case 9:
      a[2] = (a[2] & 0xff000000) | (e >> 8);
      a[3] = (a[3] & 0x00ffffff) | (e << 24);
      break;
    case 10:
      a[2] = (a[2] & 0xffff0000) | (e >> 16);
      a[3] = (a[3] & 0x0000ffff) | (e << 16);
      break;
    case 11:
      a[2] = (a[2] & 0xffffff00) | (e >> 24);
      a[3] = (a[3] & 0x000000ff) | (e << 8);
      break;
    case 12:
      a[3] = e;
      break;
    case 13:
      a[3] = (a[3] & 0xff000000) | (e >> 8);
      b[0] = (b[0] & 0x00ffffff) | (e << 24);
      break;
    case 14:
      a[3] = (a[3] & 0xffff0000) | (e >> 16);
      b[0] = (b[0] & 0x0000ffff) | (e << 16);
      break;
    case 15:
      a[3] = (a[3] & 0xffffff00) | (e >> 24);
      b[0] = (b[0] & 0x000000ff) | (e << 8);
      break;
    case 16:
      b[0] = e;
      break;
    case 17:
      b[0] = (b[0] & 0xff000000) | (e >> 8);
      b[1] = (b[1] & 0x00ffffff) | (e << 24);
      break;
    case 18:
      b[0] = (b[0] & 0xffff0000) | (e >> 16);
      b[1] = (b[1] & 0x0000ffff) | (e << 16);
      break;
    case 19:
      b[0] = (b[0] & 0xffffff00) | (e >> 24);
      b[1] = (b[1] & 0x000000ff) | (e << 8);
      break;
    case 20:
      b[1] = e;
      break;
    case 21:
      b[1] = (b[1] & 0xff000000) | (e >> 8);
      b[2] = (b[2] & 0x00ffffff) | (e << 24);
      break;
    case 22:
      b[1] = (b[1] & 0xffff0000) | (e >> 16);
      b[2] = (b[2] & 0x0000ffff) | (e << 16);
      break;
    case 23:
      b[1] = (b[1] & 0xffffff00) | (e >> 24);
      b[2] = (b[2] & 0x000000ff) | (e << 8);
      break;
    case 24:
      b[2] = e;
      break;
    case 25:
      b[2] = (b[2] & 0xff000000) | (e >> 8);
      b[3] = (b[3] & 0x00ffffff) | (e << 24);
      break;
    case 26:
      b[2] = (b[2] & 0xffff0000) | (e >> 16);
      b[3] = (b[3] & 0x0000ffff) | (e << 16);
      break;
    case 27:
      b[2] = (b[2] & 0xffffff00) | (e >> 24);
      b[3] = (b[3] & 0x000000ff) | (e << 8);
      break;
    case 28:
      b[3] = e;
      break;
    case 29:
      b[3] = (b[3] & 0xff000000) | (e >> 8);
      c[0] = (c[0] & 0x00ffffff) | (e << 24);
      break;
    case 30:
      b[3] = (b[3] & 0xffff0000) | (e >> 16);
      c[0] = (c[0] & 0x0000ffff) | (e << 16);
      break;
    case 31:
      b[3] = (b[3] & 0xffffff00) | (e >> 24);
      c[0] = (c[0] & 0x000000ff) | (e << 8);
      break;
    case 32:
      c[0] = e;
      break;
    case 33:
      c[0] = (c[0] & 0xff000000) | (e >> 8);
      c[1] = (c[1] & 0x00ffffff) | (e << 24);
      break;
    case 34:
      c[0] = (c[0] & 0xffff0000) | (e >> 16);
      c[1] = (c[1] & 0x0000ffff) | (e << 16);
      break;
    case 35:
      c[0] = (c[0] & 0xffffff00) | (e >> 24);
      c[1] = (c[1] & 0x000000ff) | (e << 8);
      break;
    case 36:
      c[1] = e;
      break;
    case 37:
      c[1] = (c[1] & 0xff000000) | (e >> 8);
      c[2] = (c[2] & 0x00ffffff) | (e << 24);
      break;
    case 38:
      c[1] = (c[1] & 0xffff0000) | (e >> 16);
      c[2] = (c[2] & 0x0000ffff) | (e << 16);
      break;
    case 39:
      c[1] = (c[1] & 0xffffff00) | (e >> 24);
      c[2] = (c[2] & 0x000000ff) | (e << 8);
      break;
    case 40:
      c[2] = e;
      break;
    case 41:
      c[2] = (c[2] & 0xff000000) | (e >> 8);
      c[3] = (c[3] & 0x00ffffff) | (e << 24);
      break;
    case 42:
      c[2] = (c[2] & 0xffff0000) | (e >> 16);
      c[3] = (c[3] & 0x0000ffff) | (e << 16);
      break;
    case 43:
      c[2] = (c[2] & 0xffffff00) | (e >> 24);
      c[3] = (c[3] & 0x000000ff) | (e << 8);
      break;
    case 44:
      c[3] = e;
      break;
    case 45:
      c[3] = (c[3] & 0xff000000) | (e >> 8);
      d[0] = (d[0] & 0x00ffffff) | (e << 24);
      break;
    case 46:
      c[3] = (c[3] & 0xffff0000) | (e >> 16);
      d[0] = (d[0] & 0x0000ffff) | (e << 16);
      break;
    case 47:
      c[3] = (c[3] & 0xffffff00) | (e >> 24);
      d[0] = (d[0] & 0x000000ff) | (e << 8);
      break;
    case 48:
      d[0] = e;
      break;
    case 49:
      d[0] = (d[0] & 0xff000000) | (e >> 8);
      d[1] = (d[1] & 0x00ffffff) | (e << 24);
      break;
    case 50:
      d[0] = (d[0] & 0xffff0000) | (e >> 16);
      d[1] = (d[1] & 0x0000ffff) | (e << 16);
      break;
    case 51:
      d[0] = (d[0] & 0xffffff00) | (e >> 24);
      d[1] = (d[1] & 0x000000ff) | (e << 8);
      break;
    case 52:
      d[1] = e;
      break;
    case 53:
      d[1] = (d[1] & 0xff000000) | (e >> 8);
      d[2] = (d[2] & 0x00ffffff) | (e << 24);
      break;
    case 54:
      d[1] = (d[1] & 0xffff0000) | (e >> 16);
      d[2] = (d[2] & 0x0000ffff) | (e << 16);
      break;
    case 55:
      d[1] = (d[1] & 0xffffff00) | (e >> 24);
      d[2] = (d[2] & 0x000000ff) | (e << 8);
      break;
    case 56:
      d[2] = e;
      break;
    case 57:
      d[2] = (d[2] & 0xff000000) | (e >> 8);
      d[3] = (d[3] & 0x00ffffff) | (e << 24);
      break;
    case 58:
      d[2] = (d[2] & 0xffff0000) | (e >> 16);
      d[3] = (d[3] & 0x0000ffff) | (e << 16);
      break;
    case 59:
      d[2] = (d[2] & 0xffffff00) | (e >> 24);
      d[3] = (d[3] & 0x000000ff) | (e << 8);
      break;
    case 60:
      d[3] = e;
      break;
    case 61:
      d[3] = (d[3] & 0xff000000) | (e >> 8);

      break;
    case 62:
      d[3] = (d[3] & 0xffff0000) | (e >> 16);

      break;
    case 63:
      d[3] = (d[3] & 0xffffff00) | (e >> 24);

      break;
  }
}

inline void BA(u32 a[4], const u32 b) {
  switch (b) {
    case 0:
      a[0] = 0x01;
      break;

    case 1:
      a[0] = a[0] | 0x0100;
      break;

    case 2:
      a[0] = a[0] | 0x010000;
      break;

    case 3:
      a[0] = a[0] | 0x01000000;
      break;

    case 4:
      a[1] = 0x01;
      break;

    case 5:
      a[1] = a[1] | 0x0100;
      break;

    case 6:
      a[1] = a[1] | 0x010000;
      break;

    case 7:
      a[1] = a[1] | 0x01000000;
      break;

    case 8:
      a[2] = 0x01;
      break;

    case 9:
      a[2] = a[2] | 0x0100;
      break;

    case 10:
      a[2] = a[2] | 0x010000;
      break;

    case 11:
      a[2] = a[2] | 0x01000000;
      break;

    case 12:
      a[3] = 0x01;
      break;

    case 13:
      a[3] = a[3] | 0x0100;
      break;

    case 14:
      a[3] = a[3] | 0x010000;
      break;

    case 15:
      a[3] = a[3] | 0x01000000;
      break;
  }
}

inline void BB(u32 a[4], u32 b[4], const u32 c) {
  switch (c) {
    case 0:
      a[0] = 0x01;
      break;

    case 1:
      a[0] = a[0] | 0x0100;
      break;

    case 2:
      a[0] = a[0] | 0x010000;
      break;

    case 3:
      a[0] = a[0] | 0x01000000;
      break;

    case 4:
      a[1] = 0x01;
      break;

    case 5:
      a[1] = a[1] | 0x0100;
      break;

    case 6:
      a[1] = a[1] | 0x010000;
      break;

    case 7:
      a[1] = a[1] | 0x01000000;
      break;

    case 8:
      a[2] = 0x01;
      break;

    case 9:
      a[2] = a[2] | 0x0100;
      break;

    case 10:
      a[2] = a[2] | 0x010000;
      break;

    case 11:
      a[2] = a[2] | 0x01000000;
      break;

    case 12:
      a[3] = 0x01;
      break;

    case 13:
      a[3] = a[3] | 0x0100;
      break;

    case 14:
      a[3] = a[3] | 0x010000;
      break;

    case 15:
      a[3] = a[3] | 0x01000000;
      break;

    case 16:
      b[0] = 0x01;
      break;

    case 17:
      b[0] = b[0] | 0x0100;
      break;

    case 18:
      b[0] = b[0] | 0x010000;
      break;

    case 19:
      b[0] = b[0] | 0x01000000;
      break;

    case 20:
      b[1] = 0x01;
      break;

    case 21:
      b[1] = b[1] | 0x0100;
      break;

    case 22:
      b[1] = b[1] | 0x010000;
      break;

    case 23:
      b[1] = b[1] | 0x01000000;
      break;

    case 24:
      b[2] = 0x01;
      break;

    case 25:
      b[2] = b[2] | 0x0100;
      break;

    case 26:
      b[2] = b[2] | 0x010000;
      break;

    case 27:
      b[2] = b[2] | 0x01000000;
      break;

    case 28:
      b[3] = 0x01;
      break;

    case 29:
      b[3] = b[3] | 0x0100;
      break;

    case 30:
      b[3] = b[3] | 0x010000;
      break;

    case 31:
      b[3] = b[3] | 0x01000000;
      break;
  }
}

inline void BC(u32 a[4], u32 b[4], u32 c[4], const u32 d) {
  switch (d) {
    case 0:
      a[0] = 0x01;
      break;

    case 1:
      a[0] = a[0] | 0x0100;
      break;

    case 2:
      a[0] = a[0] | 0x010000;
      break;

    case 3:
      a[0] = a[0] | 0x01000000;
      break;

    case 4:
      a[1] = 0x01;
      break;

    case 5:
      a[1] = a[1] | 0x0100;
      break;

    case 6:
      a[1] = a[1] | 0x010000;
      break;

    case 7:
      a[1] = a[1] | 0x01000000;
      break;

    case 8:
      a[2] = 0x01;
      break;

    case 9:
      a[2] = a[2] | 0x0100;
      break;

    case 10:
      a[2] = a[2] | 0x010000;
      break;

    case 11:
      a[2] = a[2] | 0x01000000;
      break;

    case 12:
      a[3] = 0x01;
      break;

    case 13:
      a[3] = a[3] | 0x0100;
      break;

    case 14:
      a[3] = a[3] | 0x010000;
      break;

    case 15:
      a[3] = a[3] | 0x01000000;
      break;

    case 16:
      b[0] = 0x01;
      break;

    case 17:
      b[0] = b[0] | 0x0100;
      break;

    case 18:
      b[0] = b[0] | 0x010000;
      break;

    case 19:
      b[0] = b[0] | 0x01000000;
      break;

    case 20:
      b[1] = 0x01;
      break;

    case 21:
      b[1] = b[1] | 0x0100;
      break;

    case 22:
      b[1] = b[1] | 0x010000;
      break;

    case 23:
      b[1] = b[1] | 0x01000000;
      break;

    case 24:
      b[2] = 0x01;
      break;

    case 25:
      b[2] = b[2] | 0x0100;
      break;

    case 26:
      b[2] = b[2] | 0x010000;
      break;

    case 27:
      b[2] = b[2] | 0x01000000;
      break;

    case 28:
      b[3] = 0x01;
      break;

    case 29:
      b[3] = b[3] | 0x0100;
      break;

    case 30:
      b[3] = b[3] | 0x010000;
      break;

    case 31:
      b[3] = b[3] | 0x01000000;
      break;

    case 32:
      c[0] = 0x01;
      break;

    case 33:
      c[0] = c[0] | 0x0100;
      break;

    case 34:
      c[0] = c[0] | 0x010000;
      break;

    case 35:
      c[0] = c[0] | 0x01000000;
      break;

    case 36:
      c[1] = 0x01;
      break;

    case 37:
      c[1] = c[1] | 0x0100;
      break;

    case 38:
      c[1] = c[1] | 0x010000;
      break;

    case 39:
      c[1] = c[1] | 0x01000000;
      break;

    case 40:
      c[2] = 0x01;
      break;

    case 41:
      c[2] = c[2] | 0x0100;
      break;

    case 42:
      c[2] = c[2] | 0x010000;
      break;

    case 43:
      c[2] = c[2] | 0x01000000;
      break;

    case 44:
      c[3] = 0x01;
      break;

    case 45:
      c[3] = c[3] | 0x0100;
      break;

    case 46:
      c[3] = c[3] | 0x010000;
      break;

    case 47:
      c[3] = c[3] | 0x01000000;
      break;
  }
}

inline void BD(u32 a[4], u32 b[4], u32 c[4], u32 d[4], const u32 e) {
  switch (e) {
    case 0:
      a[0] = 0x01;
      break;

    case 1:
      a[0] = a[0] | 0x0100;
      break;

    case 2:
      a[0] = a[0] | 0x010000;
      break;

    case 3:
      a[0] = a[0] | 0x01000000;
      break;

    case 4:
      a[1] = 0x01;
      break;

    case 5:
      a[1] = a[1] | 0x0100;
      break;

    case 6:
      a[1] = a[1] | 0x010000;
      break;

    case 7:
      a[1] = a[1] | 0x01000000;
      break;

    case 8:
      a[2] = 0x01;
      break;

    case 9:
      a[2] = a[2] | 0x0100;
      break;

    case 10:
      a[2] = a[2] | 0x010000;
      break;

    case 11:
      a[2] = a[2] | 0x01000000;
      break;

    case 12:
      a[3] = 0x01;
      break;

    case 13:
      a[3] = a[3] | 0x0100;
      break;

    case 14:
      a[3] = a[3] | 0x010000;
      break;

    case 15:
      a[3] = a[3] | 0x01000000;
      break;

    case 16:
      b[0] = 0x01;
      break;

    case 17:
      b[0] = b[0] | 0x0100;
      break;

    case 18:
      b[0] = b[0] | 0x010000;
      break;

    case 19:
      b[0] = b[0] | 0x01000000;
      break;

    case 20:
      b[1] = 0x01;
      break;

    case 21:
      b[1] = b[1] | 0x0100;
      break;

    case 22:
      b[1] = b[1] | 0x010000;
      break;

    case 23:
      b[1] = b[1] | 0x01000000;
      break;

    case 24:
      b[2] = 0x01;
      break;

    case 25:
      b[2] = b[2] | 0x0100;
      break;

    case 26:
      b[2] = b[2] | 0x010000;
      break;

    case 27:
      b[2] = b[2] | 0x01000000;
      break;

    case 28:
      b[3] = 0x01;
      break;

    case 29:
      b[3] = b[3] | 0x0100;
      break;

    case 30:
      b[3] = b[3] | 0x010000;
      break;

    case 31:
      b[3] = b[3] | 0x01000000;
      break;

    case 32:
      c[0] = 0x01;
      break;

    case 33:
      c[0] = c[0] | 0x0100;
      break;

    case 34:
      c[0] = c[0] | 0x010000;
      break;

    case 35:
      c[0] = c[0] | 0x01000000;
      break;

    case 36:
      c[1] = 0x01;
      break;

    case 37:
      c[1] = c[1] | 0x0100;
      break;

    case 38:
      c[1] = c[1] | 0x010000;
      break;

    case 39:
      c[1] = c[1] | 0x01000000;
      break;

    case 40:
      c[2] = 0x01;
      break;

    case 41:
      c[2] = c[2] | 0x0100;
      break;

    case 42:
      c[2] = c[2] | 0x010000;
      break;

    case 43:
      c[2] = c[2] | 0x01000000;
      break;

    case 44:
      c[3] = 0x01;
      break;

    case 45:
      c[3] = c[3] | 0x0100;
      break;

    case 46:
      c[3] = c[3] | 0x010000;
      break;

    case 47:
      c[3] = c[3] | 0x01000000;
      break;

    case 48:
      d[0] = 0x01;
      break;

    case 49:
      d[0] = d[0] | 0x0100;
      break;

    case 50:
      d[0] = d[0] | 0x010000;
      break;

    case 51:
      d[0] = d[0] | 0x01000000;
      break;

    case 52:
      d[1] = 0x01;
      break;

    case 53:
      d[1] = d[1] | 0x0100;
      break;

    case 54:
      d[1] = d[1] | 0x010000;
      break;

    case 55:
      d[1] = d[1] | 0x01000000;
      break;

    case 56:
      d[2] = 0x01;
      break;

    case 57:
      d[2] = d[2] | 0x0100;
      break;

    case 58:
      d[2] = d[2] | 0x010000;
      break;

    case 59:
      d[2] = d[2] | 0x01000000;
      break;

    case 60:
      d[3] = 0x01;
      break;

    case 61:
      d[3] = d[3] | 0x0100;
      break;

    case 62:
      d[3] = d[3] | 0x010000;
      break;

    case 63:
      d[3] = d[3] | 0x01000000;
      break;
  }
}

inline void BE(u32 a[4], u32 b[4], const u32 c) {
  switch (c) {
    case 0:
      a[0] = 0x02;
      break;

    case 1:
      a[0] = a[0] | 0x0200;
      break;

    case 2:
      a[0] = a[0] | 0x020000;
      break;

    case 3:
      a[0] = a[0] | 0x02000000;
      break;

    case 4:
      a[1] = 0x02;
      break;

    case 5:
      a[1] = a[1] | 0x0200;
      break;

    case 6:
      a[1] = a[1] | 0x020000;
      break;

    case 7:
      a[1] = a[1] | 0x02000000;
      break;

    case 8:
      a[2] = 0x02;
      break;

    case 9:
      a[2] = a[2] | 0x0200;
      break;

    case 10:
      a[2] = a[2] | 0x020000;
      break;

    case 11:
      a[2] = a[2] | 0x02000000;
      break;

    case 12:
      a[3] = 0x02;
      break;

    case 13:
      a[3] = a[3] | 0x0200;
      break;

    case 14:
      a[3] = a[3] | 0x020000;
      break;

    case 15:
      a[3] = a[3] | 0x02000000;
      break;

    case 16:
      b[0] = 0x02;
      break;

    case 17:
      b[0] = b[0] | 0x0200;
      break;

    case 18:
      b[0] = b[0] | 0x020000;
      break;

    case 19:
      b[0] = b[0] | 0x02000000;
      break;

    case 20:
      b[1] = 0x02;
      break;

    case 21:
      b[1] = b[1] | 0x0200;
      break;

    case 22:
      b[1] = b[1] | 0x020000;
      break;

    case 23:
      b[1] = b[1] | 0x02000000;
      break;

    case 24:
      b[2] = 0x02;
      break;

    case 25:
      b[2] = b[2] | 0x0200;
      break;

    case 26:
      b[2] = b[2] | 0x020000;
      break;

    case 27:
      b[2] = b[2] | 0x02000000;
      break;

    case 28:
      b[3] = 0x02;
      break;

    case 29:
      b[3] = b[3] | 0x0200;
      break;

    case 30:
      b[3] = b[3] | 0x020000;
      break;

    case 31:
      b[3] = b[3] | 0x02000000;
      break;
  }
}

inline void BF(u32 a[4], u32 b[4], u32 c[4], const u32 d) {
  switch (d) {
    case 0:
      a[0] = 0x02;
      break;

    case 1:
      a[0] = a[0] | 0x0200;
      break;

    case 2:
      a[0] = a[0] | 0x020000;
      break;

    case 3:
      a[0] = a[0] | 0x02000000;
      break;

    case 4:
      a[1] = 0x02;
      break;

    case 5:
      a[1] = a[1] | 0x0200;
      break;

    case 6:
      a[1] = a[1] | 0x020000;
      break;

    case 7:
      a[1] = a[1] | 0x02000000;
      break;

    case 8:
      a[2] = 0x02;
      break;

    case 9:
      a[2] = a[2] | 0x0200;
      break;

    case 10:
      a[2] = a[2] | 0x020000;
      break;

    case 11:
      a[2] = a[2] | 0x02000000;
      break;

    case 12:
      a[3] = 0x02;
      break;

    case 13:
      a[3] = a[3] | 0x0200;
      break;

    case 14:
      a[3] = a[3] | 0x020000;
      break;

    case 15:
      a[3] = a[3] | 0x02000000;
      break;

    case 16:
      b[0] = 0x02;
      break;

    case 17:
      b[0] = b[0] | 0x0200;
      break;

    case 18:
      b[0] = b[0] | 0x020000;
      break;

    case 19:
      b[0] = b[0] | 0x02000000;
      break;

    case 20:
      b[1] = 0x02;
      break;

    case 21:
      b[1] = b[1] | 0x0200;
      break;

    case 22:
      b[1] = b[1] | 0x020000;
      break;

    case 23:
      b[1] = b[1] | 0x02000000;
      break;

    case 24:
      b[2] = 0x02;
      break;

    case 25:
      b[2] = b[2] | 0x0200;
      break;

    case 26:
      b[2] = b[2] | 0x020000;
      break;

    case 27:
      b[2] = b[2] | 0x02000000;
      break;

    case 28:
      b[3] = 0x02;
      break;

    case 29:
      b[3] = b[3] | 0x0200;
      break;

    case 30:
      b[3] = b[3] | 0x020000;
      break;

    case 31:
      b[3] = b[3] | 0x02000000;
      break;

    case 32:
      c[0] = 0x02;
      break;

    case 33:
      c[0] = c[0] | 0x0200;
      break;

    case 34:
      c[0] = c[0] | 0x020000;
      break;

    case 35:
      c[0] = c[0] | 0x02000000;
      break;

    case 36:
      c[1] = 0x02;
      break;

    case 37:
      c[1] = c[1] | 0x0200;
      break;

    case 38:
      c[1] = c[1] | 0x020000;
      break;

    case 39:
      c[1] = c[1] | 0x02000000;
      break;

    case 40:
      c[2] = 0x02;
      break;

    case 41:
      c[2] = c[2] | 0x0200;
      break;

    case 42:
      c[2] = c[2] | 0x020000;
      break;

    case 43:
      c[2] = c[2] | 0x02000000;
      break;

    case 44:
      c[3] = 0x02;
      break;

    case 45:
      c[3] = c[3] | 0x0200;
      break;

    case 46:
      c[3] = c[3] | 0x020000;
      break;

    case 47:
      c[3] = c[3] | 0x02000000;
      break;
  }
}

inline void BG(u32 a[4], const u32 b) {
  switch (b) {
    case 0:
      a[0] = 0x80;
      break;

    case 1:
      a[0] = a[0] | 0x8000;
      break;

    case 2:
      a[0] = a[0] | 0x800000;
      break;

    case 3:
      a[0] = a[0] | 0x80000000;
      break;

    case 4:
      a[1] = 0x80;
      break;

    case 5:
      a[1] = a[1] | 0x8000;
      break;

    case 6:
      a[1] = a[1] | 0x800000;
      break;

    case 7:
      a[1] = a[1] | 0x80000000;
      break;

    case 8:
      a[2] = 0x80;
      break;

    case 9:
      a[2] = a[2] | 0x8000;
      break;

    case 10:
      a[2] = a[2] | 0x800000;
      break;

    case 11:
      a[2] = a[2] | 0x80000000;
      break;

    case 12:
      a[3] = 0x80;
      break;

    case 13:
      a[3] = a[3] | 0x8000;
      break;

    case 14:
      a[3] = a[3] | 0x800000;
      break;

    case 15:
      a[3] = a[3] | 0x80000000;
      break;
  }
}

inline void BH(u32 a[4], u32 b[4], const u32 c) {
  switch (c) {
    case 0:
      a[0] = 0x80;
      break;

    case 1:
      a[0] = a[0] | 0x8000;
      break;

    case 2:
      a[0] = a[0] | 0x800000;
      break;

    case 3:
      a[0] = a[0] | 0x80000000;
      break;

    case 4:
      a[1] = 0x80;
      break;

    case 5:
      a[1] = a[1] | 0x8000;
      break;

    case 6:
      a[1] = a[1] | 0x800000;
      break;

    case 7:
      a[1] = a[1] | 0x80000000;
      break;

    case 8:
      a[2] = 0x80;
      break;

    case 9:
      a[2] = a[2] | 0x8000;
      break;

    case 10:
      a[2] = a[2] | 0x800000;
      break;

    case 11:
      a[2] = a[2] | 0x80000000;
      break;

    case 12:
      a[3] = 0x80;
      break;

    case 13:
      a[3] = a[3] | 0x8000;
      break;

    case 14:
      a[3] = a[3] | 0x800000;
      break;

    case 15:
      a[3] = a[3] | 0x80000000;
      break;

    case 16:
      b[0] = 0x80;
      break;

    case 17:
      b[0] = b[0] | 0x8000;
      break;

    case 18:
      b[0] = b[0] | 0x800000;
      break;

    case 19:
      b[0] = b[0] | 0x80000000;
      break;

    case 20:
      b[1] = 0x80;
      break;

    case 21:
      b[1] = b[1] | 0x8000;
      break;

    case 22:
      b[1] = b[1] | 0x800000;
      break;

    case 23:
      b[1] = b[1] | 0x80000000;
      break;

    case 24:
      b[2] = 0x80;
      break;

    case 25:
      b[2] = b[2] | 0x8000;
      break;

    case 26:
      b[2] = b[2] | 0x800000;
      break;

    case 27:
      b[2] = b[2] | 0x80000000;
      break;

    case 28:
      b[3] = 0x80;
      break;

    case 29:
      b[3] = b[3] | 0x8000;
      break;

    case 30:
      b[3] = b[3] | 0x800000;
      break;

    case 31:
      b[3] = b[3] | 0x80000000;
      break;
  }
}

inline void BI(u32 a[4], u32 b[4], u32 c[4], const u32 d) {
  switch (d) {
    case 0:
      a[0] = 0x80;
      break;

    case 1:
      a[0] = a[0] | 0x8000;
      break;

    case 2:
      a[0] = a[0] | 0x800000;
      break;

    case 3:
      a[0] = a[0] | 0x80000000;
      break;

    case 4:
      a[1] = 0x80;
      break;

    case 5:
      a[1] = a[1] | 0x8000;
      break;

    case 6:
      a[1] = a[1] | 0x800000;
      break;

    case 7:
      a[1] = a[1] | 0x80000000;
      break;

    case 8:
      a[2] = 0x80;
      break;

    case 9:
      a[2] = a[2] | 0x8000;
      break;

    case 10:
      a[2] = a[2] | 0x800000;
      break;

    case 11:
      a[2] = a[2] | 0x80000000;
      break;

    case 12:
      a[3] = 0x80;
      break;

    case 13:
      a[3] = a[3] | 0x8000;
      break;

    case 14:
      a[3] = a[3] | 0x800000;
      break;

    case 15:
      a[3] = a[3] | 0x80000000;
      break;

    case 16:
      b[0] = 0x80;
      break;

    case 17:
      b[0] = b[0] | 0x8000;
      break;

    case 18:
      b[0] = b[0] | 0x800000;
      break;

    case 19:
      b[0] = b[0] | 0x80000000;
      break;

    case 20:
      b[1] = 0x80;
      break;

    case 21:
      b[1] = b[1] | 0x8000;
      break;

    case 22:
      b[1] = b[1] | 0x800000;
      break;

    case 23:
      b[1] = b[1] | 0x80000000;
      break;

    case 24:
      b[2] = 0x80;
      break;

    case 25:
      b[2] = b[2] | 0x8000;
      break;

    case 26:
      b[2] = b[2] | 0x800000;
      break;

    case 27:
      b[2] = b[2] | 0x80000000;
      break;

    case 28:
      b[3] = 0x80;
      break;

    case 29:
      b[3] = b[3] | 0x8000;
      break;

    case 30:
      b[3] = b[3] | 0x800000;
      break;

    case 31:
      b[3] = b[3] | 0x80000000;
      break;

    case 32:
      c[0] = 0x80;
      break;

    case 33:
      c[0] = c[0] | 0x8000;
      break;

    case 34:
      c[0] = c[0] | 0x800000;
      break;

    case 35:
      c[0] = c[0] | 0x80000000;
      break;

    case 36:
      c[1] = 0x80;
      break;

    case 37:
      c[1] = c[1] | 0x8000;
      break;

    case 38:
      c[1] = c[1] | 0x800000;
      break;

    case 39:
      c[1] = c[1] | 0x80000000;
      break;

    case 40:
      c[2] = 0x80;
      break;

    case 41:
      c[2] = c[2] | 0x8000;
      break;

    case 42:
      c[2] = c[2] | 0x800000;
      break;

    case 43:
      c[2] = c[2] | 0x80000000;
      break;

    case 44:
      c[3] = 0x80;
      break;

    case 45:
      c[3] = c[3] | 0x8000;
      break;

    case 46:
      c[3] = c[3] | 0x800000;
      break;

    case 47:
      c[3] = c[3] | 0x80000000;
      break;
  }
}

inline void BJ(u32 a[4], u32 b[4], u32 c[4], u32 d[4], const u32 e) {
  switch (e) {
    case 0:
      a[0] = 0x80;
      break;

    case 1:
      a[0] = a[0] | 0x8000;
      break;

    case 2:
      a[0] = a[0] | 0x800000;
      break;

    case 3:
      a[0] = a[0] | 0x80000000;
      break;

    case 4:
      a[1] = 0x80;
      break;

    case 5:
      a[1] = a[1] | 0x8000;
      break;

    case 6:
      a[1] = a[1] | 0x800000;
      break;

    case 7:
      a[1] = a[1] | 0x80000000;
      break;

    case 8:
      a[2] = 0x80;
      break;

    case 9:
      a[2] = a[2] | 0x8000;
      break;

    case 10:
      a[2] = a[2] | 0x800000;
      break;

    case 11:
      a[2] = a[2] | 0x80000000;
      break;

    case 12:
      a[3] = 0x80;
      break;

    case 13:
      a[3] = a[3] | 0x8000;
      break;

    case 14:
      a[3] = a[3] | 0x800000;
      break;

    case 15:
      a[3] = a[3] | 0x80000000;
      break;

    case 16:
      b[0] = 0x80;
      break;

    case 17:
      b[0] = b[0] | 0x8000;
      break;

    case 18:
      b[0] = b[0] | 0x800000;
      break;

    case 19:
      b[0] = b[0] | 0x80000000;
      break;

    case 20:
      b[1] = 0x80;
      break;

    case 21:
      b[1] = b[1] | 0x8000;
      break;

    case 22:
      b[1] = b[1] | 0x800000;
      break;

    case 23:
      b[1] = b[1] | 0x80000000;
      break;

    case 24:
      b[2] = 0x80;
      break;

    case 25:
      b[2] = b[2] | 0x8000;
      break;

    case 26:
      b[2] = b[2] | 0x800000;
      break;

    case 27:
      b[2] = b[2] | 0x80000000;
      break;

    case 28:
      b[3] = 0x80;
      break;

    case 29:
      b[3] = b[3] | 0x8000;
      break;

    case 30:
      b[3] = b[3] | 0x800000;
      break;

    case 31:
      b[3] = b[3] | 0x80000000;
      break;

    case 32:
      c[0] = 0x80;
      break;

    case 33:
      c[0] = c[0] | 0x8000;
      break;

    case 34:
      c[0] = c[0] | 0x800000;
      break;

    case 35:
      c[0] = c[0] | 0x80000000;
      break;

    case 36:
      c[1] = 0x80;
      break;

    case 37:
      c[1] = c[1] | 0x8000;
      break;

    case 38:
      c[1] = c[1] | 0x800000;
      break;

    case 39:
      c[1] = c[1] | 0x80000000;
      break;

    case 40:
      c[2] = 0x80;
      break;

    case 41:
      c[2] = c[2] | 0x8000;
      break;

    case 42:
      c[2] = c[2] | 0x800000;
      break;

    case 43:
      c[2] = c[2] | 0x80000000;
      break;

    case 44:
      c[3] = 0x80;
      break;

    case 45:
      c[3] = c[3] | 0x8000;
      break;

    case 46:
      c[3] = c[3] | 0x800000;
      break;

    case 47:
      c[3] = c[3] | 0x80000000;
      break;

    case 48:
      d[0] = 0x80;
      break;

    case 49:
      d[0] = d[0] | 0x8000;
      break;

    case 50:
      d[0] = d[0] | 0x800000;
      break;

    case 51:
      d[0] = d[0] | 0x80000000;
      break;

    case 52:
      d[1] = 0x80;
      break;

    case 53:
      d[1] = d[1] | 0x8000;
      break;

    case 54:
      d[1] = d[1] | 0x800000;
      break;

    case 55:
      d[1] = d[1] | 0x80000000;
      break;

    case 56:
      d[2] = 0x80;
      break;

    case 57:
      d[2] = d[2] | 0x8000;
      break;

    case 58:
      d[2] = d[2] | 0x800000;
      break;

    case 59:
      d[2] = d[2] | 0x80000000;
      break;

    case 60:
      d[3] = 0x80;
      break;

    case 61:
      d[3] = d[3] | 0x8000;
      break;

    case 62:
      d[3] = d[3] | 0x800000;
      break;

    case 63:
      d[3] = d[3] | 0x80000000;
      break;
  }
}

inline void BK(u32 a[4], const u32 b) {
  switch (b) {
    case 0:
      a[0] &= 0;
      a[1] &= 0;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 1:
      a[0] &= 0x000000FF;
      a[1] &= 0;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 2:
      a[0] &= 0x0000FFFF;
      a[1] &= 0;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 3:
      a[0] &= 0x00FFFFFF;
      a[1] &= 0;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 4:
      a[1] &= 0;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 5:
      a[1] &= 0x000000FF;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 6:
      a[1] &= 0x0000FFFF;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 7:
      a[1] &= 0x00FFFFFF;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 8:
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 9:
      a[2] &= 0x000000FF;
      a[3] &= 0;
      break;
    case 10:
      a[2] &= 0x0000FFFF;
      a[3] &= 0;
      break;
    case 11:
      a[2] &= 0x00FFFFFF;
      a[3] &= 0;
      break;
    case 12:
      a[3] &= 0;
      break;
    case 13:
      a[3] &= 0x000000FF;
      break;
    case 14:
      a[3] &= 0x0000FFFF;
      break;
    case 15:
      a[3] &= 0x00FFFFFF;
      break;
  }
}

inline void BL(const u32 a[4], u32 b[4], u32 c[4]) {
  c[3] = ((a[3] >> 8) & 0x00FF0000) | ((a[3] >> 16) & 0x000000FF);
  c[2] = ((a[3] << 8) & 0x00FF0000) | ((a[3] >> 0) & 0x000000FF);
  c[1] = ((a[2] >> 8) & 0x00FF0000) | ((a[2] >> 16) & 0x000000FF);
  c[0] = ((a[2] << 8) & 0x00FF0000) | ((a[2] >> 0) & 0x000000FF);
  b[3] = ((a[1] >> 8) & 0x00FF0000) | ((a[1] >> 16) & 0x000000FF);
  b[2] = ((a[1] << 8) & 0x00FF0000) | ((a[1] >> 0) & 0x000000FF);
  b[1] = ((a[0] >> 8) & 0x00FF0000) | ((a[0] >> 16) & 0x000000FF);
  b[0] = ((a[0] << 8) & 0x00FF0000) | ((a[0] >> 0) & 0x000000FF);
}

inline void BM(const u32 a[4], const u32 b[4], u32 c[4]) {
  c[0] = ((a[0] & 0x000000ff) >> 0) | ((a[0] & 0x00ff0000) >> 8) | ((a[1] & 0x000000ff) << 16) | ((a[1] & 0x00ff0000) << 8);
  c[1] = ((a[2] & 0x000000ff) >> 0) | ((a[2] & 0x00ff0000) >> 8) | ((a[3] & 0x000000ff) << 16) | ((a[3] & 0x00ff0000) << 8);
  c[2] = ((b[0] & 0x000000ff) >> 0) | ((b[0] & 0x00ff0000) >> 8) | ((b[1] & 0x000000ff) << 16) | ((b[1] & 0x00ff0000) << 8);
  c[3] = ((b[2] & 0x000000ff) >> 0) | ((b[2] & 0x00ff0000) >> 8) | ((b[3] & 0x000000ff) << 16) | ((b[3] & 0x00ff0000) << 8);
}

inline void BN(u32 a[4], u32 b[4], u32 c[4], u32 d[4], const u32 e) {
  const int f = e & 3;

  const int g = 4 - e;

  switch (e / 4) {
    case 0:
      d[2] = V(0, d[1], g);
      d[1] = V(d[1], d[0], g);
      d[0] = V(d[0], c[3], g);
      c[3] = V(c[3], c[2], g);
      c[2] = V(c[2], c[1], g);
      c[1] = V(c[1], c[0], g);
      c[0] = V(c[0], b[3], g);
      b[3] = V(b[3], b[2], g);
      b[2] = V(b[2], b[1], g);
      b[1] = V(b[1], b[0], g);
      b[0] = V(b[0], a[3], g);
      a[3] = V(a[3], a[2], g);
      a[2] = V(a[2], a[1], g);
      a[1] = V(a[1], a[0], g);
      a[0] = V(a[0], 0, g);

      if (f == 0) {
        a[0] = a[1];
        a[1] = a[2];
        a[2] = a[3];
        a[3] = b[0];
        b[0] = b[1];
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 1:
      d[2] = V(0, d[0], g);
      d[1] = V(d[0], c[3], g);
      d[0] = V(c[3], c[2], g);
      c[3] = V(c[2], c[1], g);
      c[2] = V(c[1], c[0], g);
      c[1] = V(c[0], b[3], g);
      c[0] = V(b[3], b[2], g);
      b[3] = V(b[2], b[1], g);
      b[2] = V(b[1], b[0], g);
      b[1] = V(b[0], a[3], g);
      b[0] = V(a[3], a[2], g);
      a[3] = V(a[2], a[1], g);
      a[2] = V(a[1], a[0], g);
      a[1] = V(a[0], 0, g);
      a[0] = 0;

      if (f == 0) {
        a[1] = a[2];
        a[2] = a[3];
        a[3] = b[0];
        b[0] = b[1];
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 2:
      d[2] = V(0, c[3], g);
      d[1] = V(c[3], c[2], g);
      d[0] = V(c[2], c[1], g);
      c[3] = V(c[1], c[0], g);
      c[2] = V(c[0], b[3], g);
      c[1] = V(b[3], b[2], g);
      c[0] = V(b[2], b[1], g);
      b[3] = V(b[1], b[0], g);
      b[2] = V(b[0], a[3], g);
      b[1] = V(a[3], a[2], g);
      b[0] = V(a[2], a[1], g);
      a[3] = V(a[1], a[0], g);
      a[2] = V(a[0], 0, g);
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        a[2] = a[3];
        a[3] = b[0];
        b[0] = b[1];
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 3:
      d[2] = V(0, c[2], g);
      d[1] = V(c[2], c[1], g);
      d[0] = V(c[1], c[0], g);
      c[3] = V(c[0], b[3], g);
      c[2] = V(b[3], b[2], g);
      c[1] = V(b[2], b[1], g);
      c[0] = V(b[1], b[0], g);
      b[3] = V(b[0], a[3], g);
      b[2] = V(a[3], a[2], g);
      b[1] = V(a[2], a[1], g);
      b[0] = V(a[1], a[0], g);
      a[3] = V(a[0], 0, g);
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        a[3] = b[0];
        b[0] = b[1];
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 4:
      d[2] = V(0, c[1], g);
      d[1] = V(c[1], c[0], g);
      d[0] = V(c[0], b[3], g);
      c[3] = V(b[3], b[2], g);
      c[2] = V(b[2], b[1], g);
      c[1] = V(b[1], b[0], g);
      c[0] = V(b[0], a[3], g);
      b[3] = V(a[3], a[2], g);
      b[2] = V(a[2], a[1], g);
      b[1] = V(a[1], a[0], g);
      b[0] = V(a[0], 0, g);
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        b[0] = b[1];
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 5:
      d[2] = V(0, c[0], g);
      d[1] = V(c[0], b[3], g);
      d[0] = V(b[3], b[2], g);
      c[3] = V(b[2], b[1], g);
      c[2] = V(b[1], b[0], g);
      c[1] = V(b[0], a[3], g);
      c[0] = V(a[3], a[2], g);
      b[3] = V(a[2], a[1], g);
      b[2] = V(a[1], a[0], g);
      b[1] = V(a[0], 0, g);
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 6:
      d[2] = V(0, b[3], g);
      d[1] = V(b[3], b[2], g);
      d[0] = V(b[2], b[1], g);
      c[3] = V(b[1], b[0], g);
      c[2] = V(b[0], a[3], g);
      c[1] = V(a[3], a[2], g);
      c[0] = V(a[2], a[1], g);
      b[3] = V(a[1], a[0], g);
      b[2] = V(a[0], 0, g);
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 7:
      d[2] = V(0, b[2], g);
      d[1] = V(b[2], b[1], g);
      d[0] = V(b[1], b[0], g);
      c[3] = V(b[0], a[3], g);
      c[2] = V(a[3], a[2], g);
      c[1] = V(a[2], a[1], g);
      c[0] = V(a[1], a[0], g);
      b[3] = V(a[0], 0, g);
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 8:
      d[2] = V(0, b[1], g);
      d[1] = V(b[1], b[0], g);
      d[0] = V(b[0], a[3], g);
      c[3] = V(a[3], a[2], g);
      c[2] = V(a[2], a[1], g);
      c[1] = V(a[1], a[0], g);
      c[0] = V(a[0], 0, g);
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 9:
      d[2] = V(0, b[0], g);
      d[1] = V(b[0], a[3], g);
      d[0] = V(a[3], a[2], g);
      c[3] = V(a[2], a[1], g);
      c[2] = V(a[1], a[0], g);
      c[1] = V(a[0], 0, g);
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 10:
      d[2] = V(0, a[3], g);
      d[1] = V(a[3], a[2], g);
      d[0] = V(a[2], a[1], g);
      c[3] = V(a[1], a[0], g);
      c[2] = V(a[0], 0, g);
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 11:
      d[2] = V(0, a[2], g);
      d[1] = V(a[2], a[1], g);
      d[0] = V(a[1], a[0], g);
      c[3] = V(a[0], 0, g);
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 12:
      d[2] = V(0, a[1], g);
      d[1] = V(a[1], a[0], g);
      d[0] = V(a[0], 0, g);
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 13:
      d[2] = V(0, a[0], g);
      d[1] = V(a[0], 0, g);
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        d[1] = d[2];
        d[2] = 0;
      }

      break;
  }
}

inline void BO(u32 a[4], u32 b[4], u32 c[4], u32 d[4], const u32 e) {
  switch (e / 4) {
    case 0:
      d[2] = V(d[1], 0, e);
      d[1] = V(d[0], d[1], e);
      d[0] = V(c[3], d[0], e);
      c[3] = V(c[2], c[3], e);
      c[2] = V(c[1], c[2], e);
      c[1] = V(c[0], c[1], e);
      c[0] = V(b[3], c[0], e);
      b[3] = V(b[2], b[3], e);
      b[2] = V(b[1], b[2], e);
      b[1] = V(b[0], b[1], e);
      b[0] = V(a[3], b[0], e);
      a[3] = V(a[2], a[3], e);
      a[2] = V(a[1], a[2], e);
      a[1] = V(a[0], a[1], e);
      a[0] = V(0, a[0], e);
      break;

    case 1:
      d[2] = V(d[0], 0, e);
      d[1] = V(c[3], d[0], e);
      d[0] = V(c[2], c[3], e);
      c[3] = V(c[1], c[2], e);
      c[2] = V(c[0], c[1], e);
      c[1] = V(b[3], c[0], e);
      c[0] = V(b[2], b[3], e);
      b[3] = V(b[1], b[2], e);
      b[2] = V(b[0], b[1], e);
      b[1] = V(a[3], b[0], e);
      b[0] = V(a[2], a[3], e);
      a[3] = V(a[1], a[2], e);
      a[2] = V(a[0], a[1], e);
      a[1] = V(0, a[0], e);
      a[0] = 0;
      break;

    case 2:
      d[2] = V(c[3], 0, e);
      d[1] = V(c[2], c[3], e);
      d[0] = V(c[1], c[2], e);
      c[3] = V(c[0], c[1], e);
      c[2] = V(b[3], c[0], e);
      c[1] = V(b[2], b[3], e);
      c[0] = V(b[1], b[2], e);
      b[3] = V(b[0], b[1], e);
      b[2] = V(a[3], b[0], e);
      b[1] = V(a[2], a[3], e);
      b[0] = V(a[1], a[2], e);
      a[3] = V(a[0], a[1], e);
      a[2] = V(0, a[0], e);
      a[1] = 0;
      a[0] = 0;
      break;

    case 3:
      d[2] = V(c[2], 0, e);
      d[1] = V(c[1], c[2], e);
      d[0] = V(c[0], c[1], e);
      c[3] = V(b[3], c[0], e);
      c[2] = V(b[2], b[3], e);
      c[1] = V(b[1], b[2], e);
      c[0] = V(b[0], b[1], e);
      b[3] = V(a[3], b[0], e);
      b[2] = V(a[2], a[3], e);
      b[1] = V(a[1], a[2], e);
      b[0] = V(a[0], a[1], e);
      a[3] = V(0, a[0], e);
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 4:
      d[2] = V(c[1], 0, e);
      d[1] = V(c[0], c[1], e);
      d[0] = V(b[3], c[0], e);
      c[3] = V(b[2], b[3], e);
      c[2] = V(b[1], b[2], e);
      c[1] = V(b[0], b[1], e);
      c[0] = V(a[3], b[0], e);
      b[3] = V(a[2], a[3], e);
      b[2] = V(a[1], a[2], e);
      b[1] = V(a[0], a[1], e);
      b[0] = V(0, a[0], e);
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 5:
      d[2] = V(c[0], 0, e);
      d[1] = V(b[3], c[0], e);
      d[0] = V(b[2], b[3], e);
      c[3] = V(b[1], b[2], e);
      c[2] = V(b[0], b[1], e);
      c[1] = V(a[3], b[0], e);
      c[0] = V(a[2], a[3], e);
      b[3] = V(a[1], a[2], e);
      b[2] = V(a[0], a[1], e);
      b[1] = V(0, a[0], e);
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 6:
      d[2] = V(b[3], 0, e);
      d[1] = V(b[2], b[3], e);
      d[0] = V(b[1], b[2], e);
      c[3] = V(b[0], b[1], e);
      c[2] = V(a[3], b[0], e);
      c[1] = V(a[2], a[3], e);
      c[0] = V(a[1], a[2], e);
      b[3] = V(a[0], a[1], e);
      b[2] = V(0, a[0], e);
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 7:
      d[2] = V(b[2], 0, e);
      d[1] = V(b[1], b[2], e);
      d[0] = V(b[0], b[1], e);
      c[3] = V(a[3], b[0], e);
      c[2] = V(a[2], a[3], e);
      c[1] = V(a[1], a[2], e);
      c[0] = V(a[0], a[1], e);
      b[3] = V(0, a[0], e);
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 8:
      d[2] = V(b[1], 0, e);
      d[1] = V(b[0], b[1], e);
      d[0] = V(a[3], b[0], e);
      c[3] = V(a[2], a[3], e);
      c[2] = V(a[1], a[2], e);
      c[1] = V(a[0], a[1], e);
      c[0] = V(0, a[0], e);
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 9:
      d[2] = V(b[0], 0, e);
      d[1] = V(a[3], b[0], e);
      d[0] = V(a[2], a[3], e);
      c[3] = V(a[1], a[2], e);
      c[2] = V(a[0], a[1], e);
      c[1] = V(0, a[0], e);
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 10:
      d[2] = V(a[3], 0, e);
      d[1] = V(a[2], a[3], e);
      d[0] = V(a[1], a[2], e);
      c[3] = V(a[0], a[1], e);
      c[2] = V(0, a[0], e);
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 11:
      d[2] = V(a[2], 0, e);
      d[1] = V(a[1], a[2], e);
      d[0] = V(a[0], a[1], e);
      c[3] = V(0, a[0], e);
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 12:
      d[2] = V(a[1], 0, e);
      d[1] = V(a[0], a[1], e);
      d[0] = V(0, a[0], e);
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 13:
      d[2] = V(a[0], 0, e);
      d[1] = V(0, a[0], e);
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;
  }
}
inline void BP(u32x a[4], u32x b[4], u32x c[4], u32x d[4], const u32x e) {
  BN(a, b, c, d, e);
}

inline void BQ(u32x a[4], u32x b[4], const u32x c) {
  BB(a, b, c);
}

inline void BR(u32x a[4], u32x b[4], const u32x c) {
  BH(a, b, c);
}

inline void BS(u32x a[4], u32x b[4], u32x c[4], u32x d[4], const u32x e) {
  BJ(a, b, c, d, e);
}

__kernel void BT(__global uint4* a, const u32 b, const u32 c) {
  const u32 d = get_global_id(0);

  if (d >= c)
    return;

  a[d] = (uint4)(b);
}
inline u32x BU(__global bf_t* a, const u32 b) {
  const u32x c = (u32x)(a[b + 0].i);
  return c;
}

inline u32x BV(__global comb_t* a, const u32 b) {
  const u32x c = (u32x)(a[b + 0].pw_len);
  return c;
}

inline u32x BW(__global comb_t* a, const u32 b, const int c) {
  const u32x d = (u32x)(a[b + 0].i[c]);
  return d;
}
void BX(u32x a[16], const u32 b, u32x c[16]) {
  const u32 d = b & 3;
  const u32 e = b / 4;

  u32 f;
  u32 g;
  u32 h;
  u32 i;
  u32 j;
  u32 k;
  u32 l;
  u32 m;
  u32 n;
  u32 o;
  u32 p;
  u32 q;
  u32 r;
  u32 s;
  u32 t;
  u32 u;
  u32 v;
  f = U(0, c[0], b);
  g = U(c[0], c[1], b);
  h = U(c[1], c[2], b);
  i = U(c[2], c[3], b);
  j = U(c[3], c[4], b);
  k = U(c[4], c[5], b);
  l = U(c[5], c[6], b);
  m = U(c[6], c[7], b);
  n = U(c[7], c[8], b);
  o = U(c[8], c[9], b);
  p = U(c[9], c[10], b);
  q = U(c[10], c[11], b);
  r = U(c[11], c[12], b);
  s = U(c[12], c[13], b);
  t = U(c[13], c[14], b);
  u = U(c[14], c[15], b);
  v = U(c[15], 0, b);

  c[0] = 0;
  c[1] = 0;
  c[2] = 0;
  c[3] = 0;
  c[4] = 0;
  c[5] = 0;
  c[6] = 0;
  c[7] = 0;
  c[8] = 0;
  c[9] = 0;
  c[10] = 0;
  c[11] = 0;
  c[12] = 0;
  c[13] = 0;
  c[14] = 0;
  c[15] = 0;

  switch (e) {
    case 0:
      a[0] |= f;
      a[1] = g;
      a[2] = h;
      a[3] = i;
      a[4] = j;
      a[5] = k;
      a[6] = l;
      a[7] = m;
      a[8] = n;
      a[9] = o;
      a[10] = p;
      a[11] = q;
      a[12] = r;
      a[13] = s;
      a[14] = t;
      a[15] = u;
      c[0] = v;
      break;
    case 1:
      a[1] |= f;
      a[2] = g;
      a[3] = h;
      a[4] = i;
      a[5] = j;
      a[6] = k;
      a[7] = l;
      a[8] = m;
      a[9] = n;
      a[10] = o;
      a[11] = p;
      a[12] = q;
      a[13] = r;
      a[14] = s;
      a[15] = t;
      c[0] = u;
      c[1] = v;
      break;
    case 2:
      a[2] |= f;
      a[3] = g;
      a[4] = h;
      a[5] = i;
      a[6] = j;
      a[7] = k;
      a[8] = l;
      a[9] = m;
      a[10] = n;
      a[11] = o;
      a[12] = p;
      a[13] = q;
      a[14] = r;
      a[15] = s;
      c[0] = t;
      c[1] = u;
      c[2] = v;
      break;
    case 3:
      a[3] |= f;
      a[4] = g;
      a[5] = h;
      a[6] = i;
      a[7] = j;
      a[8] = k;
      a[9] = l;
      a[10] = m;
      a[11] = n;
      a[12] = o;
      a[13] = p;
      a[14] = q;
      a[15] = r;
      c[0] = s;
      c[1] = t;
      c[2] = u;
      c[3] = v;
      break;
    case 4:
      a[4] |= f;
      a[5] = g;
      a[6] = h;
      a[7] = i;
      a[8] = j;
      a[9] = k;
      a[10] = l;
      a[11] = m;
      a[12] = n;
      a[13] = o;
      a[14] = p;
      a[15] = q;
      c[0] = r;
      c[1] = s;
      c[2] = t;
      c[3] = u;
      c[4] = v;
      break;
    case 5:
      a[5] |= f;
      a[6] = g;
      a[7] = h;
      a[8] = i;
      a[9] = j;
      a[10] = k;
      a[11] = l;
      a[12] = m;
      a[13] = n;
      a[14] = o;
      a[15] = p;
      c[0] = q;
      c[1] = r;
      c[2] = s;
      c[3] = t;
      c[4] = u;
      c[5] = v;
      break;
    case 6:
      a[6] |= f;
      a[7] = g;
      a[8] = h;
      a[9] = i;
      a[10] = j;
      a[11] = k;
      a[12] = l;
      a[13] = m;
      a[14] = n;
      a[15] = o;
      c[0] = p;
      c[1] = q;
      c[2] = r;
      c[3] = s;
      c[4] = t;
      c[5] = u;
      c[6] = v;
      break;
    case 7:
      a[7] |= f;
      a[8] = g;
      a[9] = h;
      a[10] = i;
      a[11] = j;
      a[12] = k;
      a[13] = l;
      a[14] = m;
      a[15] = n;
      c[0] = o;
      c[1] = p;
      c[2] = q;
      c[3] = r;
      c[4] = s;
      c[5] = t;
      c[6] = u;
      c[7] = v;
      break;
    case 8:
      a[8] |= f;
      a[9] = g;
      a[10] = h;
      a[11] = i;
      a[12] = j;
      a[13] = k;
      a[14] = l;
      a[15] = m;
      c[0] = n;
      c[1] = o;
      c[2] = p;
      c[3] = q;
      c[4] = r;
      c[5] = s;
      c[6] = t;
      c[7] = u;
      c[8] = v;
      break;
    case 9:
      a[9] |= f;
      a[10] = g;
      a[11] = h;
      a[12] = i;
      a[13] = j;
      a[14] = k;
      a[15] = l;
      c[0] = m;
      c[1] = n;
      c[2] = o;
      c[3] = p;
      c[4] = q;
      c[5] = r;
      c[6] = s;
      c[7] = t;
      c[8] = u;
      c[9] = v;
      break;
    case 10:
      a[10] |= f;
      a[11] = g;
      a[12] = h;
      a[13] = i;
      a[14] = j;
      a[15] = k;
      c[0] = l;
      c[1] = m;
      c[2] = n;
      c[3] = o;
      c[4] = p;
      c[5] = q;
      c[6] = r;
      c[7] = s;
      c[8] = t;
      c[9] = u;
      c[10] = v;
      break;
    case 11:
      a[11] |= f;
      a[12] = g;
      a[13] = h;
      a[14] = i;
      a[15] = j;
      c[0] = k;
      c[1] = l;
      c[2] = m;
      c[3] = n;
      c[4] = o;
      c[5] = p;
      c[6] = q;
      c[7] = r;
      c[8] = s;
      c[9] = t;
      c[10] = u;
      c[11] = v;
      break;
    case 12:
      a[12] |= f;
      a[13] = g;
      a[14] = h;
      a[15] = i;
      c[0] = j;
      c[1] = k;
      c[2] = l;
      c[3] = m;
      c[4] = n;
      c[5] = o;
      c[6] = p;
      c[7] = q;
      c[8] = r;
      c[9] = s;
      c[10] = t;
      c[11] = u;
      c[12] = v;
      break;
    case 13:
      a[13] |= f;
      a[14] = g;
      a[15] = h;
      c[0] = i;
      c[1] = j;
      c[2] = k;
      c[3] = l;
      c[4] = m;
      c[5] = n;
      c[6] = o;
      c[7] = p;
      c[8] = q;
      c[9] = r;
      c[10] = s;
      c[11] = t;
      c[12] = u;
      c[13] = v;
      break;
    case 14:
      a[14] |= f;
      a[15] = g;
      c[0] = h;
      c[1] = i;
      c[2] = j;
      c[3] = k;
      c[4] = l;
      c[5] = m;
      c[6] = n;
      c[7] = o;
      c[8] = p;
      c[9] = q;
      c[10] = r;
      c[11] = s;
      c[12] = t;
      c[13] = u;
      c[14] = v;
      break;
    case 15:
      a[15] |= f;
      c[0] = g;
      c[1] = h;
      c[2] = i;
      c[3] = j;
      c[4] = k;
      c[5] = l;
      c[6] = m;
      c[7] = n;
      c[8] = o;
      c[9] = p;
      c[10] = q;
      c[11] = r;
      c[12] = s;
      c[13] = t;
      c[14] = u;
      c[15] = v;
      break;
  }
}

void BY(u32 a[4], u32 b[4], u32 c[4], u32 d[4], const u32 e, __global pw_t* f, __global kernel_rule_t* g, __global comb_t* h, __global bf_t* i, __global void* j, __global void* k, __global u32* l, __global u32* m, __global u32* n, __global u32* o, __global u32* p, __global u32* q, __global u32* r, __global u32* s, __global plain_t* t, __global digest_t* u, __global u32* v, __global salt_t* w, __global pstoken_t* x, __global u32* y, __global u32* z, const u32 aa, const u32 ab, const u32 ac,
        const u32 ad, const u32 ae, const u32 af, const u32 ag, const u32 ah, const u32 ai) {
  const u32 aj = get_global_id(0);
  const u32 ak = get_local_id(0);

  const u32 al = x[ad].pc_offset;

  u32 am[5];

  am[0] = x[ad].pc_digest[0];
  am[1] = x[ad].pc_digest[1];
  am[2] = x[ad].pc_digest[2];
  am[3] = x[ad].pc_digest[3];
  am[4] = x[ad].pc_digest[4];

  u32 an[4];
  u32 ao[4];
  u32 ap[4];
  u32 aq[4];

  an[0] = G(x[ad].salt_buf[al + 0]);
  an[1] = G(x[ad].salt_buf[al + 1]);
  an[2] = G(x[ad].salt_buf[al + 2]);
  an[3] = G(x[ad].salt_buf[al + 3]);
  ao[0] = G(x[ad].salt_buf[al + 4]);
  ao[1] = G(x[ad].salt_buf[al + 5]);
  ao[2] = G(x[ad].salt_buf[al + 6]);
  ao[3] = G(x[ad].salt_buf[al + 7]);
  ap[0] = G(x[ad].salt_buf[al + 8]);
  ap[1] = G(x[ad].salt_buf[al + 9]);
  ap[2] = G(x[ad].salt_buf[al + 10]);
  ap[3] = G(x[ad].salt_buf[al + 11]);
  aq[0] = G(x[ad].salt_buf[al + 12]);
  aq[1] = G(x[ad].salt_buf[al + 13]);
  aq[2] = G(x[ad].salt_buf[al + 14]);
  aq[3] = G(x[ad].salt_buf[al + 15]);

  const u32 ar = x[ad].salt_len;

  const u32 as = e + ar;

  u32 at = a[0];

  for (u32 au = 0; au < ag; au += 1) {
    const u32x av = BU(i, au);

    const u32x aw = at | av;

    u32x ax[16];

    ax[0] = aw;
    ax[1] = a[1];
    ax[2] = a[2];
    ax[3] = a[3];
    ax[4] = b[0];
    ax[5] = b[1];
    ax[6] = b[2];
    ax[7] = b[3];
    ax[8] = c[0];
    ax[9] = c[1];
    ax[10] = c[2];
    ax[11] = c[3];
    ax[12] = d[0];
    ax[13] = d[1];
    ax[14] = d[2];
    ax[15] = d[3];

    u32x ay[16];

    ay[0] = an[0];
    ay[1] = an[1];
    ay[2] = an[2];
    ay[3] = an[3];
    ay[4] = ao[0];
    ay[5] = ao[1];
    ay[6] = ao[2];
    ay[7] = ao[3];
    ay[8] = ap[0];
    ay[9] = ap[1];
    ay[10] = ap[2];
    ay[11] = ap[3];
    ay[12] = aq[0];
    ay[13] = aq[1];
    ay[14] = aq[2];
    ay[15] = aq[3];

    BX(ay, ar & 0x3f, ax);

    u32x az = am[0];
    u32x ba = am[1];
    u32x bb = am[2];
    u32x bc = am[3];
    u32x bd = am[4];

    if (((ar & 0x3f) + e) >= 56) {
      u32x be = ay[0];
      u32x bf = ay[1];
      u32x bg = ay[2];
      u32x bh = ay[3];
      u32x bi = ay[4];
      u32x bj = ay[5];
      u32x bk = ay[6];
      u32x bl = ay[7];
      u32x bm = ay[8];
      u32x bn = ay[9];
      u32x bo = ay[10];
      u32x bp = ay[11];
      u32x bq = ay[12];
      u32x br = ay[13];
      u32x bs = ay[14];
      u32x bt = ay[15];

      {
        bd += 0x5a827999u;
        bd += be;
        bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
        bd += P(az, 5u);
        ba = P(ba, 30u);
      };
      {
        bc += 0x5a827999u;
        bc += bf;
        bc += ((((bb)) ^ (((az)) & (((ba)) ^ ((bb))))));
        bc += P(bd, 5u);
        az = P(az, 30u);
      };
      {
        bb += 0x5a827999u;
        bb += bg;
        bb += ((((ba)) ^ (((bd)) & (((az)) ^ ((ba))))));
        bb += P(bc, 5u);
        bd = P(bd, 30u);
      };
      {
        ba += 0x5a827999u;
        ba += bh;
        ba += ((((az)) ^ (((bc)) & (((bd)) ^ ((az))))));
        ba += P(bb, 5u);
        bc = P(bc, 30u);
      };
      {
        az += 0x5a827999u;
        az += bi;
        az += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
        az += P(ba, 5u);
        bb = P(bb, 30u);
      };
      {
        bd += 0x5a827999u;
        bd += bj;
        bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
        bd += P(az, 5u);
        ba = P(ba, 30u);
      };
      {
        bc += 0x5a827999u;
        bc += bk;
        bc += ((((bb)) ^ (((az)) & (((ba)) ^ ((bb))))));
        bc += P(bd, 5u);
        az = P(az, 30u);
      };
      {
        bb += 0x5a827999u;
        bb += bl;
        bb += ((((ba)) ^ (((bd)) & (((az)) ^ ((ba))))));
        bb += P(bc, 5u);
        bd = P(bd, 30u);
      };
      {
        ba += 0x5a827999u;
        ba += bm;
        ba += ((((az)) ^ (((bc)) & (((bd)) ^ ((az))))));
        ba += P(bb, 5u);
        bc = P(bc, 30u);
      };
      {
        az += 0x5a827999u;
        az += bn;
        az += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
        az += P(ba, 5u);
        bb = P(bb, 30u);
      };
      {
        bd += 0x5a827999u;
        bd += bo;
        bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
        bd += P(az, 5u);
        ba = P(ba, 30u);
      };
      {
        bc += 0x5a827999u;
        bc += bp;
        bc += ((((bb)) ^ (((az)) & (((ba)) ^ ((bb))))));
        bc += P(bd, 5u);
        az = P(az, 30u);
      };
      {
        bb += 0x5a827999u;
        bb += bq;
        bb += ((((ba)) ^ (((bd)) & (((az)) ^ ((ba))))));
        bb += P(bc, 5u);
        bd = P(bd, 30u);
      };
      {
        ba += 0x5a827999u;
        ba += br;
        ba += ((((az)) ^ (((bc)) & (((bd)) ^ ((az))))));
        ba += P(bb, 5u);
        bc = P(bc, 30u);
      };
      {
        az += 0x5a827999u;
        az += bs;
        az += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
        az += P(ba, 5u);
        bb = P(bb, 30u);
      };
      {
        bd += 0x5a827999u;
        bd += bt;
        bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
        bd += P(az, 5u);
        ba = P(ba, 30u);
      };
      be = P((br ^ bm ^ bg ^ be), 1u);
      {
        bc += 0x5a827999u;
        bc += be;
        bc += ((((bb)) ^ (((az)) & (((ba)) ^ ((bb))))));
        bc += P(bd, 5u);
        az = P(az, 30u);
      };
      bf = P((bs ^ bn ^ bh ^ bf), 1u);
      {
        bb += 0x5a827999u;
        bb += bf;
        bb += ((((ba)) ^ (((bd)) & (((az)) ^ ((ba))))));
        bb += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bg = P((bt ^ bo ^ bi ^ bg), 1u);
      {
        ba += 0x5a827999u;
        ba += bg;
        ba += ((((az)) ^ (((bc)) & (((bd)) ^ ((az))))));
        ba += P(bb, 5u);
        bc = P(bc, 30u);
      };
      bh = P((be ^ bp ^ bj ^ bh), 1u);
      {
        az += 0x5a827999u;
        az += bh;
        az += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
        az += P(ba, 5u);
        bb = P(bb, 30u);
      };

      bi = P((bf ^ bq ^ bk ^ bi), 1u);
      {
        bd += 0x6ed9eba1u;
        bd += bi;
        bd += ((ba) ^ (bb) ^ (bc));
        bd += P(az, 5u);
        ba = P(ba, 30u);
      };
      bj = P((bg ^ br ^ bl ^ bj), 1u);
      {
        bc += 0x6ed9eba1u;
        bc += bj;
        bc += ((az) ^ (ba) ^ (bb));
        bc += P(bd, 5u);
        az = P(az, 30u);
      };
      bk = P((bh ^ bs ^ bm ^ bk), 1u);
      {
        bb += 0x6ed9eba1u;
        bb += bk;
        bb += ((bd) ^ (az) ^ (ba));
        bb += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bl = P((bi ^ bt ^ bn ^ bl), 1u);
      {
        ba += 0x6ed9eba1u;
        ba += bl;
        ba += ((bc) ^ (bd) ^ (az));
        ba += P(bb, 5u);
        bc = P(bc, 30u);
      };
      bm = P((bj ^ be ^ bo ^ bm), 1u);
      {
        az += 0x6ed9eba1u;
        az += bm;
        az += ((bb) ^ (bc) ^ (bd));
        az += P(ba, 5u);
        bb = P(bb, 30u);
      };
      bn = P((bk ^ bf ^ bp ^ bn), 1u);
      {
        bd += 0x6ed9eba1u;
        bd += bn;
        bd += ((ba) ^ (bb) ^ (bc));
        bd += P(az, 5u);
        ba = P(ba, 30u);
      };
      bo = P((bl ^ bg ^ bq ^ bo), 1u);
      {
        bc += 0x6ed9eba1u;
        bc += bo;
        bc += ((az) ^ (ba) ^ (bb));
        bc += P(bd, 5u);
        az = P(az, 30u);
      };
      bp = P((bm ^ bh ^ br ^ bp), 1u);
      {
        bb += 0x6ed9eba1u;
        bb += bp;
        bb += ((bd) ^ (az) ^ (ba));
        bb += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bq = P((bn ^ bi ^ bs ^ bq), 1u);
      {
        ba += 0x6ed9eba1u;
        ba += bq;
        ba += ((bc) ^ (bd) ^ (az));
        ba += P(bb, 5u);
        bc = P(bc, 30u);
      };
      br = P((bo ^ bj ^ bt ^ br), 1u);
      {
        az += 0x6ed9eba1u;
        az += br;
        az += ((bb) ^ (bc) ^ (bd));
        az += P(ba, 5u);
        bb = P(bb, 30u);
      };
      bs = P((bp ^ bk ^ be ^ bs), 1u);
      {
        bd += 0x6ed9eba1u;
        bd += bs;
        bd += ((ba) ^ (bb) ^ (bc));
        bd += P(az, 5u);
        ba = P(ba, 30u);
      };
      bt = P((bq ^ bl ^ bf ^ bt), 1u);
      {
        bc += 0x6ed9eba1u;
        bc += bt;
        bc += ((az) ^ (ba) ^ (bb));
        bc += P(bd, 5u);
        az = P(az, 30u);
      };
      be = P((br ^ bm ^ bg ^ be), 1u);
      {
        bb += 0x6ed9eba1u;
        bb += be;
        bb += ((bd) ^ (az) ^ (ba));
        bb += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bf = P((bs ^ bn ^ bh ^ bf), 1u);
      {
        ba += 0x6ed9eba1u;
        ba += bf;
        ba += ((bc) ^ (bd) ^ (az));
        ba += P(bb, 5u);
        bc = P(bc, 30u);
      };
      bg = P((bt ^ bo ^ bi ^ bg), 1u);
      {
        az += 0x6ed9eba1u;
        az += bg;
        az += ((bb) ^ (bc) ^ (bd));
        az += P(ba, 5u);
        bb = P(bb, 30u);
      };
      bh = P((be ^ bp ^ bj ^ bh), 1u);
      {
        bd += 0x6ed9eba1u;
        bd += bh;
        bd += ((ba) ^ (bb) ^ (bc));
        bd += P(az, 5u);
        ba = P(ba, 30u);
      };
      bi = P((bf ^ bq ^ bk ^ bi), 1u);
      {
        bc += 0x6ed9eba1u;
        bc += bi;
        bc += ((az) ^ (ba) ^ (bb));
        bc += P(bd, 5u);
        az = P(az, 30u);
      };
      bj = P((bg ^ br ^ bl ^ bj), 1u);
      {
        bb += 0x6ed9eba1u;
        bb += bj;
        bb += ((bd) ^ (az) ^ (ba));
        bb += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bk = P((bh ^ bs ^ bm ^ bk), 1u);
      {
        ba += 0x6ed9eba1u;
        ba += bk;
        ba += ((bc) ^ (bd) ^ (az));
        ba += P(bb, 5u);
        bc = P(bc, 30u);
      };
      bl = P((bi ^ bt ^ bn ^ bl), 1u);
      {
        az += 0x6ed9eba1u;
        az += bl;
        az += ((bb) ^ (bc) ^ (bd));
        az += P(ba, 5u);
        bb = P(bb, 30u);
      };

      bm = P((bj ^ be ^ bo ^ bm), 1u);
      {
        bd += 0x8f1bbcdcu;
        bd += bm;
        bd += (((((ba)) & ((bb))) | (((bc)) & (((ba)) ^ ((bb))))));
        bd += P(az, 5u);
        ba = P(ba, 30u);
      };
      bn = P((bk ^ bf ^ bp ^ bn), 1u);
      {
        bc += 0x8f1bbcdcu;
        bc += bn;
        bc += (((((az)) & ((ba))) | (((bb)) & (((az)) ^ ((ba))))));
        bc += P(bd, 5u);
        az = P(az, 30u);
      };
      bo = P((bl ^ bg ^ bq ^ bo), 1u);
      {
        bb += 0x8f1bbcdcu;
        bb += bo;
        bb += (((((bd)) & ((az))) | (((ba)) & (((bd)) ^ ((az))))));
        bb += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bp = P((bm ^ bh ^ br ^ bp), 1u);
      {
        ba += 0x8f1bbcdcu;
        ba += bp;
        ba += (((((bc)) & ((bd))) | (((az)) & (((bc)) ^ ((bd))))));
        ba += P(bb, 5u);
        bc = P(bc, 30u);
      };
      bq = P((bn ^ bi ^ bs ^ bq), 1u);
      {
        az += 0x8f1bbcdcu;
        az += bq;
        az += (((((bb)) & ((bc))) | (((bd)) & (((bb)) ^ ((bc))))));
        az += P(ba, 5u);
        bb = P(bb, 30u);
      };
      br = P((bo ^ bj ^ bt ^ br), 1u);
      {
        bd += 0x8f1bbcdcu;
        bd += br;
        bd += (((((ba)) & ((bb))) | (((bc)) & (((ba)) ^ ((bb))))));
        bd += P(az, 5u);
        ba = P(ba, 30u);
      };
      bs = P((bp ^ bk ^ be ^ bs), 1u);
      {
        bc += 0x8f1bbcdcu;
        bc += bs;
        bc += (((((az)) & ((ba))) | (((bb)) & (((az)) ^ ((ba))))));
        bc += P(bd, 5u);
        az = P(az, 30u);
      };
      bt = P((bq ^ bl ^ bf ^ bt), 1u);
      {
        bb += 0x8f1bbcdcu;
        bb += bt;
        bb += (((((bd)) & ((az))) | (((ba)) & (((bd)) ^ ((az))))));
        bb += P(bc, 5u);
        bd = P(bd, 30u);
      };
      be = P((br ^ bm ^ bg ^ be), 1u);
      {
        ba += 0x8f1bbcdcu;
        ba += be;
        ba += (((((bc)) & ((bd))) | (((az)) & (((bc)) ^ ((bd))))));
        ba += P(bb, 5u);
        bc = P(bc, 30u);
      };
      bf = P((bs ^ bn ^ bh ^ bf), 1u);
      {
        az += 0x8f1bbcdcu;
        az += bf;
        az += (((((bb)) & ((bc))) | (((bd)) & (((bb)) ^ ((bc))))));
        az += P(ba, 5u);
        bb = P(bb, 30u);
      };
      bg = P((bt ^ bo ^ bi ^ bg), 1u);
      {
        bd += 0x8f1bbcdcu;
        bd += bg;
        bd += (((((ba)) & ((bb))) | (((bc)) & (((ba)) ^ ((bb))))));
        bd += P(az, 5u);
        ba = P(ba, 30u);
      };
      bh = P((be ^ bp ^ bj ^ bh), 1u);
      {
        bc += 0x8f1bbcdcu;
        bc += bh;
        bc += (((((az)) & ((ba))) | (((bb)) & (((az)) ^ ((ba))))));
        bc += P(bd, 5u);
        az = P(az, 30u);
      };
      bi = P((bf ^ bq ^ bk ^ bi), 1u);
      {
        bb += 0x8f1bbcdcu;
        bb += bi;
        bb += (((((bd)) & ((az))) | (((ba)) & (((bd)) ^ ((az))))));
        bb += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bj = P((bg ^ br ^ bl ^ bj), 1u);
      {
        ba += 0x8f1bbcdcu;
        ba += bj;
        ba += (((((bc)) & ((bd))) | (((az)) & (((bc)) ^ ((bd))))));
        ba += P(bb, 5u);
        bc = P(bc, 30u);
      };
      bk = P((bh ^ bs ^ bm ^ bk), 1u);
      {
        az += 0x8f1bbcdcu;
        az += bk;
        az += (((((bb)) & ((bc))) | (((bd)) & (((bb)) ^ ((bc))))));
        az += P(ba, 5u);
        bb = P(bb, 30u);
      };
      bl = P((bi ^ bt ^ bn ^ bl), 1u);
      {
        bd += 0x8f1bbcdcu;
        bd += bl;
        bd += (((((ba)) & ((bb))) | (((bc)) & (((ba)) ^ ((bb))))));
        bd += P(az, 5u);
        ba = P(ba, 30u);
      };
      bm = P((bj ^ be ^ bo ^ bm), 1u);
      {
        bc += 0x8f1bbcdcu;
        bc += bm;
        bc += (((((az)) & ((ba))) | (((bb)) & (((az)) ^ ((ba))))));
        bc += P(bd, 5u);
        az = P(az, 30u);
      };
      bn = P((bk ^ bf ^ bp ^ bn), 1u);
      {
        bb += 0x8f1bbcdcu;
        bb += bn;
        bb += (((((bd)) & ((az))) | (((ba)) & (((bd)) ^ ((az))))));
        bb += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bo = P((bl ^ bg ^ bq ^ bo), 1u);
      {
        ba += 0x8f1bbcdcu;
        ba += bo;
        ba += (((((bc)) & ((bd))) | (((az)) & (((bc)) ^ ((bd))))));
        ba += P(bb, 5u);
        bc = P(bc, 30u);
      };
      bp = P((bm ^ bh ^ br ^ bp), 1u);
      {
        az += 0x8f1bbcdcu;
        az += bp;
        az += (((((bb)) & ((bc))) | (((bd)) & (((bb)) ^ ((bc))))));
        az += P(ba, 5u);
        bb = P(bb, 30u);
      };

      bq = P((bn ^ bi ^ bs ^ bq), 1u);
      {
        bd += 0xca62c1d6u;
        bd += bq;
        bd += ((ba) ^ (bb) ^ (bc));
        bd += P(az, 5u);
        ba = P(ba, 30u);
      };
      br = P((bo ^ bj ^ bt ^ br), 1u);
      {
        bc += 0xca62c1d6u;
        bc += br;
        bc += ((az) ^ (ba) ^ (bb));
        bc += P(bd, 5u);
        az = P(az, 30u);
      };
      bs = P((bp ^ bk ^ be ^ bs), 1u);
      {
        bb += 0xca62c1d6u;
        bb += bs;
        bb += ((bd) ^ (az) ^ (ba));
        bb += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bt = P((bq ^ bl ^ bf ^ bt), 1u);
      {
        ba += 0xca62c1d6u;
        ba += bt;
        ba += ((bc) ^ (bd) ^ (az));
        ba += P(bb, 5u);
        bc = P(bc, 30u);
      };
      be = P((br ^ bm ^ bg ^ be), 1u);
      {
        az += 0xca62c1d6u;
        az += be;
        az += ((bb) ^ (bc) ^ (bd));
        az += P(ba, 5u);
        bb = P(bb, 30u);
      };
      bf = P((bs ^ bn ^ bh ^ bf), 1u);
      {
        bd += 0xca62c1d6u;
        bd += bf;
        bd += ((ba) ^ (bb) ^ (bc));
        bd += P(az, 5u);
        ba = P(ba, 30u);
      };
      bg = P((bt ^ bo ^ bi ^ bg), 1u);
      {
        bc += 0xca62c1d6u;
        bc += bg;
        bc += ((az) ^ (ba) ^ (bb));
        bc += P(bd, 5u);
        az = P(az, 30u);
      };
      bh = P((be ^ bp ^ bj ^ bh), 1u);
      {
        bb += 0xca62c1d6u;
        bb += bh;
        bb += ((bd) ^ (az) ^ (ba));
        bb += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bi = P((bf ^ bq ^ bk ^ bi), 1u);
      {
        ba += 0xca62c1d6u;
        ba += bi;
        ba += ((bc) ^ (bd) ^ (az));
        ba += P(bb, 5u);
        bc = P(bc, 30u);
      };
      bj = P((bg ^ br ^ bl ^ bj), 1u);
      {
        az += 0xca62c1d6u;
        az += bj;
        az += ((bb) ^ (bc) ^ (bd));
        az += P(ba, 5u);
        bb = P(bb, 30u);
      };
      bk = P((bh ^ bs ^ bm ^ bk), 1u);
      {
        bd += 0xca62c1d6u;
        bd += bk;
        bd += ((ba) ^ (bb) ^ (bc));
        bd += P(az, 5u);
        ba = P(ba, 30u);
      };
      bl = P((bi ^ bt ^ bn ^ bl), 1u);
      {
        bc += 0xca62c1d6u;
        bc += bl;
        bc += ((az) ^ (ba) ^ (bb));
        bc += P(bd, 5u);
        az = P(az, 30u);
      };
      bm = P((bj ^ be ^ bo ^ bm), 1u);
      {
        bb += 0xca62c1d6u;
        bb += bm;
        bb += ((bd) ^ (az) ^ (ba));
        bb += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bn = P((bk ^ bf ^ bp ^ bn), 1u);
      {
        ba += 0xca62c1d6u;
        ba += bn;
        ba += ((bc) ^ (bd) ^ (az));
        ba += P(bb, 5u);
        bc = P(bc, 30u);
      };
      bo = P((bl ^ bg ^ bq ^ bo), 1u);
      {
        az += 0xca62c1d6u;
        az += bo;
        az += ((bb) ^ (bc) ^ (bd));
        az += P(ba, 5u);
        bb = P(bb, 30u);
      };
      bp = P((bm ^ bh ^ br ^ bp), 1u);
      {
        bd += 0xca62c1d6u;
        bd += bp;
        bd += ((ba) ^ (bb) ^ (bc));
        bd += P(az, 5u);
        ba = P(ba, 30u);
      };
      bq = P((bn ^ bi ^ bs ^ bq), 1u);
      {
        bc += 0xca62c1d6u;
        bc += bq;
        bc += ((az) ^ (ba) ^ (bb));
        bc += P(bd, 5u);
        az = P(az, 30u);
      };
      br = P((bo ^ bj ^ bt ^ br), 1u);
      {
        bb += 0xca62c1d6u;
        bb += br;
        bb += ((bd) ^ (az) ^ (ba));
        bb += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bs = P((bp ^ bk ^ be ^ bs), 1u);
      {
        ba += 0xca62c1d6u;
        ba += bs;
        ba += ((bc) ^ (bd) ^ (az));
        ba += P(bb, 5u);
        bc = P(bc, 30u);
      };
      bt = P((bq ^ bl ^ bf ^ bt), 1u);
      {
        az += 0xca62c1d6u;
        az += bt;
        az += ((bb) ^ (bc) ^ (bd));
        az += P(ba, 5u);
        bb = P(bb, 30u);
      };

      az += am[0];
      ba += am[1];
      bb += am[2];
      bc += am[3];
      bd += am[4];

      ay[0] = ax[0];
      ay[1] = ax[1];
      ay[2] = ax[2];
      ay[3] = ax[3];
      ay[4] = ax[4];
      ay[5] = ax[5];
      ay[6] = ax[6];
      ay[7] = ax[7];
      ay[8] = ax[8];
      ay[9] = ax[9];
      ay[10] = ax[10];
      ay[11] = ax[11];
      ay[12] = ax[12];
      ay[13] = ax[13];
      ay[14] = ax[14];
      ay[15] = ax[15];
    }

    u32x be = ay[0];
    u32x bf = ay[1];
    u32x bg = ay[2];
    u32x bh = ay[3];
    u32x bi = ay[4];
    u32x bj = ay[5];
    u32x bk = ay[6];
    u32x bl = ay[7];
    u32x bm = ay[8];
    u32x bn = ay[9];
    u32x bo = ay[10];
    u32x bp = ay[11];
    u32x bq = ay[12];
    u32x br = ay[13];
    u32x bs = 0;
    u32x bt = as * 8;

    u32x bu = az;
    u32x bv = ba;
    u32x bw = bb;
    u32x bx = bc;
    u32x by = bd;

    {
      bd += 0x5a827999u;
      bd += be;
      bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
      bd += P(az, 5u);
      ba = P(ba, 30u);
    };
    {
      bc += 0x5a827999u;
      bc += bf;
      bc += ((((bb)) ^ (((az)) & (((ba)) ^ ((bb))))));
      bc += P(bd, 5u);
      az = P(az, 30u);
    };
    {
      bb += 0x5a827999u;
      bb += bg;
      bb += ((((ba)) ^ (((bd)) & (((az)) ^ ((ba))))));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    {
      ba += 0x5a827999u;
      ba += bh;
      ba += ((((az)) ^ (((bc)) & (((bd)) ^ ((az))))));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    {
      az += 0x5a827999u;
      az += bi;
      az += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
      az += P(ba, 5u);
      bb = P(bb, 30u);
    };
    {
      bd += 0x5a827999u;
      bd += bj;
      bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
      bd += P(az, 5u);
      ba = P(ba, 30u);
    };
    {
      bc += 0x5a827999u;
      bc += bk;
      bc += ((((bb)) ^ (((az)) & (((ba)) ^ ((bb))))));
      bc += P(bd, 5u);
      az = P(az, 30u);
    };
    {
      bb += 0x5a827999u;
      bb += bl;
      bb += ((((ba)) ^ (((bd)) & (((az)) ^ ((ba))))));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    {
      ba += 0x5a827999u;
      ba += bm;
      ba += ((((az)) ^ (((bc)) & (((bd)) ^ ((az))))));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    {
      az += 0x5a827999u;
      az += bn;
      az += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
      az += P(ba, 5u);
      bb = P(bb, 30u);
    };
    {
      bd += 0x5a827999u;
      bd += bo;
      bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
      bd += P(az, 5u);
      ba = P(ba, 30u);
    };
    {
      bc += 0x5a827999u;
      bc += bp;
      bc += ((((bb)) ^ (((az)) & (((ba)) ^ ((bb))))));
      bc += P(bd, 5u);
      az = P(az, 30u);
    };
    {
      bb += 0x5a827999u;
      bb += bq;
      bb += ((((ba)) ^ (((bd)) & (((az)) ^ ((ba))))));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    {
      ba += 0x5a827999u;
      ba += br;
      ba += ((((az)) ^ (((bc)) & (((bd)) ^ ((az))))));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    {
      az += 0x5a827999u;
      az += bs;
      az += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
      az += P(ba, 5u);
      bb = P(bb, 30u);
    };
    {
      bd += 0x5a827999u;
      bd += bt;
      bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
      bd += P(az, 5u);
      ba = P(ba, 30u);
    };
    be = P((br ^ bm ^ bg ^ be), 1u);
    {
      bc += 0x5a827999u;
      bc += be;
      bc += ((((bb)) ^ (((az)) & (((ba)) ^ ((bb))))));
      bc += P(bd, 5u);
      az = P(az, 30u);
    };
    bf = P((bs ^ bn ^ bh ^ bf), 1u);
    {
      bb += 0x5a827999u;
      bb += bf;
      bb += ((((ba)) ^ (((bd)) & (((az)) ^ ((ba))))));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bg = P((bt ^ bo ^ bi ^ bg), 1u);
    {
      ba += 0x5a827999u;
      ba += bg;
      ba += ((((az)) ^ (((bc)) & (((bd)) ^ ((az))))));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    bh = P((be ^ bp ^ bj ^ bh), 1u);
    {
      az += 0x5a827999u;
      az += bh;
      az += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
      az += P(ba, 5u);
      bb = P(bb, 30u);
    };

    bi = P((bf ^ bq ^ bk ^ bi), 1u);
    {
      bd += 0x6ed9eba1u;
      bd += bi;
      bd += ((ba) ^ (bb) ^ (bc));
      bd += P(az, 5u);
      ba = P(ba, 30u);
    };
    bj = P((bg ^ br ^ bl ^ bj), 1u);
    {
      bc += 0x6ed9eba1u;
      bc += bj;
      bc += ((az) ^ (ba) ^ (bb));
      bc += P(bd, 5u);
      az = P(az, 30u);
    };
    bk = P((bh ^ bs ^ bm ^ bk), 1u);
    {
      bb += 0x6ed9eba1u;
      bb += bk;
      bb += ((bd) ^ (az) ^ (ba));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bl = P((bi ^ bt ^ bn ^ bl), 1u);
    {
      ba += 0x6ed9eba1u;
      ba += bl;
      ba += ((bc) ^ (bd) ^ (az));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    bm = P((bj ^ be ^ bo ^ bm), 1u);
    {
      az += 0x6ed9eba1u;
      az += bm;
      az += ((bb) ^ (bc) ^ (bd));
      az += P(ba, 5u);
      bb = P(bb, 30u);
    };
    bn = P((bk ^ bf ^ bp ^ bn), 1u);
    {
      bd += 0x6ed9eba1u;
      bd += bn;
      bd += ((ba) ^ (bb) ^ (bc));
      bd += P(az, 5u);
      ba = P(ba, 30u);
    };
    bo = P((bl ^ bg ^ bq ^ bo), 1u);
    {
      bc += 0x6ed9eba1u;
      bc += bo;
      bc += ((az) ^ (ba) ^ (bb));
      bc += P(bd, 5u);
      az = P(az, 30u);
    };
    bp = P((bm ^ bh ^ br ^ bp), 1u);
    {
      bb += 0x6ed9eba1u;
      bb += bp;
      bb += ((bd) ^ (az) ^ (ba));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bq = P((bn ^ bi ^ bs ^ bq), 1u);
    {
      ba += 0x6ed9eba1u;
      ba += bq;
      ba += ((bc) ^ (bd) ^ (az));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    br = P((bo ^ bj ^ bt ^ br), 1u);
    {
      az += 0x6ed9eba1u;
      az += br;
      az += ((bb) ^ (bc) ^ (bd));
      az += P(ba, 5u);
      bb = P(bb, 30u);
    };
    bs = P((bp ^ bk ^ be ^ bs), 1u);
    {
      bd += 0x6ed9eba1u;
      bd += bs;
      bd += ((ba) ^ (bb) ^ (bc));
      bd += P(az, 5u);
      ba = P(ba, 30u);
    };
    bt = P((bq ^ bl ^ bf ^ bt), 1u);
    {
      bc += 0x6ed9eba1u;
      bc += bt;
      bc += ((az) ^ (ba) ^ (bb));
      bc += P(bd, 5u);
      az = P(az, 30u);
    };
    be = P((br ^ bm ^ bg ^ be), 1u);
    {
      bb += 0x6ed9eba1u;
      bb += be;
      bb += ((bd) ^ (az) ^ (ba));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bf = P((bs ^ bn ^ bh ^ bf), 1u);
    {
      ba += 0x6ed9eba1u;
      ba += bf;
      ba += ((bc) ^ (bd) ^ (az));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    bg = P((bt ^ bo ^ bi ^ bg), 1u);
    {
      az += 0x6ed9eba1u;
      az += bg;
      az += ((bb) ^ (bc) ^ (bd));
      az += P(ba, 5u);
      bb = P(bb, 30u);
    };
    bh = P((be ^ bp ^ bj ^ bh), 1u);
    {
      bd += 0x6ed9eba1u;
      bd += bh;
      bd += ((ba) ^ (bb) ^ (bc));
      bd += P(az, 5u);
      ba = P(ba, 30u);
    };
    bi = P((bf ^ bq ^ bk ^ bi), 1u);
    {
      bc += 0x6ed9eba1u;
      bc += bi;
      bc += ((az) ^ (ba) ^ (bb));
      bc += P(bd, 5u);
      az = P(az, 30u);
    };
    bj = P((bg ^ br ^ bl ^ bj), 1u);
    {
      bb += 0x6ed9eba1u;
      bb += bj;
      bb += ((bd) ^ (az) ^ (ba));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bk = P((bh ^ bs ^ bm ^ bk), 1u);
    {
      ba += 0x6ed9eba1u;
      ba += bk;
      ba += ((bc) ^ (bd) ^ (az));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    bl = P((bi ^ bt ^ bn ^ bl), 1u);
    {
      az += 0x6ed9eba1u;
      az += bl;
      az += ((bb) ^ (bc) ^ (bd));
      az += P(ba, 5u);
      bb = P(bb, 30u);
    };

    bm = P((bj ^ be ^ bo ^ bm), 1u);
    {
      bd += 0x8f1bbcdcu;
      bd += bm;
      bd += (((((ba)) & ((bb))) | (((bc)) & (((ba)) ^ ((bb))))));
      bd += P(az, 5u);
      ba = P(ba, 30u);
    };
    bn = P((bk ^ bf ^ bp ^ bn), 1u);
    {
      bc += 0x8f1bbcdcu;
      bc += bn;
      bc += (((((az)) & ((ba))) | (((bb)) & (((az)) ^ ((ba))))));
      bc += P(bd, 5u);
      az = P(az, 30u);
    };
    bo = P((bl ^ bg ^ bq ^ bo), 1u);
    {
      bb += 0x8f1bbcdcu;
      bb += bo;
      bb += (((((bd)) & ((az))) | (((ba)) & (((bd)) ^ ((az))))));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bp = P((bm ^ bh ^ br ^ bp), 1u);
    {
      ba += 0x8f1bbcdcu;
      ba += bp;
      ba += (((((bc)) & ((bd))) | (((az)) & (((bc)) ^ ((bd))))));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    bq = P((bn ^ bi ^ bs ^ bq), 1u);
    {
      az += 0x8f1bbcdcu;
      az += bq;
      az += (((((bb)) & ((bc))) | (((bd)) & (((bb)) ^ ((bc))))));
      az += P(ba, 5u);
      bb = P(bb, 30u);
    };
    br = P((bo ^ bj ^ bt ^ br), 1u);
    {
      bd += 0x8f1bbcdcu;
      bd += br;
      bd += (((((ba)) & ((bb))) | (((bc)) & (((ba)) ^ ((bb))))));
      bd += P(az, 5u);
      ba = P(ba, 30u);
    };
    bs = P((bp ^ bk ^ be ^ bs), 1u);
    {
      bc += 0x8f1bbcdcu;
      bc += bs;
      bc += (((((az)) & ((ba))) | (((bb)) & (((az)) ^ ((ba))))));
      bc += P(bd, 5u);
      az = P(az, 30u);
    };
    bt = P((bq ^ bl ^ bf ^ bt), 1u);
    {
      bb += 0x8f1bbcdcu;
      bb += bt;
      bb += (((((bd)) & ((az))) | (((ba)) & (((bd)) ^ ((az))))));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    be = P((br ^ bm ^ bg ^ be), 1u);
    {
      ba += 0x8f1bbcdcu;
      ba += be;
      ba += (((((bc)) & ((bd))) | (((az)) & (((bc)) ^ ((bd))))));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    bf = P((bs ^ bn ^ bh ^ bf), 1u);
    {
      az += 0x8f1bbcdcu;
      az += bf;
      az += (((((bb)) & ((bc))) | (((bd)) & (((bb)) ^ ((bc))))));
      az += P(ba, 5u);
      bb = P(bb, 30u);
    };
    bg = P((bt ^ bo ^ bi ^ bg), 1u);
    {
      bd += 0x8f1bbcdcu;
      bd += bg;
      bd += (((((ba)) & ((bb))) | (((bc)) & (((ba)) ^ ((bb))))));
      bd += P(az, 5u);
      ba = P(ba, 30u);
    };
    bh = P((be ^ bp ^ bj ^ bh), 1u);
    {
      bc += 0x8f1bbcdcu;
      bc += bh;
      bc += (((((az)) & ((ba))) | (((bb)) & (((az)) ^ ((ba))))));
      bc += P(bd, 5u);
      az = P(az, 30u);
    };
    bi = P((bf ^ bq ^ bk ^ bi), 1u);
    {
      bb += 0x8f1bbcdcu;
      bb += bi;
      bb += (((((bd)) & ((az))) | (((ba)) & (((bd)) ^ ((az))))));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bj = P((bg ^ br ^ bl ^ bj), 1u);
    {
      ba += 0x8f1bbcdcu;
      ba += bj;
      ba += (((((bc)) & ((bd))) | (((az)) & (((bc)) ^ ((bd))))));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    bk = P((bh ^ bs ^ bm ^ bk), 1u);
    {
      az += 0x8f1bbcdcu;
      az += bk;
      az += (((((bb)) & ((bc))) | (((bd)) & (((bb)) ^ ((bc))))));
      az += P(ba, 5u);
      bb = P(bb, 30u);
    };
    bl = P((bi ^ bt ^ bn ^ bl), 1u);
    {
      bd += 0x8f1bbcdcu;
      bd += bl;
      bd += (((((ba)) & ((bb))) | (((bc)) & (((ba)) ^ ((bb))))));
      bd += P(az, 5u);
      ba = P(ba, 30u);
    };
    bm = P((bj ^ be ^ bo ^ bm), 1u);
    {
      bc += 0x8f1bbcdcu;
      bc += bm;
      bc += (((((az)) & ((ba))) | (((bb)) & (((az)) ^ ((ba))))));
      bc += P(bd, 5u);
      az = P(az, 30u);
    };
    bn = P((bk ^ bf ^ bp ^ bn), 1u);
    {
      bb += 0x8f1bbcdcu;
      bb += bn;
      bb += (((((bd)) & ((az))) | (((ba)) & (((bd)) ^ ((az))))));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bo = P((bl ^ bg ^ bq ^ bo), 1u);
    {
      ba += 0x8f1bbcdcu;
      ba += bo;
      ba += (((((bc)) & ((bd))) | (((az)) & (((bc)) ^ ((bd))))));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    bp = P((bm ^ bh ^ br ^ bp), 1u);
    {
      az += 0x8f1bbcdcu;
      az += bp;
      az += (((((bb)) & ((bc))) | (((bd)) & (((bb)) ^ ((bc))))));
      az += P(ba, 5u);
      bb = P(bb, 30u);
    };

    bq = P((bn ^ bi ^ bs ^ bq), 1u);
    {
      bd += 0xca62c1d6u;
      bd += bq;
      bd += ((ba) ^ (bb) ^ (bc));
      bd += P(az, 5u);
      ba = P(ba, 30u);
    };
    br = P((bo ^ bj ^ bt ^ br), 1u);
    {
      bc += 0xca62c1d6u;
      bc += br;
      bc += ((az) ^ (ba) ^ (bb));
      bc += P(bd, 5u);
      az = P(az, 30u);
    };
    bs = P((bp ^ bk ^ be ^ bs), 1u);
    {
      bb += 0xca62c1d6u;
      bb += bs;
      bb += ((bd) ^ (az) ^ (ba));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bt = P((bq ^ bl ^ bf ^ bt), 1u);
    {
      ba += 0xca62c1d6u;
      ba += bt;
      ba += ((bc) ^ (bd) ^ (az));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    be = P((br ^ bm ^ bg ^ be), 1u);
    {
      az += 0xca62c1d6u;
      az += be;
      az += ((bb) ^ (bc) ^ (bd));
      az += P(ba, 5u);
      bb = P(bb, 30u);
    };
    bf = P((bs ^ bn ^ bh ^ bf), 1u);
    {
      bd += 0xca62c1d6u;
      bd += bf;
      bd += ((ba) ^ (bb) ^ (bc));
      bd += P(az, 5u);
      ba = P(ba, 30u);
    };
    bg = P((bt ^ bo ^ bi ^ bg), 1u);
    {
      bc += 0xca62c1d6u;
      bc += bg;
      bc += ((az) ^ (ba) ^ (bb));
      bc += P(bd, 5u);
      az = P(az, 30u);
    };
    bh = P((be ^ bp ^ bj ^ bh), 1u);
    {
      bb += 0xca62c1d6u;
      bb += bh;
      bb += ((bd) ^ (az) ^ (ba));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bi = P((bf ^ bq ^ bk ^ bi), 1u);
    {
      ba += 0xca62c1d6u;
      ba += bi;
      ba += ((bc) ^ (bd) ^ (az));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    bj = P((bg ^ br ^ bl ^ bj), 1u);
    {
      az += 0xca62c1d6u;
      az += bj;
      az += ((bb) ^ (bc) ^ (bd));
      az += P(ba, 5u);
      bb = P(bb, 30u);
    };
    bk = P((bh ^ bs ^ bm ^ bk), 1u);
    {
      bd += 0xca62c1d6u;
      bd += bk;
      bd += ((ba) ^ (bb) ^ (bc));
      bd += P(az, 5u);
      ba = P(ba, 30u);
    };
    bl = P((bi ^ bt ^ bn ^ bl), 1u);
    {
      bc += 0xca62c1d6u;
      bc += bl;
      bc += ((az) ^ (ba) ^ (bb));
      bc += P(bd, 5u);
      az = P(az, 30u);
    };
    bm = P((bj ^ be ^ bo ^ bm), 1u);
    {
      bb += 0xca62c1d6u;
      bb += bm;
      bb += ((bd) ^ (az) ^ (ba));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bn = P((bk ^ bf ^ bp ^ bn), 1u);
    {
      ba += 0xca62c1d6u;
      ba += bn;
      ba += ((bc) ^ (bd) ^ (az));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    bo = P((bl ^ bg ^ bq ^ bo), 1u);
    {
      az += 0xca62c1d6u;
      az += bo;
      az += ((bb) ^ (bc) ^ (bd));
      az += P(ba, 5u);
      bb = P(bb, 30u);
    };
    bp = P((bm ^ bh ^ br ^ bp), 1u);
    {
      bd += 0xca62c1d6u;
      bd += bp;
      bd += ((ba) ^ (bb) ^ (bc));
      bd += P(az, 5u);
      ba = P(ba, 30u);
    };
    bq = P((bn ^ bi ^ bs ^ bq), 1u);
    {
      bc += 0xca62c1d6u;
      bc += bq;
      bc += ((az) ^ (ba) ^ (bb));
      bc += P(bd, 5u);
      az = P(az, 30u);
    };
    br = P((bo ^ bj ^ bt ^ br), 1u);
    {
      bb += 0xca62c1d6u;
      bb += br;
      bb += ((bd) ^ (az) ^ (ba));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bs = P((bp ^ bk ^ be ^ bs), 1u);
    {
      ba += 0xca62c1d6u;
      ba += bs;
      ba += ((bc) ^ (bd) ^ (az));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    bt = P((bq ^ bl ^ bf ^ bt), 1u);
    {
      az += 0xca62c1d6u;
      az += bt;
      az += ((bb) ^ (bc) ^ (bd));
      az += P(ba, 5u);
      bb = P(bb, 30u);
    };

    az += bu;
    ba += bv;
    bb += bw;
    bc += bx;
    bd += by;

    {
      const u32 bz[4] = {bcc, bdd, bbb, baa};
      if (Z(bz, l, m, n, o, p, q, r, s, aa, ab, ac)) {
        int ca = X(bz, ah, &u[ai]);
        if (ca != -1) {
          const u32 cb = ai + ca;
          if (atomic_add(&v[cb], 1) == 0) {
            AA(t, y, ad, ca, cb, aj, au);
          }
        }
      }
    };
  }
}

void BZ(u32 a[4], u32 b[4], u32 c[4], u32 d[4], const u32 e, __global pw_t* f, __global kernel_rule_t* g, __global comb_t* h, __global bf_t* i, __global void* j, __global void* k, __global u32* l, __global u32* m, __global u32* n, __global u32* o, __global u32* p, __global u32* q, __global u32* r, __global u32* s, __global plain_t* t, __global digest_t* u, __global u32* v, __global salt_t* w, __global pstoken_t* x, __global u32* y, __global u32* z, const u32 aa, const u32 ab, const u32 ac,
        const u32 ad, const u32 ae, const u32 af, const u32 ag, const u32 ah, const u32 ai) {
  const u32 aj = get_global_id(0);
  const u32 ak = get_local_id(0);

  const u32 al = x[ad].pc_offset;

  u32 am[5];

  am[0] = x[ad].pc_digest[0];
  am[1] = x[ad].pc_digest[1];
  am[2] = x[ad].pc_digest[2];
  am[3] = x[ad].pc_digest[3];
  am[4] = x[ad].pc_digest[4];

  u32 an[4];
  u32 ao[4];
  u32 ap[4];
  u32 aq[4];

  an[0] = G(x[ad].salt_buf[al + 0]);
  an[1] = G(x[ad].salt_buf[al + 1]);
  an[2] = G(x[ad].salt_buf[al + 2]);
  an[3] = G(x[ad].salt_buf[al + 3]);
  ao[0] = G(x[ad].salt_buf[al + 4]);
  ao[1] = G(x[ad].salt_buf[al + 5]);
  ao[2] = G(x[ad].salt_buf[al + 6]);
  ao[3] = G(x[ad].salt_buf[al + 7]);
  ap[0] = G(x[ad].salt_buf[al + 8]);
  ap[1] = G(x[ad].salt_buf[al + 9]);
  ap[2] = G(x[ad].salt_buf[al + 10]);
  ap[3] = G(x[ad].salt_buf[al + 11]);
  aq[0] = G(x[ad].salt_buf[al + 12]);
  aq[1] = G(x[ad].salt_buf[al + 13]);
  aq[2] = G(x[ad].salt_buf[al + 14]);
  aq[3] = G(x[ad].salt_buf[al + 15]);

  const u32 ar = x[ad].salt_len;

  const u32 as = e + ar;

  const u32 at[4] =
ai[ai[ai[ai[1]
};

u32 au = a[0];

for (u32 av = 0; av < ag; av += 1) {
  const u32x aw = BU(i, av);

  const u32x ax = au | aw;

  u32x ay[16];

  ay[0] = ax;
  ay[1] = a[1];
  ay[2] = a[2];
  ay[3] = a[3];
  ay[4] = b[0];
  ay[5] = b[1];
  ay[6] = b[2];
  ay[7] = b[3];
  ay[8] = c[0];
  ay[9] = c[1];
  ay[10] = c[2];
  ay[11] = c[3];
  ay[12] = d[0];
  ay[13] = d[1];
  ay[14] = d[2];
  ay[15] = d[3];

  u32x az[16];

  az[0] = an[0];
  az[1] = an[1];
  az[2] = an[2];
  az[3] = an[3];
  az[4] = ao[0];
  az[5] = ao[1];
  az[6] = ao[2];
  az[7] = ao[3];
  az[8] = ap[0];
  az[9] = ap[1];
  az[10] = ap[2];
  az[11] = ap[3];
  az[12] = aq[0];
  az[13] = aq[1];
  az[14] = aq[2];
  az[15] = aq[3];

  BX(az, ar & 0x3f, ay);

  u32x ba = am[0];
  u32x bb = am[1];
  u32x bc = am[2];
  u32x bd = am[3];
  u32x be = am[4];

  if (((ar & 0x3f) + e) >= 56) {
    u32x bf = az[0];
    u32x bg = az[1];
    u32x bh = az[2];
    u32x bi = az[3];
    u32x bj = az[4];
    u32x bk = az[5];
    u32x bl = az[6];
    u32x bm = az[7];
    u32x bn = az[8];
    u32x bo = az[9];
    u32x bp = az[10];
    u32x bq = az[11];
    u32x br = az[12];
    u32x bs = az[13];
    u32x bt = az[14];
    u32x bu = az[15];

    {
      be += 0x5a827999u;
      be += bf;
      be += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
      be += P(ba, 5u);
      bb = P(bb, 30u);
    };
    {
      bd += 0x5a827999u;
      bd += bg;
      bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
      bd += P(be, 5u);
      ba = P(ba, 30u);
    };
    {
      bc += 0x5a827999u;
      bc += bh;
      bc += ((((bb)) ^ (((be)) & (((ba)) ^ ((bb))))));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    {
      bb += 0x5a827999u;
      bb += bi;
      bb += ((((ba)) ^ (((bd)) & (((be)) ^ ((ba))))));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    {
      ba += 0x5a827999u;
      ba += bj;
      ba += ((((be)) ^ (((bc)) & (((bd)) ^ ((be))))));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    {
      be += 0x5a827999u;
      be += bk;
      be += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
      be += P(ba, 5u);
      bb = P(bb, 30u);
    };
    {
      bd += 0x5a827999u;
      bd += bl;
      bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
      bd += P(be, 5u);
      ba = P(ba, 30u);
    };
    {
      bc += 0x5a827999u;
      bc += bm;
      bc += ((((bb)) ^ (((be)) & (((ba)) ^ ((bb))))));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    {
      bb += 0x5a827999u;
      bb += bn;
      bb += ((((ba)) ^ (((bd)) & (((be)) ^ ((ba))))));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    {
      ba += 0x5a827999u;
      ba += bo;
      ba += ((((be)) ^ (((bc)) & (((bd)) ^ ((be))))));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    {
      be += 0x5a827999u;
      be += bp;
      be += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
      be += P(ba, 5u);
      bb = P(bb, 30u);
    };
    {
      bd += 0x5a827999u;
      bd += bq;
      bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
      bd += P(be, 5u);
      ba = P(ba, 30u);
    };
    {
      bc += 0x5a827999u;
      bc += br;
      bc += ((((bb)) ^ (((be)) & (((ba)) ^ ((bb))))));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    {
      bb += 0x5a827999u;
      bb += bs;
      bb += ((((ba)) ^ (((bd)) & (((be)) ^ ((ba))))));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    {
      ba += 0x5a827999u;
      ba += bt;
      ba += ((((be)) ^ (((bc)) & (((bd)) ^ ((be))))));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    {
      be += 0x5a827999u;
      be += bu;
      be += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
      be += P(ba, 5u);
      bb = P(bb, 30u);
    };
    bf = P((bs ^ bn ^ bh ^ bf), 1u);
    {
      bd += 0x5a827999u;
      bd += bf;
      bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
      bd += P(be, 5u);
      ba = P(ba, 30u);
    };
    bg = P((bt ^ bo ^ bi ^ bg), 1u);
    {
      bc += 0x5a827999u;
      bc += bg;
      bc += ((((bb)) ^ (((be)) & (((ba)) ^ ((bb))))));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    bh = P((bu ^ bp ^ bj ^ bh), 1u);
    {
      bb += 0x5a827999u;
      bb += bh;
      bb += ((((ba)) ^ (((bd)) & (((be)) ^ ((ba))))));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bi = P((bf ^ bq ^ bk ^ bi), 1u);
    {
      ba += 0x5a827999u;
      ba += bi;
      ba += ((((be)) ^ (((bc)) & (((bd)) ^ ((be))))));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };

    bj = P((bg ^ br ^ bl ^ bj), 1u);
    {
      be += 0x6ed9eba1u;
      be += bj;
      be += ((bb) ^ (bc) ^ (bd));
      be += P(ba, 5u);
      bb = P(bb, 30u);
    };
    bk = P((bh ^ bs ^ bm ^ bk), 1u);
    {
      bd += 0x6ed9eba1u;
      bd += bk;
      bd += ((ba) ^ (bb) ^ (bc));
      bd += P(be, 5u);
      ba = P(ba, 30u);
    };
    bl = P((bi ^ bt ^ bn ^ bl), 1u);
    {
      bc += 0x6ed9eba1u;
      bc += bl;
      bc += ((be) ^ (ba) ^ (bb));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    bm = P((bj ^ bu ^ bo ^ bm), 1u);
    {
      bb += 0x6ed9eba1u;
      bb += bm;
      bb += ((bd) ^ (be) ^ (ba));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bn = P((bk ^ bf ^ bp ^ bn), 1u);
    {
      ba += 0x6ed9eba1u;
      ba += bn;
      ba += ((bc) ^ (bd) ^ (be));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    bo = P((bl ^ bg ^ bq ^ bo), 1u);
    {
      be += 0x6ed9eba1u;
      be += bo;
      be += ((bb) ^ (bc) ^ (bd));
      be += P(ba, 5u);
      bb = P(bb, 30u);
    };
    bp = P((bm ^ bh ^ br ^ bp), 1u);
    {
      bd += 0x6ed9eba1u;
      bd += bp;
      bd += ((ba) ^ (bb) ^ (bc));
      bd += P(be, 5u);
      ba = P(ba, 30u);
    };
    bq = P((bn ^ bi ^ bs ^ bq), 1u);
    {
      bc += 0x6ed9eba1u;
      bc += bq;
      bc += ((be) ^ (ba) ^ (bb));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    br = P((bo ^ bj ^ bt ^ br), 1u);
    {
      bb += 0x6ed9eba1u;
      bb += br;
      bb += ((bd) ^ (be) ^ (ba));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bs = P((bp ^ bk ^ bu ^ bs), 1u);
    {
      ba += 0x6ed9eba1u;
      ba += bs;
      ba += ((bc) ^ (bd) ^ (be));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    bt = P((bq ^ bl ^ bf ^ bt), 1u);
    {
      be += 0x6ed9eba1u;
      be += bt;
      be += ((bb) ^ (bc) ^ (bd));
      be += P(ba, 5u);
      bb = P(bb, 30u);
    };
    bu = P((br ^ bm ^ bg ^ bu), 1u);
    {
      bd += 0x6ed9eba1u;
      bd += bu;
      bd += ((ba) ^ (bb) ^ (bc));
      bd += P(be, 5u);
      ba = P(ba, 30u);
    };
    bf = P((bs ^ bn ^ bh ^ bf), 1u);
    {
      bc += 0x6ed9eba1u;
      bc += bf;
      bc += ((be) ^ (ba) ^ (bb));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    bg = P((bt ^ bo ^ bi ^ bg), 1u);
    {
      bb += 0x6ed9eba1u;
      bb += bg;
      bb += ((bd) ^ (be) ^ (ba));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bh = P((bu ^ bp ^ bj ^ bh), 1u);
    {
      ba += 0x6ed9eba1u;
      ba += bh;
      ba += ((bc) ^ (bd) ^ (be));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    bi = P((bf ^ bq ^ bk ^ bi), 1u);
    {
      be += 0x6ed9eba1u;
      be += bi;
      be += ((bb) ^ (bc) ^ (bd));
      be += P(ba, 5u);
      bb = P(bb, 30u);
    };
    bj = P((bg ^ br ^ bl ^ bj), 1u);
    {
      bd += 0x6ed9eba1u;
      bd += bj;
      bd += ((ba) ^ (bb) ^ (bc));
      bd += P(be, 5u);
      ba = P(ba, 30u);
    };
    bk = P((bh ^ bs ^ bm ^ bk), 1u);
    {
      bc += 0x6ed9eba1u;
      bc += bk;
      bc += ((be) ^ (ba) ^ (bb));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    bl = P((bi ^ bt ^ bn ^ bl), 1u);
    {
      bb += 0x6ed9eba1u;
      bb += bl;
      bb += ((bd) ^ (be) ^ (ba));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bm = P((bj ^ bu ^ bo ^ bm), 1u);
    {
      ba += 0x6ed9eba1u;
      ba += bm;
      ba += ((bc) ^ (bd) ^ (be));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };

    bn = P((bk ^ bf ^ bp ^ bn), 1u);
    {
      be += 0x8f1bbcdcu;
      be += bn;
      be += (((((bb)) & ((bc))) | (((bd)) & (((bb)) ^ ((bc))))));
      be += P(ba, 5u);
      bb = P(bb, 30u);
    };
    bo = P((bl ^ bg ^ bq ^ bo), 1u);
    {
      bd += 0x8f1bbcdcu;
      bd += bo;
      bd += (((((ba)) & ((bb))) | (((bc)) & (((ba)) ^ ((bb))))));
      bd += P(be, 5u);
      ba = P(ba, 30u);
    };
    bp = P((bm ^ bh ^ br ^ bp), 1u);
    {
      bc += 0x8f1bbcdcu;
      bc += bp;
      bc += (((((be)) & ((ba))) | (((bb)) & (((be)) ^ ((ba))))));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    bq = P((bn ^ bi ^ bs ^ bq), 1u);
    {
      bb += 0x8f1bbcdcu;
      bb += bq;
      bb += (((((bd)) & ((be))) | (((ba)) & (((bd)) ^ ((be))))));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    br = P((bo ^ bj ^ bt ^ br), 1u);
    {
      ba += 0x8f1bbcdcu;
      ba += br;
      ba += (((((bc)) & ((bd))) | (((be)) & (((bc)) ^ ((bd))))));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    bs = P((bp ^ bk ^ bu ^ bs), 1u);
    {
      be += 0x8f1bbcdcu;
      be += bs;
      be += (((((bb)) & ((bc))) | (((bd)) & (((bb)) ^ ((bc))))));
      be += P(ba, 5u);
      bb = P(bb, 30u);
    };
    bt = P((bq ^ bl ^ bf ^ bt), 1u);
    {
      bd += 0x8f1bbcdcu;
      bd += bt;
      bd += (((((ba)) & ((bb))) | (((bc)) & (((ba)) ^ ((bb))))));
      bd += P(be, 5u);
      ba = P(ba, 30u);
    };
    bu = P((br ^ bm ^ bg ^ bu), 1u);
    {
      bc += 0x8f1bbcdcu;
      bc += bu;
      bc += (((((be)) & ((ba))) | (((bb)) & (((be)) ^ ((ba))))));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    bf = P((bs ^ bn ^ bh ^ bf), 1u);
    {
      bb += 0x8f1bbcdcu;
      bb += bf;
      bb += (((((bd)) & ((be))) | (((ba)) & (((bd)) ^ ((be))))));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bg = P((bt ^ bo ^ bi ^ bg), 1u);
    {
      ba += 0x8f1bbcdcu;
      ba += bg;
      ba += (((((bc)) & ((bd))) | (((be)) & (((bc)) ^ ((bd))))));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    bh = P((bu ^ bp ^ bj ^ bh), 1u);
    {
      be += 0x8f1bbcdcu;
      be += bh;
      be += (((((bb)) & ((bc))) | (((bd)) & (((bb)) ^ ((bc))))));
      be += P(ba, 5u);
      bb = P(bb, 30u);
    };
    bi = P((bf ^ bq ^ bk ^ bi), 1u);
    {
      bd += 0x8f1bbcdcu;
      bd += bi;
      bd += (((((ba)) & ((bb))) | (((bc)) & (((ba)) ^ ((bb))))));
      bd += P(be, 5u);
      ba = P(ba, 30u);
    };
    bj = P((bg ^ br ^ bl ^ bj), 1u);
    {
      bc += 0x8f1bbcdcu;
      bc += bj;
      bc += (((((be)) & ((ba))) | (((bb)) & (((be)) ^ ((ba))))));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    bk = P((bh ^ bs ^ bm ^ bk), 1u);
    {
      bb += 0x8f1bbcdcu;
      bb += bk;
      bb += (((((bd)) & ((be))) | (((ba)) & (((bd)) ^ ((be))))));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bl = P((bi ^ bt ^ bn ^ bl), 1u);
    {
      ba += 0x8f1bbcdcu;
      ba += bl;
      ba += (((((bc)) & ((bd))) | (((be)) & (((bc)) ^ ((bd))))));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    bm = P((bj ^ bu ^ bo ^ bm), 1u);
    {
      be += 0x8f1bbcdcu;
      be += bm;
      be += (((((bb)) & ((bc))) | (((bd)) & (((bb)) ^ ((bc))))));
      be += P(ba, 5u);
      bb = P(bb, 30u);
    };
    bn = P((bk ^ bf ^ bp ^ bn), 1u);
    {
      bd += 0x8f1bbcdcu;
      bd += bn;
      bd += (((((ba)) & ((bb))) | (((bc)) & (((ba)) ^ ((bb))))));
      bd += P(be, 5u);
      ba = P(ba, 30u);
    };
    bo = P((bl ^ bg ^ bq ^ bo), 1u);
    {
      bc += 0x8f1bbcdcu;
      bc += bo;
      bc += (((((be)) & ((ba))) | (((bb)) & (((be)) ^ ((ba))))));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    bp = P((bm ^ bh ^ br ^ bp), 1u);
    {
      bb += 0x8f1bbcdcu;
      bb += bp;
      bb += (((((bd)) & ((be))) | (((ba)) & (((bd)) ^ ((be))))));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bq = P((bn ^ bi ^ bs ^ bq), 1u);
    {
      ba += 0x8f1bbcdcu;
      ba += bq;
      ba += (((((bc)) & ((bd))) | (((be)) & (((bc)) ^ ((bd))))));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };

    br = P((bo ^ bj ^ bt ^ br), 1u);
    {
      be += 0xca62c1d6u;
      be += br;
      be += ((bb) ^ (bc) ^ (bd));
      be += P(ba, 5u);
      bb = P(bb, 30u);
    };
    bs = P((bp ^ bk ^ bu ^ bs), 1u);
    {
      bd += 0xca62c1d6u;
      bd += bs;
      bd += ((ba) ^ (bb) ^ (bc));
      bd += P(be, 5u);
      ba = P(ba, 30u);
    };
    bt = P((bq ^ bl ^ bf ^ bt), 1u);
    {
      bc += 0xca62c1d6u;
      bc += bt;
      bc += ((be) ^ (ba) ^ (bb));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    bu = P((br ^ bm ^ bg ^ bu), 1u);
    {
      bb += 0xca62c1d6u;
      bb += bu;
      bb += ((bd) ^ (be) ^ (ba));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bf = P((bs ^ bn ^ bh ^ bf), 1u);
    {
      ba += 0xca62c1d6u;
      ba += bf;
      ba += ((bc) ^ (bd) ^ (be));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    bg = P((bt ^ bo ^ bi ^ bg), 1u);
    {
      be += 0xca62c1d6u;
      be += bg;
      be += ((bb) ^ (bc) ^ (bd));
      be += P(ba, 5u);
      bb = P(bb, 30u);
    };
    bh = P((bu ^ bp ^ bj ^ bh), 1u);
    {
      bd += 0xca62c1d6u;
      bd += bh;
      bd += ((ba) ^ (bb) ^ (bc));
      bd += P(be, 5u);
      ba = P(ba, 30u);
    };
    bi = P((bf ^ bq ^ bk ^ bi), 1u);
    {
      bc += 0xca62c1d6u;
      bc += bi;
      bc += ((be) ^ (ba) ^ (bb));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    bj = P((bg ^ br ^ bl ^ bj), 1u);
    {
      bb += 0xca62c1d6u;
      bb += bj;
      bb += ((bd) ^ (be) ^ (ba));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bk = P((bh ^ bs ^ bm ^ bk), 1u);
    {
      ba += 0xca62c1d6u;
      ba += bk;
      ba += ((bc) ^ (bd) ^ (be));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    bl = P((bi ^ bt ^ bn ^ bl), 1u);
    {
      be += 0xca62c1d6u;
      be += bl;
      be += ((bb) ^ (bc) ^ (bd));
      be += P(ba, 5u);
      bb = P(bb, 30u);
    };
    bm = P((bj ^ bu ^ bo ^ bm), 1u);
    {
      bd += 0xca62c1d6u;
      bd += bm;
      bd += ((ba) ^ (bb) ^ (bc));
      bd += P(be, 5u);
      ba = P(ba, 30u);
    };
    bn = P((bk ^ bf ^ bp ^ bn), 1u);
    {
      bc += 0xca62c1d6u;
      bc += bn;
      bc += ((be) ^ (ba) ^ (bb));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    bo = P((bl ^ bg ^ bq ^ bo), 1u);
    {
      bb += 0xca62c1d6u;
      bb += bo;
      bb += ((bd) ^ (be) ^ (ba));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bp = P((bm ^ bh ^ br ^ bp), 1u);
    {
      ba += 0xca62c1d6u;
      ba += bp;
      ba += ((bc) ^ (bd) ^ (be));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };
    bq = P((bn ^ bi ^ bs ^ bq), 1u);
    {
      be += 0xca62c1d6u;
      be += bq;
      be += ((bb) ^ (bc) ^ (bd));
      be += P(ba, 5u);
      bb = P(bb, 30u);
    };
    br = P((bo ^ bj ^ bt ^ br), 1u);
    {
      bd += 0xca62c1d6u;
      bd += br;
      bd += ((ba) ^ (bb) ^ (bc));
      bd += P(be, 5u);
      ba = P(ba, 30u);
    };
    bs = P((bp ^ bk ^ bu ^ bs), 1u);
    {
      bc += 0xca62c1d6u;
      bc += bs;
      bc += ((be) ^ (ba) ^ (bb));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    bt = P((bq ^ bl ^ bf ^ bt), 1u);
    {
      bb += 0xca62c1d6u;
      bb += bt;
      bb += ((bd) ^ (be) ^ (ba));
      bb += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bu = P((br ^ bm ^ bg ^ bu), 1u);
    {
      ba += 0xca62c1d6u;
      ba += bu;
      ba += ((bc) ^ (bd) ^ (be));
      ba += P(bb, 5u);
      bc = P(bc, 30u);
    };

    ba += am[0];
    bb += am[1];
    bc += am[2];
    bd += am[3];
    be += am[4];

    az[0] = ay[0];
    az[1] = ay[1];
    az[2] = ay[2];
    az[3] = ay[3];
    az[4] = ay[4];
    az[5] = ay[5];
    az[6] = ay[6];
    az[7] = ay[7];
    az[8] = ay[8];
    az[9] = ay[9];
    az[10] = ay[10];
    az[11] = ay[11];
    az[12] = ay[12];
    az[13] = ay[13];
    az[14] = ay[14];
    az[15] = ay[15];
  }

  u32x bf = az[0];
  u32x bg = az[1];
  u32x bh = az[2];
  u32x bi = az[3];
  u32x bj = az[4];
  u32x bk = az[5];
  u32x bl = az[6];
  u32x bm = az[7];
  u32x bn = az[8];
  u32x bo = az[9];
  u32x bp = az[10];
  u32x bq = az[11];
  u32x br = az[12];
  u32x bs = az[13];
  u32x bt = 0;
  u32x bu = as * 8;

  u32x bv = ba;
  u32x bw = bb;
  u32x bx = bc;
  u32x by = bd;
  u32x bz = be;

  {
    be += 0x5a827999u;
    be += bf;
    be += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
    be += P(ba, 5u);
    bb = P(bb, 30u);
  };
  {
    bd += 0x5a827999u;
    bd += bg;
    bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
    bd += P(be, 5u);
    ba = P(ba, 30u);
  };
  {
    bc += 0x5a827999u;
    bc += bh;
    bc += ((((bb)) ^ (((be)) & (((ba)) ^ ((bb))))));
    bc += P(bd, 5u);
    be = P(be, 30u);
  };
  {
    bb += 0x5a827999u;
    bb += bi;
    bb += ((((ba)) ^ (((bd)) & (((be)) ^ ((ba))))));
    bb += P(bc, 5u);
    bd = P(bd, 30u);
  };
  {
    ba += 0x5a827999u;
    ba += bj;
    ba += ((((be)) ^ (((bc)) & (((bd)) ^ ((be))))));
    ba += P(bb, 5u);
    bc = P(bc, 30u);
  };
  {
    be += 0x5a827999u;
    be += bk;
    be += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
    be += P(ba, 5u);
    bb = P(bb, 30u);
  };
  {
    bd += 0x5a827999u;
    bd += bl;
    bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
    bd += P(be, 5u);
    ba = P(ba, 30u);
  };
  {
    bc += 0x5a827999u;
    bc += bm;
    bc += ((((bb)) ^ (((be)) & (((ba)) ^ ((bb))))));
    bc += P(bd, 5u);
    be = P(be, 30u);
  };
  {
    bb += 0x5a827999u;
    bb += bn;
    bb += ((((ba)) ^ (((bd)) & (((be)) ^ ((ba))))));
    bb += P(bc, 5u);
    bd = P(bd, 30u);
  };
  {
    ba += 0x5a827999u;
    ba += bo;
    ba += ((((be)) ^ (((bc)) & (((bd)) ^ ((be))))));
    ba += P(bb, 5u);
    bc = P(bc, 30u);
  };
  {
    be += 0x5a827999u;
    be += bp;
    be += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
    be += P(ba, 5u);
    bb = P(bb, 30u);
  };
  {
    bd += 0x5a827999u;
    bd += bq;
    bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
    bd += P(be, 5u);
    ba = P(ba, 30u);
  };
  {
    bc += 0x5a827999u;
    bc += br;
    bc += ((((bb)) ^ (((be)) & (((ba)) ^ ((bb))))));
    bc += P(bd, 5u);
    be = P(be, 30u);
  };
  {
    bb += 0x5a827999u;
    bb += bs;
    bb += ((((ba)) ^ (((bd)) & (((be)) ^ ((ba))))));
    bb += P(bc, 5u);
    bd = P(bd, 30u);
  };
  {
    ba += 0x5a827999u;
    ba += bt;
    ba += ((((be)) ^ (((bc)) & (((bd)) ^ ((be))))));
    ba += P(bb, 5u);
    bc = P(bc, 30u);
  };
  {
    be += 0x5a827999u;
    be += bu;
    be += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
    be += P(ba, 5u);
    bb = P(bb, 30u);
  };
  bf = P((bs ^ bn ^ bh ^ bf), 1u);
  {
    bd += 0x5a827999u;
    bd += bf;
    bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
    bd += P(be, 5u);
    ba = P(ba, 30u);
  };
  bg = P((bt ^ bo ^ bi ^ bg), 1u);
  {
    bc += 0x5a827999u;
    bc += bg;
    bc += ((((bb)) ^ (((be)) & (((ba)) ^ ((bb))))));
    bc += P(bd, 5u);
    be = P(be, 30u);
  };
  bh = P((bu ^ bp ^ bj ^ bh), 1u);
  {
    bb += 0x5a827999u;
    bb += bh;
    bb += ((((ba)) ^ (((bd)) & (((be)) ^ ((ba))))));
    bb += P(bc, 5u);
    bd = P(bd, 30u);
  };
  bi = P((bf ^ bq ^ bk ^ bi), 1u);
  {
    ba += 0x5a827999u;
    ba += bi;
    ba += ((((be)) ^ (((bc)) & (((bd)) ^ ((be))))));
    ba += P(bb, 5u);
    bc = P(bc, 30u);
  };

  bj = P((bg ^ br ^ bl ^ bj), 1u);
  {
    be += 0x6ed9eba1u;
    be += bj;
    be += ((bb) ^ (bc) ^ (bd));
    be += P(ba, 5u);
    bb = P(bb, 30u);
  };
  bk = P((bh ^ bs ^ bm ^ bk), 1u);
  {
    bd += 0x6ed9eba1u;
    bd += bk;
    bd += ((ba) ^ (bb) ^ (bc));
    bd += P(be, 5u);
    ba = P(ba, 30u);
  };
  bl = P((bi ^ bt ^ bn ^ bl), 1u);
  {
    bc += 0x6ed9eba1u;
    bc += bl;
    bc += ((be) ^ (ba) ^ (bb));
    bc += P(bd, 5u);
    be = P(be, 30u);
  };
  bm = P((bj ^ bu ^ bo ^ bm), 1u);
  {
    bb += 0x6ed9eba1u;
    bb += bm;
    bb += ((bd) ^ (be) ^ (ba));
    bb += P(bc, 5u);
    bd = P(bd, 30u);
  };
  bn = P((bk ^ bf ^ bp ^ bn), 1u);
  {
    ba += 0x6ed9eba1u;
    ba += bn;
    ba += ((bc) ^ (bd) ^ (be));
    ba += P(bb, 5u);
    bc = P(bc, 30u);
  };
  bo = P((bl ^ bg ^ bq ^ bo), 1u);
  {
    be += 0x6ed9eba1u;
    be += bo;
    be += ((bb) ^ (bc) ^ (bd));
    be += P(ba, 5u);
    bb = P(bb, 30u);
  };
  bp = P((bm ^ bh ^ br ^ bp), 1u);
  {
    bd += 0x6ed9eba1u;
    bd += bp;
    bd += ((ba) ^ (bb) ^ (bc));
    bd += P(be, 5u);
    ba = P(ba, 30u);
  };
  bq = P((bn ^ bi ^ bs ^ bq), 1u);
  {
    bc += 0x6ed9eba1u;
    bc += bq;
    bc += ((be) ^ (ba) ^ (bb));
    bc += P(bd, 5u);
    be = P(be, 30u);
  };
  br = P((bo ^ bj ^ bt ^ br), 1u);
  {
    bb += 0x6ed9eba1u;
    bb += br;
    bb += ((bd) ^ (be) ^ (ba));
    bb += P(bc, 5u);
    bd = P(bd, 30u);
  };
  bs = P((bp ^ bk ^ bu ^ bs), 1u);
  {
    ba += 0x6ed9eba1u;
    ba += bs;
    ba += ((bc) ^ (bd) ^ (be));
    ba += P(bb, 5u);
    bc = P(bc, 30u);
  };
  bt = P((bq ^ bl ^ bf ^ bt), 1u);
  {
    be += 0x6ed9eba1u;
    be += bt;
    be += ((bb) ^ (bc) ^ (bd));
    be += P(ba, 5u);
    bb = P(bb, 30u);
  };
  bu = P((br ^ bm ^ bg ^ bu), 1u);
  {
    bd += 0x6ed9eba1u;
    bd += bu;
    bd += ((ba) ^ (bb) ^ (bc));
    bd += P(be, 5u);
    ba = P(ba, 30u);
  };
  bf = P((bs ^ bn ^ bh ^ bf), 1u);
  {
    bc += 0x6ed9eba1u;
    bc += bf;
    bc += ((be) ^ (ba) ^ (bb));
    bc += P(bd, 5u);
    be = P(be, 30u);
  };
  bg = P((bt ^ bo ^ bi ^ bg), 1u);
  {
    bb += 0x6ed9eba1u;
    bb += bg;
    bb += ((bd) ^ (be) ^ (ba));
    bb += P(bc, 5u);
    bd = P(bd, 30u);
  };
  bh = P((bu ^ bp ^ bj ^ bh), 1u);
  {
    ba += 0x6ed9eba1u;
    ba += bh;
    ba += ((bc) ^ (bd) ^ (be));
    ba += P(bb, 5u);
    bc = P(bc, 30u);
  };
  bi = P((bf ^ bq ^ bk ^ bi), 1u);
  {
    be += 0x6ed9eba1u;
    be += bi;
    be += ((bb) ^ (bc) ^ (bd));
    be += P(ba, 5u);
    bb = P(bb, 30u);
  };
  bj = P((bg ^ br ^ bl ^ bj), 1u);
  {
    bd += 0x6ed9eba1u;
    bd += bj;
    bd += ((ba) ^ (bb) ^ (bc));
    bd += P(be, 5u);
    ba = P(ba, 30u);
  };
  bk = P((bh ^ bs ^ bm ^ bk), 1u);
  {
    bc += 0x6ed9eba1u;
    bc += bk;
    bc += ((be) ^ (ba) ^ (bb));
    bc += P(bd, 5u);
    be = P(be, 30u);
  };
  bl = P((bi ^ bt ^ bn ^ bl), 1u);
  {
    bb += 0x6ed9eba1u;
    bb += bl;
    bb += ((bd) ^ (be) ^ (ba));
    bb += P(bc, 5u);
    bd = P(bd, 30u);
  };
  bm = P((bj ^ bu ^ bo ^ bm), 1u);
  {
    ba += 0x6ed9eba1u;
    ba += bm;
    ba += ((bc) ^ (bd) ^ (be));
    ba += P(bb, 5u);
    bc = P(bc, 30u);
  };

  bn = P((bk ^ bf ^ bp ^ bn), 1u);
  {
    be += 0x8f1bbcdcu;
    be += bn;
    be += (((((bb)) & ((bc))) | (((bd)) & (((bb)) ^ ((bc))))));
    be += P(ba, 5u);
    bb = P(bb, 30u);
  };
  bo = P((bl ^ bg ^ bq ^ bo), 1u);
  {
    bd += 0x8f1bbcdcu;
    bd += bo;
    bd += (((((ba)) & ((bb))) | (((bc)) & (((ba)) ^ ((bb))))));
    bd += P(be, 5u);
    ba = P(ba, 30u);
  };
  bp = P((bm ^ bh ^ br ^ bp), 1u);
  {
    bc += 0x8f1bbcdcu;
    bc += bp;
    bc += (((((be)) & ((ba))) | (((bb)) & (((be)) ^ ((ba))))));
    bc += P(bd, 5u);
    be = P(be, 30u);
  };
  bq = P((bn ^ bi ^ bs ^ bq), 1u);
  {
    bb += 0x8f1bbcdcu;
    bb += bq;
    bb += (((((bd)) & ((be))) | (((ba)) & (((bd)) ^ ((be))))));
    bb += P(bc, 5u);
    bd = P(bd, 30u);
  };
  br = P((bo ^ bj ^ bt ^ br), 1u);
  {
    ba += 0x8f1bbcdcu;
    ba += br;
    ba += (((((bc)) & ((bd))) | (((be)) & (((bc)) ^ ((bd))))));
    ba += P(bb, 5u);
    bc = P(bc, 30u);
  };
  bs = P((bp ^ bk ^ bu ^ bs), 1u);
  {
    be += 0x8f1bbcdcu;
    be += bs;
    be += (((((bb)) & ((bc))) | (((bd)) & (((bb)) ^ ((bc))))));
    be += P(ba, 5u);
    bb = P(bb, 30u);
  };
  bt = P((bq ^ bl ^ bf ^ bt), 1u);
  {
    bd += 0x8f1bbcdcu;
    bd += bt;
    bd += (((((ba)) & ((bb))) | (((bc)) & (((ba)) ^ ((bb))))));
    bd += P(be, 5u);
    ba = P(ba, 30u);
  };
  bu = P((br ^ bm ^ bg ^ bu), 1u);
  {
    bc += 0x8f1bbcdcu;
    bc += bu;
    bc += (((((be)) & ((ba))) | (((bb)) & (((be)) ^ ((ba))))));
    bc += P(bd, 5u);
    be = P(be, 30u);
  };
  bf = P((bs ^ bn ^ bh ^ bf), 1u);
  {
    bb += 0x8f1bbcdcu;
    bb += bf;
    bb += (((((bd)) & ((be))) | (((ba)) & (((bd)) ^ ((be))))));
    bb += P(bc, 5u);
    bd = P(bd, 30u);
  };
  bg = P((bt ^ bo ^ bi ^ bg), 1u);
  {
    ba += 0x8f1bbcdcu;
    ba += bg;
    ba += (((((bc)) & ((bd))) | (((be)) & (((bc)) ^ ((bd))))));
    ba += P(bb, 5u);
    bc = P(bc, 30u);
  };
  bh = P((bu ^ bp ^ bj ^ bh), 1u);
  {
    be += 0x8f1bbcdcu;
    be += bh;
    be += (((((bb)) & ((bc))) | (((bd)) & (((bb)) ^ ((bc))))));
    be += P(ba, 5u);
    bb = P(bb, 30u);
  };
  bi = P((bf ^ bq ^ bk ^ bi), 1u);
  {
    bd += 0x8f1bbcdcu;
    bd += bi;
    bd += (((((ba)) & ((bb))) | (((bc)) & (((ba)) ^ ((bb))))));
    bd += P(be, 5u);
    ba = P(ba, 30u);
  };
  bj = P((bg ^ br ^ bl ^ bj), 1u);
  {
    bc += 0x8f1bbcdcu;
    bc += bj;
    bc += (((((be)) & ((ba))) | (((bb)) & (((be)) ^ ((ba))))));
    bc += P(bd, 5u);
    be = P(be, 30u);
  };
  bk = P((bh ^ bs ^ bm ^ bk), 1u);
  {
    bb += 0x8f1bbcdcu;
    bb += bk;
    bb += (((((bd)) & ((be))) | (((ba)) & (((bd)) ^ ((be))))));
    bb += P(bc, 5u);
    bd = P(bd, 30u);
  };
  bl = P((bi ^ bt ^ bn ^ bl), 1u);
  {
    ba += 0x8f1bbcdcu;
    ba += bl;
    ba += (((((bc)) & ((bd))) | (((be)) & (((bc)) ^ ((bd))))));
    ba += P(bb, 5u);
    bc = P(bc, 30u);
  };
  bm = P((bj ^ bu ^ bo ^ bm), 1u);
  {
    be += 0x8f1bbcdcu;
    be += bm;
    be += (((((bb)) & ((bc))) | (((bd)) & (((bb)) ^ ((bc))))));
    be += P(ba, 5u);
    bb = P(bb, 30u);
  };
  bn = P((bk ^ bf ^ bp ^ bn), 1u);
  {
    bd += 0x8f1bbcdcu;
    bd += bn;
    bd += (((((ba)) & ((bb))) | (((bc)) & (((ba)) ^ ((bb))))));
    bd += P(be, 5u);
    ba = P(ba, 30u);
  };
  bo = P((bl ^ bg ^ bq ^ bo), 1u);
  {
    bc += 0x8f1bbcdcu;
    bc += bo;
    bc += (((((be)) & ((ba))) | (((bb)) & (((be)) ^ ((ba))))));
    bc += P(bd, 5u);
    be = P(be, 30u);
  };
  bp = P((bm ^ bh ^ br ^ bp), 1u);
  {
    bb += 0x8f1bbcdcu;
    bb += bp;
    bb += (((((bd)) & ((be))) | (((ba)) & (((bd)) ^ ((be))))));
    bb += P(bc, 5u);
    bd = P(bd, 30u);
  };
  bq = P((bn ^ bi ^ bs ^ bq), 1u);
  {
    ba += 0x8f1bbcdcu;
    ba += bq;
    ba += (((((bc)) & ((bd))) | (((be)) & (((bc)) ^ ((bd))))));
    ba += P(bb, 5u);
    bc = P(bc, 30u);
  };

  br = P((bo ^ bj ^ bt ^ br), 1u);
  {
    be += 0xca62c1d6u;
    be += br;
    be += ((bb) ^ (bc) ^ (bd));
    be += P(ba, 5u);
    bb = P(bb, 30u);
  };
  bs = P((bp ^ bk ^ bu ^ bs), 1u);
  {
    bd += 0xca62c1d6u;
    bd += bs;
    bd += ((ba) ^ (bb) ^ (bc));
    bd += P(be, 5u);
    ba = P(ba, 30u);
  };
  bt = P((bq ^ bl ^ bf ^ bt), 1u);
  {
    bc += 0xca62c1d6u;
    bc += bt;
    bc += ((be) ^ (ba) ^ (bb));
    bc += P(bd, 5u);
    be = P(be, 30u);
  };
  bu = P((br ^ bm ^ bg ^ bu), 1u);
  {
    bb += 0xca62c1d6u;
    bb += bu;
    bb += ((bd) ^ (be) ^ (ba));
    bb += P(bc, 5u);
    bd = P(bd, 30u);
  };
  bf = P((bs ^ bn ^ bh ^ bf), 1u);
  {
    ba += 0xca62c1d6u;
    ba += bf;
    ba += ((bc) ^ (bd) ^ (be));
    ba += P(bb, 5u);
    bc = P(bc, 30u);
  };
  bg = P((bt ^ bo ^ bi ^ bg), 1u);
  {
    be += 0xca62c1d6u;
    be += bg;
    be += ((bb) ^ (bc) ^ (bd));
    be += P(ba, 5u);
    bb = P(bb, 30u);
  };
  bh = P((bu ^ bp ^ bj ^ bh), 1u);
  {
    bd += 0xca62c1d6u;
    bd += bh;
    bd += ((ba) ^ (bb) ^ (bc));
    bd += P(be, 5u);
    ba = P(ba, 30u);
  };
  bi = P((bf ^ bq ^ bk ^ bi), 1u);
  {
    bc += 0xca62c1d6u;
    bc += bi;
    bc += ((be) ^ (ba) ^ (bb));
    bc += P(bd, 5u);
    be = P(be, 30u);
  };
  bj = P((bg ^ br ^ bl ^ bj), 1u);
  {
    bb += 0xca62c1d6u;
    bb += bj;
    bb += ((bd) ^ (be) ^ (ba));
    bb += P(bc, 5u);
    bd = P(bd, 30u);
  };
  bk = P((bh ^ bs ^ bm ^ bk), 1u);
  {
    ba += 0xca62c1d6u;
    ba += bk;
    ba += ((bc) ^ (bd) ^ (be));
    ba += P(bb, 5u);
    bc = P(bc, 30u);
  };
  bl = P((bi ^ bt ^ bn ^ bl), 1u);
  {
    be += 0xca62c1d6u;
    be += bl;
    be += ((bb) ^ (bc) ^ (bd));
    be += P(ba, 5u);
    bb = P(bb, 30u);
  };
  bm = P((bj ^ bu ^ bo ^ bm), 1u);
  {
    bd += 0xca62c1d6u;
    bd += bm;
    bd += ((ba) ^ (bb) ^ (bc));
    bd += P(be, 5u);
    ba = P(ba, 30u);
  };
  bn = P((bk ^ bf ^ bp ^ bn), 1u);
  {
    bc += 0xca62c1d6u;
    bc += bn;
    bc += ((be) ^ (ba) ^ (bb));
    bc += P(bd, 5u);
    be = P(be, 30u);
  };
  bo = P((bl ^ bg ^ bq ^ bo), 1u);
  {
    bb += 0xca62c1d6u;
    bb += bo;
    bb += ((bd) ^ (be) ^ (ba));
    bb += P(bc, 5u);
    bd = P(bd, 30u);
  };
  bp = P((bm ^ bh ^ br ^ bp), 1u);
  {
    ba += 0xca62c1d6u;
    ba += bp;
    ba += ((bc) ^ (bd) ^ (be));
    ba += P(bb, 5u);
    bc = P(bc, 30u);
  };
  bq = P((bn ^ bi ^ bs ^ bq), 1u);
  {
    be += 0xca62c1d6u;
    be += bq;
    be += ((bb) ^ (bc) ^ (bd));
    be += P(ba, 5u);
    bb = P(bb, 30u);
  };
  br = P((bo ^ bj ^ bt ^ br), 1u);
  {
    bd += 0xca62c1d6u;
    bd += br;
    bd += ((ba) ^ (bb) ^ (bc));
    bd += P(be, 5u);
    ba = P(ba, 30u);
  };
  bs = P((bp ^ bk ^ bu ^ bs), 1u);
  {
    bc += 0xca62c1d6u;
    bc += bs;
    bc += ((be) ^ (ba) ^ (bb));
    bc += P(bd, 5u);
    be = P(be, 30u);
  };
  bt = P((bq ^ bl ^ bf ^ bt), 1u);
  {
    bb += 0xca62c1d6u;
    bb += bt;
    bb += ((bd) ^ (be) ^ (ba));
    bb += P(bc, 5u);
    bd = P(bd, 30u);
  };
  bu = P((br ^ bm ^ bg ^ bu), 1u);
  {
    ba += 0xca62c1d6u;
    ba += bu;
    ba += ((bc) ^ (bd) ^ (be));
    ba += P(bb, 5u);
    bc = P(bc, 30u);
  };

  ba += bv;
  bb += bw;
  bc += bx;
  bd += by;
  be += bz;

  {
    if (((bd) == at[0]) && ((be) == at[1]) && ((bc) == at[2]) && ((bb) == at[3])) {
      const u32 ca = ai + 0;
      if (atomic_add(&v[ca], 1) == 0) {
        AA(t, y, ad, 0, ca, aj, av);
      }
    }
  };
}
}

__kernel void CA(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global pstoken_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa,
                 const u32 ab, const u32 ac, const u32 ad, const u32 ae, const u32 af) {
  const u32 ag = get_global_id(0);

  if (ag >= af)
    return;

  u32 ah[4];

  ah[0] = a[ag].i[0];
  ah[1] = a[ag].i[1];
  ah[2] = a[ag].i[2];
  ah[3] = a[ag].i[3];

  u32 ai[4];

  ai[0] = 0;
  ai[1] = 0;
  ai[2] = 0;
  ai[3] = 0;

  u32 aj[4];

  aj[0] = 0;
  aj[1] = 0;
  aj[2] = 0;
  aj[3] = 0;

  u32 ak[4];

  ak[0] = 0;
  ak[1] = 0;
  ak[2] = 0;
  ak[3] = 0;

  const u32 al = a[ag].pw_len;

  BY(ah, ai, aj, ak, al, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad);
}

__kernel void CB(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global pstoken_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa,
                 const u32 ab, const u32 ac, const u32 ad, const u32 ae, const u32 af) {
  const u32 ag = get_global_id(0);

  if (ag >= af)
    return;

  u32 ah[4];

  ah[0] = a[ag].i[0];
  ah[1] = a[ag].i[1];
  ah[2] = a[ag].i[2];
  ah[3] = a[ag].i[3];

  u32 ai[4];

  ai[0] = a[ag].i[4];
  ai[1] = a[ag].i[5];
  ai[2] = a[ag].i[6];
  ai[3] = a[ag].i[7];

  u32 aj[4];

  aj[0] = 0;
  aj[1] = 0;
  aj[2] = 0;
  aj[3] = 0;

  u32 ak[4];

  ak[0] = 0;
  ak[1] = 0;
  ak[2] = 0;
  ak[3] = 0;

  const u32 al = a[ag].pw_len;

  BY(ah, ai, aj, ak, al, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad);
}

__kernel void CC(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global pstoken_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa,
                 const u32 ab, const u32 ac, const u32 ad, const u32 ae, const u32 af) {
  const u32 ag = get_global_id(0);

  if (ag >= af)
    return;

  u32 ah[4];

  ah[0] = a[ag].i[0];
  ah[1] = a[ag].i[1];
  ah[2] = a[ag].i[2];
  ah[3] = a[ag].i[3];

  u32 ai[4];

  ai[0] = a[ag].i[4];
  ai[1] = a[ag].i[5];
  ai[2] = a[ag].i[6];
  ai[3] = a[ag].i[7];

  u32 aj[4];

  aj[0] = a[ag].i[8];
  aj[1] = a[ag].i[9];
  aj[2] = a[ag].i[10];
  aj[3] = a[ag].i[11];

  u32 ak[4];

  ak[0] = a[ag].i[12];
  ak[1] = a[ag].i[13];
  ak[2] = 0;
  ak[3] = 0;

  const u32 al = a[ag].pw_len;

  BY(ah, ai, aj, ak, al, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad);
}

__kernel void CD(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global pstoken_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa,
                 const u32 ab, const u32 ac, const u32 ad, const u32 ae, const u32 af) {
  const u32 ag = get_global_id(0);

  if (ag >= af)
    return;

  u32 ah[4];

  ah[0] = a[ag].i[0];
  ah[1] = a[ag].i[1];
  ah[2] = a[ag].i[2];
  ah[3] = a[ag].i[3];

  u32 ai[4];

  ai[0] = 0;
  ai[1] = 0;
  ai[2] = 0;
  ai[3] = 0;

  u32 aj[4];

  aj[0] = 0;
  aj[1] = 0;
  aj[2] = 0;
  aj[3] = 0;

  u32 ak[4];

  ak[0] = 0;
  ak[1] = 0;
  ak[2] = 0;
  ak[3] = 0;

  const u32 al = a[ag].pw_len;

  BZ(ah, ai, aj, ak, al, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad);
}

__kernel void CE(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global pstoken_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa,
                 const u32 ab, const u32 ac, const u32 ad, const u32 ae, const u32 af) {
  const u32 ag = get_global_id(0);

  if (ag >= af)
    return;

  u32 ah[4];

  ah[0] = a[ag].i[0];
  ah[1] = a[ag].i[1];
  ah[2] = a[ag].i[2];
  ah[3] = a[ag].i[3];

  u32 ai[4];

  ai[0] = a[ag].i[4];
  ai[1] = a[ag].i[5];
  ai[2] = a[ag].i[6];
  ai[3] = a[ag].i[7];

  u32 aj[4];

  aj[0] = 0;
  aj[1] = 0;
  aj[2] = 0;
  aj[3] = 0;

  u32 ak[4];

  ak[0] = 0;
  ak[1] = 0;
  ak[2] = 0;
  ak[3] = 0;

  const u32 al = a[ag].pw_len;

  BZ(ah, ai, aj, ak, al, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad);
}

__kernel void CF(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global pstoken_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa,
                 const u32 ab, const u32 ac, const u32 ad, const u32 ae, const u32 af) {
  const u32 ag = get_global_id(0);

  if (ag >= af)
    return;

  u32 ah[4];

  ah[0] = a[ag].i[0];
  ah[1] = a[ag].i[1];
  ah[2] = a[ag].i[2];
  ah[3] = a[ag].i[3];

  u32 ai[4];

  ai[0] = a[ag].i[4];
  ai[1] = a[ag].i[5];
  ai[2] = a[ag].i[6];
  ai[3] = a[ag].i[7];

  u32 aj[4];

  aj[0] = a[ag].i[8];
  aj[1] = a[ag].i[9];
  aj[2] = a[ag].i[10];
  aj[3] = a[ag].i[11];

  u32 ak[4];

  ak[0] = a[ag].i[12];
  ak[1] = a[ag].i[13];
  ak[2] = 0;
  ak[3] = 0;

  const u32 al = a[ag].pw_len;

  BZ(ah, ai, aj, ak, al, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad);
}