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
__constant u32 Ga[64] = {0x1451ac91, 0x4354679f, 0xe03be724, 0xc27b7428, 0xeb133386, 0x5ccb4f5a, 0x37730a08, 0x2f1c5d0e, 0xe5e68f33, 0xddae9bf8, 0x8d4bf216, 0xdcd4e12c, 0x9ddfcbb0, 0x176d70d4, 0x3f424df9, 0x94111b9b, 0x9bc15b9f, 0x039d0506, 0x8a135e9d, 0xe86a9a1e, 0x17147cd9, 0xf62ac758, 0x0a6399a1, 0xc370fdd7, 0x13745ef6, 0x040bc903, 0x26f79826, 0x2593928a, 0x230da2b0, 0x6d7963ed, 0x3cfa3213, 0xa39a0235,
                         0x0a8eddb3, 0xc351bf24, 0x9f55cd7c, 0x4c94af37, 0x82520829, 0x374e3bb2, 0x9107179f, 0xcdfd3b11, 0,          0,          0,          0,          0,          0,          0,          0,          0,          0,          0,          0,          0,          0,          0,          0,          0,          0,          0,          0,          0,          0,          0,          0};

void BX(u32 a[16]) {
  a[0] = M(a[0]);
  a[1] = M(a[1]);
  a[2] = M(a[2]);
  a[3] = M(a[3]);
  a[4] = M(a[4]);
  a[5] = M(a[5]);
  a[6] = M(a[6]);
  a[7] = M(a[7]);
  a[8] = M(a[8]);
  a[9] = M(a[9]);
  a[10] = M(a[10]);
  a[11] = M(a[11]);
  a[12] = M(a[12]);
  a[13] = M(a[13]);
  a[14] = M(a[14]);
  a[15] = M(a[15]);
}

void BY(const u32 a[4], const u32 b[4], const u32 c[4], const u32 d[4], u32 e[5]) {
  u32 f = e[0];
  u32 g = e[1];
  u32 h = e[2];
  u32 i = e[3];
  u32 j = e[4];

  u32 k = a[0];
  u32 l = a[1];
  u32 m = a[2];
  u32 n = a[3];
  u32 o = b[0];
  u32 p = b[1];
  u32 q = b[2];
  u32 r = b[3];
  u32 s = c[0];
  u32 t = c[1];
  u32 u = c[2];
  u32 v = c[3];
  u32 w = d[0];
  u32 x = d[1];
  u32 y = d[2];
  u32 z = d[3];

  {
    j += 0x5a827999u;
    j += k;
    j += ((((i)) ^ (((g)) & (((h)) ^ ((i))))));
    j += P(f, 5u);
    g = P(g, 30u);
  };
  {
    i += 0x5a827999u;
    i += l;
    i += ((((h)) ^ (((f)) & (((g)) ^ ((h))))));
    i += P(j, 5u);
    f = P(f, 30u);
  };
  {
    h += 0x5a827999u;
    h += m;
    h += ((((g)) ^ (((j)) & (((f)) ^ ((g))))));
    h += P(i, 5u);
    j = P(j, 30u);
  };
  {
    g += 0x5a827999u;
    g += n;
    g += ((((f)) ^ (((i)) & (((j)) ^ ((f))))));
    g += P(h, 5u);
    i = P(i, 30u);
  };
  {
    f += 0x5a827999u;
    f += o;
    f += ((((j)) ^ (((h)) & (((i)) ^ ((j))))));
    f += P(g, 5u);
    h = P(h, 30u);
  };
  {
    j += 0x5a827999u;
    j += p;
    j += ((((i)) ^ (((g)) & (((h)) ^ ((i))))));
    j += P(f, 5u);
    g = P(g, 30u);
  };
  {
    i += 0x5a827999u;
    i += q;
    i += ((((h)) ^ (((f)) & (((g)) ^ ((h))))));
    i += P(j, 5u);
    f = P(f, 30u);
  };
  {
    h += 0x5a827999u;
    h += r;
    h += ((((g)) ^ (((j)) & (((f)) ^ ((g))))));
    h += P(i, 5u);
    j = P(j, 30u);
  };
  {
    g += 0x5a827999u;
    g += s;
    g += ((((f)) ^ (((i)) & (((j)) ^ ((f))))));
    g += P(h, 5u);
    i = P(i, 30u);
  };
  {
    f += 0x5a827999u;
    f += t;
    f += ((((j)) ^ (((h)) & (((i)) ^ ((j))))));
    f += P(g, 5u);
    h = P(h, 30u);
  };
  {
    j += 0x5a827999u;
    j += u;
    j += ((((i)) ^ (((g)) & (((h)) ^ ((i))))));
    j += P(f, 5u);
    g = P(g, 30u);
  };
  {
    i += 0x5a827999u;
    i += v;
    i += ((((h)) ^ (((f)) & (((g)) ^ ((h))))));
    i += P(j, 5u);
    f = P(f, 30u);
  };
  {
    h += 0x5a827999u;
    h += w;
    h += ((((g)) ^ (((j)) & (((f)) ^ ((g))))));
    h += P(i, 5u);
    j = P(j, 30u);
  };
  {
    g += 0x5a827999u;
    g += x;
    g += ((((f)) ^ (((i)) & (((j)) ^ ((f))))));
    g += P(h, 5u);
    i = P(i, 30u);
  };
  {
    f += 0x5a827999u;
    f += y;
    f += ((((j)) ^ (((h)) & (((i)) ^ ((j))))));
    f += P(g, 5u);
    h = P(h, 30u);
  };
  {
    j += 0x5a827999u;
    j += z;
    j += ((((i)) ^ (((g)) & (((h)) ^ ((i))))));
    j += P(f, 5u);
    g = P(g, 30u);
  };
  k = P((x ^ s ^ m ^ k), 1u);
  {
    i += 0x5a827999u;
    i += k;
    i += ((((h)) ^ (((f)) & (((g)) ^ ((h))))));
    i += P(j, 5u);
    f = P(f, 30u);
  };
  l = P((y ^ t ^ n ^ l), 1u);
  {
    h += 0x5a827999u;
    h += l;
    h += ((((g)) ^ (((j)) & (((f)) ^ ((g))))));
    h += P(i, 5u);
    j = P(j, 30u);
  };
  m = P((z ^ u ^ o ^ m), 1u);
  {
    g += 0x5a827999u;
    g += m;
    g += ((((f)) ^ (((i)) & (((j)) ^ ((f))))));
    g += P(h, 5u);
    i = P(i, 30u);
  };
  n = P((k ^ v ^ p ^ n), 1u);
  {
    f += 0x5a827999u;
    f += n;
    f += ((((j)) ^ (((h)) & (((i)) ^ ((j))))));
    f += P(g, 5u);
    h = P(h, 30u);
  };

  o = P((l ^ w ^ q ^ o), 1u);
  {
    j += 0x6ed9eba1u;
    j += o;
    j += ((g) ^ (h) ^ (i));
    j += P(f, 5u);
    g = P(g, 30u);
  };
  p = P((m ^ x ^ r ^ p), 1u);
  {
    i += 0x6ed9eba1u;
    i += p;
    i += ((f) ^ (g) ^ (h));
    i += P(j, 5u);
    f = P(f, 30u);
  };
  q = P((n ^ y ^ s ^ q), 1u);
  {
    h += 0x6ed9eba1u;
    h += q;
    h += ((j) ^ (f) ^ (g));
    h += P(i, 5u);
    j = P(j, 30u);
  };
  r = P((o ^ z ^ t ^ r), 1u);
  {
    g += 0x6ed9eba1u;
    g += r;
    g += ((i) ^ (j) ^ (f));
    g += P(h, 5u);
    i = P(i, 30u);
  };
  s = P((p ^ k ^ u ^ s), 1u);
  {
    f += 0x6ed9eba1u;
    f += s;
    f += ((h) ^ (i) ^ (j));
    f += P(g, 5u);
    h = P(h, 30u);
  };
  t = P((q ^ l ^ v ^ t), 1u);
  {
    j += 0x6ed9eba1u;
    j += t;
    j += ((g) ^ (h) ^ (i));
    j += P(f, 5u);
    g = P(g, 30u);
  };
  u = P((r ^ m ^ w ^ u), 1u);
  {
    i += 0x6ed9eba1u;
    i += u;
    i += ((f) ^ (g) ^ (h));
    i += P(j, 5u);
    f = P(f, 30u);
  };
  v = P((s ^ n ^ x ^ v), 1u);
  {
    h += 0x6ed9eba1u;
    h += v;
    h += ((j) ^ (f) ^ (g));
    h += P(i, 5u);
    j = P(j, 30u);
  };
  w = P((t ^ o ^ y ^ w), 1u);
  {
    g += 0x6ed9eba1u;
    g += w;
    g += ((i) ^ (j) ^ (f));
    g += P(h, 5u);
    i = P(i, 30u);
  };
  x = P((u ^ p ^ z ^ x), 1u);
  {
    f += 0x6ed9eba1u;
    f += x;
    f += ((h) ^ (i) ^ (j));
    f += P(g, 5u);
    h = P(h, 30u);
  };
  y = P((v ^ q ^ k ^ y), 1u);
  {
    j += 0x6ed9eba1u;
    j += y;
    j += ((g) ^ (h) ^ (i));
    j += P(f, 5u);
    g = P(g, 30u);
  };
  z = P((w ^ r ^ l ^ z), 1u);
  {
    i += 0x6ed9eba1u;
    i += z;
    i += ((f) ^ (g) ^ (h));
    i += P(j, 5u);
    f = P(f, 30u);
  };
  k = P((x ^ s ^ m ^ k), 1u);
  {
    h += 0x6ed9eba1u;
    h += k;
    h += ((j) ^ (f) ^ (g));
    h += P(i, 5u);
    j = P(j, 30u);
  };
  l = P((y ^ t ^ n ^ l), 1u);
  {
    g += 0x6ed9eba1u;
    g += l;
    g += ((i) ^ (j) ^ (f));
    g += P(h, 5u);
    i = P(i, 30u);
  };
  m = P((z ^ u ^ o ^ m), 1u);
  {
    f += 0x6ed9eba1u;
    f += m;
    f += ((h) ^ (i) ^ (j));
    f += P(g, 5u);
    h = P(h, 30u);
  };
  n = P((k ^ v ^ p ^ n), 1u);
  {
    j += 0x6ed9eba1u;
    j += n;
    j += ((g) ^ (h) ^ (i));
    j += P(f, 5u);
    g = P(g, 30u);
  };
  o = P((l ^ w ^ q ^ o), 1u);
  {
    i += 0x6ed9eba1u;
    i += o;
    i += ((f) ^ (g) ^ (h));
    i += P(j, 5u);
    f = P(f, 30u);
  };
  p = P((m ^ x ^ r ^ p), 1u);
  {
    h += 0x6ed9eba1u;
    h += p;
    h += ((j) ^ (f) ^ (g));
    h += P(i, 5u);
    j = P(j, 30u);
  };
  q = P((n ^ y ^ s ^ q), 1u);
  {
    g += 0x6ed9eba1u;
    g += q;
    g += ((i) ^ (j) ^ (f));
    g += P(h, 5u);
    i = P(i, 30u);
  };
  r = P((o ^ z ^ t ^ r), 1u);
  {
    f += 0x6ed9eba1u;
    f += r;
    f += ((h) ^ (i) ^ (j));
    f += P(g, 5u);
    h = P(h, 30u);
  };

  s = P((p ^ k ^ u ^ s), 1u);
  {
    j += 0x8f1bbcdcu;
    j += s;
    j += (((((g)) & ((h))) | (((i)) & (((g)) ^ ((h))))));
    j += P(f, 5u);
    g = P(g, 30u);
  };
  t = P((q ^ l ^ v ^ t), 1u);
  {
    i += 0x8f1bbcdcu;
    i += t;
    i += (((((f)) & ((g))) | (((h)) & (((f)) ^ ((g))))));
    i += P(j, 5u);
    f = P(f, 30u);
  };
  u = P((r ^ m ^ w ^ u), 1u);
  {
    h += 0x8f1bbcdcu;
    h += u;
    h += (((((j)) & ((f))) | (((g)) & (((j)) ^ ((f))))));
    h += P(i, 5u);
    j = P(j, 30u);
  };
  v = P((s ^ n ^ x ^ v), 1u);
  {
    g += 0x8f1bbcdcu;
    g += v;
    g += (((((i)) & ((j))) | (((f)) & (((i)) ^ ((j))))));
    g += P(h, 5u);
    i = P(i, 30u);
  };
  w = P((t ^ o ^ y ^ w), 1u);
  {
    f += 0x8f1bbcdcu;
    f += w;
    f += (((((h)) & ((i))) | (((j)) & (((h)) ^ ((i))))));
    f += P(g, 5u);
    h = P(h, 30u);
  };
  x = P((u ^ p ^ z ^ x), 1u);
  {
    j += 0x8f1bbcdcu;
    j += x;
    j += (((((g)) & ((h))) | (((i)) & (((g)) ^ ((h))))));
    j += P(f, 5u);
    g = P(g, 30u);
  };
  y = P((v ^ q ^ k ^ y), 1u);
  {
    i += 0x8f1bbcdcu;
    i += y;
    i += (((((f)) & ((g))) | (((h)) & (((f)) ^ ((g))))));
    i += P(j, 5u);
    f = P(f, 30u);
  };
  z = P((w ^ r ^ l ^ z), 1u);
  {
    h += 0x8f1bbcdcu;
    h += z;
    h += (((((j)) & ((f))) | (((g)) & (((j)) ^ ((f))))));
    h += P(i, 5u);
    j = P(j, 30u);
  };
  k = P((x ^ s ^ m ^ k), 1u);
  {
    g += 0x8f1bbcdcu;
    g += k;
    g += (((((i)) & ((j))) | (((f)) & (((i)) ^ ((j))))));
    g += P(h, 5u);
    i = P(i, 30u);
  };
  l = P((y ^ t ^ n ^ l), 1u);
  {
    f += 0x8f1bbcdcu;
    f += l;
    f += (((((h)) & ((i))) | (((j)) & (((h)) ^ ((i))))));
    f += P(g, 5u);
    h = P(h, 30u);
  };
  m = P((z ^ u ^ o ^ m), 1u);
  {
    j += 0x8f1bbcdcu;
    j += m;
    j += (((((g)) & ((h))) | (((i)) & (((g)) ^ ((h))))));
    j += P(f, 5u);
    g = P(g, 30u);
  };
  n = P((k ^ v ^ p ^ n), 1u);
  {
    i += 0x8f1bbcdcu;
    i += n;
    i += (((((f)) & ((g))) | (((h)) & (((f)) ^ ((g))))));
    i += P(j, 5u);
    f = P(f, 30u);
  };
  o = P((l ^ w ^ q ^ o), 1u);
  {
    h += 0x8f1bbcdcu;
    h += o;
    h += (((((j)) & ((f))) | (((g)) & (((j)) ^ ((f))))));
    h += P(i, 5u);
    j = P(j, 30u);
  };
  p = P((m ^ x ^ r ^ p), 1u);
  {
    g += 0x8f1bbcdcu;
    g += p;
    g += (((((i)) & ((j))) | (((f)) & (((i)) ^ ((j))))));
    g += P(h, 5u);
    i = P(i, 30u);
  };
  q = P((n ^ y ^ s ^ q), 1u);
  {
    f += 0x8f1bbcdcu;
    f += q;
    f += (((((h)) & ((i))) | (((j)) & (((h)) ^ ((i))))));
    f += P(g, 5u);
    h = P(h, 30u);
  };
  r = P((o ^ z ^ t ^ r), 1u);
  {
    j += 0x8f1bbcdcu;
    j += r;
    j += (((((g)) & ((h))) | (((i)) & (((g)) ^ ((h))))));
    j += P(f, 5u);
    g = P(g, 30u);
  };
  s = P((p ^ k ^ u ^ s), 1u);
  {
    i += 0x8f1bbcdcu;
    i += s;
    i += (((((f)) & ((g))) | (((h)) & (((f)) ^ ((g))))));
    i += P(j, 5u);
    f = P(f, 30u);
  };
  t = P((q ^ l ^ v ^ t), 1u);
  {
    h += 0x8f1bbcdcu;
    h += t;
    h += (((((j)) & ((f))) | (((g)) & (((j)) ^ ((f))))));
    h += P(i, 5u);
    j = P(j, 30u);
  };
  u = P((r ^ m ^ w ^ u), 1u);
  {
    g += 0x8f1bbcdcu;
    g += u;
    g += (((((i)) & ((j))) | (((f)) & (((i)) ^ ((j))))));
    g += P(h, 5u);
    i = P(i, 30u);
  };
  v = P((s ^ n ^ x ^ v), 1u);
  {
    f += 0x8f1bbcdcu;
    f += v;
    f += (((((h)) & ((i))) | (((j)) & (((h)) ^ ((i))))));
    f += P(g, 5u);
    h = P(h, 30u);
  };

  w = P((t ^ o ^ y ^ w), 1u);
  {
    j += 0xca62c1d6u;
    j += w;
    j += ((g) ^ (h) ^ (i));
    j += P(f, 5u);
    g = P(g, 30u);
  };
  x = P((u ^ p ^ z ^ x), 1u);
  {
    i += 0xca62c1d6u;
    i += x;
    i += ((f) ^ (g) ^ (h));
    i += P(j, 5u);
    f = P(f, 30u);
  };
  y = P((v ^ q ^ k ^ y), 1u);
  {
    h += 0xca62c1d6u;
    h += y;
    h += ((j) ^ (f) ^ (g));
    h += P(i, 5u);
    j = P(j, 30u);
  };
  z = P((w ^ r ^ l ^ z), 1u);
  {
    g += 0xca62c1d6u;
    g += z;
    g += ((i) ^ (j) ^ (f));
    g += P(h, 5u);
    i = P(i, 30u);
  };
  k = P((x ^ s ^ m ^ k), 1u);
  {
    f += 0xca62c1d6u;
    f += k;
    f += ((h) ^ (i) ^ (j));
    f += P(g, 5u);
    h = P(h, 30u);
  };
  l = P((y ^ t ^ n ^ l), 1u);
  {
    j += 0xca62c1d6u;
    j += l;
    j += ((g) ^ (h) ^ (i));
    j += P(f, 5u);
    g = P(g, 30u);
  };
  m = P((z ^ u ^ o ^ m), 1u);
  {
    i += 0xca62c1d6u;
    i += m;
    i += ((f) ^ (g) ^ (h));
    i += P(j, 5u);
    f = P(f, 30u);
  };
  n = P((k ^ v ^ p ^ n), 1u);
  {
    h += 0xca62c1d6u;
    h += n;
    h += ((j) ^ (f) ^ (g));
    h += P(i, 5u);
    j = P(j, 30u);
  };
  o = P((l ^ w ^ q ^ o), 1u);
  {
    g += 0xca62c1d6u;
    g += o;
    g += ((i) ^ (j) ^ (f));
    g += P(h, 5u);
    i = P(i, 30u);
  };
  p = P((m ^ x ^ r ^ p), 1u);
  {
    f += 0xca62c1d6u;
    f += p;
    f += ((h) ^ (i) ^ (j));
    f += P(g, 5u);
    h = P(h, 30u);
  };
  q = P((n ^ y ^ s ^ q), 1u);
  {
    j += 0xca62c1d6u;
    j += q;
    j += ((g) ^ (h) ^ (i));
    j += P(f, 5u);
    g = P(g, 30u);
  };
  r = P((o ^ z ^ t ^ r), 1u);
  {
    i += 0xca62c1d6u;
    i += r;
    i += ((f) ^ (g) ^ (h));
    i += P(j, 5u);
    f = P(f, 30u);
  };
  s = P((p ^ k ^ u ^ s), 1u);
  {
    h += 0xca62c1d6u;
    h += s;
    h += ((j) ^ (f) ^ (g));
    h += P(i, 5u);
    j = P(j, 30u);
  };
  t = P((q ^ l ^ v ^ t), 1u);
  {
    g += 0xca62c1d6u;
    g += t;
    g += ((i) ^ (j) ^ (f));
    g += P(h, 5u);
    i = P(i, 30u);
  };
  u = P((r ^ m ^ w ^ u), 1u);
  {
    f += 0xca62c1d6u;
    f += u;
    f += ((h) ^ (i) ^ (j));
    f += P(g, 5u);
    h = P(h, 30u);
  };
  v = P((s ^ n ^ x ^ v), 1u);
  {
    j += 0xca62c1d6u;
    j += v;
    j += ((g) ^ (h) ^ (i));
    j += P(f, 5u);
    g = P(g, 30u);
  };
  w = P((t ^ o ^ y ^ w), 1u);
  {
    i += 0xca62c1d6u;
    i += w;
    i += ((f) ^ (g) ^ (h));
    i += P(j, 5u);
    f = P(f, 30u);
  };
  x = P((u ^ p ^ z ^ x), 1u);
  {
    h += 0xca62c1d6u;
    h += x;
    h += ((j) ^ (f) ^ (g));
    h += P(i, 5u);
    j = P(j, 30u);
  };
  y = P((v ^ q ^ k ^ y), 1u);
  {
    g += 0xca62c1d6u;
    g += y;
    g += ((i) ^ (j) ^ (f));
    g += P(h, 5u);
    i = P(i, 30u);
  };
  z = P((w ^ r ^ l ^ z), 1u);
  {
    f += 0xca62c1d6u;
    f += z;
    f += ((h) ^ (i) ^ (j));
    f += P(g, 5u);
    h = P(h, 30u);
  };

  e[0] += f;
  e[1] += g;
  e[2] += h;
  e[3] += i;
  e[4] += j;
}

void BZ(u32 a[4], u32 b[4], u32 c[4], u32 d[4], const u32 e, __global pw_t* f, __global kernel_rule_t* g, __global comb_t* h, __global bf_t* i, __global void* j, __global void* k, __global u32* l, __global u32* m, __global u32* n, __global u32* o, __global u32* p, __global u32* q, __global u32* r, __global u32* s, __global plain_t* t, __global digest_t* u, __global u32* v, __global salt_t* w, __global void* x, __global u32* y, __global u32* z, const u32 aa, const u32 ab, const u32 ac,
        const u32 ad, const u32 ae, const u32 af, const u32 ag, const u32 ah, const u32 ai) {
  const u32 aj = get_global_id(0);
  const u32 ak = get_local_id(0);

  u32 al[8];

  al[0] = w[ad].salt_buf[0];
  al[1] = w[ad].salt_buf[1];
  al[2] = w[ad].salt_buf[2];
  al[3] = w[ad].salt_buf[3];
  al[4] = w[ad].salt_buf[4];
  al[5] = w[ad].salt_buf[5];
  al[6] = w[ad].salt_buf[6];
  al[7] = w[ad].salt_buf[7];

  const u32 am = w[ad].salt_len;

  u32 an[4];
  u32 ao[4];
  u32 ap[4];
  u32 aq[4];

  an[0] = M(al[0]);
  an[1] = M(al[1]);
  an[2] = M(al[2]);
  an[3] = M(al[3]);
  ao[0] = M(al[4]);
  ao[1] = M(al[5]);
  ao[2] = M(al[6]);
  ao[3] = M(al[7]);
  ap[0] = 0;
  ap[1] = 0;
  ap[2] = 0;
  ap[3] = 0;
  aq[0] = 0;
  aq[1] = 0;
  aq[2] = 0;
  aq[3] = 0;

  BO(an, ao, ap, aq, e);

  const u32x ar = e + am;

  u32 as = a[0];

  for (u32 at = 0; at < ag; at += 1) {
    const u32x au = BU(i, at);

    const u32x av = as | au;

    a[0] = av;

    u32 aw[32];

    aw[0] = a[0] | an[0];
    aw[1] = a[1] | an[1];
    aw[2] = a[2] | an[2];
    aw[3] = a[3] | an[3];
    aw[4] = b[0] | ao[0];
    aw[5] = b[1] | ao[1];
    aw[6] = b[2] | ao[2];
    aw[7] = b[3] | ao[3];
    aw[8] = c[0] | ap[0];
    aw[9] = c[1] | ap[1];
    aw[10] = c[2] | ap[2];
    aw[11] = c[3] | ap[3];
    aw[12] = d[0] | aq[0];
    aw[13] = d[1] | aq[1];
    aw[14] = 0;
    aw[15] = ar * 8;

    u32 ax[5];

    ax[0] = 0x67452301u;
    ax[1] = 0xefcdab89u;
    ax[2] = 0x98badcfeu;
    ax[3] = 0x10325476u;
    ax[4] = 0xc3d2e1f0u;

    BY(&aw[0], &aw[4], &aw[8], &aw[12], ax);

    u32 ay = 0x20;
    u32 az = 0;

    ay += ((ax[0] >> 24) & 0xff) % 6;
    ay += ((ax[0] >> 16) & 0xff) % 6;
    ay += ((ax[0] >> 8) & 0xff) % 6;
    ay += ((ax[0] >> 0) & 0xff) % 6;
    ay += ((ax[1] >> 24) & 0xff) % 6;
    ay += ((ax[1] >> 16) & 0xff) % 6;
    ay += ((ax[1] >> 8) & 0xff) % 6;
    ay += ((ax[1] >> 0) & 0xff) % 6;
    ay += ((ax[2] >> 24) & 0xff) % 6;
    ay += ((ax[2] >> 16) & 0xff) % 6;
    az += ((ax[2] >> 8) & 0xff) % 8;
    az += ((ax[2] >> 0) & 0xff) % 8;
    az += ((ax[3] >> 24) & 0xff) % 8;
    az += ((ax[3] >> 16) & 0xff) % 8;
    az += ((ax[3] >> 8) & 0xff) % 8;
    az += ((ax[3] >> 0) & 0xff) % 8;
    az += ((ax[4] >> 24) & 0xff) % 8;
    az += ((ax[4] >> 16) & 0xff) % 8;
    az += ((ax[4] >> 8) & 0xff) % 8;
    az += ((ax[4] >> 0) & 0xff) % 8;

    ax[0] = 0x67452301u;
    ax[1] = 0xefcdab89u;
    ax[2] = 0x98badcfeu;
    ax[3] = 0x10325476u;
    ax[4] = 0xc3d2e1f0u;

    for (int ba = 0; ba < 32; ba++)
      aw[ba] = 0;

    aw[0] = M(a[0]);
    aw[1] = M(a[1]);
    aw[2] = M(a[2]);
    aw[3] = M(a[3]);
    aw[4] = M(b[0]);
    aw[5] = M(b[1]);
    aw[6] = M(b[2]);
    aw[7] = M(b[3]);

    u32 bb = e;

    int ba;

    for (ba = 0; ba < ay - 4; ba += 4) {
      const u32 bc = U((Ga)[((az + ba) / 4) + 1], (Ga)[((az + ba) / 4) + 0], (az + ba));

      {
        const u32 bd = ((bb + ba) & 3) * 8;
        const u64 be = (u64)(bc) << bd;
        (aw)[((bb + ba) / 4) + 0] |= be;
        (aw)[((bb + ba) / 4) + 1] = be >> 32;
      };
    }

    const u32 bf = 0xffffffff >> (((ba - ay) & 3) * 8);

    const u32 bc = U((Ga)[((az + ba) / 4) + 1], (Ga)[((az + ba) / 4) + 0], (az + ba)) & bf;

    {
      const u32 bd = ((bb + ba) & 3) * 8;
      const u64 be = (u64)(bc) << bd;
      (aw)[((bb + ba) / 4) + 0] |= be;
      (aw)[((bb + ba) / 4) + 1] = be >> 32;
    };

    bb += ay;

    for (ba = 0; ba < am + 1; ba += 4) {
      const u32 bc = al[ba / 4];

      {
        const u32 bd = ((bb + ba) & 3) * 8;
        const u64 be = (u64)(bc) << bd;
        (aw)[((bb + ba) / 4) + 0] |= be;
        (aw)[((bb + ba) / 4) + 1] = be >> 32;
      };
    }

    bb += am;

    int bg;
    int bh;

    for (bg = bb, bh = 0; bg >= 56; bg -= 64, bh += 16) {
      BX(&aw[bh]);

      BY(&aw[bh + 0], &aw[bh + 4], &aw[bh + 8], &aw[bh + 12], ax);
    }

    BX(&aw[bh]);

    aw[bh + 14] = 0;
    aw[bh + 15] = bb * 8;

    BY(&aw[bh + 0], &aw[bh + 4], &aw[bh + 8], &aw[bh + 12], ax);

    {
      const u32 bi[4] = {ax ax ax ax};
      if (Z(bi, l, m, n, o, p, q, r, s, aa, ab, ac)) {
        int bj = X(bi, ah, &u[ai]);
        if (bj != -1) {
          const u32 bk = ai + bj;
          if (atomic_add(&v[bk], 1) == 0) {
            AA(t, y, ad, bj, bk, aj, at);
          }
        }
      }
    };
  }
}

void CA(u32 a[4], u32 b[4], u32 c[4], u32 d[4], const u32 e, __global pw_t* f, __global kernel_rule_t* g, __global comb_t* h, __global bf_t* i, __global void* j, __global void* k, __global u32* l, __global u32* m, __global u32* n, __global u32* o, __global u32* p, __global u32* q, __global u32* r, __global u32* s, __global plain_t* t, __global digest_t* u, __global u32* v, __global salt_t* w, __global void* x, __global u32* y, __global u32* z, const u32 aa, const u32 ab, const u32 ac,
        const u32 ad, const u32 ae, const u32 af, const u32 ag, const u32 ah, const u32 ai) {
  const u32 aj = get_global_id(0);
  const u32 ak = get_local_id(0);

  u32 al[8];

  al[0] = w[ad].salt_buf[0];
  al[1] = w[ad].salt_buf[1];
  al[2] = w[ad].salt_buf[2];
  al[3] = w[ad].salt_buf[3];
  al[4] = w[ad].salt_buf[4];
  al[5] = w[ad].salt_buf[5];
  al[6] = w[ad].salt_buf[6];
  al[7] = w[ad].salt_buf[7];

  const u32 am = w[ad].salt_len;

  u32 an[4];
  u32 ao[4];
  u32 ap[4];
  u32 aq[4];

  an[0] = M(al[0]);
  an[1] = M(al[1]);
  an[2] = M(al[2]);
  an[3] = M(al[3]);
  ao[0] = M(al[4]);
  ao[1] = M(al[5]);
  ao[2] = M(al[6]);
  ao[3] = M(al[7]);
  ap[0] = 0;
  ap[1] = 0;
  ap[2] = 0;
  ap[3] = 0;
  aq[0] = 0;
  aq[1] = 0;
  aq[2] = 0;
  aq[3] = 0;

  BO(an, ao, ap, aq, e);

  const u32x ar = e + am;

  const u32 as[4] =
ai[ai[ai[ai[1]
};

u32 at = a[0];

for (u32 au = 0; au < ag; au += 1) {
  const u32x av = BU(i, au);

  const u32x aw = at | av;

  a[0] = aw;

  u32 ax[32];

  ax[0] = a[0] | an[0];
  ax[1] = a[1] | an[1];
  ax[2] = a[2] | an[2];
  ax[3] = a[3] | an[3];
  ax[4] = b[0] | ao[0];
  ax[5] = b[1] | ao[1];
  ax[6] = b[2] | ao[2];
  ax[7] = b[3] | ao[3];
  ax[8] = c[0] | ap[0];
  ax[9] = c[1] | ap[1];
  ax[10] = c[2] | ap[2];
  ax[11] = c[3] | ap[3];
  ax[12] = d[0] | aq[0];
  ax[13] = d[1] | aq[1];
  ax[14] = 0;
  ax[15] = ar * 8;

  u32 ay[5];

  ay[0] = 0x67452301u;
  ay[1] = 0xefcdab89u;
  ay[2] = 0x98badcfeu;
  ay[3] = 0x10325476u;
  ay[4] = 0xc3d2e1f0u;

  BY(&ax[0], &ax[4], &ax[8], &ax[12], ay);

  u32 az = 0x20;
  u32 ba = 0;

  az += ((ay[0] >> 24) & 0xff) % 6;
  az += ((ay[0] >> 16) & 0xff) % 6;
  az += ((ay[0] >> 8) & 0xff) % 6;
  az += ((ay[0] >> 0) & 0xff) % 6;
  az += ((ay[1] >> 24) & 0xff) % 6;
  az += ((ay[1] >> 16) & 0xff) % 6;
  az += ((ay[1] >> 8) & 0xff) % 6;
  az += ((ay[1] >> 0) & 0xff) % 6;
  az += ((ay[2] >> 24) & 0xff) % 6;
  az += ((ay[2] >> 16) & 0xff) % 6;
  ba += ((ay[2] >> 8) & 0xff) % 8;
  ba += ((ay[2] >> 0) & 0xff) % 8;
  ba += ((ay[3] >> 24) & 0xff) % 8;
  ba += ((ay[3] >> 16) & 0xff) % 8;
  ba += ((ay[3] >> 8) & 0xff) % 8;
  ba += ((ay[3] >> 0) & 0xff) % 8;
  ba += ((ay[4] >> 24) & 0xff) % 8;
  ba += ((ay[4] >> 16) & 0xff) % 8;
  ba += ((ay[4] >> 8) & 0xff) % 8;
  ba += ((ay[4] >> 0) & 0xff) % 8;

  ay[0] = 0x67452301u;
  ay[1] = 0xefcdab89u;
  ay[2] = 0x98badcfeu;
  ay[3] = 0x10325476u;
  ay[4] = 0xc3d2e1f0u;

  for (int bb = 0; bb < 32; bb++)
    ax[bb] = 0;

  ax[0] = M(a[0]);
  ax[1] = M(a[1]);
  ax[2] = M(a[2]);
  ax[3] = M(a[3]);
  ax[4] = M(b[0]);
  ax[5] = M(b[1]);
  ax[6] = M(b[2]);
  ax[7] = M(b[3]);

  u32 bc = e;

  int bb;

  for (bb = 0; bb < az - 4; bb += 4) {
    const u32 bd = U((Ga)[((ba + bb) / 4) + 1], (Ga)[((ba + bb) / 4) + 0], (ba + bb));

    {
      const u32 be = ((bc + bb) & 3) * 8;
      const u64 bf = (u64)(bd) << be;
      (ax)[((bc + bb) / 4) + 0] |= bf;
      (ax)[((bc + bb) / 4) + 1] = bf >> 32;
    };
  }

  const u32 bg = 0xffffffff >> (((bb - az) & 3) * 8);

  const u32 bd = U((Ga)[((ba + bb) / 4) + 1], (Ga)[((ba + bb) / 4) + 0], (ba + bb)) & bg;

  {
    const u32 be = ((bc + bb) & 3) * 8;
    const u64 bf = (u64)(bd) << be;
    (ax)[((bc + bb) / 4) + 0] |= bf;
    (ax)[((bc + bb) / 4) + 1] = bf >> 32;
  };

  bc += az;

  for (bb = 0; bb < am + 1; bb += 4) {
    const u32 bd = al[bb / 4];

    {
      const u32 be = ((bc + bb) & 3) * 8;
      const u64 bf = (u64)(bd) << be;
      (ax)[((bc + bb) / 4) + 0] |= bf;
      (ax)[((bc + bb) / 4) + 1] = bf >> 32;
    };
  }

  bc += am;

  int bh;
  int bi;

  for (bh = bc, bi = 0; bh >= 56; bh -= 64, bi += 16) {
    BX(&ax[bi]);

    BY(&ax[bi + 0], &ax[bi + 4], &ax[bi + 8], &ax[bi + 12], ay);
  }

  BX(&ax[bi]);

  ax[bi + 14] = 0;
  ax[bi + 15] = bc * 8;

  BY(&ax[bi + 0], &ax[bi + 4], &ax[bi + 8], &ax[bi + 12], ay);

  {
    if (((ay[3]) == as[0]) && ((ay[4]) == as[1]) && ((ay[2]) == as[2]) && ((ay[1]) == as[3])) {
      const u32 bj = ai + 0;
      if (atomic_add(&v[bj], 1) == 0) {
        AA(t, y, ad, 0, bj, aj, au);
      }
    }
  };
}
}

__kernel void CB(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global void* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
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

__kernel void CC(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global void* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
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

__kernel void CD(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global void* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
}

__kernel void CE(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global void* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
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

  CA(ah, ai, aj, ak, al, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad);
}

__kernel void CF(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global void* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
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

  CA(ah, ai, aj, ak, al, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad);
}

__kernel void CG(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global void* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
}