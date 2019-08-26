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
inline u32 BU(const u32 a, const u32 b, const u32 c, u32 d[4], u32 e[4], const u32 f);
inline u32 BV(const __global u32* a, u32 b[4], u32 c[4], const u32 d);
inline u32x BW(const u32 a[4], const u32 b[4], const u32 c, const __global kernel_rule_t* d, const u32 e, u32x f[4], u32x g[4]);

inline u32 BX(u32 a) {
  const u32 b = ((a & 0x40404040) >> 1) & ~((a & 0x80808080) >> 2);

  const u32 c = (a & 0x1f1f1f1f) + 0x05050505;
  const u32 d = (a & 0x1f1f1f1f) + 0x1f1f1f1f;

  return b & ~c & d;
}

inline void BY(u32 a[4], u32 b[4], const u32 c) {
  const u32 d = (1 << ((c % 4) * 8)) - 1;

  switch (c / 4) {
    case 0:
      a[0] &= d;
      a[1] = 0;
      a[2] = 0;
      a[3] = 0;
      b[0] = 0;
      b[1] = 0;
      b[2] = 0;
      b[3] = 0;
      break;
    case 1:
      a[1] &= d;
      a[2] = 0;
      a[3] = 0;
      b[0] = 0;
      b[1] = 0;
      b[2] = 0;
      b[3] = 0;
      break;
    case 2:
      a[2] &= d;
      a[3] = 0;
      b[0] = 0;
      b[1] = 0;
      b[2] = 0;
      b[3] = 0;
      break;
    case 3:
      a[3] &= d;
      b[0] = 0;
      b[1] = 0;
      b[2] = 0;
      b[3] = 0;
      break;
    case 4:
      b[0] &= d;
      b[1] = 0;
      b[2] = 0;
      b[3] = 0;
      break;
    case 5:
      b[1] &= d;
      b[2] = 0;
      b[3] = 0;
      break;
    case 6:
      b[2] &= d;
      b[3] = 0;
      break;
    case 7:
      b[3] &= d;
      break;
  }
}

inline void BZ(u32 a[4], u32 b[4], const u32 c) {
  const u32 d = ~((1 << ((c % 4) * 8)) - 1);

  switch (c / 4) {
    case 0:
      a[0] &= d;
      break;
    case 1:
      a[0] = 0;
      a[1] &= d;
      break;
    case 2:
      a[0] = 0;
      a[1] = 0;
      a[2] &= d;
      break;
    case 3:
      a[0] = 0;
      a[1] = 0;
      a[2] = 0;
      a[3] &= d;
      break;
    case 4:
      a[0] = 0;
      a[1] = 0;
      a[2] = 0;
      a[3] = 0;
      b[0] &= d;
      break;
    case 5:
      a[0] = 0;
      a[1] = 0;
      a[2] = 0;
      a[3] = 0;
      b[0] = 0;
      b[1] &= d;
      break;
    case 6:
      a[0] = 0;
      a[1] = 0;
      a[2] = 0;
      a[3] = 0;
      b[0] = 0;
      b[1] = 0;
      b[2] &= d;
      break;
    case 7:
      a[0] = 0;
      a[1] = 0;
      a[2] = 0;
      a[3] = 0;
      b[0] = 0;
      b[1] = 0;
      b[2] = 0;
      b[3] &= d;
      break;
  }
}

inline void CA(const u32 a[4], const u32 b[4], u32 c[4], u32 d[4]) {
  c[0] = V(a[1], a[0], 1);
  c[1] = V(a[2], a[1], 1);
  c[2] = V(a[3], a[2], 1);
  c[3] = V(b[0], a[3], 1);
  d[0] = V(b[1], b[0], 1);
  d[1] = V(b[2], b[1], 1);
  d[2] = V(b[3], b[2], 1);
  d[3] = V(0, b[3], 1);
}

inline void CB(const u32 a[4], const u32 b[4], u32 c[4], u32 d[4]) {
  d[3] = V(b[3], b[2], 3);
  d[2] = V(b[2], b[1], 3);
  d[1] = V(b[1], b[0], 3);
  d[0] = V(b[0], a[3], 3);
  c[3] = V(a[3], a[2], 3);
  c[2] = V(a[2], a[1], 3);
  c[1] = V(a[1], a[0], 3);
  c[0] = V(a[0], 0, 3);
}

inline void CC(const u32 a[4], const u32 b[4], u32 c[4], u32 d[4], const u32 e) {
  switch (e) {
    case 0:
      c[0] = a[0];
      c[1] = a[1];
      c[2] = a[2];
      c[3] = a[3];
      d[0] = b[0];
      d[1] = b[1];
      d[2] = b[2];
      d[3] = b[3];
      break;
    case 1:
      c[0] = V(a[1], a[0], 1);
      c[1] = V(a[2], a[1], 1);
      c[2] = V(a[3], a[2], 1);
      c[3] = V(b[0], a[3], 1);
      d[0] = V(b[1], b[0], 1);
      d[1] = V(b[2], b[1], 1);
      d[2] = V(b[3], b[2], 1);
      d[3] = V(0, b[3], 1);
      break;
    case 2:
      c[0] = V(a[1], a[0], 2);
      c[1] = V(a[2], a[1], 2);
      c[2] = V(a[3], a[2], 2);
      c[3] = V(b[0], a[3], 2);
      d[0] = V(b[1], b[0], 2);
      d[1] = V(b[2], b[1], 2);
      d[2] = V(b[3], b[2], 2);
      d[3] = V(0, b[3], 2);
      break;
    case 3:
      c[0] = V(a[1], a[0], 3);
      c[1] = V(a[2], a[1], 3);
      c[2] = V(a[3], a[2], 3);
      c[3] = V(b[0], a[3], 3);
      d[0] = V(b[1], b[0], 3);
      d[1] = V(b[2], b[1], 3);
      d[2] = V(b[3], b[2], 3);
      d[3] = V(0, b[3], 3);
      break;
    case 4:
      c[0] = a[1];
      c[1] = a[2];
      c[2] = a[3];
      c[3] = b[0];
      d[0] = b[1];
      d[1] = b[2];
      d[2] = b[3];
      d[3] = 0;
      break;
    case 5:
      c[0] = V(a[2], a[1], 1);
      c[1] = V(a[3], a[2], 1);
      c[2] = V(b[0], a[3], 1);
      c[3] = V(b[1], b[0], 1);
      d[0] = V(b[2], b[1], 1);
      d[1] = V(b[3], b[2], 1);
      d[2] = V(0, b[3], 1);
      d[3] = 0;
      break;
    case 6:
      c[0] = V(a[2], a[1], 2);
      c[1] = V(a[3], a[2], 2);
      c[2] = V(b[0], a[3], 2);
      c[3] = V(b[1], b[0], 2);
      d[0] = V(b[2], b[1], 2);
      d[1] = V(b[3], b[2], 2);
      d[2] = V(0, b[3], 2);
      d[3] = 0;
      break;
    case 7:
      c[0] = V(a[2], a[1], 3);
      c[1] = V(a[3], a[2], 3);
      c[2] = V(b[0], a[3], 3);
      c[3] = V(b[1], b[0], 3);
      d[0] = V(b[2], b[1], 3);
      d[1] = V(b[3], b[2], 3);
      d[2] = V(0, b[3], 3);
      d[3] = 0;
      break;
    case 8:
      c[0] = a[2];
      c[1] = a[3];
      c[2] = b[0];
      c[3] = b[1];
      d[0] = b[2];
      d[1] = b[3];
      d[2] = 0;
      d[3] = 0;
      break;
    case 9:
      c[0] = V(a[3], a[2], 1);
      c[1] = V(b[0], a[3], 1);
      c[2] = V(b[1], b[0], 1);
      c[3] = V(b[2], b[1], 1);
      d[0] = V(b[3], b[2], 1);
      d[1] = V(0, b[3], 1);
      d[2] = 0;
      d[3] = 0;
      break;
    case 10:
      c[0] = V(a[3], a[2], 2);
      c[1] = V(b[0], a[3], 2);
      c[2] = V(b[1], b[0], 2);
      c[3] = V(b[2], b[1], 2);
      d[0] = V(b[3], b[2], 2);
      d[1] = V(0, b[3], 2);
      d[2] = 0;
      d[3] = 0;
      break;
    case 11:
      c[0] = V(a[3], a[2], 3);
      c[1] = V(b[0], a[3], 3);
      c[2] = V(b[1], b[0], 3);
      c[3] = V(b[2], b[1], 3);
      d[0] = V(b[3], b[2], 3);
      d[1] = V(0, b[3], 3);
      d[2] = 0;
      d[3] = 0;
      break;
    case 12:
      c[0] = a[3];
      c[1] = b[0];
      c[2] = b[1];
      c[3] = b[2];
      d[0] = b[3];
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 13:
      c[0] = V(b[0], a[3], 1);
      c[1] = V(b[1], b[0], 1);
      c[2] = V(b[2], b[1], 1);
      c[3] = V(b[3], b[2], 1);
      d[0] = V(0, b[3], 1);
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 14:
      c[0] = V(b[0], a[3], 2);
      c[1] = V(b[1], b[0], 2);
      c[2] = V(b[2], b[1], 2);
      c[3] = V(b[3], b[2], 2);
      d[0] = V(0, b[3], 2);
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 15:
      c[0] = V(b[0], a[3], 3);
      c[1] = V(b[1], b[0], 3);
      c[2] = V(b[2], b[1], 3);
      c[3] = V(b[3], b[2], 3);
      d[0] = V(0, b[3], 3);
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 16:
      c[0] = b[0];
      c[1] = b[1];
      c[2] = b[2];
      c[3] = b[3];
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 17:
      c[0] = V(b[1], b[0], 1);
      c[1] = V(b[2], b[1], 1);
      c[2] = V(b[3], b[2], 1);
      c[3] = V(0, b[3], 1);
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 18:
      c[0] = V(b[1], b[0], 2);
      c[1] = V(b[2], b[1], 2);
      c[2] = V(b[3], b[2], 2);
      c[3] = V(0, b[3], 2);
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 19:
      c[0] = V(b[1], b[0], 3);
      c[1] = V(b[2], b[1], 3);
      c[2] = V(b[3], b[2], 3);
      c[3] = V(0, b[3], 3);
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 20:
      c[0] = b[1];
      c[1] = b[2];
      c[2] = b[3];
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 21:
      c[0] = V(b[2], b[1], 1);
      c[1] = V(b[3], b[2], 1);
      c[2] = V(0, b[3], 1);
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 22:
      c[0] = V(b[2], b[1], 2);
      c[1] = V(b[3], b[2], 2);
      c[2] = V(0, b[3], 2);
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 23:
      c[0] = V(b[2], b[1], 3);
      c[1] = V(b[3], b[2], 3);
      c[2] = V(0, b[3], 3);
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 24:
      c[0] = b[2];
      c[1] = b[3];
      c[2] = 0;
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 25:
      c[0] = V(b[3], b[2], 1);
      c[1] = V(0, b[3], 1);
      c[2] = 0;
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 26:
      c[0] = V(b[3], b[2], 2);
      c[1] = V(0, b[3], 2);
      c[2] = 0;
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 27:
      c[0] = V(b[3], b[2], 3);
      c[1] = V(0, b[3], 3);
      c[2] = 0;
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 28:
      c[0] = b[3];
      c[1] = 0;
      c[2] = 0;
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 29:
      c[0] = V(0, b[3], 1);
      c[1] = 0;
      c[2] = 0;
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 30:
      c[0] = V(0, b[3], 2);
      c[1] = 0;
      c[2] = 0;
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 31:
      c[0] = V(0, b[3], 3);
      c[1] = 0;
      c[2] = 0;
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
  }
}

inline void CD(const u32 a[4], const u32 b[4], u32 c[4], u32 d[4], const u32 e) {
  switch (e) {
    case 0:
      d[3] = b[3];
      d[2] = b[2];
      d[1] = b[1];
      d[0] = b[0];
      c[3] = a[3];
      c[2] = a[2];
      c[1] = a[1];
      c[0] = a[0];
      break;
    case 1:
      d[3] = V(b[3], b[2], 3);
      d[2] = V(b[2], b[1], 3);
      d[1] = V(b[1], b[0], 3);
      d[0] = V(b[0], a[3], 3);
      c[3] = V(a[3], a[2], 3);
      c[2] = V(a[2], a[1], 3);
      c[1] = V(a[1], a[0], 3);
      c[0] = V(a[0], 0, 3);
      break;
    case 2:
      d[3] = V(b[3], b[2], 2);
      d[2] = V(b[2], b[1], 2);
      d[1] = V(b[1], b[0], 2);
      d[0] = V(b[0], a[3], 2);
      c[3] = V(a[3], a[2], 2);
      c[2] = V(a[2], a[1], 2);
      c[1] = V(a[1], a[0], 2);
      c[0] = V(a[0], 0, 2);
      break;
    case 3:
      d[3] = V(b[3], b[2], 1);
      d[2] = V(b[2], b[1], 1);
      d[1] = V(b[1], b[0], 1);
      d[0] = V(b[0], a[3], 1);
      c[3] = V(a[3], a[2], 1);
      c[2] = V(a[2], a[1], 1);
      c[1] = V(a[1], a[0], 1);
      c[0] = V(a[0], 0, 1);
      break;
    case 4:
      d[3] = b[2];
      d[2] = b[1];
      d[1] = b[0];
      d[0] = a[3];
      c[3] = a[2];
      c[2] = a[1];
      c[1] = a[0];
      c[0] = 0;
      break;
    case 5:
      d[3] = V(b[2], b[1], 3);
      d[2] = V(b[1], b[0], 3);
      d[1] = V(b[0], a[3], 3);
      d[0] = V(a[3], a[2], 3);
      c[3] = V(a[2], a[1], 3);
      c[2] = V(a[1], a[0], 3);
      c[1] = V(a[0], 0, 3);
      c[0] = 0;
      break;
    case 6:
      d[3] = V(b[2], b[1], 2);
      d[2] = V(b[1], b[0], 2);
      d[1] = V(b[0], a[3], 2);
      d[0] = V(a[3], a[2], 2);
      c[3] = V(a[2], a[1], 2);
      c[2] = V(a[1], a[0], 2);
      c[1] = V(a[0], 0, 2);
      c[0] = 0;
      break;
    case 7:
      d[3] = V(b[2], b[1], 1);
      d[2] = V(b[1], b[0], 1);
      d[1] = V(b[0], a[3], 1);
      d[0] = V(a[3], a[2], 1);
      c[3] = V(a[2], a[1], 1);
      c[2] = V(a[1], a[0], 1);
      c[1] = V(a[0], 0, 1);
      c[0] = 0;
      break;
    case 8:
      d[3] = b[1];
      d[2] = b[0];
      d[1] = a[3];
      d[0] = a[2];
      c[3] = a[1];
      c[2] = a[0];
      c[1] = 0;
      c[0] = 0;
      break;
    case 9:
      d[3] = V(b[1], b[0], 3);
      d[2] = V(b[0], a[3], 3);
      d[1] = V(a[3], a[2], 3);
      d[0] = V(a[2], a[1], 3);
      c[3] = V(a[1], a[0], 3);
      c[2] = V(a[0], 0, 3);
      c[1] = 0;
      c[0] = 0;
      break;
    case 10:
      d[3] = V(b[1], b[0], 2);
      d[2] = V(b[0], a[3], 2);
      d[1] = V(a[3], a[2], 2);
      d[0] = V(a[2], a[1], 2);
      c[3] = V(a[1], a[0], 2);
      c[2] = V(a[0], 0, 2);
      c[1] = 0;
      c[0] = 0;
      break;
    case 11:
      d[3] = V(b[1], b[0], 1);
      d[2] = V(b[0], a[3], 1);
      d[1] = V(a[3], a[2], 1);
      d[0] = V(a[2], a[1], 1);
      c[3] = V(a[1], a[0], 1);
      c[2] = V(a[0], 0, 1);
      c[1] = 0;
      c[0] = 0;
      break;
    case 12:
      d[3] = b[0];
      d[2] = a[3];
      d[1] = a[2];
      d[0] = a[1];
      c[3] = a[0];
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 13:
      d[3] = V(b[0], a[3], 3);
      d[2] = V(a[3], a[2], 3);
      d[1] = V(a[2], a[1], 3);
      d[0] = V(a[1], a[0], 3);
      c[3] = V(a[0], 0, 3);
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 14:
      d[3] = V(b[0], a[3], 2);
      d[2] = V(a[3], a[2], 2);
      d[1] = V(a[2], a[1], 2);
      d[0] = V(a[1], a[0], 2);
      c[3] = V(a[0], 0, 2);
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 15:
      d[3] = V(b[0], a[3], 1);
      d[2] = V(a[3], a[2], 1);
      d[1] = V(a[2], a[1], 1);
      d[0] = V(a[1], a[0], 1);
      c[3] = V(a[0], 0, 1);
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 16:
      d[3] = a[3];
      d[2] = a[2];
      d[1] = a[1];
      d[0] = a[0];
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 17:
      d[3] = V(a[3], a[2], 3);
      d[2] = V(a[2], a[1], 3);
      d[1] = V(a[1], a[0], 3);
      d[0] = V(a[0], 0, 3);
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 18:
      d[3] = V(a[3], a[2], 2);
      d[2] = V(a[2], a[1], 2);
      d[1] = V(a[1], a[0], 2);
      d[0] = V(a[0], 0, 2);
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 19:
      d[3] = V(a[3], a[2], 1);
      d[2] = V(a[2], a[1], 1);
      d[1] = V(a[1], a[0], 1);
      d[0] = V(a[0], 0, 1);
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 20:
      d[3] = a[2];
      d[2] = a[1];
      d[1] = a[0];
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 21:
      d[3] = V(a[2], a[1], 3);
      d[2] = V(a[1], a[0], 3);
      d[1] = V(a[0], 0, 3);
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 22:
      d[3] = V(a[2], a[1], 2);
      d[2] = V(a[1], a[0], 2);
      d[1] = V(a[0], 0, 2);
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 23:
      d[3] = V(a[2], a[1], 1);
      d[2] = V(a[1], a[0], 1);
      d[1] = V(a[0], 0, 1);
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 24:
      d[3] = a[1];
      d[2] = a[0];
      d[1] = 0;
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 25:
      d[3] = V(a[1], a[0], 3);
      d[2] = V(a[0], 0, 3);
      d[1] = 0;
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 26:
      d[3] = V(a[1], a[0], 2);
      d[2] = V(a[0], 0, 2);
      d[1] = 0;
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 27:
      d[3] = V(a[1], a[0], 1);
      d[2] = V(a[0], 0, 1);
      d[1] = 0;
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 28:
      d[3] = a[0];
      d[2] = 0;
      d[1] = 0;
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 29:
      d[3] = V(a[0], 0, 3);
      d[2] = 0;
      d[1] = 0;
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 30:
      d[3] = V(a[0], 0, 2);
      d[2] = 0;
      d[1] = 0;
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 31:
      d[3] = V(a[0], 0, 1);
      d[2] = 0;
      d[1] = 0;
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
  }
}

inline void CE(const u32 a, u32 b[4], u32 c[4], const u32 d) {
  u32 e[2];

  switch (a & 3) {
    case 0:
      e[0] = d;
      e[1] = 0;
      break;
    case 1:
      e[0] = d << 8;
      e[1] = d >> 24;
      break;
    case 2:
      e[0] = d << 16;
      e[1] = d >> 16;
      break;
    case 3:
      e[0] = d << 24;
      e[1] = d >> 8;
      break;
  }

  switch (a / 4) {
    case 0:
      b[0] |= e[0];
      b[1] = e[1];
      break;
    case 1:
      b[1] |= e[0];
      b[2] = e[1];
      break;
    case 2:
      b[2] |= e[0];
      b[3] = e[1];
      break;
    case 3:
      b[3] |= e[0];
      c[0] = e[1];
      break;
    case 4:
      c[0] |= e[0];
      c[1] = e[1];
      break;
    case 5:
      c[1] |= e[0];
      c[2] = e[1];
      break;
    case 6:
      c[2] |= e[0];
      c[3] = e[1];
      break;
    case 7:
      c[3] |= e[0];
      break;
  }
}

inline void CF(const u32 a, u32 b[4], u32 c[4], const u32 d[4], const u32 e[4], const u32 f[4], const u32 g[4]) {
  switch (a) {
    case 31:
      c[3] = e[3] | f[0] << 24;
      break;
    case 30:
      c[3] = e[3] | f[0] << 16;
      break;
    case 29:
      c[3] = e[3] | f[0] << 8;
      break;
    case 28:
      c[3] = f[0];
      break;
    case 27:
      c[3] = V(f[1], f[0], 1);
      c[2] = e[2] | f[0] << 24;
      break;
    case 26:
      c[3] = V(f[1], f[0], 2);
      c[2] = e[2] | f[0] << 16;
      break;
    case 25:
      c[3] = V(f[1], f[0], 3);
      c[2] = e[2] | f[0] << 8;
      break;
    case 24:
      c[3] = f[1];
      c[2] = f[0];
      break;
    case 23:
      c[3] = V(f[2], f[1], 1);
      c[2] = V(f[1], f[0], 1);
      c[1] = e[1] | f[0] << 24;
      break;
    case 22:
      c[3] = V(f[2], f[1], 2);
      c[2] = V(f[1], f[0], 2);
      c[1] = e[1] | f[0] << 16;
      break;
    case 21:
      c[3] = V(f[2], f[1], 3);
      c[2] = V(f[1], f[0], 3);
      c[1] = e[1] | f[0] << 8;
      break;
    case 20:
      c[3] = f[2];
      c[2] = f[1];
      c[1] = f[0];
      break;
    case 19:
      c[3] = V(f[3], f[2], 1);
      c[2] = V(f[2], f[1], 1);
      c[1] = V(f[1], f[0], 1);
      c[0] = e[0] | f[0] << 24;
      break;
    case 18:
      c[3] = V(f[3], f[2], 2);
      c[2] = V(f[2], f[1], 2);
      c[1] = V(f[1], f[0], 2);
      c[0] = e[0] | f[0] << 16;
      break;
    case 17:
      c[3] = V(f[3], f[2], 3);
      c[2] = V(f[2], f[1], 3);
      c[1] = V(f[1], f[0], 3);
      c[0] = e[0] | f[0] << 8;
      break;
    case 16:
      c[3] = f[3];
      c[2] = f[2];
      c[1] = f[1];
      c[0] = f[0];
      break;
    case 15:
      c[3] = V(g[0], f[3], 1);
      c[2] = V(f[3], f[2], 1);
      c[1] = V(f[2], f[1], 1);
      c[0] = V(f[1], f[0], 1);
      b[3] = d[3] | f[0] << 24;
      break;
    case 14:
      c[3] = V(g[0], f[3], 2);
      c[2] = V(f[3], f[2], 2);
      c[1] = V(f[2], f[1], 2);
      c[0] = V(f[1], f[0], 2);
      b[3] = d[3] | f[0] << 16;
      break;
    case 13:
      c[3] = V(g[0], f[3], 3);
      c[2] = V(f[3], f[2], 3);
      c[1] = V(f[2], f[1], 3);
      c[0] = V(f[1], f[0], 3);
      b[3] = d[3] | f[0] << 8;
      break;
    case 12:
      c[3] = g[0];
      c[2] = f[3];
      c[1] = f[2];
      c[0] = f[1];
      b[3] = f[0];
      break;
    case 11:
      c[3] = V(g[1], g[0], 1);
      c[2] = V(g[0], f[3], 1);
      c[1] = V(f[3], f[2], 1);
      c[0] = V(f[2], f[1], 1);
      b[3] = V(f[1], f[0], 1);
      b[2] = d[2] | f[0] << 24;
      break;
    case 10:
      c[3] = V(g[1], g[0], 2);
      c[2] = V(g[0], f[3], 2);
      c[1] = V(f[3], f[2], 2);
      c[0] = V(f[2], f[1], 2);
      b[3] = V(f[1], f[0], 2);
      b[2] = d[2] | f[0] << 16;
      break;
    case 9:
      c[3] = V(g[1], g[0], 3);
      c[2] = V(g[0], f[3], 3);
      c[1] = V(f[3], f[2], 3);
      c[0] = V(f[2], f[1], 3);
      b[3] = V(f[1], f[0], 3);
      b[2] = d[2] | f[0] << 8;
      break;
    case 8:
      c[3] = g[1];
      c[2] = g[0];
      c[1] = f[3];
      c[0] = f[2];
      b[3] = f[1];
      b[2] = f[0];
      break;
    case 7:
      c[3] = V(g[2], g[1], 1);
      c[2] = V(g[1], g[0], 1);
      c[1] = V(g[0], f[3], 1);
      c[0] = V(f[3], f[2], 1);
      b[3] = V(f[2], f[1], 1);
      b[2] = V(f[1], f[0], 1);
      b[1] = d[1] | f[0] << 24;
      break;
    case 6:
      c[3] = V(g[2], g[1], 2);
      c[2] = V(g[1], g[0], 2);
      c[1] = V(g[0], f[3], 2);
      c[0] = V(f[3], f[2], 2);
      b[3] = V(f[2], f[1], 2);
      b[2] = V(f[1], f[0], 2);
      b[1] = d[1] | f[0] << 16;
      break;
    case 5:
      c[3] = V(g[2], g[1], 3);
      c[2] = V(g[1], g[0], 3);
      c[1] = V(g[0], f[3], 3);
      c[0] = V(f[3], f[2], 3);
      b[3] = V(f[2], f[1], 3);
      b[2] = V(f[1], f[0], 3);
      b[1] = d[1] | f[0] << 8;
      break;
    case 4:
      c[3] = g[2];
      c[2] = g[1];
      c[1] = g[0];
      c[0] = f[3];
      b[3] = f[2];
      b[2] = f[1];
      b[1] = f[0];
      break;
    case 3:
      c[3] = V(g[3], g[2], 1);
      c[2] = V(g[2], g[1], 1);
      c[1] = V(g[1], g[0], 1);
      c[0] = V(g[0], f[3], 1);
      b[3] = V(f[3], f[2], 1);
      b[2] = V(f[2], f[1], 1);
      b[1] = V(f[1], f[0], 1);
      b[0] = d[0] | f[0] << 24;
      break;
    case 2:
      c[3] = V(g[3], g[2], 2);
      c[2] = V(g[2], g[1], 2);
      c[1] = V(g[1], g[0], 2);
      c[0] = V(g[0], f[3], 2);
      b[3] = V(f[3], f[2], 2);
      b[2] = V(f[2], f[1], 2);
      b[1] = V(f[1], f[0], 2);
      b[0] = d[0] | f[0] << 16;
      break;
    case 1:
      c[3] = V(g[3], g[2], 3);
      c[2] = V(g[2], g[1], 3);
      c[1] = V(g[1], g[0], 3);
      c[0] = V(g[0], f[3], 3);
      b[3] = V(f[3], f[2], 3);
      b[2] = V(f[2], f[1], 3);
      b[1] = V(f[1], f[0], 3);
      b[0] = d[0] | f[0] << 8;
      break;
    case 0:
      c[3] = g[3];
      c[2] = g[2];
      c[1] = g[1];
      c[0] = g[0];
      b[3] = f[3];
      b[2] = f[2];
      b[1] = f[1];
      b[0] = f[0];
      break;
  }
}

inline void CG(u32 a[4], u32 b[4], u32 c[4], u32 d[4], const u32 e) {
  CD(a, b, c, d, 32 - e);

  u32 f[4];
  u32 g[4];

  f[0] = d[3];
  f[1] = d[2];
  f[2] = d[1];
  f[3] = d[0];
  g[0] = c[3];
  g[1] = c[2];
  g[2] = c[1];
  g[3] = c[0];

  c[0] = G(f[0]);
  c[1] = G(f[1]);
  c[2] = G(f[2]);
  c[3] = G(f[3]);
  d[0] = G(g[0]);
  d[1] = G(g[1]);
  d[2] = G(g[2]);
  d[3] = G(g[3]);
}

inline u32 CH(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  c[0] |= (BX(c[0]));
  c[1] |= (BX(c[1]));
  c[2] |= (BX(c[2]));
  c[3] |= (BX(c[3]));
  d[0] |= (BX(d[0]));
  d[1] |= (BX(d[1]));
  d[2] |= (BX(d[2]));
  d[3] |= (BX(d[3]));

  return e;
}

inline u32 CI(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  c[0] &= ~(BX(c[0]));
  c[1] &= ~(BX(c[1]));
  c[2] &= ~(BX(c[2]));
  c[3] &= ~(BX(c[3]));
  d[0] &= ~(BX(d[0]));
  d[1] &= ~(BX(d[1]));
  d[2] &= ~(BX(d[2]));
  d[3] &= ~(BX(d[3]));

  return e;
}

inline u32 CJ(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  CH(a, b, c, d, e);

  c[0] &= ~(0x00000020 & BX(c[0]));

  return e;
}

inline u32 CK(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  CI(a, b, c, d, e);

  c[0] |= (0x00000020 & BX(c[0]));

  return e;
}

inline u32 CL(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  c[0] ^= (BX(c[0]));
  c[1] ^= (BX(c[1]));
  c[2] ^= (BX(c[2]));
  c[3] ^= (BX(c[3]));
  d[0] ^= (BX(d[0]));
  d[1] ^= (BX(d[1]));
  d[2] ^= (BX(d[2]));
  d[3] ^= (BX(d[3]));

  return e;
}

inline u32 CM(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a >= e)
    return (e);

  const u32 f = 0x20u << ((a & 3) * 8);

  switch (a / 4) {
    case 0:
      c[0] ^= (f & BX(c[0]));
      break;
    case 1:
      c[1] ^= (f & BX(c[1]));
      break;
    case 2:
      c[2] ^= (f & BX(c[2]));
      break;
    case 3:
      c[3] ^= (f & BX(c[3]));
      break;
    case 4:
      d[0] ^= (f & BX(d[0]));
      break;
    case 5:
      d[1] ^= (f & BX(d[1]));
      break;
    case 6:
      d[2] ^= (f & BX(d[2]));
      break;
    case 7:
      d[3] ^= (f & BX(d[3]));
      break;
  }

  return e;
}

inline u32 CN(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  CG(c, d, c, d, e);

  return e;
}

inline u32 CO(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if ((e + e) >= 32)
    return (e);

  u32 f = e;

  CF(f, c, d, c, d, c, d);

  f += e;

  return f;
}

inline u32 CP(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (((e * a) + e) >= 32)
    return (e);

  u32 f = e;

  u32 g[4];
  u32 h[4];

  g[0] = c[0];
  g[1] = c[1];
  g[2] = c[2];
  g[3] = c[3];
  h[0] = d[0];
  h[1] = d[1];
  h[2] = d[2];
  h[3] = d[3];

  for (u32 i = 0; i < a; i++) {
    CF(f, c, d, c, d, g, h);

    f += e;
  }

  return f;
}

inline u32 CQ(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if ((e + e) >= 32)
    return (e);

  u32 f = e;

  u32 g[4];
  u32 h[4];

  CG(c, d, g, h, f);

  CF(f, c, d, c, d, g, h);

  f += e;

  return f;
}

inline u32 CR(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if ((e + 1) >= 32)
    return (e);

  u32 f = e;

  CE(f, c, d, a);

  f++;

  return f;
}

inline u32 CS(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if ((e + 1) >= 32)
    return (e);

  u32 f = e;

  CB(c, d, c, d);

  c[0] = c[0] | a;

  f++;

  return f;
}

inline u32 CT(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (e == 0)
    return (e);

  const u32 f = e - 1;

  const u32 g = (f & 3) * 8;

  const u32 h = (c[0] & 0xff) << g;

  CA(c, d, c, d);

  switch (f / 4) {
    case 0:
      c[0] |= h;
      break;
    case 1:
      c[1] |= h;
      break;
    case 2:
      c[2] |= h;
      break;
    case 3:
      c[3] |= h;
      break;
    case 4:
      d[0] |= h;
      break;
    case 5:
      d[1] |= h;
      break;
    case 6:
      d[2] |= h;
      break;
    case 7:
      d[3] |= h;
      break;
  }

  return e;
}

inline u32 CU(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (e == 0)
    return (e);

  const u32 f = e - 1;

  const u32 g = (f & 3) * 8;

  u32 h = 0;

  switch (f / 4) {
    case 0:
      h = (c[0] >> g) & 0xff;
      break;
    case 1:
      h = (c[1] >> g) & 0xff;
      break;
    case 2:
      h = (c[2] >> g) & 0xff;
      break;
    case 3:
      h = (c[3] >> g) & 0xff;
      break;
    case 4:
      h = (d[0] >> g) & 0xff;
      break;
    case 5:
      h = (d[1] >> g) & 0xff;
      break;
    case 6:
      h = (d[2] >> g) & 0xff;
      break;
    case 7:
      h = (d[3] >> g) & 0xff;
      break;
  }

  CB(c, d, c, d);

  c[0] |= h;

  BY(c, d, e);

  return e;
}

inline u32 CV(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (e == 0)
    return (e);

  const u32 f = e - 1;

  CA(c, d, c, d);

  return f;
}

inline u32 CW(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (e == 0)
    return (e);

  const u32 f = e - 1;

  const u32 g = (1 << ((f & 3) * 8)) - 1;

  switch (f / 4) {
    case 0:
      c[0] &= g;
      break;
    case 1:
      c[1] &= g;
      break;
    case 2:
      c[2] &= g;
      break;
    case 3:
      c[3] &= g;
      break;
    case 4:
      d[0] &= g;
      break;
    case 5:
      d[1] &= g;
      break;
    case 6:
      d[2] &= g;
      break;
    case 7:
      d[3] &= g;
      break;
  }

  return f;
}

inline u32 CX(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a >= e)
    return (e);

  u32 f = e;

  u32 g[4];
  u32 h[4];

  CA(c, d, g, h);

  const u32 i = (1 << ((a & 3) * 8)) - 1;
  const u32 j = ~i;

  switch (a / 4) {
    case 0:
      c[0] = (c[0] & i) | (g[0] & j);
      c[1] = g[1];
      c[2] = g[2];
      c[3] = g[3];
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 1:
      c[1] = (c[1] & i) | (g[1] & j);
      c[2] = g[2];
      c[3] = g[3];
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 2:
      c[2] = (c[2] & i) | (g[2] & j);
      c[3] = g[3];
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 3:
      c[3] = (c[3] & i) | (g[3] & j);
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 4:
      d[0] = (d[0] & i) | (h[0] & j);
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 5:
      d[1] = (d[1] & i) | (h[1] & j);
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 6:
      d[2] = (d[2] & i) | (h[2] & j);
      d[3] = h[3];
      break;
    case 7:
      d[3] = (d[3] & i) | (h[3] & j);
      break;
  }

  f--;

  return f;
}

inline u32 CY(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a >= e)
    return (e);

  if ((a + b) > e)
    return (e);

  u32 f = b;

  CC(c, d, c, d, a);

  BY(c, d, f);

  return f;
}

inline u32 CZ(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a >= e)
    return (e);

  if ((a + b) > e)
    return (e);

  u32 f = e;

  u32 g[4];
  u32 h[4];

  g[0] = 0;
  g[1] = 0;
  g[2] = 0;
  g[3] = 0;
  h[0] = 0;
  h[1] = 0;
  h[2] = 0;
  h[3] = 0;

  CC(c, d, g, h, b);

  const u32 i = (1 << ((a & 3) * 8)) - 1;
  const u32 j = ~i;

  switch (a / 4) {
    case 0:
      c[0] = (c[0] & i) | (g[0] & j);
      c[1] = g[1];
      c[2] = g[2];
      c[3] = g[3];
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 1:
      c[1] = (c[1] & i) | (g[1] & j);
      c[2] = g[2];
      c[3] = g[3];
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 2:
      c[2] = (c[2] & i) | (g[2] & j);
      c[3] = g[3];
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 3:
      c[3] = (c[3] & i) | (g[3] & j);
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 4:
      d[0] = (d[0] & i) | (h[0] & j);
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 5:
      d[1] = (d[1] & i) | (h[1] & j);
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 6:
      d[2] = (d[2] & i) | (h[2] & j);
      d[3] = h[3];
      break;
    case 7:
      d[3] = (d[3] & i) | (h[3] & j);
      break;
  }

  f -= b;

  return f;
}

inline u32 DA(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a > e)
    return (e);

  if ((e + 1) >= 32)
    return (e);

  u32 f = e;

  u32 g[4];
  u32 h[4];

  CB(c, d, g, h);

  const u32 i = b << ((a & 3) * 8);

  const u32 j = (1 << ((a & 3) * 8)) - 1;

  const u32 k = 0xffffff00 << ((a & 3) * 8);

  switch (a / 4) {
    case 0:
      c[0] = (c[0] & j) | i | (g[0] & k);
      c[1] = g[1];
      c[2] = g[2];
      c[3] = g[3];
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 1:
      c[1] = (c[1] & j) | i | (g[1] & k);
      c[2] = g[2];
      c[3] = g[3];
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 2:
      c[2] = (c[2] & j) | i | (g[2] & k);
      c[3] = g[3];
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 3:
      c[3] = (c[3] & j) | i | (g[3] & k);
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 4:
      d[0] = (d[0] & j) | i | (h[0] & k);
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 5:
      d[1] = (d[1] & j) | i | (h[1] & k);
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 6:
      d[2] = (d[2] & j) | i | (h[2] & k);
      d[3] = h[3];
      break;
    case 7:
      d[3] = (d[3] & j) | i | (h[3] & k);
      break;
  }

  f++;

  return f;
}

inline u32 DB(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a >= e)
    return (e);

  const u32 f = b << ((a & 3) * 8);

  const u32 g = ~(0xffu << ((a & 3) * 8));

  switch (a / 4) {
    case 0:
      c[0] = (c[0] & g) | f;
      break;
    case 1:
      c[1] = (c[1] & g) | f;
      break;
    case 2:
      c[2] = (c[2] & g) | f;
      break;
    case 3:
      c[3] = (c[3] & g) | f;
      break;
    case 4:
      d[0] = (d[0] & g) | f;
      break;
    case 5:
      d[1] = (d[1] & g) | f;
      break;
    case 6:
      d[2] = (d[2] & g) | f;
      break;
    case 7:
      d[3] = (d[3] & g) | f;
      break;
  }

  return e;
}

inline u32 DC(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a >= e)
    return (e);

  BY(c, d, a);

  return a;
}

inline u32 DD(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  const uchar4 f = (uchar4)(a);
  const uchar4 g = (uchar4)(b);

  uchar4 h;

  h = __builtin_astype(c[0], uchar4);
  h = ((h == f) ? (g) : (h));
  c[0] = __builtin_astype(h, uint);
  h = __builtin_astype(c[1], uchar4);
  h = ((h == f) ? (g) : (h));
  c[1] = __builtin_astype(h, uint);
  h = __builtin_astype(c[2], uchar4);
  h = ((h == f) ? (g) : (h));
  c[2] = __builtin_astype(h, uint);
  h = __builtin_astype(c[3], uchar4);
  h = ((h == f) ? (g) : (h));
  c[3] = __builtin_astype(h, uint);
  h = __builtin_astype(d[0], uchar4);
  h = ((h == f) ? (g) : (h));
  d[0] = __builtin_astype(h, uint);
  h = __builtin_astype(d[1], uchar4);
  h = ((h == f) ? (g) : (h));
  d[1] = __builtin_astype(h, uint);
  h = __builtin_astype(d[2], uchar4);
  h = ((h == f) ? (g) : (h));
  d[2] = __builtin_astype(h, uint);
  h = __builtin_astype(d[3], uchar4);
  h = ((h == f) ? (g) : (h));
  d[3] = __builtin_astype(h, uint);

  return e;
}

inline u32 DE(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  return e;
}

inline u32 DF(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  return e;
}

inline u32 DG(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (e == 0)
    return (e);
  if ((e + a) >= 32)
    return (e);

  u32 f = e;

  const u32 g = c[0] & 0xFF;

  CD(c, d, c, d, a);
  switch (a) {
    case 1:
      c[0] |= g << 0;
      break;
    case 2:
      c[0] |= g << 0 | g << 8;
      break;
    case 3:
      c[0] |= g << 0 | g << 8 | g << 16;
      break;
    case 4:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      break;
    case 5:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0;
      break;
    case 6:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8;
      break;
    case 7:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16;
      break;
    case 8:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      break;
    case 9:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0;
      break;
    case 10:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8;
      break;
    case 11:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16;
      break;
    case 12:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      break;
    case 13:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0;
      break;
    case 14:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8;
      break;
    case 15:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16;
      break;
    case 16:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      break;
    case 17:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0;
      break;
    case 18:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8;
      break;
    case 19:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16;
      break;
    case 20:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      break;
    case 21:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[1] |= g << 0;
      break;
    case 22:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[1] |= g << 0 | g << 8;
      break;
    case 23:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[1] |= g << 0 | g << 8 | g << 16;
      break;
    case 24:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      break;
    case 25:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[2] |= g << 0;
      break;
    case 26:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[2] |= g << 0 | g << 8;
      break;
    case 27:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[2] |= g << 0 | g << 8 | g << 16;
      break;
    case 28:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      break;
    case 29:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[3] |= g << 0;
      break;
    case 30:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[3] |= g << 0 | g << 8;
      break;
    case 31:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[3] |= g << 0 | g << 8 | g << 16;
      break;
  }

  f += a;

  return f;
}

inline u32 DH(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (e == 0)
    return (e);
  if ((e + a) >= 32)
    return (e);

  const u32 f = e - 1;

  const u32 g = (f & 3) * 8;

  u32 h = 0;

  switch (f / 4) {
    case 0:
      h = (c[0] >> g) & 0xff;
      break;
    case 1:
      h = (c[1] >> g) & 0xff;
      break;
    case 2:
      h = (c[2] >> g) & 0xff;
      break;
    case 3:
      h = (c[3] >> g) & 0xff;
      break;
    case 4:
      h = (d[0] >> g) & 0xff;
      break;
    case 5:
      h = (d[1] >> g) & 0xff;
      break;
    case 6:
      h = (d[2] >> g) & 0xff;
      break;
    case 7:
      h = (d[3] >> g) & 0xff;
      break;
  }

  u32 i = e;

  for (u32 j = 0; j < a; j++) {
    CE(i, c, d, h);

    i++;
  }

  return i;
}

inline u32 DI(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (e == 0)
    return (e);
  if ((e + e) >= 32)
    return (e);

  u32 f = e;

  u32 g[4];
  u32 h[4];
  g[0] = ((c[0] & 0x000000FF) << 0) | ((c[0] & 0x0000FF00) << 8);
  g[1] = ((c[0] & 0x00FF0000) >> 16) | ((c[0] & 0xFF000000) >> 8);
  g[2] = ((c[1] & 0x000000FF) << 0) | ((c[1] & 0x0000FF00) << 8);
  g[3] = ((c[1] & 0x00FF0000) >> 16) | ((c[1] & 0xFF000000) >> 8);
  h[0] = ((c[2] & 0x000000FF) << 0) | ((c[2] & 0x0000FF00) << 8);
  h[1] = ((c[2] & 0x00FF0000) >> 16) | ((c[2] & 0xFF000000) >> 8);
  h[2] = ((c[3] & 0x000000FF) << 0) | ((c[3] & 0x0000FF00) << 8);
  h[3] = ((c[3] & 0x00FF0000) >> 16) | ((c[3] & 0xFF000000) >> 8);

  c[0] = g[0] | (g[0] << 8);
  c[1] = g[1] | (g[1] << 8);
  c[2] = g[2] | (g[2] << 8);
  c[3] = g[3] | (g[3] << 8);
  d[0] = h[0] | (h[0] << 8);
  d[1] = h[1] | (h[1] << 8);
  d[2] = h[2] | (h[2] << 8);
  d[3] = h[3] | (h[3] << 8);

  f = f + f;

  return f;
}

inline u32 DJ(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (e < 2)
    return (e);

  c[0] = (c[0] & 0xFFFF0000) | ((c[0] << 8) & 0x0000FF00) | ((c[0] >> 8) & 0x000000FF);

  return e;
}

inline u32 DK(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (e < 2)
    return (e);
  switch (e) {
    case 2:
      c[0] = ((c[0] << 8) & 0x0000FF00) | ((c[0] >> 8) & 0x000000FF);
      break;
    case 3:
      c[0] = (c[0] & 0x000000FF) | ((c[0] << 8) & 0x00FF0000) | ((c[0] >> 8) & 0x0000FF00);
      break;
    case 4:
      c[0] = (c[0] & 0x0000FFFF) | ((c[0] << 8) & 0xFF000000) | ((c[0] >> 8) & 0x00FF0000);
      break;
    case 5:
      c[1] = (c[0] & 0xFF000000) | c[1];
      c[0] = (c[0] & 0x00FFFFFF) | (c[1] << 24);
      c[1] = (c[1] >> 24);
      break;
    case 6:
      c[1] = ((c[1] << 8) & 0x0000FF00) | ((c[1] >> 8) & 0x000000FF);
      break;
    case 7:
      c[1] = (c[1] & 0x000000FF) | ((c[1] << 8) & 0x00FF0000) | ((c[1] >> 8) & 0x0000FF00);
      break;
    case 8:
      c[1] = (c[1] & 0x0000FFFF) | ((c[1] << 8) & 0xFF000000) | ((c[1] >> 8) & 0x00FF0000);
      break;
    case 9:
      c[2] = (c[1] & 0xFF000000) | c[2];
      c[1] = (c[1] & 0x00FFFFFF) | (c[2] << 24);
      c[2] = (c[2] >> 24);
      break;
    case 10:
      c[2] = ((c[2] << 8) & 0x0000FF00) | ((c[2] >> 8) & 0x000000FF);
      break;
    case 11:
      c[2] = (c[2] & 0x000000FF) | ((c[2] << 8) & 0x00FF0000) | ((c[2] >> 8) & 0x0000FF00);
      break;
    case 12:
      c[2] = (c[2] & 0x0000FFFF) | ((c[2] << 8) & 0xFF000000) | ((c[2] >> 8) & 0x00FF0000);
      break;
    case 13:
      c[3] = (c[2] & 0xFF000000) | c[3];
      c[2] = (c[2] & 0x00FFFFFF) | (c[3] << 24);
      c[3] = (c[3] >> 24);
      break;
    case 14:
      c[3] = ((c[3] << 8) & 0x0000FF00) | ((c[3] >> 8) & 0x000000FF);
      break;
    case 15:
      c[3] = (c[3] & 0x000000FF) | ((c[3] << 8) & 0x00FF0000) | ((c[3] >> 8) & 0x0000FF00);
      break;
    case 16:
      c[3] = (c[3] & 0x0000FFFF) | ((c[3] << 8) & 0xFF000000) | ((c[3] >> 8) & 0x00FF0000);
      break;
    case 17:
      d[0] = (c[3] & 0xFF000000) | d[0];
      c[3] = (c[3] & 0x00FFFFFF) | (d[0] << 24);
      d[0] = (d[0] >> 24);
      break;
    case 18:
      d[0] = ((d[0] << 8) & 0x0000FF00) | ((d[0] >> 8) & 0x000000FF);
      break;
    case 19:
      d[0] = (d[0] & 0x000000FF) | ((d[0] << 8) & 0x00FF0000) | ((d[0] >> 8) & 0x0000FF00);
      break;
    case 20:
      d[0] = (d[0] & 0x0000FFFF) | ((d[0] << 8) & 0xFF000000) | ((d[0] >> 8) & 0x00FF0000);
      break;
    case 21:
      d[1] = (d[0] & 0xFF000000) | d[1];
      d[0] = (d[0] & 0x00FFFFFF) | (d[1] << 24);
      d[1] = (d[1] >> 24);
      break;
    case 22:
      d[1] = ((d[1] << 8) & 0x0000FF00) | ((d[1] >> 8) & 0x000000FF);
      break;
    case 23:
      d[1] = (d[1] & 0x000000FF) | ((d[1] << 8) & 0x00FF0000) | ((d[1] >> 8) & 0x0000FF00);
      break;
    case 24:
      d[1] = (d[1] & 0x0000FFFF) | ((d[1] << 8) & 0xFF000000) | ((d[1] >> 8) & 0x00FF0000);
      break;
    case 25:
      d[2] = (d[1] & 0xFF000000) | d[2];
      d[1] = (d[1] & 0x00FFFFFF) | (d[2] << 24);
      d[2] = (d[2] >> 24);
      break;
    case 26:
      d[2] = ((d[2] << 8) & 0x0000FF00) | ((d[2] >> 8) & 0x000000FF);
      break;
    case 27:
      d[2] = (d[2] & 0x000000FF) | ((d[2] << 8) & 0x00FF0000) | ((d[2] >> 8) & 0x0000FF00);
      break;
    case 28:
      d[2] = (d[2] & 0x0000FFFF) | ((d[2] << 8) & 0xFF000000) | ((d[2] >> 8) & 0x00FF0000);
      break;
    case 29:
      d[3] = (d[2] & 0xFF000000) | d[3];
      d[2] = (d[2] & 0x00FFFFFF) | (d[3] << 24);
      d[3] = (d[3] >> 24);
      break;
    case 30:
      d[3] = ((d[3] << 8) & 0x0000FF00) | ((d[3] >> 8) & 0x000000FF);
      break;
    case 31:
      d[3] = (d[3] & 0x000000FF) | ((d[3] << 8) & 0x00FF0000) | ((d[3] >> 8) & 0x0000FF00);
      break;
  }

  return e;
}

inline u32 DL(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a >= e)
    return (e);
  if (b >= e)
    return (e);

  u32 f = 0;
  u32 g = 0;
  switch (a) {
    case 0:
      f = (c[0] >> 0) & 0xFF;
      break;
    case 1:
      f = (c[0] >> 8) & 0xFF;
      break;
    case 2:
      f = (c[0] >> 16) & 0xFF;
      break;
    case 3:
      f = (c[0] >> 24) & 0xFF;
      break;
    case 4:
      f = (c[1] >> 0) & 0xFF;
      break;
    case 5:
      f = (c[1] >> 8) & 0xFF;
      break;
    case 6:
      f = (c[1] >> 16) & 0xFF;
      break;
    case 7:
      f = (c[1] >> 24) & 0xFF;
      break;
    case 8:
      f = (c[2] >> 0) & 0xFF;
      break;
    case 9:
      f = (c[2] >> 8) & 0xFF;
      break;
    case 10:
      f = (c[2] >> 16) & 0xFF;
      break;
    case 11:
      f = (c[2] >> 24) & 0xFF;
      break;
    case 12:
      f = (c[3] >> 0) & 0xFF;
      break;
    case 13:
      f = (c[3] >> 8) & 0xFF;
      break;
    case 14:
      f = (c[3] >> 16) & 0xFF;
      break;
    case 15:
      f = (c[3] >> 24) & 0xFF;
      break;
    case 16:
      f = (d[0] >> 0) & 0xFF;
      break;
    case 17:
      f = (d[0] >> 8) & 0xFF;
      break;
    case 18:
      f = (d[0] >> 16) & 0xFF;
      break;
    case 19:
      f = (d[0] >> 24) & 0xFF;
      break;
    case 20:
      f = (d[1] >> 0) & 0xFF;
      break;
    case 21:
      f = (d[1] >> 8) & 0xFF;
      break;
    case 22:
      f = (d[1] >> 16) & 0xFF;
      break;
    case 23:
      f = (d[1] >> 24) & 0xFF;
      break;
    case 24:
      f = (d[2] >> 0) & 0xFF;
      break;
    case 25:
      f = (d[2] >> 8) & 0xFF;
      break;
    case 26:
      f = (d[2] >> 16) & 0xFF;
      break;
    case 27:
      f = (d[2] >> 24) & 0xFF;
      break;
    case 28:
      f = (d[3] >> 0) & 0xFF;
      break;
    case 29:
      f = (d[3] >> 8) & 0xFF;
      break;
    case 30:
      f = (d[3] >> 16) & 0xFF;
      break;
    case 31:
      f = (d[3] >> 24) & 0xFF;
      break;
  }

  switch (b) {
    case 0:
      g = (c[0] >> 0) & 0xff;
      c[0] = (c[0] & 0xffffff00) | f << 0;
      break;
    case 1:
      g = (c[0] >> 8) & 0xff;
      c[0] = (c[0] & 0xffff00ff) | f << 8;
      break;
    case 2:
      g = (c[0] >> 16) & 0xff;
      c[0] = (c[0] & 0xff00ffff) | f << 16;
      break;
    case 3:
      g = (c[0] >> 24) & 0xff;
      c[0] = (c[0] & 0x00ffffff) | f << 24;
      break;
    case 4:
      g = (c[1] >> 0) & 0xff;
      c[1] = (c[1] & 0xffffff00) | f << 0;
      break;
    case 5:
      g = (c[1] >> 8) & 0xff;
      c[1] = (c[1] & 0xffff00ff) | f << 8;
      break;
    case 6:
      g = (c[1] >> 16) & 0xff;
      c[1] = (c[1] & 0xff00ffff) | f << 16;
      break;
    case 7:
      g = (c[1] >> 24) & 0xff;
      c[1] = (c[1] & 0x00ffffff) | f << 24;
      break;
    case 8:
      g = (c[2] >> 0) & 0xff;
      c[2] = (c[2] & 0xffffff00) | f << 0;
      break;
    case 9:
      g = (c[2] >> 8) & 0xff;
      c[2] = (c[2] & 0xffff00ff) | f << 8;
      break;
    case 10:
      g = (c[2] >> 16) & 0xff;
      c[2] = (c[2] & 0xff00ffff) | f << 16;
      break;
    case 11:
      g = (c[2] >> 24) & 0xff;
      c[2] = (c[2] & 0x00ffffff) | f << 24;
      break;
    case 12:
      g = (c[3] >> 0) & 0xff;
      c[3] = (c[3] & 0xffffff00) | f << 0;
      break;
    case 13:
      g = (c[3] >> 8) & 0xff;
      c[3] = (c[3] & 0xffff00ff) | f << 8;
      break;
    case 14:
      g = (c[3] >> 16) & 0xff;
      c[3] = (c[3] & 0xff00ffff) | f << 16;
      break;
    case 15:
      g = (c[3] >> 24) & 0xff;
      c[3] = (c[3] & 0x00ffffff) | f << 24;
      break;
    case 16:
      g = (d[0] >> 0) & 0xff;
      d[0] = (d[0] & 0xffffff00) | f << 0;
      break;
    case 17:
      g = (d[0] >> 8) & 0xff;
      d[0] = (d[0] & 0xffff00ff) | f << 8;
      break;
    case 18:
      g = (d[0] >> 16) & 0xff;
      d[0] = (d[0] & 0xff00ffff) | f << 16;
      break;
    case 19:
      g = (d[0] >> 24) & 0xff;
      d[0] = (d[0] & 0x00ffffff) | f << 24;
      break;
    case 20:
      g = (d[1] >> 0) & 0xff;
      d[1] = (d[1] & 0xffffff00) | f << 0;
      break;
    case 21:
      g = (d[1] >> 8) & 0xff;
      d[1] = (d[1] & 0xffff00ff) | f << 8;
      break;
    case 22:
      g = (d[1] >> 16) & 0xff;
      d[1] = (d[1] & 0xff00ffff) | f << 16;
      break;
    case 23:
      g = (d[1] >> 24) & 0xff;
      d[1] = (d[1] & 0x00ffffff) | f << 24;
      break;
    case 24:
      g = (d[2] >> 0) & 0xff;
      d[2] = (d[2] & 0xffffff00) | f << 0;
      break;
    case 25:
      g = (d[2] >> 8) & 0xff;
      d[2] = (d[2] & 0xffff00ff) | f << 8;
      break;
    case 26:
      g = (d[2] >> 16) & 0xff;
      d[2] = (d[2] & 0xff00ffff) | f << 16;
      break;
    case 27:
      g = (d[2] >> 24) & 0xff;
      d[2] = (d[2] & 0x00ffffff) | f << 24;
      break;
    case 28:
      g = (d[3] >> 0) & 0xff;
      d[3] = (d[3] & 0xffffff00) | f << 0;
      break;
    case 29:
      g = (d[3] >> 8) & 0xff;
      d[3] = (d[3] & 0xffff00ff) | f << 8;
      break;
    case 30:
      g = (d[3] >> 16) & 0xff;
      d[3] = (d[3] & 0xff00ffff) | f << 16;
      break;
    case 31:
      g = (d[3] >> 24) & 0xff;
      d[3] = (d[3] & 0x00ffffff) | f << 24;
      break;
  }

  switch (a) {
    case 0:
      c[0] = (c[0] & 0xffffff00) | g << 0;
      break;
    case 1:
      c[0] = (c[0] & 0xffff00ff) | g << 8;
      break;
    case 2:
      c[0] = (c[0] & 0xff00ffff) | g << 16;
      break;
    case 3:
      c[0] = (c[0] & 0x00ffffff) | g << 24;
      break;
    case 4:
      c[1] = (c[1] & 0xffffff00) | g << 0;
      break;
    case 5:
      c[1] = (c[1] & 0xffff00ff) | g << 8;
      break;
    case 6:
      c[1] = (c[1] & 0xff00ffff) | g << 16;
      break;
    case 7:
      c[1] = (c[1] & 0x00ffffff) | g << 24;
      break;
    case 8:
      c[2] = (c[2] & 0xffffff00) | g << 0;
      break;
    case 9:
      c[2] = (c[2] & 0xffff00ff) | g << 8;
      break;
    case 10:
      c[2] = (c[2] & 0xff00ffff) | g << 16;
      break;
    case 11:
      c[2] = (c[2] & 0x00ffffff) | g << 24;
      break;
    case 12:
      c[3] = (c[3] & 0xffffff00) | g << 0;
      break;
    case 13:
      c[3] = (c[3] & 0xffff00ff) | g << 8;
      break;
    case 14:
      c[3] = (c[3] & 0xff00ffff) | g << 16;
      break;
    case 15:
      c[3] = (c[3] & 0x00ffffff) | g << 24;
      break;
    case 16:
      d[0] = (d[0] & 0xffffff00) | g << 0;
      break;
    case 17:
      d[0] = (d[0] & 0xffff00ff) | g << 8;
      break;
    case 18:
      d[0] = (d[0] & 0xff00ffff) | g << 16;
      break;
    case 19:
      d[0] = (d[0] & 0x00ffffff) | g << 24;
      break;
    case 20:
      d[1] = (d[1] & 0xffffff00) | g << 0;
      break;
    case 21:
      d[1] = (d[1] & 0xffff00ff) | g << 8;
      break;
    case 22:
      d[1] = (d[1] & 0xff00ffff) | g << 16;
      break;
    case 23:
      d[1] = (d[1] & 0x00ffffff) | g << 24;
      break;
    case 24:
      d[2] = (d[2] & 0xffffff00) | g << 0;
      break;
    case 25:
      d[2] = (d[2] & 0xffff00ff) | g << 8;
      break;
    case 26:
      d[2] = (d[2] & 0xff00ffff) | g << 16;
      break;
    case 27:
      d[2] = (d[2] & 0x00ffffff) | g << 24;
      break;
    case 28:
      d[3] = (d[3] & 0xffffff00) | g << 0;
      break;
    case 29:
      d[3] = (d[3] & 0xffff00ff) | g << 8;
      break;
    case 30:
      d[3] = (d[3] & 0xff00ffff) | g << 16;
      break;
    case 31:
      d[3] = (d[3] & 0x00ffffff) | g << 24;
      break;
  }

  return e;
}

inline u32 DM(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a >= e)
    return (e);

  const u32 f = 0xffu << ((a & 3) * 8);
  const u32 g = ~f;

  switch (a / 4) {
    case 0:
      c[0] = (c[0] & g) | (((c[0] & f) << 1) & f);
      break;
    case 1:
      c[1] = (c[1] & g) | (((c[1] & f) << 1) & f);
      break;
    case 2:
      c[2] = (c[2] & g) | (((c[2] & f) << 1) & f);
      break;
    case 3:
      c[3] = (c[3] & g) | (((c[3] & f) << 1) & f);
      break;
    case 4:
      d[0] = (d[0] & g) | (((d[0] & f) << 1) & f);
      break;
    case 5:
      d[1] = (d[1] & g) | (((d[1] & f) << 1) & f);
      break;
    case 6:
      d[2] = (d[2] & g) | (((d[2] & f) << 1) & f);
      break;
    case 7:
      d[3] = (d[3] & g) | (((d[3] & f) << 1) & f);
      break;
  }

  return e;
}

inline u32 DN(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a >= e)
    return (e);

  const u32 f = 0xffu << ((a & 3) * 8);
  const u32 g = ~f;

  switch (a / 4) {
    case 0:
      c[0] = (c[0] & g) | (((c[0] & f) >> 1) & f);
      break;
    case 1:
      c[1] = (c[1] & g) | (((c[1] & f) >> 1) & f);
      break;
    case 2:
      c[2] = (c[2] & g) | (((c[2] & f) >> 1) & f);
      break;
    case 3:
      c[3] = (c[3] & g) | (((c[3] & f) >> 1) & f);
      break;
    case 4:
      d[0] = (d[0] & g) | (((d[0] & f) >> 1) & f);
      break;
    case 5:
      d[1] = (d[1] & g) | (((d[1] & f) >> 1) & f);
      break;
    case 6:
      d[2] = (d[2] & g) | (((d[2] & f) >> 1) & f);
      break;
    case 7:
      d[3] = (d[3] & g) | (((d[3] & f) >> 1) & f);
      break;
  }

  return e;
}

inline u32 DO(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a >= e)
    return (e);

  const u32 f = 0xffu << ((a & 3) * 8);
  const u32 g = ~f;

  const u32 h = 0x01010101 & f;

  switch (a / 4) {
    case 0:
      c[0] = (c[0] & g) | (((c[0] & f) + h) & f);
      break;
    case 1:
      c[1] = (c[1] & g) | (((c[1] & f) + h) & f);
      break;
    case 2:
      c[2] = (c[2] & g) | (((c[2] & f) + h) & f);
      break;
    case 3:
      c[3] = (c[3] & g) | (((c[3] & f) + h) & f);
      break;
    case 4:
      d[0] = (d[0] & g) | (((d[0] & f) + h) & f);
      break;
    case 5:
      d[1] = (d[1] & g) | (((d[1] & f) + h) & f);
      break;
    case 6:
      d[2] = (d[2] & g) | (((d[2] & f) + h) & f);
      break;
    case 7:
      d[3] = (d[3] & g) | (((d[3] & f) + h) & f);
      break;
  }

  return e;
}

inline u32 DP(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a >= e)
    return (e);

  const u32 f = 0xffu << ((a & 3) * 8);
  const u32 g = ~f;

  const u32 h = 0x01010101 & f;

  switch (a / 4) {
    case 0:
      c[0] = (c[0] & g) | (((c[0] & f) - h) & f);
      break;
    case 1:
      c[1] = (c[1] & g) | (((c[1] & f) - h) & f);
      break;
    case 2:
      c[2] = (c[2] & g) | (((c[2] & f) - h) & f);
      break;
    case 3:
      c[3] = (c[3] & g) | (((c[3] & f) - h) & f);
      break;
    case 4:
      d[0] = (d[0] & g) | (((d[0] & f) - h) & f);
      break;
    case 5:
      d[1] = (d[1] & g) | (((d[1] & f) - h) & f);
      break;
    case 6:
      d[2] = (d[2] & g) | (((d[2] & f) - h) & f);
      break;
    case 7:
      d[3] = (d[3] & g) | (((d[3] & f) - h) & f);
      break;
  }

  return e;
}

inline u32 DQ(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if ((a + 1) >= e)
    return (e);

  u32 f[4];
  u32 g[4];

  CA(c, d, f, g);

  const u32 h = 0xffu << ((a & 3) * 8);
  const u32 i = ~h;

  switch (a / 4) {
    case 0:
      c[0] = (c[0] & i) | (f[0] & h);
      break;
    case 1:
      c[1] = (c[1] & i) | (f[1] & h);
      break;
    case 2:
      c[2] = (c[2] & i) | (f[2] & h);
      break;
    case 3:
      c[3] = (c[3] & i) | (f[3] & h);
      break;
    case 4:
      d[0] = (d[0] & i) | (g[0] & h);
      break;
    case 5:
      d[1] = (d[1] & i) | (g[1] & h);
      break;
    case 6:
      d[2] = (d[2] & i) | (g[2] & h);
      break;
    case 7:
      d[3] = (d[3] & i) | (g[3] & h);
      break;
  }

  return e;
}

inline u32 DR(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a == 0)
    return (e);

  if (a >= e)
    return (e);

  u32 f[4];
  u32 g[4];

  CB(c, d, f, g);

  const u32 h = 0xffu << ((a & 3) * 8);
  const u32 i = ~h;

  switch (a / 4) {
    case 0:
      c[0] = (c[0] & i) | (f[0] & h);
      break;
    case 1:
      c[1] = (c[1] & i) | (f[1] & h);
      break;
    case 2:
      c[2] = (c[2] & i) | (f[2] & h);
      break;
    case 3:
      c[3] = (c[3] & i) | (f[3] & h);
      break;
    case 4:
      d[0] = (d[0] & i) | (g[0] & h);
      break;
    case 5:
      d[1] = (d[1] & i) | (g[1] & h);
      break;
    case 6:
      d[2] = (d[2] & i) | (g[2] & h);
      break;
    case 7:
      d[3] = (d[3] & i) | (g[3] & h);
      break;
  }

  return e;
}

inline u32 DS(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a > e)
    return (e);

  if ((e + a) >= 32)
    return (e);

  u32 f = e;

  u32 g[4];
  u32 h[4];

  g[0] = c[0];
  g[1] = c[1];
  g[2] = c[2];
  g[3] = c[3];
  h[0] = d[0];
  h[1] = d[1];
  h[2] = d[2];
  h[3] = d[3];

  BY(g, h, a);

  CD(c, d, c, d, a);

  c[0] |= g[0];
  c[1] |= g[1];
  c[2] |= g[2];
  c[3] |= g[3];
  d[0] |= h[0];
  d[1] |= h[1];
  d[2] |= h[2];
  d[3] |= h[3];

  f += a;

  return f;
}

inline u32 DT(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a > e)
    return (e);

  if ((e + a) >= 32)
    return (e);

  u32 f = e;

  u32 g[4];
  u32 h[4];

  CD(c, d, g, h, a);

  BZ(g, h, f);

  c[0] |= g[0];
  c[1] |= g[1];
  c[2] |= g[2];
  c[3] |= g[3];
  d[0] |= h[0];
  d[1] |= h[1];
  d[2] |= h[2];
  d[3] |= h[3];

  f += a;

  return f;
}

inline u32 DU(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  c[0] |= (BX(c[0]));
  c[1] |= (BX(c[1]));
  c[2] |= (BX(c[2]));
  c[3] |= (BX(c[3]));
  d[0] |= (BX(d[0]));
  d[1] |= (BX(d[1]));
  d[2] |= (BX(d[2]));
  d[3] |= (BX(d[3]));
  u32 f[4];
  u32 g[4];

  const uchar4 h = (uchar4)(' ');
  const uchar4 i = (uchar4)(0x00);
  const uchar4 j = (uchar4)(0xff);

  uchar4 k;

  k = __builtin_astype(c[0], uchar4);
  k = ((k == h) ? (j) : (i));
  f[0] = __builtin_astype(k, uint);
  k = __builtin_astype(c[1], uchar4);
  k = ((k == h) ? (j) : (i));
  f[1] = __builtin_astype(k, uint);
  k = __builtin_astype(c[2], uchar4);
  k = ((k == h) ? (j) : (i));
  f[2] = __builtin_astype(k, uint);
  k = __builtin_astype(c[3], uchar4);
  k = ((k == h) ? (j) : (i));
  f[3] = __builtin_astype(k, uint);
  k = __builtin_astype(d[0], uchar4);
  k = ((k == h) ? (j) : (i));
  g[0] = __builtin_astype(k, uint);
  k = __builtin_astype(d[1], uchar4);
  k = ((k == h) ? (j) : (i));
  g[1] = __builtin_astype(k, uint);
  k = __builtin_astype(d[2], uchar4);
  k = ((k == h) ? (j) : (i));
  g[2] = __builtin_astype(k, uint);
  k = __builtin_astype(d[3], uchar4);
  k = ((k == h) ? (j) : (i));
  g[3] = __builtin_astype(k, uint);

  CB(f, g, f, g);
  f[0] |= 0xff;

  c[0] &= ~(BX(c[0]) & f[0]);
  c[1] &= ~(BX(c[1]) & f[1]);
  c[2] &= ~(BX(c[2]) & f[2]);
  c[3] &= ~(BX(c[3]) & f[3]);
  d[0] &= ~(BX(d[0]) & g[0]);
  d[1] &= ~(BX(d[1]) & g[1]);
  d[2] &= ~(BX(d[2]) & g[2]);
  d[3] &= ~(BX(d[3]) & g[3]);

  return e;
}

inline u32 BU(const u32 a, const u32 b, const u32 c, u32 d[4], u32 e[4], const u32 f) {
  u32 g = f;

  switch (a) {
    case 'l':
      g = CH(b, c, d, e, g);
      break;
    case 'u':
      g = CI(b, c, d, e, g);
      break;
    case 'c':
      g = CJ(b, c, d, e, g);
      break;
    case 'C':
      g = CK(b, c, d, e, g);
      break;
    case 't':
      g = CL(b, c, d, e, g);
      break;
    case 'T':
      g = CM(b, c, d, e, g);
      break;
    case 'r':
      g = CN(b, c, d, e, g);
      break;
    case 'd':
      g = CO(b, c, d, e, g);
      break;
    case 'p':
      g = CP(b, c, d, e, g);
      break;
    case 'f':
      g = CQ(b, c, d, e, g);
      break;
    case '$':
      g = CR(b, c, d, e, g);
      break;
    case '^':
      g = CS(b, c, d, e, g);
      break;
    case '{':
      g = CT(b, c, d, e, g);
      break;
    case '}':
      g = CU(b, c, d, e, g);
      break;
    case '[':
      g = CV(b, c, d, e, g);
      break;
    case ']':
      g = CW(b, c, d, e, g);
      break;
    case 'D':
      g = CX(b, c, d, e, g);
      break;
    case 'x':
      g = CY(b, c, d, e, g);
      break;
    case 'O':
      g = CZ(b, c, d, e, g);
      break;
    case 'i':
      g = DA(b, c, d, e, g);
      break;
    case 'o':
      g = DB(b, c, d, e, g);
      break;
    case '\'':
      g = DC(b, c, d, e, g);
      break;
    case 's':
      g = DD(b, c, d, e, g);
      break;

    case 'z':
      g = DG(b, c, d, e, g);
      break;
    case 'Z':
      g = DH(b, c, d, e, g);
      break;
    case 'q':
      g = DI(b, c, d, e, g);
      break;
    case 'k':
      g = DJ(b, c, d, e, g);
      break;
    case 'K':
      g = DK(b, c, d, e, g);
      break;
    case '*':
      g = DL(b, c, d, e, g);
      break;
    case 'L':
      g = DM(b, c, d, e, g);
      break;
    case 'R':
      g = DN(b, c, d, e, g);
      break;
    case '+':
      g = DO(b, c, d, e, g);
      break;
    case '-':
      g = DP(b, c, d, e, g);
      break;
    case '.':
      g = DQ(b, c, d, e, g);
      break;
    case ',':
      g = DR(b, c, d, e, g);
      break;
    case 'y':
      g = DS(b, c, d, e, g);
      break;
    case 'Y':
      g = DT(b, c, d, e, g);
      break;
    case 'E':
      g = DU(b, c, d, e, g);
      break;
  }

  return g;
}

inline u32 BV(const __global u32* a, u32 b[4], u32 c[4], const u32 d) {
  u32 e = d;

  for (u32 f = 0; a[f] != 0; f++) {
    const u32 g = a[f];

    const u32 h = (g >> 0) & 0xff;
    const u32 i = (g >> 8) & 0xff;
    const u32 j = (g >> 16) & 0xff;

    e = BU(h, i, j, b, c, e);
  }

  return e;
}

inline u32x BW(const u32 a[4], const u32 b[4], const u32 c, const __global kernel_rule_t* d, const u32 e, u32x f[4], u32x g[4]) {
  f[0] = a[0];
  f[1] = a[1];
  f[2] = a[2];
  f[3] = a[3];
  g[0] = b[0];
  g[1] = b[1];
  g[2] = b[2];
  g[3] = b[3];

  return BV(d[e].cmds, f, g, c);
}
inline u32x DV(__global bf_t* a, const u32 b) {
  const u32x c = (u32x)(a[b + 0].i);
  return c;
}

inline u32x DW(__global comb_t* a, const u32 b) {
  const u32x c = (u32x)(a[b + 0].pw_len);
  return c;
}

inline u32x DX(__global comb_t* a, const u32 b, const int c) {
  const u32x d = (u32x)(a[b + 0].i[c]);
  return d;
}
void DY(u32x a[16], const u32 b, u32x c[16]) {
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

__kernel void DZ(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global pstoken_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa,
                 const u32 ab, const u32 ac, const u32 ad, const u32 ae, const u32 af) {
  const u32 ag = get_local_id(0);

  const u32 ah = get_global_id(0);

  if (ah >= af)
    return;

  u32 ai[4];
  u32 aj[4];

  ai[0] = a[ah].i[0];
  ai[1] = a[ah].i[1];
  ai[2] = a[ah].i[2];
  ai[3] = a[ah].i[3];
  aj[0] = a[ah].i[4];
  aj[1] = a[ah].i[5];
  aj[2] = a[ah].i[6];
  aj[3] = a[ah].i[7];

  const u32 ak = a[ah].pw_len;

  const u32 al = s[y].pc_offset;

  u32 am[5];

  am[0] = s[y].pc_digest[0];
  am[1] = s[y].pc_digest[1];
  am[2] = s[y].pc_digest[2];
  am[3] = s[y].pc_digest[3];
  am[4] = s[y].pc_digest[4];

  u32 an[4];
  u32 ao[4];
  u32 ap[4];
  u32 aq[4];

  an[0] = G(s[y].salt_buf[al + 0]);
  an[1] = G(s[y].salt_buf[al + 1]);
  an[2] = G(s[y].salt_buf[al + 2]);
  an[3] = G(s[y].salt_buf[al + 3]);
  ao[0] = G(s[y].salt_buf[al + 4]);
  ao[1] = G(s[y].salt_buf[al + 5]);
  ao[2] = G(s[y].salt_buf[al + 6]);
  ao[3] = G(s[y].salt_buf[al + 7]);
  ap[0] = G(s[y].salt_buf[al + 8]);
  ap[1] = G(s[y].salt_buf[al + 9]);
  ap[2] = G(s[y].salt_buf[al + 10]);
  ap[3] = G(s[y].salt_buf[al + 11]);
  aq[0] = G(s[y].salt_buf[al + 12]);
  aq[1] = G(s[y].salt_buf[al + 13]);
  aq[2] = G(s[y].salt_buf[al + 14]);
  aq[3] = G(s[y].salt_buf[al + 15]);

  const u32 ar = s[y].salt_len;

  for (u32 as = 0; as < ab; as += 1) {
    u32x at[4] = {0};
    u32x au[4] = {0};
    u32x av[4] = {0};
    u32x aw[4] = {0};

    const u32x ax = BW(ai, aj, ak, b, as, at, au);

    BR(at, au, ax);

    AC(au, av, aw);
    AC(at, at, au);

    const u32x ay = ax * 2;

    const u32x az = ay + ar;

    u32x ba[16];

    ba[0] = M(at[0]);
    ba[1] = M(at[1]);
    ba[2] = M(at[2]);
    ba[3] = M(at[3]);
    ba[4] = M(au[0]);
    ba[5] = M(au[1]);
    ba[6] = M(au[2]);
    ba[7] = M(au[3]);
    ba[8] = M(av[0]);
    ba[9] = M(av[1]);
    ba[10] = M(av[2]);
    ba[11] = M(av[3]);
    ba[12] = M(aw[0]);
    ba[13] = M(aw[1]);
    ba[14] = M(aw[2]);
    ba[15] = M(aw[3]);

    u32x bb[16];

    bb[0] = an[0];
    bb[1] = an[1];
    bb[2] = an[2];
    bb[3] = an[3];
    bb[4] = ao[0];
    bb[5] = ao[1];
    bb[6] = ao[2];
    bb[7] = ao[3];
    bb[8] = ap[0];
    bb[9] = ap[1];
    bb[10] = ap[2];
    bb[11] = ap[3];
    bb[12] = aq[0];
    bb[13] = aq[1];
    bb[14] = aq[2];
    bb[15] = aq[3];

    DY(bb, ar & 0x3f, ba);

    u32x bc = am[0];
    u32x bd = am[1];
    u32x be = am[2];
    u32x bf = am[3];
    u32x bg = am[4];

    if (((ar & 0x3f) + ay) >= 56) {
      u32x bh = bb[0];
      u32x bi = bb[1];
      u32x bj = bb[2];
      u32x bk = bb[3];
      u32x bl = bb[4];
      u32x bm = bb[5];
      u32x bn = bb[6];
      u32x bo = bb[7];
      u32x bp = bb[8];
      u32x bq = bb[9];
      u32x br = bb[10];
      u32x bs = bb[11];
      u32x bt = bb[12];
      u32x bu = bb[13];
      u32x bv = bb[14];
      u32x bw = bb[15];

      {
        bg += 0x5a827999u;
        bg += bh;
        bg += ((((bf)) ^ (((bd)) & (((be)) ^ ((bf))))));
        bg += P(bc, 5u);
        bd = P(bd, 30u);
      };
      {
        bf += 0x5a827999u;
        bf += bi;
        bf += ((((be)) ^ (((bc)) & (((bd)) ^ ((be))))));
        bf += P(bg, 5u);
        bc = P(bc, 30u);
      };
      {
        be += 0x5a827999u;
        be += bj;
        be += ((((bd)) ^ (((bg)) & (((bc)) ^ ((bd))))));
        be += P(bf, 5u);
        bg = P(bg, 30u);
      };
      {
        bd += 0x5a827999u;
        bd += bk;
        bd += ((((bc)) ^ (((bf)) & (((bg)) ^ ((bc))))));
        bd += P(be, 5u);
        bf = P(bf, 30u);
      };
      {
        bc += 0x5a827999u;
        bc += bl;
        bc += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
        bc += P(bd, 5u);
        be = P(be, 30u);
      };
      {
        bg += 0x5a827999u;
        bg += bm;
        bg += ((((bf)) ^ (((bd)) & (((be)) ^ ((bf))))));
        bg += P(bc, 5u);
        bd = P(bd, 30u);
      };
      {
        bf += 0x5a827999u;
        bf += bn;
        bf += ((((be)) ^ (((bc)) & (((bd)) ^ ((be))))));
        bf += P(bg, 5u);
        bc = P(bc, 30u);
      };
      {
        be += 0x5a827999u;
        be += bo;
        be += ((((bd)) ^ (((bg)) & (((bc)) ^ ((bd))))));
        be += P(bf, 5u);
        bg = P(bg, 30u);
      };
      {
        bd += 0x5a827999u;
        bd += bp;
        bd += ((((bc)) ^ (((bf)) & (((bg)) ^ ((bc))))));
        bd += P(be, 5u);
        bf = P(bf, 30u);
      };
      {
        bc += 0x5a827999u;
        bc += bq;
        bc += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
        bc += P(bd, 5u);
        be = P(be, 30u);
      };
      {
        bg += 0x5a827999u;
        bg += br;
        bg += ((((bf)) ^ (((bd)) & (((be)) ^ ((bf))))));
        bg += P(bc, 5u);
        bd = P(bd, 30u);
      };
      {
        bf += 0x5a827999u;
        bf += bs;
        bf += ((((be)) ^ (((bc)) & (((bd)) ^ ((be))))));
        bf += P(bg, 5u);
        bc = P(bc, 30u);
      };
      {
        be += 0x5a827999u;
        be += bt;
        be += ((((bd)) ^ (((bg)) & (((bc)) ^ ((bd))))));
        be += P(bf, 5u);
        bg = P(bg, 30u);
      };
      {
        bd += 0x5a827999u;
        bd += bu;
        bd += ((((bc)) ^ (((bf)) & (((bg)) ^ ((bc))))));
        bd += P(be, 5u);
        bf = P(bf, 30u);
      };
      {
        bc += 0x5a827999u;
        bc += bv;
        bc += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
        bc += P(bd, 5u);
        be = P(be, 30u);
      };
      {
        bg += 0x5a827999u;
        bg += bw;
        bg += ((((bf)) ^ (((bd)) & (((be)) ^ ((bf))))));
        bg += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bh = P((bu ^ bp ^ bj ^ bh), 1u);
      {
        bf += 0x5a827999u;
        bf += bh;
        bf += ((((be)) ^ (((bc)) & (((bd)) ^ ((be))))));
        bf += P(bg, 5u);
        bc = P(bc, 30u);
      };
      bi = P((bv ^ bq ^ bk ^ bi), 1u);
      {
        be += 0x5a827999u;
        be += bi;
        be += ((((bd)) ^ (((bg)) & (((bc)) ^ ((bd))))));
        be += P(bf, 5u);
        bg = P(bg, 30u);
      };
      bj = P((bw ^ br ^ bl ^ bj), 1u);
      {
        bd += 0x5a827999u;
        bd += bj;
        bd += ((((bc)) ^ (((bf)) & (((bg)) ^ ((bc))))));
        bd += P(be, 5u);
        bf = P(bf, 30u);
      };
      bk = P((bh ^ bs ^ bm ^ bk), 1u);
      {
        bc += 0x5a827999u;
        bc += bk;
        bc += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
        bc += P(bd, 5u);
        be = P(be, 30u);
      };

      bl = P((bi ^ bt ^ bn ^ bl), 1u);
      {
        bg += 0x6ed9eba1u;
        bg += bl;
        bg += ((bd) ^ (be) ^ (bf));
        bg += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bm = P((bj ^ bu ^ bo ^ bm), 1u);
      {
        bf += 0x6ed9eba1u;
        bf += bm;
        bf += ((bc) ^ (bd) ^ (be));
        bf += P(bg, 5u);
        bc = P(bc, 30u);
      };
      bn = P((bk ^ bv ^ bp ^ bn), 1u);
      {
        be += 0x6ed9eba1u;
        be += bn;
        be += ((bg) ^ (bc) ^ (bd));
        be += P(bf, 5u);
        bg = P(bg, 30u);
      };
      bo = P((bl ^ bw ^ bq ^ bo), 1u);
      {
        bd += 0x6ed9eba1u;
        bd += bo;
        bd += ((bf) ^ (bg) ^ (bc));
        bd += P(be, 5u);
        bf = P(bf, 30u);
      };
      bp = P((bm ^ bh ^ br ^ bp), 1u);
      {
        bc += 0x6ed9eba1u;
        bc += bp;
        bc += ((be) ^ (bf) ^ (bg));
        bc += P(bd, 5u);
        be = P(be, 30u);
      };
      bq = P((bn ^ bi ^ bs ^ bq), 1u);
      {
        bg += 0x6ed9eba1u;
        bg += bq;
        bg += ((bd) ^ (be) ^ (bf));
        bg += P(bc, 5u);
        bd = P(bd, 30u);
      };
      br = P((bo ^ bj ^ bt ^ br), 1u);
      {
        bf += 0x6ed9eba1u;
        bf += br;
        bf += ((bc) ^ (bd) ^ (be));
        bf += P(bg, 5u);
        bc = P(bc, 30u);
      };
      bs = P((bp ^ bk ^ bu ^ bs), 1u);
      {
        be += 0x6ed9eba1u;
        be += bs;
        be += ((bg) ^ (bc) ^ (bd));
        be += P(bf, 5u);
        bg = P(bg, 30u);
      };
      bt = P((bq ^ bl ^ bv ^ bt), 1u);
      {
        bd += 0x6ed9eba1u;
        bd += bt;
        bd += ((bf) ^ (bg) ^ (bc));
        bd += P(be, 5u);
        bf = P(bf, 30u);
      };
      bu = P((br ^ bm ^ bw ^ bu), 1u);
      {
        bc += 0x6ed9eba1u;
        bc += bu;
        bc += ((be) ^ (bf) ^ (bg));
        bc += P(bd, 5u);
        be = P(be, 30u);
      };
      bv = P((bs ^ bn ^ bh ^ bv), 1u);
      {
        bg += 0x6ed9eba1u;
        bg += bv;
        bg += ((bd) ^ (be) ^ (bf));
        bg += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bw = P((bt ^ bo ^ bi ^ bw), 1u);
      {
        bf += 0x6ed9eba1u;
        bf += bw;
        bf += ((bc) ^ (bd) ^ (be));
        bf += P(bg, 5u);
        bc = P(bc, 30u);
      };
      bh = P((bu ^ bp ^ bj ^ bh), 1u);
      {
        be += 0x6ed9eba1u;
        be += bh;
        be += ((bg) ^ (bc) ^ (bd));
        be += P(bf, 5u);
        bg = P(bg, 30u);
      };
      bi = P((bv ^ bq ^ bk ^ bi), 1u);
      {
        bd += 0x6ed9eba1u;
        bd += bi;
        bd += ((bf) ^ (bg) ^ (bc));
        bd += P(be, 5u);
        bf = P(bf, 30u);
      };
      bj = P((bw ^ br ^ bl ^ bj), 1u);
      {
        bc += 0x6ed9eba1u;
        bc += bj;
        bc += ((be) ^ (bf) ^ (bg));
        bc += P(bd, 5u);
        be = P(be, 30u);
      };
      bk = P((bh ^ bs ^ bm ^ bk), 1u);
      {
        bg += 0x6ed9eba1u;
        bg += bk;
        bg += ((bd) ^ (be) ^ (bf));
        bg += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bl = P((bi ^ bt ^ bn ^ bl), 1u);
      {
        bf += 0x6ed9eba1u;
        bf += bl;
        bf += ((bc) ^ (bd) ^ (be));
        bf += P(bg, 5u);
        bc = P(bc, 30u);
      };
      bm = P((bj ^ bu ^ bo ^ bm), 1u);
      {
        be += 0x6ed9eba1u;
        be += bm;
        be += ((bg) ^ (bc) ^ (bd));
        be += P(bf, 5u);
        bg = P(bg, 30u);
      };
      bn = P((bk ^ bv ^ bp ^ bn), 1u);
      {
        bd += 0x6ed9eba1u;
        bd += bn;
        bd += ((bf) ^ (bg) ^ (bc));
        bd += P(be, 5u);
        bf = P(bf, 30u);
      };
      bo = P((bl ^ bw ^ bq ^ bo), 1u);
      {
        bc += 0x6ed9eba1u;
        bc += bo;
        bc += ((be) ^ (bf) ^ (bg));
        bc += P(bd, 5u);
        be = P(be, 30u);
      };

      bp = P((bm ^ bh ^ br ^ bp), 1u);
      {
        bg += 0x8f1bbcdcu;
        bg += bp;
        bg += (((((bd)) & ((be))) | (((bf)) & (((bd)) ^ ((be))))));
        bg += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bq = P((bn ^ bi ^ bs ^ bq), 1u);
      {
        bf += 0x8f1bbcdcu;
        bf += bq;
        bf += (((((bc)) & ((bd))) | (((be)) & (((bc)) ^ ((bd))))));
        bf += P(bg, 5u);
        bc = P(bc, 30u);
      };
      br = P((bo ^ bj ^ bt ^ br), 1u);
      {
        be += 0x8f1bbcdcu;
        be += br;
        be += (((((bg)) & ((bc))) | (((bd)) & (((bg)) ^ ((bc))))));
        be += P(bf, 5u);
        bg = P(bg, 30u);
      };
      bs = P((bp ^ bk ^ bu ^ bs), 1u);
      {
        bd += 0x8f1bbcdcu;
        bd += bs;
        bd += (((((bf)) & ((bg))) | (((bc)) & (((bf)) ^ ((bg))))));
        bd += P(be, 5u);
        bf = P(bf, 30u);
      };
      bt = P((bq ^ bl ^ bv ^ bt), 1u);
      {
        bc += 0x8f1bbcdcu;
        bc += bt;
        bc += (((((be)) & ((bf))) | (((bg)) & (((be)) ^ ((bf))))));
        bc += P(bd, 5u);
        be = P(be, 30u);
      };
      bu = P((br ^ bm ^ bw ^ bu), 1u);
      {
        bg += 0x8f1bbcdcu;
        bg += bu;
        bg += (((((bd)) & ((be))) | (((bf)) & (((bd)) ^ ((be))))));
        bg += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bv = P((bs ^ bn ^ bh ^ bv), 1u);
      {
        bf += 0x8f1bbcdcu;
        bf += bv;
        bf += (((((bc)) & ((bd))) | (((be)) & (((bc)) ^ ((bd))))));
        bf += P(bg, 5u);
        bc = P(bc, 30u);
      };
      bw = P((bt ^ bo ^ bi ^ bw), 1u);
      {
        be += 0x8f1bbcdcu;
        be += bw;
        be += (((((bg)) & ((bc))) | (((bd)) & (((bg)) ^ ((bc))))));
        be += P(bf, 5u);
        bg = P(bg, 30u);
      };
      bh = P((bu ^ bp ^ bj ^ bh), 1u);
      {
        bd += 0x8f1bbcdcu;
        bd += bh;
        bd += (((((bf)) & ((bg))) | (((bc)) & (((bf)) ^ ((bg))))));
        bd += P(be, 5u);
        bf = P(bf, 30u);
      };
      bi = P((bv ^ bq ^ bk ^ bi), 1u);
      {
        bc += 0x8f1bbcdcu;
        bc += bi;
        bc += (((((be)) & ((bf))) | (((bg)) & (((be)) ^ ((bf))))));
        bc += P(bd, 5u);
        be = P(be, 30u);
      };
      bj = P((bw ^ br ^ bl ^ bj), 1u);
      {
        bg += 0x8f1bbcdcu;
        bg += bj;
        bg += (((((bd)) & ((be))) | (((bf)) & (((bd)) ^ ((be))))));
        bg += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bk = P((bh ^ bs ^ bm ^ bk), 1u);
      {
        bf += 0x8f1bbcdcu;
        bf += bk;
        bf += (((((bc)) & ((bd))) | (((be)) & (((bc)) ^ ((bd))))));
        bf += P(bg, 5u);
        bc = P(bc, 30u);
      };
      bl = P((bi ^ bt ^ bn ^ bl), 1u);
      {
        be += 0x8f1bbcdcu;
        be += bl;
        be += (((((bg)) & ((bc))) | (((bd)) & (((bg)) ^ ((bc))))));
        be += P(bf, 5u);
        bg = P(bg, 30u);
      };
      bm = P((bj ^ bu ^ bo ^ bm), 1u);
      {
        bd += 0x8f1bbcdcu;
        bd += bm;
        bd += (((((bf)) & ((bg))) | (((bc)) & (((bf)) ^ ((bg))))));
        bd += P(be, 5u);
        bf = P(bf, 30u);
      };
      bn = P((bk ^ bv ^ bp ^ bn), 1u);
      {
        bc += 0x8f1bbcdcu;
        bc += bn;
        bc += (((((be)) & ((bf))) | (((bg)) & (((be)) ^ ((bf))))));
        bc += P(bd, 5u);
        be = P(be, 30u);
      };
      bo = P((bl ^ bw ^ bq ^ bo), 1u);
      {
        bg += 0x8f1bbcdcu;
        bg += bo;
        bg += (((((bd)) & ((be))) | (((bf)) & (((bd)) ^ ((be))))));
        bg += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bp = P((bm ^ bh ^ br ^ bp), 1u);
      {
        bf += 0x8f1bbcdcu;
        bf += bp;
        bf += (((((bc)) & ((bd))) | (((be)) & (((bc)) ^ ((bd))))));
        bf += P(bg, 5u);
        bc = P(bc, 30u);
      };
      bq = P((bn ^ bi ^ bs ^ bq), 1u);
      {
        be += 0x8f1bbcdcu;
        be += bq;
        be += (((((bg)) & ((bc))) | (((bd)) & (((bg)) ^ ((bc))))));
        be += P(bf, 5u);
        bg = P(bg, 30u);
      };
      br = P((bo ^ bj ^ bt ^ br), 1u);
      {
        bd += 0x8f1bbcdcu;
        bd += br;
        bd += (((((bf)) & ((bg))) | (((bc)) & (((bf)) ^ ((bg))))));
        bd += P(be, 5u);
        bf = P(bf, 30u);
      };
      bs = P((bp ^ bk ^ bu ^ bs), 1u);
      {
        bc += 0x8f1bbcdcu;
        bc += bs;
        bc += (((((be)) & ((bf))) | (((bg)) & (((be)) ^ ((bf))))));
        bc += P(bd, 5u);
        be = P(be, 30u);
      };

      bt = P((bq ^ bl ^ bv ^ bt), 1u);
      {
        bg += 0xca62c1d6u;
        bg += bt;
        bg += ((bd) ^ (be) ^ (bf));
        bg += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bu = P((br ^ bm ^ bw ^ bu), 1u);
      {
        bf += 0xca62c1d6u;
        bf += bu;
        bf += ((bc) ^ (bd) ^ (be));
        bf += P(bg, 5u);
        bc = P(bc, 30u);
      };
      bv = P((bs ^ bn ^ bh ^ bv), 1u);
      {
        be += 0xca62c1d6u;
        be += bv;
        be += ((bg) ^ (bc) ^ (bd));
        be += P(bf, 5u);
        bg = P(bg, 30u);
      };
      bw = P((bt ^ bo ^ bi ^ bw), 1u);
      {
        bd += 0xca62c1d6u;
        bd += bw;
        bd += ((bf) ^ (bg) ^ (bc));
        bd += P(be, 5u);
        bf = P(bf, 30u);
      };
      bh = P((bu ^ bp ^ bj ^ bh), 1u);
      {
        bc += 0xca62c1d6u;
        bc += bh;
        bc += ((be) ^ (bf) ^ (bg));
        bc += P(bd, 5u);
        be = P(be, 30u);
      };
      bi = P((bv ^ bq ^ bk ^ bi), 1u);
      {
        bg += 0xca62c1d6u;
        bg += bi;
        bg += ((bd) ^ (be) ^ (bf));
        bg += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bj = P((bw ^ br ^ bl ^ bj), 1u);
      {
        bf += 0xca62c1d6u;
        bf += bj;
        bf += ((bc) ^ (bd) ^ (be));
        bf += P(bg, 5u);
        bc = P(bc, 30u);
      };
      bk = P((bh ^ bs ^ bm ^ bk), 1u);
      {
        be += 0xca62c1d6u;
        be += bk;
        be += ((bg) ^ (bc) ^ (bd));
        be += P(bf, 5u);
        bg = P(bg, 30u);
      };
      bl = P((bi ^ bt ^ bn ^ bl), 1u);
      {
        bd += 0xca62c1d6u;
        bd += bl;
        bd += ((bf) ^ (bg) ^ (bc));
        bd += P(be, 5u);
        bf = P(bf, 30u);
      };
      bm = P((bj ^ bu ^ bo ^ bm), 1u);
      {
        bc += 0xca62c1d6u;
        bc += bm;
        bc += ((be) ^ (bf) ^ (bg));
        bc += P(bd, 5u);
        be = P(be, 30u);
      };
      bn = P((bk ^ bv ^ bp ^ bn), 1u);
      {
        bg += 0xca62c1d6u;
        bg += bn;
        bg += ((bd) ^ (be) ^ (bf));
        bg += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bo = P((bl ^ bw ^ bq ^ bo), 1u);
      {
        bf += 0xca62c1d6u;
        bf += bo;
        bf += ((bc) ^ (bd) ^ (be));
        bf += P(bg, 5u);
        bc = P(bc, 30u);
      };
      bp = P((bm ^ bh ^ br ^ bp), 1u);
      {
        be += 0xca62c1d6u;
        be += bp;
        be += ((bg) ^ (bc) ^ (bd));
        be += P(bf, 5u);
        bg = P(bg, 30u);
      };
      bq = P((bn ^ bi ^ bs ^ bq), 1u);
      {
        bd += 0xca62c1d6u;
        bd += bq;
        bd += ((bf) ^ (bg) ^ (bc));
        bd += P(be, 5u);
        bf = P(bf, 30u);
      };
      br = P((bo ^ bj ^ bt ^ br), 1u);
      {
        bc += 0xca62c1d6u;
        bc += br;
        bc += ((be) ^ (bf) ^ (bg));
        bc += P(bd, 5u);
        be = P(be, 30u);
      };
      bs = P((bp ^ bk ^ bu ^ bs), 1u);
      {
        bg += 0xca62c1d6u;
        bg += bs;
        bg += ((bd) ^ (be) ^ (bf));
        bg += P(bc, 5u);
        bd = P(bd, 30u);
      };
      bt = P((bq ^ bl ^ bv ^ bt), 1u);
      {
        bf += 0xca62c1d6u;
        bf += bt;
        bf += ((bc) ^ (bd) ^ (be));
        bf += P(bg, 5u);
        bc = P(bc, 30u);
      };
      bu = P((br ^ bm ^ bw ^ bu), 1u);
      {
        be += 0xca62c1d6u;
        be += bu;
        be += ((bg) ^ (bc) ^ (bd));
        be += P(bf, 5u);
        bg = P(bg, 30u);
      };
      bv = P((bs ^ bn ^ bh ^ bv), 1u);
      {
        bd += 0xca62c1d6u;
        bd += bv;
        bd += ((bf) ^ (bg) ^ (bc));
        bd += P(be, 5u);
        bf = P(bf, 30u);
      };
      bw = P((bt ^ bo ^ bi ^ bw), 1u);
      {
        bc += 0xca62c1d6u;
        bc += bw;
        bc += ((be) ^ (bf) ^ (bg));
        bc += P(bd, 5u);
        be = P(be, 30u);
      };

      bc += am[0];
      bd += am[1];
      be += am[2];
      bf += am[3];
      bg += am[4];

      bb[0] = ba[0];
      bb[1] = ba[1];
      bb[2] = ba[2];
      bb[3] = ba[3];
      bb[4] = ba[4];
      bb[5] = ba[5];
      bb[6] = ba[6];
      bb[7] = ba[7];
      bb[8] = ba[8];
      bb[9] = ba[9];
      bb[10] = ba[10];
      bb[11] = ba[11];
      bb[12] = ba[12];
      bb[13] = ba[13];
      bb[14] = ba[14];
      bb[15] = ba[15];
    }

    u32x bh = bb[0];
    u32x bi = bb[1];
    u32x bj = bb[2];
    u32x bk = bb[3];
    u32x bl = bb[4];
    u32x bm = bb[5];
    u32x bn = bb[6];
    u32x bo = bb[7];
    u32x bp = bb[8];
    u32x bq = bb[9];
    u32x br = bb[10];
    u32x bs = bb[11];
    u32x bt = bb[12];
    u32x bu = bb[13];
    u32x bv = 0;
    u32x bw = az * 8;

    u32x bx = bc;
    u32x by = bd;
    u32x bz = be;
    u32x ca = bf;
    u32x cb = bg;

    {
      bg += 0x5a827999u;
      bg += bh;
      bg += ((((bf)) ^ (((bd)) & (((be)) ^ ((bf))))));
      bg += P(bc, 5u);
      bd = P(bd, 30u);
    };
    {
      bf += 0x5a827999u;
      bf += bi;
      bf += ((((be)) ^ (((bc)) & (((bd)) ^ ((be))))));
      bf += P(bg, 5u);
      bc = P(bc, 30u);
    };
    {
      be += 0x5a827999u;
      be += bj;
      be += ((((bd)) ^ (((bg)) & (((bc)) ^ ((bd))))));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    {
      bd += 0x5a827999u;
      bd += bk;
      bd += ((((bc)) ^ (((bf)) & (((bg)) ^ ((bc))))));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    {
      bc += 0x5a827999u;
      bc += bl;
      bc += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    {
      bg += 0x5a827999u;
      bg += bm;
      bg += ((((bf)) ^ (((bd)) & (((be)) ^ ((bf))))));
      bg += P(bc, 5u);
      bd = P(bd, 30u);
    };
    {
      bf += 0x5a827999u;
      bf += bn;
      bf += ((((be)) ^ (((bc)) & (((bd)) ^ ((be))))));
      bf += P(bg, 5u);
      bc = P(bc, 30u);
    };
    {
      be += 0x5a827999u;
      be += bo;
      be += ((((bd)) ^ (((bg)) & (((bc)) ^ ((bd))))));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    {
      bd += 0x5a827999u;
      bd += bp;
      bd += ((((bc)) ^ (((bf)) & (((bg)) ^ ((bc))))));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    {
      bc += 0x5a827999u;
      bc += bq;
      bc += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    {
      bg += 0x5a827999u;
      bg += br;
      bg += ((((bf)) ^ (((bd)) & (((be)) ^ ((bf))))));
      bg += P(bc, 5u);
      bd = P(bd, 30u);
    };
    {
      bf += 0x5a827999u;
      bf += bs;
      bf += ((((be)) ^ (((bc)) & (((bd)) ^ ((be))))));
      bf += P(bg, 5u);
      bc = P(bc, 30u);
    };
    {
      be += 0x5a827999u;
      be += bt;
      be += ((((bd)) ^ (((bg)) & (((bc)) ^ ((bd))))));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    {
      bd += 0x5a827999u;
      bd += bu;
      bd += ((((bc)) ^ (((bf)) & (((bg)) ^ ((bc))))));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    {
      bc += 0x5a827999u;
      bc += bv;
      bc += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    {
      bg += 0x5a827999u;
      bg += bw;
      bg += ((((bf)) ^ (((bd)) & (((be)) ^ ((bf))))));
      bg += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bh = P((bu ^ bp ^ bj ^ bh), 1u);
    {
      bf += 0x5a827999u;
      bf += bh;
      bf += ((((be)) ^ (((bc)) & (((bd)) ^ ((be))))));
      bf += P(bg, 5u);
      bc = P(bc, 30u);
    };
    bi = P((bv ^ bq ^ bk ^ bi), 1u);
    {
      be += 0x5a827999u;
      be += bi;
      be += ((((bd)) ^ (((bg)) & (((bc)) ^ ((bd))))));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bj = P((bw ^ br ^ bl ^ bj), 1u);
    {
      bd += 0x5a827999u;
      bd += bj;
      bd += ((((bc)) ^ (((bf)) & (((bg)) ^ ((bc))))));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    bk = P((bh ^ bs ^ bm ^ bk), 1u);
    {
      bc += 0x5a827999u;
      bc += bk;
      bc += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };

    bl = P((bi ^ bt ^ bn ^ bl), 1u);
    {
      bg += 0x6ed9eba1u;
      bg += bl;
      bg += ((bd) ^ (be) ^ (bf));
      bg += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bm = P((bj ^ bu ^ bo ^ bm), 1u);
    {
      bf += 0x6ed9eba1u;
      bf += bm;
      bf += ((bc) ^ (bd) ^ (be));
      bf += P(bg, 5u);
      bc = P(bc, 30u);
    };
    bn = P((bk ^ bv ^ bp ^ bn), 1u);
    {
      be += 0x6ed9eba1u;
      be += bn;
      be += ((bg) ^ (bc) ^ (bd));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bo = P((bl ^ bw ^ bq ^ bo), 1u);
    {
      bd += 0x6ed9eba1u;
      bd += bo;
      bd += ((bf) ^ (bg) ^ (bc));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    bp = P((bm ^ bh ^ br ^ bp), 1u);
    {
      bc += 0x6ed9eba1u;
      bc += bp;
      bc += ((be) ^ (bf) ^ (bg));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    bq = P((bn ^ bi ^ bs ^ bq), 1u);
    {
      bg += 0x6ed9eba1u;
      bg += bq;
      bg += ((bd) ^ (be) ^ (bf));
      bg += P(bc, 5u);
      bd = P(bd, 30u);
    };
    br = P((bo ^ bj ^ bt ^ br), 1u);
    {
      bf += 0x6ed9eba1u;
      bf += br;
      bf += ((bc) ^ (bd) ^ (be));
      bf += P(bg, 5u);
      bc = P(bc, 30u);
    };
    bs = P((bp ^ bk ^ bu ^ bs), 1u);
    {
      be += 0x6ed9eba1u;
      be += bs;
      be += ((bg) ^ (bc) ^ (bd));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bt = P((bq ^ bl ^ bv ^ bt), 1u);
    {
      bd += 0x6ed9eba1u;
      bd += bt;
      bd += ((bf) ^ (bg) ^ (bc));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    bu = P((br ^ bm ^ bw ^ bu), 1u);
    {
      bc += 0x6ed9eba1u;
      bc += bu;
      bc += ((be) ^ (bf) ^ (bg));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    bv = P((bs ^ bn ^ bh ^ bv), 1u);
    {
      bg += 0x6ed9eba1u;
      bg += bv;
      bg += ((bd) ^ (be) ^ (bf));
      bg += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bw = P((bt ^ bo ^ bi ^ bw), 1u);
    {
      bf += 0x6ed9eba1u;
      bf += bw;
      bf += ((bc) ^ (bd) ^ (be));
      bf += P(bg, 5u);
      bc = P(bc, 30u);
    };
    bh = P((bu ^ bp ^ bj ^ bh), 1u);
    {
      be += 0x6ed9eba1u;
      be += bh;
      be += ((bg) ^ (bc) ^ (bd));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bi = P((bv ^ bq ^ bk ^ bi), 1u);
    {
      bd += 0x6ed9eba1u;
      bd += bi;
      bd += ((bf) ^ (bg) ^ (bc));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    bj = P((bw ^ br ^ bl ^ bj), 1u);
    {
      bc += 0x6ed9eba1u;
      bc += bj;
      bc += ((be) ^ (bf) ^ (bg));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    bk = P((bh ^ bs ^ bm ^ bk), 1u);
    {
      bg += 0x6ed9eba1u;
      bg += bk;
      bg += ((bd) ^ (be) ^ (bf));
      bg += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bl = P((bi ^ bt ^ bn ^ bl), 1u);
    {
      bf += 0x6ed9eba1u;
      bf += bl;
      bf += ((bc) ^ (bd) ^ (be));
      bf += P(bg, 5u);
      bc = P(bc, 30u);
    };
    bm = P((bj ^ bu ^ bo ^ bm), 1u);
    {
      be += 0x6ed9eba1u;
      be += bm;
      be += ((bg) ^ (bc) ^ (bd));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bn = P((bk ^ bv ^ bp ^ bn), 1u);
    {
      bd += 0x6ed9eba1u;
      bd += bn;
      bd += ((bf) ^ (bg) ^ (bc));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    bo = P((bl ^ bw ^ bq ^ bo), 1u);
    {
      bc += 0x6ed9eba1u;
      bc += bo;
      bc += ((be) ^ (bf) ^ (bg));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };

    bp = P((bm ^ bh ^ br ^ bp), 1u);
    {
      bg += 0x8f1bbcdcu;
      bg += bp;
      bg += (((((bd)) & ((be))) | (((bf)) & (((bd)) ^ ((be))))));
      bg += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bq = P((bn ^ bi ^ bs ^ bq), 1u);
    {
      bf += 0x8f1bbcdcu;
      bf += bq;
      bf += (((((bc)) & ((bd))) | (((be)) & (((bc)) ^ ((bd))))));
      bf += P(bg, 5u);
      bc = P(bc, 30u);
    };
    br = P((bo ^ bj ^ bt ^ br), 1u);
    {
      be += 0x8f1bbcdcu;
      be += br;
      be += (((((bg)) & ((bc))) | (((bd)) & (((bg)) ^ ((bc))))));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bs = P((bp ^ bk ^ bu ^ bs), 1u);
    {
      bd += 0x8f1bbcdcu;
      bd += bs;
      bd += (((((bf)) & ((bg))) | (((bc)) & (((bf)) ^ ((bg))))));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    bt = P((bq ^ bl ^ bv ^ bt), 1u);
    {
      bc += 0x8f1bbcdcu;
      bc += bt;
      bc += (((((be)) & ((bf))) | (((bg)) & (((be)) ^ ((bf))))));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    bu = P((br ^ bm ^ bw ^ bu), 1u);
    {
      bg += 0x8f1bbcdcu;
      bg += bu;
      bg += (((((bd)) & ((be))) | (((bf)) & (((bd)) ^ ((be))))));
      bg += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bv = P((bs ^ bn ^ bh ^ bv), 1u);
    {
      bf += 0x8f1bbcdcu;
      bf += bv;
      bf += (((((bc)) & ((bd))) | (((be)) & (((bc)) ^ ((bd))))));
      bf += P(bg, 5u);
      bc = P(bc, 30u);
    };
    bw = P((bt ^ bo ^ bi ^ bw), 1u);
    {
      be += 0x8f1bbcdcu;
      be += bw;
      be += (((((bg)) & ((bc))) | (((bd)) & (((bg)) ^ ((bc))))));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bh = P((bu ^ bp ^ bj ^ bh), 1u);
    {
      bd += 0x8f1bbcdcu;
      bd += bh;
      bd += (((((bf)) & ((bg))) | (((bc)) & (((bf)) ^ ((bg))))));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    bi = P((bv ^ bq ^ bk ^ bi), 1u);
    {
      bc += 0x8f1bbcdcu;
      bc += bi;
      bc += (((((be)) & ((bf))) | (((bg)) & (((be)) ^ ((bf))))));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    bj = P((bw ^ br ^ bl ^ bj), 1u);
    {
      bg += 0x8f1bbcdcu;
      bg += bj;
      bg += (((((bd)) & ((be))) | (((bf)) & (((bd)) ^ ((be))))));
      bg += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bk = P((bh ^ bs ^ bm ^ bk), 1u);
    {
      bf += 0x8f1bbcdcu;
      bf += bk;
      bf += (((((bc)) & ((bd))) | (((be)) & (((bc)) ^ ((bd))))));
      bf += P(bg, 5u);
      bc = P(bc, 30u);
    };
    bl = P((bi ^ bt ^ bn ^ bl), 1u);
    {
      be += 0x8f1bbcdcu;
      be += bl;
      be += (((((bg)) & ((bc))) | (((bd)) & (((bg)) ^ ((bc))))));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bm = P((bj ^ bu ^ bo ^ bm), 1u);
    {
      bd += 0x8f1bbcdcu;
      bd += bm;
      bd += (((((bf)) & ((bg))) | (((bc)) & (((bf)) ^ ((bg))))));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    bn = P((bk ^ bv ^ bp ^ bn), 1u);
    {
      bc += 0x8f1bbcdcu;
      bc += bn;
      bc += (((((be)) & ((bf))) | (((bg)) & (((be)) ^ ((bf))))));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    bo = P((bl ^ bw ^ bq ^ bo), 1u);
    {
      bg += 0x8f1bbcdcu;
      bg += bo;
      bg += (((((bd)) & ((be))) | (((bf)) & (((bd)) ^ ((be))))));
      bg += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bp = P((bm ^ bh ^ br ^ bp), 1u);
    {
      bf += 0x8f1bbcdcu;
      bf += bp;
      bf += (((((bc)) & ((bd))) | (((be)) & (((bc)) ^ ((bd))))));
      bf += P(bg, 5u);
      bc = P(bc, 30u);
    };
    bq = P((bn ^ bi ^ bs ^ bq), 1u);
    {
      be += 0x8f1bbcdcu;
      be += bq;
      be += (((((bg)) & ((bc))) | (((bd)) & (((bg)) ^ ((bc))))));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    br = P((bo ^ bj ^ bt ^ br), 1u);
    {
      bd += 0x8f1bbcdcu;
      bd += br;
      bd += (((((bf)) & ((bg))) | (((bc)) & (((bf)) ^ ((bg))))));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    bs = P((bp ^ bk ^ bu ^ bs), 1u);
    {
      bc += 0x8f1bbcdcu;
      bc += bs;
      bc += (((((be)) & ((bf))) | (((bg)) & (((be)) ^ ((bf))))));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };

    bt = P((bq ^ bl ^ bv ^ bt), 1u);
    {
      bg += 0xca62c1d6u;
      bg += bt;
      bg += ((bd) ^ (be) ^ (bf));
      bg += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bu = P((br ^ bm ^ bw ^ bu), 1u);
    {
      bf += 0xca62c1d6u;
      bf += bu;
      bf += ((bc) ^ (bd) ^ (be));
      bf += P(bg, 5u);
      bc = P(bc, 30u);
    };
    bv = P((bs ^ bn ^ bh ^ bv), 1u);
    {
      be += 0xca62c1d6u;
      be += bv;
      be += ((bg) ^ (bc) ^ (bd));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bw = P((bt ^ bo ^ bi ^ bw), 1u);
    {
      bd += 0xca62c1d6u;
      bd += bw;
      bd += ((bf) ^ (bg) ^ (bc));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    bh = P((bu ^ bp ^ bj ^ bh), 1u);
    {
      bc += 0xca62c1d6u;
      bc += bh;
      bc += ((be) ^ (bf) ^ (bg));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    bi = P((bv ^ bq ^ bk ^ bi), 1u);
    {
      bg += 0xca62c1d6u;
      bg += bi;
      bg += ((bd) ^ (be) ^ (bf));
      bg += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bj = P((bw ^ br ^ bl ^ bj), 1u);
    {
      bf += 0xca62c1d6u;
      bf += bj;
      bf += ((bc) ^ (bd) ^ (be));
      bf += P(bg, 5u);
      bc = P(bc, 30u);
    };
    bk = P((bh ^ bs ^ bm ^ bk), 1u);
    {
      be += 0xca62c1d6u;
      be += bk;
      be += ((bg) ^ (bc) ^ (bd));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bl = P((bi ^ bt ^ bn ^ bl), 1u);
    {
      bd += 0xca62c1d6u;
      bd += bl;
      bd += ((bf) ^ (bg) ^ (bc));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    bm = P((bj ^ bu ^ bo ^ bm), 1u);
    {
      bc += 0xca62c1d6u;
      bc += bm;
      bc += ((be) ^ (bf) ^ (bg));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    bn = P((bk ^ bv ^ bp ^ bn), 1u);
    {
      bg += 0xca62c1d6u;
      bg += bn;
      bg += ((bd) ^ (be) ^ (bf));
      bg += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bo = P((bl ^ bw ^ bq ^ bo), 1u);
    {
      bf += 0xca62c1d6u;
      bf += bo;
      bf += ((bc) ^ (bd) ^ (be));
      bf += P(bg, 5u);
      bc = P(bc, 30u);
    };
    bp = P((bm ^ bh ^ br ^ bp), 1u);
    {
      be += 0xca62c1d6u;
      be += bp;
      be += ((bg) ^ (bc) ^ (bd));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bq = P((bn ^ bi ^ bs ^ bq), 1u);
    {
      bd += 0xca62c1d6u;
      bd += bq;
      bd += ((bf) ^ (bg) ^ (bc));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    br = P((bo ^ bj ^ bt ^ br), 1u);
    {
      bc += 0xca62c1d6u;
      bc += br;
      bc += ((be) ^ (bf) ^ (bg));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };
    bs = P((bp ^ bk ^ bu ^ bs), 1u);
    {
      bg += 0xca62c1d6u;
      bg += bs;
      bg += ((bd) ^ (be) ^ (bf));
      bg += P(bc, 5u);
      bd = P(bd, 30u);
    };
    bt = P((bq ^ bl ^ bv ^ bt), 1u);
    {
      bf += 0xca62c1d6u;
      bf += bt;
      bf += ((bc) ^ (bd) ^ (be));
      bf += P(bg, 5u);
      bc = P(bc, 30u);
    };
    bu = P((br ^ bm ^ bw ^ bu), 1u);
    {
      be += 0xca62c1d6u;
      be += bu;
      be += ((bg) ^ (bc) ^ (bd));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bv = P((bs ^ bn ^ bh ^ bv), 1u);
    {
      bd += 0xca62c1d6u;
      bd += bv;
      bd += ((bf) ^ (bg) ^ (bc));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    bw = P((bt ^ bo ^ bi ^ bw), 1u);
    {
      bc += 0xca62c1d6u;
      bc += bw;
      bc += ((be) ^ (bf) ^ (bg));
      bc += P(bd, 5u);
      be = P(be, 30u);
    };

    bc += bx;
    bd += by;
    be += bz;
    bf += ca;
    bg += cb;

    {
      const u32 cc[4] = {bff, bgg, bee, bdd};
      if (Z(cc, g, h, i, j, k, l, m, n, v, w, x)) {
        int cd = X(cc, ac, &p[ad]);
        if (cd != -1) {
          const u32 ce = ad + cd;
          if (atomic_add(&q[ce], 1) == 0) {
            AA(o, t, y, cd, ce, ah, as);
          }
        }
      }
    };
  }
}

__kernel void EA(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global pstoken_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa,
                 const u32 ab, const u32 ac, const u32 ad, const u32 ae, const u32 af) {
}

__kernel void EB(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global pstoken_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa,
                 const u32 ab, const u32 ac, const u32 ad, const u32 ae, const u32 af) {
}

__kernel void EC(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global pstoken_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa,
                 const u32 ab, const u32 ac, const u32 ad, const u32 ae, const u32 af) {
  const u32 ag = get_local_id(0);

  const u32 ah = get_global_id(0);

  if (ah >= af)
    return;

  u32 ai[4];
  u32 aj[4];

  ai[0] = a[ah].i[0];
  ai[1] = a[ah].i[1];
  ai[2] = a[ah].i[2];
  ai[3] = a[ah].i[3];
  aj[0] = a[ah].i[4];
  aj[1] = a[ah].i[5];
  aj[2] = a[ah].i[6];
  aj[3] = a[ah].i[7];

  const u32 ak = a[ah].pw_len;

  const u32 al = s[y].pc_offset;

  u32 am[5];

  am[0] = s[y].pc_digest[0];
  am[1] = s[y].pc_digest[1];
  am[2] = s[y].pc_digest[2];
  am[3] = s[y].pc_digest[3];
  am[4] = s[y].pc_digest[4];

  u32 an[4];
  u32 ao[4];
  u32 ap[4];
  u32 aq[4];

  an[0] = G(s[y].salt_buf[al + 0]);
  an[1] = G(s[y].salt_buf[al + 1]);
  an[2] = G(s[y].salt_buf[al + 2]);
  an[3] = G(s[y].salt_buf[al + 3]);
  ao[0] = G(s[y].salt_buf[al + 4]);
  ao[1] = G(s[y].salt_buf[al + 5]);
  ao[2] = G(s[y].salt_buf[al + 6]);
  ao[3] = G(s[y].salt_buf[al + 7]);
  ap[0] = G(s[y].salt_buf[al + 8]);
  ap[1] = G(s[y].salt_buf[al + 9]);
  ap[2] = G(s[y].salt_buf[al + 10]);
  ap[3] = G(s[y].salt_buf[al + 11]);
  aq[0] = G(s[y].salt_buf[al + 12]);
  aq[1] = G(s[y].salt_buf[al + 13]);
  aq[2] = G(s[y].salt_buf[al + 14]);
  aq[3] = G(s[y].salt_buf[al + 15]);

  const u32 ar = s[y].salt_len;

  const u32 as[4] =
ad[ad[ad[ad[1]
};

for (u32 at = 0; at < ab; at += 1) {
  u32x au[4] = {0};
  u32x av[4] = {0};
  u32x aw[4] = {0};
  u32x ax[4] = {0};

  const u32x ay = BW(ai, aj, ak, b, at, au, av);

  BR(au, av, ay);

  AC(av, aw, ax);
  AC(au, au, av);

  const u32x az = ay * 2;

  const u32x ba = az + ar;

  u32x bb[16];

  bb[0] = M(au[0]);
  bb[1] = M(au[1]);
  bb[2] = M(au[2]);
  bb[3] = M(au[3]);
  bb[4] = M(av[0]);
  bb[5] = M(av[1]);
  bb[6] = M(av[2]);
  bb[7] = M(av[3]);
  bb[8] = M(aw[0]);
  bb[9] = M(aw[1]);
  bb[10] = M(aw[2]);
  bb[11] = M(aw[3]);
  bb[12] = M(ax[0]);
  bb[13] = M(ax[1]);
  bb[14] = M(ax[2]);
  bb[15] = M(ax[3]);

  u32x bc[16];

  bc[0] = an[0];
  bc[1] = an[1];
  bc[2] = an[2];
  bc[3] = an[3];
  bc[4] = ao[0];
  bc[5] = ao[1];
  bc[6] = ao[2];
  bc[7] = ao[3];
  bc[8] = ap[0];
  bc[9] = ap[1];
  bc[10] = ap[2];
  bc[11] = ap[3];
  bc[12] = aq[0];
  bc[13] = aq[1];
  bc[14] = aq[2];
  bc[15] = aq[3];

  DY(bc, ar & 0x3f, bb);

  u32x bd = am[0];
  u32x be = am[1];
  u32x bf = am[2];
  u32x bg = am[3];
  u32x bh = am[4];

  if (((ar & 0x3f) + az) >= 56) {
    u32x bi = bc[0];
    u32x bj = bc[1];
    u32x bk = bc[2];
    u32x bl = bc[3];
    u32x bm = bc[4];
    u32x bn = bc[5];
    u32x bo = bc[6];
    u32x bp = bc[7];
    u32x bq = bc[8];
    u32x br = bc[9];
    u32x bs = bc[10];
    u32x bt = bc[11];
    u32x bu = bc[12];
    u32x bv = bc[13];
    u32x bw = bc[14];
    u32x bx = bc[15];

    {
      bh += 0x5a827999u;
      bh += bi;
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh += P(bd, 5u);
      be = P(be, 30u);
    };
    {
      bg += 0x5a827999u;
      bg += bj;
      bg += ((((bf)) ^ (((bd)) & (((be)) ^ ((bf))))));
      bg += P(bh, 5u);
      bd = P(bd, 30u);
    };
    {
      bf += 0x5a827999u;
      bf += bk;
      bf += ((((be)) ^ (((bh)) & (((bd)) ^ ((be))))));
      bf += P(bg, 5u);
      bh = P(bh, 30u);
    };
    {
      be += 0x5a827999u;
      be += bl;
      be += ((((bd)) ^ (((bg)) & (((bh)) ^ ((bd))))));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    {
      bd += 0x5a827999u;
      bd += bm;
      bd += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    {
      bh += 0x5a827999u;
      bh += bn;
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh += P(bd, 5u);
      be = P(be, 30u);
    };
    {
      bg += 0x5a827999u;
      bg += bo;
      bg += ((((bf)) ^ (((bd)) & (((be)) ^ ((bf))))));
      bg += P(bh, 5u);
      bd = P(bd, 30u);
    };
    {
      bf += 0x5a827999u;
      bf += bp;
      bf += ((((be)) ^ (((bh)) & (((bd)) ^ ((be))))));
      bf += P(bg, 5u);
      bh = P(bh, 30u);
    };
    {
      be += 0x5a827999u;
      be += bq;
      be += ((((bd)) ^ (((bg)) & (((bh)) ^ ((bd))))));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    {
      bd += 0x5a827999u;
      bd += br;
      bd += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    {
      bh += 0x5a827999u;
      bh += bs;
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh += P(bd, 5u);
      be = P(be, 30u);
    };
    {
      bg += 0x5a827999u;
      bg += bt;
      bg += ((((bf)) ^ (((bd)) & (((be)) ^ ((bf))))));
      bg += P(bh, 5u);
      bd = P(bd, 30u);
    };
    {
      bf += 0x5a827999u;
      bf += bu;
      bf += ((((be)) ^ (((bh)) & (((bd)) ^ ((be))))));
      bf += P(bg, 5u);
      bh = P(bh, 30u);
    };
    {
      be += 0x5a827999u;
      be += bv;
      be += ((((bd)) ^ (((bg)) & (((bh)) ^ ((bd))))));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    {
      bd += 0x5a827999u;
      bd += bw;
      bd += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    {
      bh += 0x5a827999u;
      bh += bx;
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh += P(bd, 5u);
      be = P(be, 30u);
    };
    bi = P((bv ^ bq ^ bk ^ bi), 1u);
    {
      bg += 0x5a827999u;
      bg += bi;
      bg += ((((bf)) ^ (((bd)) & (((be)) ^ ((bf))))));
      bg += P(bh, 5u);
      bd = P(bd, 30u);
    };
    bj = P((bw ^ br ^ bl ^ bj), 1u);
    {
      bf += 0x5a827999u;
      bf += bj;
      bf += ((((be)) ^ (((bh)) & (((bd)) ^ ((be))))));
      bf += P(bg, 5u);
      bh = P(bh, 30u);
    };
    bk = P((bx ^ bs ^ bm ^ bk), 1u);
    {
      be += 0x5a827999u;
      be += bk;
      be += ((((bd)) ^ (((bg)) & (((bh)) ^ ((bd))))));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bl = P((bi ^ bt ^ bn ^ bl), 1u);
    {
      bd += 0x5a827999u;
      bd += bl;
      bd += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };

    bm = P((bj ^ bu ^ bo ^ bm), 1u);
    {
      bh += 0x6ed9eba1u;
      bh += bm;
      bh += ((be) ^ (bf) ^ (bg));
      bh += P(bd, 5u);
      be = P(be, 30u);
    };
    bn = P((bk ^ bv ^ bp ^ bn), 1u);
    {
      bg += 0x6ed9eba1u;
      bg += bn;
      bg += ((bd) ^ (be) ^ (bf));
      bg += P(bh, 5u);
      bd = P(bd, 30u);
    };
    bo = P((bl ^ bw ^ bq ^ bo), 1u);
    {
      bf += 0x6ed9eba1u;
      bf += bo;
      bf += ((bh) ^ (bd) ^ (be));
      bf += P(bg, 5u);
      bh = P(bh, 30u);
    };
    bp = P((bm ^ bx ^ br ^ bp), 1u);
    {
      be += 0x6ed9eba1u;
      be += bp;
      be += ((bg) ^ (bh) ^ (bd));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bq = P((bn ^ bi ^ bs ^ bq), 1u);
    {
      bd += 0x6ed9eba1u;
      bd += bq;
      bd += ((bf) ^ (bg) ^ (bh));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    br = P((bo ^ bj ^ bt ^ br), 1u);
    {
      bh += 0x6ed9eba1u;
      bh += br;
      bh += ((be) ^ (bf) ^ (bg));
      bh += P(bd, 5u);
      be = P(be, 30u);
    };
    bs = P((bp ^ bk ^ bu ^ bs), 1u);
    {
      bg += 0x6ed9eba1u;
      bg += bs;
      bg += ((bd) ^ (be) ^ (bf));
      bg += P(bh, 5u);
      bd = P(bd, 30u);
    };
    bt = P((bq ^ bl ^ bv ^ bt), 1u);
    {
      bf += 0x6ed9eba1u;
      bf += bt;
      bf += ((bh) ^ (bd) ^ (be));
      bf += P(bg, 5u);
      bh = P(bh, 30u);
    };
    bu = P((br ^ bm ^ bw ^ bu), 1u);
    {
      be += 0x6ed9eba1u;
      be += bu;
      be += ((bg) ^ (bh) ^ (bd));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bv = P((bs ^ bn ^ bx ^ bv), 1u);
    {
      bd += 0x6ed9eba1u;
      bd += bv;
      bd += ((bf) ^ (bg) ^ (bh));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    bw = P((bt ^ bo ^ bi ^ bw), 1u);
    {
      bh += 0x6ed9eba1u;
      bh += bw;
      bh += ((be) ^ (bf) ^ (bg));
      bh += P(bd, 5u);
      be = P(be, 30u);
    };
    bx = P((bu ^ bp ^ bj ^ bx), 1u);
    {
      bg += 0x6ed9eba1u;
      bg += bx;
      bg += ((bd) ^ (be) ^ (bf));
      bg += P(bh, 5u);
      bd = P(bd, 30u);
    };
    bi = P((bv ^ bq ^ bk ^ bi), 1u);
    {
      bf += 0x6ed9eba1u;
      bf += bi;
      bf += ((bh) ^ (bd) ^ (be));
      bf += P(bg, 5u);
      bh = P(bh, 30u);
    };
    bj = P((bw ^ br ^ bl ^ bj), 1u);
    {
      be += 0x6ed9eba1u;
      be += bj;
      be += ((bg) ^ (bh) ^ (bd));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bk = P((bx ^ bs ^ bm ^ bk), 1u);
    {
      bd += 0x6ed9eba1u;
      bd += bk;
      bd += ((bf) ^ (bg) ^ (bh));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    bl = P((bi ^ bt ^ bn ^ bl), 1u);
    {
      bh += 0x6ed9eba1u;
      bh += bl;
      bh += ((be) ^ (bf) ^ (bg));
      bh += P(bd, 5u);
      be = P(be, 30u);
    };
    bm = P((bj ^ bu ^ bo ^ bm), 1u);
    {
      bg += 0x6ed9eba1u;
      bg += bm;
      bg += ((bd) ^ (be) ^ (bf));
      bg += P(bh, 5u);
      bd = P(bd, 30u);
    };
    bn = P((bk ^ bv ^ bp ^ bn), 1u);
    {
      bf += 0x6ed9eba1u;
      bf += bn;
      bf += ((bh) ^ (bd) ^ (be));
      bf += P(bg, 5u);
      bh = P(bh, 30u);
    };
    bo = P((bl ^ bw ^ bq ^ bo), 1u);
    {
      be += 0x6ed9eba1u;
      be += bo;
      be += ((bg) ^ (bh) ^ (bd));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bp = P((bm ^ bx ^ br ^ bp), 1u);
    {
      bd += 0x6ed9eba1u;
      bd += bp;
      bd += ((bf) ^ (bg) ^ (bh));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };

    bq = P((bn ^ bi ^ bs ^ bq), 1u);
    {
      bh += 0x8f1bbcdcu;
      bh += bq;
      bh += (((((be)) & ((bf))) | (((bg)) & (((be)) ^ ((bf))))));
      bh += P(bd, 5u);
      be = P(be, 30u);
    };
    br = P((bo ^ bj ^ bt ^ br), 1u);
    {
      bg += 0x8f1bbcdcu;
      bg += br;
      bg += (((((bd)) & ((be))) | (((bf)) & (((bd)) ^ ((be))))));
      bg += P(bh, 5u);
      bd = P(bd, 30u);
    };
    bs = P((bp ^ bk ^ bu ^ bs), 1u);
    {
      bf += 0x8f1bbcdcu;
      bf += bs;
      bf += (((((bh)) & ((bd))) | (((be)) & (((bh)) ^ ((bd))))));
      bf += P(bg, 5u);
      bh = P(bh, 30u);
    };
    bt = P((bq ^ bl ^ bv ^ bt), 1u);
    {
      be += 0x8f1bbcdcu;
      be += bt;
      be += (((((bg)) & ((bh))) | (((bd)) & (((bg)) ^ ((bh))))));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bu = P((br ^ bm ^ bw ^ bu), 1u);
    {
      bd += 0x8f1bbcdcu;
      bd += bu;
      bd += (((((bf)) & ((bg))) | (((bh)) & (((bf)) ^ ((bg))))));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    bv = P((bs ^ bn ^ bx ^ bv), 1u);
    {
      bh += 0x8f1bbcdcu;
      bh += bv;
      bh += (((((be)) & ((bf))) | (((bg)) & (((be)) ^ ((bf))))));
      bh += P(bd, 5u);
      be = P(be, 30u);
    };
    bw = P((bt ^ bo ^ bi ^ bw), 1u);
    {
      bg += 0x8f1bbcdcu;
      bg += bw;
      bg += (((((bd)) & ((be))) | (((bf)) & (((bd)) ^ ((be))))));
      bg += P(bh, 5u);
      bd = P(bd, 30u);
    };
    bx = P((bu ^ bp ^ bj ^ bx), 1u);
    {
      bf += 0x8f1bbcdcu;
      bf += bx;
      bf += (((((bh)) & ((bd))) | (((be)) & (((bh)) ^ ((bd))))));
      bf += P(bg, 5u);
      bh = P(bh, 30u);
    };
    bi = P((bv ^ bq ^ bk ^ bi), 1u);
    {
      be += 0x8f1bbcdcu;
      be += bi;
      be += (((((bg)) & ((bh))) | (((bd)) & (((bg)) ^ ((bh))))));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bj = P((bw ^ br ^ bl ^ bj), 1u);
    {
      bd += 0x8f1bbcdcu;
      bd += bj;
      bd += (((((bf)) & ((bg))) | (((bh)) & (((bf)) ^ ((bg))))));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    bk = P((bx ^ bs ^ bm ^ bk), 1u);
    {
      bh += 0x8f1bbcdcu;
      bh += bk;
      bh += (((((be)) & ((bf))) | (((bg)) & (((be)) ^ ((bf))))));
      bh += P(bd, 5u);
      be = P(be, 30u);
    };
    bl = P((bi ^ bt ^ bn ^ bl), 1u);
    {
      bg += 0x8f1bbcdcu;
      bg += bl;
      bg += (((((bd)) & ((be))) | (((bf)) & (((bd)) ^ ((be))))));
      bg += P(bh, 5u);
      bd = P(bd, 30u);
    };
    bm = P((bj ^ bu ^ bo ^ bm), 1u);
    {
      bf += 0x8f1bbcdcu;
      bf += bm;
      bf += (((((bh)) & ((bd))) | (((be)) & (((bh)) ^ ((bd))))));
      bf += P(bg, 5u);
      bh = P(bh, 30u);
    };
    bn = P((bk ^ bv ^ bp ^ bn), 1u);
    {
      be += 0x8f1bbcdcu;
      be += bn;
      be += (((((bg)) & ((bh))) | (((bd)) & (((bg)) ^ ((bh))))));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bo = P((bl ^ bw ^ bq ^ bo), 1u);
    {
      bd += 0x8f1bbcdcu;
      bd += bo;
      bd += (((((bf)) & ((bg))) | (((bh)) & (((bf)) ^ ((bg))))));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    bp = P((bm ^ bx ^ br ^ bp), 1u);
    {
      bh += 0x8f1bbcdcu;
      bh += bp;
      bh += (((((be)) & ((bf))) | (((bg)) & (((be)) ^ ((bf))))));
      bh += P(bd, 5u);
      be = P(be, 30u);
    };
    bq = P((bn ^ bi ^ bs ^ bq), 1u);
    {
      bg += 0x8f1bbcdcu;
      bg += bq;
      bg += (((((bd)) & ((be))) | (((bf)) & (((bd)) ^ ((be))))));
      bg += P(bh, 5u);
      bd = P(bd, 30u);
    };
    br = P((bo ^ bj ^ bt ^ br), 1u);
    {
      bf += 0x8f1bbcdcu;
      bf += br;
      bf += (((((bh)) & ((bd))) | (((be)) & (((bh)) ^ ((bd))))));
      bf += P(bg, 5u);
      bh = P(bh, 30u);
    };
    bs = P((bp ^ bk ^ bu ^ bs), 1u);
    {
      be += 0x8f1bbcdcu;
      be += bs;
      be += (((((bg)) & ((bh))) | (((bd)) & (((bg)) ^ ((bh))))));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bt = P((bq ^ bl ^ bv ^ bt), 1u);
    {
      bd += 0x8f1bbcdcu;
      bd += bt;
      bd += (((((bf)) & ((bg))) | (((bh)) & (((bf)) ^ ((bg))))));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };

    bu = P((br ^ bm ^ bw ^ bu), 1u);
    {
      bh += 0xca62c1d6u;
      bh += bu;
      bh += ((be) ^ (bf) ^ (bg));
      bh += P(bd, 5u);
      be = P(be, 30u);
    };
    bv = P((bs ^ bn ^ bx ^ bv), 1u);
    {
      bg += 0xca62c1d6u;
      bg += bv;
      bg += ((bd) ^ (be) ^ (bf));
      bg += P(bh, 5u);
      bd = P(bd, 30u);
    };
    bw = P((bt ^ bo ^ bi ^ bw), 1u);
    {
      bf += 0xca62c1d6u;
      bf += bw;
      bf += ((bh) ^ (bd) ^ (be));
      bf += P(bg, 5u);
      bh = P(bh, 30u);
    };
    bx = P((bu ^ bp ^ bj ^ bx), 1u);
    {
      be += 0xca62c1d6u;
      be += bx;
      be += ((bg) ^ (bh) ^ (bd));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bi = P((bv ^ bq ^ bk ^ bi), 1u);
    {
      bd += 0xca62c1d6u;
      bd += bi;
      bd += ((bf) ^ (bg) ^ (bh));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    bj = P((bw ^ br ^ bl ^ bj), 1u);
    {
      bh += 0xca62c1d6u;
      bh += bj;
      bh += ((be) ^ (bf) ^ (bg));
      bh += P(bd, 5u);
      be = P(be, 30u);
    };
    bk = P((bx ^ bs ^ bm ^ bk), 1u);
    {
      bg += 0xca62c1d6u;
      bg += bk;
      bg += ((bd) ^ (be) ^ (bf));
      bg += P(bh, 5u);
      bd = P(bd, 30u);
    };
    bl = P((bi ^ bt ^ bn ^ bl), 1u);
    {
      bf += 0xca62c1d6u;
      bf += bl;
      bf += ((bh) ^ (bd) ^ (be));
      bf += P(bg, 5u);
      bh = P(bh, 30u);
    };
    bm = P((bj ^ bu ^ bo ^ bm), 1u);
    {
      be += 0xca62c1d6u;
      be += bm;
      be += ((bg) ^ (bh) ^ (bd));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bn = P((bk ^ bv ^ bp ^ bn), 1u);
    {
      bd += 0xca62c1d6u;
      bd += bn;
      bd += ((bf) ^ (bg) ^ (bh));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    bo = P((bl ^ bw ^ bq ^ bo), 1u);
    {
      bh += 0xca62c1d6u;
      bh += bo;
      bh += ((be) ^ (bf) ^ (bg));
      bh += P(bd, 5u);
      be = P(be, 30u);
    };
    bp = P((bm ^ bx ^ br ^ bp), 1u);
    {
      bg += 0xca62c1d6u;
      bg += bp;
      bg += ((bd) ^ (be) ^ (bf));
      bg += P(bh, 5u);
      bd = P(bd, 30u);
    };
    bq = P((bn ^ bi ^ bs ^ bq), 1u);
    {
      bf += 0xca62c1d6u;
      bf += bq;
      bf += ((bh) ^ (bd) ^ (be));
      bf += P(bg, 5u);
      bh = P(bh, 30u);
    };
    br = P((bo ^ bj ^ bt ^ br), 1u);
    {
      be += 0xca62c1d6u;
      be += br;
      be += ((bg) ^ (bh) ^ (bd));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bs = P((bp ^ bk ^ bu ^ bs), 1u);
    {
      bd += 0xca62c1d6u;
      bd += bs;
      bd += ((bf) ^ (bg) ^ (bh));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };
    bt = P((bq ^ bl ^ bv ^ bt), 1u);
    {
      bh += 0xca62c1d6u;
      bh += bt;
      bh += ((be) ^ (bf) ^ (bg));
      bh += P(bd, 5u);
      be = P(be, 30u);
    };
    bu = P((br ^ bm ^ bw ^ bu), 1u);
    {
      bg += 0xca62c1d6u;
      bg += bu;
      bg += ((bd) ^ (be) ^ (bf));
      bg += P(bh, 5u);
      bd = P(bd, 30u);
    };
    bv = P((bs ^ bn ^ bx ^ bv), 1u);
    {
      bf += 0xca62c1d6u;
      bf += bv;
      bf += ((bh) ^ (bd) ^ (be));
      bf += P(bg, 5u);
      bh = P(bh, 30u);
    };
    bw = P((bt ^ bo ^ bi ^ bw), 1u);
    {
      be += 0xca62c1d6u;
      be += bw;
      be += ((bg) ^ (bh) ^ (bd));
      be += P(bf, 5u);
      bg = P(bg, 30u);
    };
    bx = P((bu ^ bp ^ bj ^ bx), 1u);
    {
      bd += 0xca62c1d6u;
      bd += bx;
      bd += ((bf) ^ (bg) ^ (bh));
      bd += P(be, 5u);
      bf = P(bf, 30u);
    };

    bd += am[0];
    be += am[1];
    bf += am[2];
    bg += am[3];
    bh += am[4];

    bc[0] = bb[0];
    bc[1] = bb[1];
    bc[2] = bb[2];
    bc[3] = bb[3];
    bc[4] = bb[4];
    bc[5] = bb[5];
    bc[6] = bb[6];
    bc[7] = bb[7];
    bc[8] = bb[8];
    bc[9] = bb[9];
    bc[10] = bb[10];
    bc[11] = bb[11];
    bc[12] = bb[12];
    bc[13] = bb[13];
    bc[14] = bb[14];
    bc[15] = bb[15];
  }

  u32x bi = bc[0];
  u32x bj = bc[1];
  u32x bk = bc[2];
  u32x bl = bc[3];
  u32x bm = bc[4];
  u32x bn = bc[5];
  u32x bo = bc[6];
  u32x bp = bc[7];
  u32x bq = bc[8];
  u32x br = bc[9];
  u32x bs = bc[10];
  u32x bt = bc[11];
  u32x bu = bc[12];
  u32x bv = bc[13];
  u32x bw = 0;
  u32x bx = ba * 8;

  u32x by = bd;
  u32x bz = be;
  u32x ca = bf;
  u32x cb = bg;
  u32x cc = bh;

  {
    bh += 0x5a827999u;
    bh += bi;
    bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
    bh += P(bd, 5u);
    be = P(be, 30u);
  };
  {
    bg += 0x5a827999u;
    bg += bj;
    bg += ((((bf)) ^ (((bd)) & (((be)) ^ ((bf))))));
    bg += P(bh, 5u);
    bd = P(bd, 30u);
  };
  {
    bf += 0x5a827999u;
    bf += bk;
    bf += ((((be)) ^ (((bh)) & (((bd)) ^ ((be))))));
    bf += P(bg, 5u);
    bh = P(bh, 30u);
  };
  {
    be += 0x5a827999u;
    be += bl;
    be += ((((bd)) ^ (((bg)) & (((bh)) ^ ((bd))))));
    be += P(bf, 5u);
    bg = P(bg, 30u);
  };
  {
    bd += 0x5a827999u;
    bd += bm;
    bd += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bd += P(be, 5u);
    bf = P(bf, 30u);
  };
  {
    bh += 0x5a827999u;
    bh += bn;
    bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
    bh += P(bd, 5u);
    be = P(be, 30u);
  };
  {
    bg += 0x5a827999u;
    bg += bo;
    bg += ((((bf)) ^ (((bd)) & (((be)) ^ ((bf))))));
    bg += P(bh, 5u);
    bd = P(bd, 30u);
  };
  {
    bf += 0x5a827999u;
    bf += bp;
    bf += ((((be)) ^ (((bh)) & (((bd)) ^ ((be))))));
    bf += P(bg, 5u);
    bh = P(bh, 30u);
  };
  {
    be += 0x5a827999u;
    be += bq;
    be += ((((bd)) ^ (((bg)) & (((bh)) ^ ((bd))))));
    be += P(bf, 5u);
    bg = P(bg, 30u);
  };
  {
    bd += 0x5a827999u;
    bd += br;
    bd += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bd += P(be, 5u);
    bf = P(bf, 30u);
  };
  {
    bh += 0x5a827999u;
    bh += bs;
    bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
    bh += P(bd, 5u);
    be = P(be, 30u);
  };
  {
    bg += 0x5a827999u;
    bg += bt;
    bg += ((((bf)) ^ (((bd)) & (((be)) ^ ((bf))))));
    bg += P(bh, 5u);
    bd = P(bd, 30u);
  };
  {
    bf += 0x5a827999u;
    bf += bu;
    bf += ((((be)) ^ (((bh)) & (((bd)) ^ ((be))))));
    bf += P(bg, 5u);
    bh = P(bh, 30u);
  };
  {
    be += 0x5a827999u;
    be += bv;
    be += ((((bd)) ^ (((bg)) & (((bh)) ^ ((bd))))));
    be += P(bf, 5u);
    bg = P(bg, 30u);
  };
  {
    bd += 0x5a827999u;
    bd += bw;
    bd += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bd += P(be, 5u);
    bf = P(bf, 30u);
  };
  {
    bh += 0x5a827999u;
    bh += bx;
    bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
    bh += P(bd, 5u);
    be = P(be, 30u);
  };
  bi = P((bv ^ bq ^ bk ^ bi), 1u);
  {
    bg += 0x5a827999u;
    bg += bi;
    bg += ((((bf)) ^ (((bd)) & (((be)) ^ ((bf))))));
    bg += P(bh, 5u);
    bd = P(bd, 30u);
  };
  bj = P((bw ^ br ^ bl ^ bj), 1u);
  {
    bf += 0x5a827999u;
    bf += bj;
    bf += ((((be)) ^ (((bh)) & (((bd)) ^ ((be))))));
    bf += P(bg, 5u);
    bh = P(bh, 30u);
  };
  bk = P((bx ^ bs ^ bm ^ bk), 1u);
  {
    be += 0x5a827999u;
    be += bk;
    be += ((((bd)) ^ (((bg)) & (((bh)) ^ ((bd))))));
    be += P(bf, 5u);
    bg = P(bg, 30u);
  };
  bl = P((bi ^ bt ^ bn ^ bl), 1u);
  {
    bd += 0x5a827999u;
    bd += bl;
    bd += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bd += P(be, 5u);
    bf = P(bf, 30u);
  };

  bm = P((bj ^ bu ^ bo ^ bm), 1u);
  {
    bh += 0x6ed9eba1u;
    bh += bm;
    bh += ((be) ^ (bf) ^ (bg));
    bh += P(bd, 5u);
    be = P(be, 30u);
  };
  bn = P((bk ^ bv ^ bp ^ bn), 1u);
  {
    bg += 0x6ed9eba1u;
    bg += bn;
    bg += ((bd) ^ (be) ^ (bf));
    bg += P(bh, 5u);
    bd = P(bd, 30u);
  };
  bo = P((bl ^ bw ^ bq ^ bo), 1u);
  {
    bf += 0x6ed9eba1u;
    bf += bo;
    bf += ((bh) ^ (bd) ^ (be));
    bf += P(bg, 5u);
    bh = P(bh, 30u);
  };
  bp = P((bm ^ bx ^ br ^ bp), 1u);
  {
    be += 0x6ed9eba1u;
    be += bp;
    be += ((bg) ^ (bh) ^ (bd));
    be += P(bf, 5u);
    bg = P(bg, 30u);
  };
  bq = P((bn ^ bi ^ bs ^ bq), 1u);
  {
    bd += 0x6ed9eba1u;
    bd += bq;
    bd += ((bf) ^ (bg) ^ (bh));
    bd += P(be, 5u);
    bf = P(bf, 30u);
  };
  br = P((bo ^ bj ^ bt ^ br), 1u);
  {
    bh += 0x6ed9eba1u;
    bh += br;
    bh += ((be) ^ (bf) ^ (bg));
    bh += P(bd, 5u);
    be = P(be, 30u);
  };
  bs = P((bp ^ bk ^ bu ^ bs), 1u);
  {
    bg += 0x6ed9eba1u;
    bg += bs;
    bg += ((bd) ^ (be) ^ (bf));
    bg += P(bh, 5u);
    bd = P(bd, 30u);
  };
  bt = P((bq ^ bl ^ bv ^ bt), 1u);
  {
    bf += 0x6ed9eba1u;
    bf += bt;
    bf += ((bh) ^ (bd) ^ (be));
    bf += P(bg, 5u);
    bh = P(bh, 30u);
  };
  bu = P((br ^ bm ^ bw ^ bu), 1u);
  {
    be += 0x6ed9eba1u;
    be += bu;
    be += ((bg) ^ (bh) ^ (bd));
    be += P(bf, 5u);
    bg = P(bg, 30u);
  };
  bv = P((bs ^ bn ^ bx ^ bv), 1u);
  {
    bd += 0x6ed9eba1u;
    bd += bv;
    bd += ((bf) ^ (bg) ^ (bh));
    bd += P(be, 5u);
    bf = P(bf, 30u);
  };
  bw = P((bt ^ bo ^ bi ^ bw), 1u);
  {
    bh += 0x6ed9eba1u;
    bh += bw;
    bh += ((be) ^ (bf) ^ (bg));
    bh += P(bd, 5u);
    be = P(be, 30u);
  };
  bx = P((bu ^ bp ^ bj ^ bx), 1u);
  {
    bg += 0x6ed9eba1u;
    bg += bx;
    bg += ((bd) ^ (be) ^ (bf));
    bg += P(bh, 5u);
    bd = P(bd, 30u);
  };
  bi = P((bv ^ bq ^ bk ^ bi), 1u);
  {
    bf += 0x6ed9eba1u;
    bf += bi;
    bf += ((bh) ^ (bd) ^ (be));
    bf += P(bg, 5u);
    bh = P(bh, 30u);
  };
  bj = P((bw ^ br ^ bl ^ bj), 1u);
  {
    be += 0x6ed9eba1u;
    be += bj;
    be += ((bg) ^ (bh) ^ (bd));
    be += P(bf, 5u);
    bg = P(bg, 30u);
  };
  bk = P((bx ^ bs ^ bm ^ bk), 1u);
  {
    bd += 0x6ed9eba1u;
    bd += bk;
    bd += ((bf) ^ (bg) ^ (bh));
    bd += P(be, 5u);
    bf = P(bf, 30u);
  };
  bl = P((bi ^ bt ^ bn ^ bl), 1u);
  {
    bh += 0x6ed9eba1u;
    bh += bl;
    bh += ((be) ^ (bf) ^ (bg));
    bh += P(bd, 5u);
    be = P(be, 30u);
  };
  bm = P((bj ^ bu ^ bo ^ bm), 1u);
  {
    bg += 0x6ed9eba1u;
    bg += bm;
    bg += ((bd) ^ (be) ^ (bf));
    bg += P(bh, 5u);
    bd = P(bd, 30u);
  };
  bn = P((bk ^ bv ^ bp ^ bn), 1u);
  {
    bf += 0x6ed9eba1u;
    bf += bn;
    bf += ((bh) ^ (bd) ^ (be));
    bf += P(bg, 5u);
    bh = P(bh, 30u);
  };
  bo = P((bl ^ bw ^ bq ^ bo), 1u);
  {
    be += 0x6ed9eba1u;
    be += bo;
    be += ((bg) ^ (bh) ^ (bd));
    be += P(bf, 5u);
    bg = P(bg, 30u);
  };
  bp = P((bm ^ bx ^ br ^ bp), 1u);
  {
    bd += 0x6ed9eba1u;
    bd += bp;
    bd += ((bf) ^ (bg) ^ (bh));
    bd += P(be, 5u);
    bf = P(bf, 30u);
  };

  bq = P((bn ^ bi ^ bs ^ bq), 1u);
  {
    bh += 0x8f1bbcdcu;
    bh += bq;
    bh += (((((be)) & ((bf))) | (((bg)) & (((be)) ^ ((bf))))));
    bh += P(bd, 5u);
    be = P(be, 30u);
  };
  br = P((bo ^ bj ^ bt ^ br), 1u);
  {
    bg += 0x8f1bbcdcu;
    bg += br;
    bg += (((((bd)) & ((be))) | (((bf)) & (((bd)) ^ ((be))))));
    bg += P(bh, 5u);
    bd = P(bd, 30u);
  };
  bs = P((bp ^ bk ^ bu ^ bs), 1u);
  {
    bf += 0x8f1bbcdcu;
    bf += bs;
    bf += (((((bh)) & ((bd))) | (((be)) & (((bh)) ^ ((bd))))));
    bf += P(bg, 5u);
    bh = P(bh, 30u);
  };
  bt = P((bq ^ bl ^ bv ^ bt), 1u);
  {
    be += 0x8f1bbcdcu;
    be += bt;
    be += (((((bg)) & ((bh))) | (((bd)) & (((bg)) ^ ((bh))))));
    be += P(bf, 5u);
    bg = P(bg, 30u);
  };
  bu = P((br ^ bm ^ bw ^ bu), 1u);
  {
    bd += 0x8f1bbcdcu;
    bd += bu;
    bd += (((((bf)) & ((bg))) | (((bh)) & (((bf)) ^ ((bg))))));
    bd += P(be, 5u);
    bf = P(bf, 30u);
  };
  bv = P((bs ^ bn ^ bx ^ bv), 1u);
  {
    bh += 0x8f1bbcdcu;
    bh += bv;
    bh += (((((be)) & ((bf))) | (((bg)) & (((be)) ^ ((bf))))));
    bh += P(bd, 5u);
    be = P(be, 30u);
  };
  bw = P((bt ^ bo ^ bi ^ bw), 1u);
  {
    bg += 0x8f1bbcdcu;
    bg += bw;
    bg += (((((bd)) & ((be))) | (((bf)) & (((bd)) ^ ((be))))));
    bg += P(bh, 5u);
    bd = P(bd, 30u);
  };
  bx = P((bu ^ bp ^ bj ^ bx), 1u);
  {
    bf += 0x8f1bbcdcu;
    bf += bx;
    bf += (((((bh)) & ((bd))) | (((be)) & (((bh)) ^ ((bd))))));
    bf += P(bg, 5u);
    bh = P(bh, 30u);
  };
  bi = P((bv ^ bq ^ bk ^ bi), 1u);
  {
    be += 0x8f1bbcdcu;
    be += bi;
    be += (((((bg)) & ((bh))) | (((bd)) & (((bg)) ^ ((bh))))));
    be += P(bf, 5u);
    bg = P(bg, 30u);
  };
  bj = P((bw ^ br ^ bl ^ bj), 1u);
  {
    bd += 0x8f1bbcdcu;
    bd += bj;
    bd += (((((bf)) & ((bg))) | (((bh)) & (((bf)) ^ ((bg))))));
    bd += P(be, 5u);
    bf = P(bf, 30u);
  };
  bk = P((bx ^ bs ^ bm ^ bk), 1u);
  {
    bh += 0x8f1bbcdcu;
    bh += bk;
    bh += (((((be)) & ((bf))) | (((bg)) & (((be)) ^ ((bf))))));
    bh += P(bd, 5u);
    be = P(be, 30u);
  };
  bl = P((bi ^ bt ^ bn ^ bl), 1u);
  {
    bg += 0x8f1bbcdcu;
    bg += bl;
    bg += (((((bd)) & ((be))) | (((bf)) & (((bd)) ^ ((be))))));
    bg += P(bh, 5u);
    bd = P(bd, 30u);
  };
  bm = P((bj ^ bu ^ bo ^ bm), 1u);
  {
    bf += 0x8f1bbcdcu;
    bf += bm;
    bf += (((((bh)) & ((bd))) | (((be)) & (((bh)) ^ ((bd))))));
    bf += P(bg, 5u);
    bh = P(bh, 30u);
  };
  bn = P((bk ^ bv ^ bp ^ bn), 1u);
  {
    be += 0x8f1bbcdcu;
    be += bn;
    be += (((((bg)) & ((bh))) | (((bd)) & (((bg)) ^ ((bh))))));
    be += P(bf, 5u);
    bg = P(bg, 30u);
  };
  bo = P((bl ^ bw ^ bq ^ bo), 1u);
  {
    bd += 0x8f1bbcdcu;
    bd += bo;
    bd += (((((bf)) & ((bg))) | (((bh)) & (((bf)) ^ ((bg))))));
    bd += P(be, 5u);
    bf = P(bf, 30u);
  };
  bp = P((bm ^ bx ^ br ^ bp), 1u);
  {
    bh += 0x8f1bbcdcu;
    bh += bp;
    bh += (((((be)) & ((bf))) | (((bg)) & (((be)) ^ ((bf))))));
    bh += P(bd, 5u);
    be = P(be, 30u);
  };
  bq = P((bn ^ bi ^ bs ^ bq), 1u);
  {
    bg += 0x8f1bbcdcu;
    bg += bq;
    bg += (((((bd)) & ((be))) | (((bf)) & (((bd)) ^ ((be))))));
    bg += P(bh, 5u);
    bd = P(bd, 30u);
  };
  br = P((bo ^ bj ^ bt ^ br), 1u);
  {
    bf += 0x8f1bbcdcu;
    bf += br;
    bf += (((((bh)) & ((bd))) | (((be)) & (((bh)) ^ ((bd))))));
    bf += P(bg, 5u);
    bh = P(bh, 30u);
  };
  bs = P((bp ^ bk ^ bu ^ bs), 1u);
  {
    be += 0x8f1bbcdcu;
    be += bs;
    be += (((((bg)) & ((bh))) | (((bd)) & (((bg)) ^ ((bh))))));
    be += P(bf, 5u);
    bg = P(bg, 30u);
  };
  bt = P((bq ^ bl ^ bv ^ bt), 1u);
  {
    bd += 0x8f1bbcdcu;
    bd += bt;
    bd += (((((bf)) & ((bg))) | (((bh)) & (((bf)) ^ ((bg))))));
    bd += P(be, 5u);
    bf = P(bf, 30u);
  };

  bu = P((br ^ bm ^ bw ^ bu), 1u);
  {
    bh += 0xca62c1d6u;
    bh += bu;
    bh += ((be) ^ (bf) ^ (bg));
    bh += P(bd, 5u);
    be = P(be, 30u);
  };
  bv = P((bs ^ bn ^ bx ^ bv), 1u);
  {
    bg += 0xca62c1d6u;
    bg += bv;
    bg += ((bd) ^ (be) ^ (bf));
    bg += P(bh, 5u);
    bd = P(bd, 30u);
  };
  bw = P((bt ^ bo ^ bi ^ bw), 1u);
  {
    bf += 0xca62c1d6u;
    bf += bw;
    bf += ((bh) ^ (bd) ^ (be));
    bf += P(bg, 5u);
    bh = P(bh, 30u);
  };
  bx = P((bu ^ bp ^ bj ^ bx), 1u);
  {
    be += 0xca62c1d6u;
    be += bx;
    be += ((bg) ^ (bh) ^ (bd));
    be += P(bf, 5u);
    bg = P(bg, 30u);
  };
  bi = P((bv ^ bq ^ bk ^ bi), 1u);
  {
    bd += 0xca62c1d6u;
    bd += bi;
    bd += ((bf) ^ (bg) ^ (bh));
    bd += P(be, 5u);
    bf = P(bf, 30u);
  };
  bj = P((bw ^ br ^ bl ^ bj), 1u);
  {
    bh += 0xca62c1d6u;
    bh += bj;
    bh += ((be) ^ (bf) ^ (bg));
    bh += P(bd, 5u);
    be = P(be, 30u);
  };
  bk = P((bx ^ bs ^ bm ^ bk), 1u);
  {
    bg += 0xca62c1d6u;
    bg += bk;
    bg += ((bd) ^ (be) ^ (bf));
    bg += P(bh, 5u);
    bd = P(bd, 30u);
  };
  bl = P((bi ^ bt ^ bn ^ bl), 1u);
  {
    bf += 0xca62c1d6u;
    bf += bl;
    bf += ((bh) ^ (bd) ^ (be));
    bf += P(bg, 5u);
    bh = P(bh, 30u);
  };
  bm = P((bj ^ bu ^ bo ^ bm), 1u);
  {
    be += 0xca62c1d6u;
    be += bm;
    be += ((bg) ^ (bh) ^ (bd));
    be += P(bf, 5u);
    bg = P(bg, 30u);
  };
  bn = P((bk ^ bv ^ bp ^ bn), 1u);
  {
    bd += 0xca62c1d6u;
    bd += bn;
    bd += ((bf) ^ (bg) ^ (bh));
    bd += P(be, 5u);
    bf = P(bf, 30u);
  };
  bo = P((bl ^ bw ^ bq ^ bo), 1u);
  {
    bh += 0xca62c1d6u;
    bh += bo;
    bh += ((be) ^ (bf) ^ (bg));
    bh += P(bd, 5u);
    be = P(be, 30u);
  };
  bp = P((bm ^ bx ^ br ^ bp), 1u);
  {
    bg += 0xca62c1d6u;
    bg += bp;
    bg += ((bd) ^ (be) ^ (bf));
    bg += P(bh, 5u);
    bd = P(bd, 30u);
  };
  bq = P((bn ^ bi ^ bs ^ bq), 1u);
  {
    bf += 0xca62c1d6u;
    bf += bq;
    bf += ((bh) ^ (bd) ^ (be));
    bf += P(bg, 5u);
    bh = P(bh, 30u);
  };
  br = P((bo ^ bj ^ bt ^ br), 1u);
  {
    be += 0xca62c1d6u;
    be += br;
    be += ((bg) ^ (bh) ^ (bd));
    be += P(bf, 5u);
    bg = P(bg, 30u);
  };
  bs = P((bp ^ bk ^ bu ^ bs), 1u);
  {
    bd += 0xca62c1d6u;
    bd += bs;
    bd += ((bf) ^ (bg) ^ (bh));
    bd += P(be, 5u);
    bf = P(bf, 30u);
  };
  bt = P((bq ^ bl ^ bv ^ bt), 1u);
  {
    bh += 0xca62c1d6u;
    bh += bt;
    bh += ((be) ^ (bf) ^ (bg));
    bh += P(bd, 5u);
    be = P(be, 30u);
  };
  bu = P((br ^ bm ^ bw ^ bu), 1u);
  {
    bg += 0xca62c1d6u;
    bg += bu;
    bg += ((bd) ^ (be) ^ (bf));
    bg += P(bh, 5u);
    bd = P(bd, 30u);
  };
  bv = P((bs ^ bn ^ bx ^ bv), 1u);
  {
    bf += 0xca62c1d6u;
    bf += bv;
    bf += ((bh) ^ (bd) ^ (be));
    bf += P(bg, 5u);
    bh = P(bh, 30u);
  };
  bw = P((bt ^ bo ^ bi ^ bw), 1u);
  {
    be += 0xca62c1d6u;
    be += bw;
    be += ((bg) ^ (bh) ^ (bd));
    be += P(bf, 5u);
    bg = P(bg, 30u);
  };
  bx = P((bu ^ bp ^ bj ^ bx), 1u);
  {
    bd += 0xca62c1d6u;
    bd += bx;
    bd += ((bf) ^ (bg) ^ (bh));
    bd += P(be, 5u);
    bf = P(bf, 30u);
  };

  bd += by;
  be += bz;
  bf += ca;
  bg += cb;
  bh += cc;

  {
    if (((bg) == as[0]) && ((bh) == as[1]) && ((bf) == as[2]) && ((be) == as[3])) {
      const u32 cd = ad + 0;
      if (atomic_add(&q[cd], 1) == 0) {
        AA(o, t, y, 0, cd, ah, at);
      }
    }
  };
}
}

__kernel void ED(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global pstoken_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa,
                 const u32 ab, const u32 ac, const u32 ad, const u32 ae, const u32 af) {
}

__kernel void EE(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global pstoken_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa,
                 const u32 ab, const u32 ac, const u32 ad, const u32 ae, const u32 af) {
}