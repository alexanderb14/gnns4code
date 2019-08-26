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

typedef struct { u32 digest_buf[4]; } digest_t;

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
  if (a[3] > b[3])
    return (1);
  if (a[3] < b[3])
    return (-1);
  if (a[2] > b[2])
    return (1);
  if (a[2] < b[2])
    return (-1);
  if (a[1] > b[1])
    return (1);
  if (a[1] < b[1])
    return (-1);
  if (a[0] > b[0])
    return (1);
  if (a[0] < b[0])
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
__constant u32 Ga[8][64] = {{
                                0x02080800, 0x00080000, 0x02000002, 0x02080802, 0x02000000, 0x00080802, 0x00080002, 0x02000002, 0x00080802, 0x02080800, 0x02080000, 0x00000802, 0x02000802, 0x02000000, 0x00000000, 0x00080002, 0x00080000, 0x00000002, 0x02000800, 0x00080800, 0x02080802, 0x02080000, 0x00000802, 0x02000800, 0x00000002, 0x00000800, 0x00080800, 0x02080002, 0x00000800, 0x02000802, 0x02080002, 0x00000000,
                                0x00000000, 0x02080802, 0x02000800, 0x00080002, 0x02080800, 0x00080000, 0x00000802, 0x02000800, 0x02080002, 0x00000800, 0x00080800, 0x02000002, 0x00080802, 0x00000002, 0x02000002, 0x02080000, 0x02080802, 0x00080800, 0x02080000, 0x02000802, 0x02000000, 0x00000802, 0x00080002, 0x00000000, 0x00080000, 0x02000000, 0x02000802, 0x02080800, 0x00000002, 0x02080002, 0x00000800, 0x00080802,
                            },
                            {
                                0x40108010, 0x00000000, 0x00108000, 0x40100000, 0x40000010, 0x00008010, 0x40008000, 0x00108000, 0x00008000, 0x40100010, 0x00000010, 0x40008000, 0x00100010, 0x40108000, 0x40100000, 0x00000010, 0x00100000, 0x40008010, 0x40100010, 0x00008000, 0x00108010, 0x40000000, 0x00000000, 0x00100010, 0x40008010, 0x00108010, 0x40108000, 0x40000010, 0x40000000, 0x00100000, 0x00008010, 0x40108010,
                                0x00100010, 0x40108000, 0x40008000, 0x00108010, 0x40108010, 0x00100010, 0x40000010, 0x00000000, 0x40000000, 0x00008010, 0x00100000, 0x40100010, 0x00008000, 0x40000000, 0x00108010, 0x40008010, 0x40108000, 0x00008000, 0x00000000, 0x40000010, 0x00000010, 0x40108010, 0x00108000, 0x40100000, 0x40100010, 0x00100000, 0x00008010, 0x40008000, 0x40008010, 0x00000010, 0x40100000, 0x00108000,
                            },
                            {
                                0x04000001, 0x04040100, 0x00000100, 0x04000101, 0x00040001, 0x04000000, 0x04000101, 0x00040100, 0x04000100, 0x00040000, 0x04040000, 0x00000001, 0x04040101, 0x00000101, 0x00000001, 0x04040001, 0x00000000, 0x00040001, 0x04040100, 0x00000100, 0x00000101, 0x04040101, 0x00040000, 0x04000001, 0x04040001, 0x04000100, 0x00040101, 0x04040000, 0x00040100, 0x00000000, 0x04000000, 0x00040101,
                                0x04040100, 0x00000100, 0x00000001, 0x00040000, 0x00000101, 0x00040001, 0x04040000, 0x04000101, 0x00000000, 0x04040100, 0x00040100, 0x04040001, 0x00040001, 0x04000000, 0x04040101, 0x00000001, 0x00040101, 0x04000001, 0x04000000, 0x04040101, 0x00040000, 0x04000100, 0x04000101, 0x00040100, 0x04000100, 0x00000000, 0x04040001, 0x00000101, 0x04000001, 0x00040101, 0x00000100, 0x04040000,
                            },
                            {
                                0x00401008, 0x10001000, 0x00000008, 0x10401008, 0x00000000, 0x10400000, 0x10001008, 0x00400008, 0x10401000, 0x10000008, 0x10000000, 0x00001008, 0x10000008, 0x00401008, 0x00400000, 0x10000000, 0x10400008, 0x00401000, 0x00001000, 0x00000008, 0x00401000, 0x10001008, 0x10400000, 0x00001000, 0x00001008, 0x00000000, 0x00400008, 0x10401000, 0x10001000, 0x10400008, 0x10401008, 0x00400000,
                                0x10400008, 0x00001008, 0x00400000, 0x10000008, 0x00401000, 0x10001000, 0x00000008, 0x10400000, 0x10001008, 0x00000000, 0x00001000, 0x00400008, 0x00000000, 0x10400008, 0x10401000, 0x00001000, 0x10000000, 0x10401008, 0x00401008, 0x00400000, 0x10401008, 0x00000008, 0x10001000, 0x00401008, 0x00400008, 0x00401000, 0x10400000, 0x10001008, 0x00001008, 0x10000000, 0x10000008, 0x10401000,
                            },
                            {
                                0x08000000, 0x00010000, 0x00000400, 0x08010420, 0x08010020, 0x08000400, 0x00010420, 0x08010000, 0x00010000, 0x00000020, 0x08000020, 0x00010400, 0x08000420, 0x08010020, 0x08010400, 0x00000000, 0x00010400, 0x08000000, 0x00010020, 0x00000420, 0x08000400, 0x00010420, 0x00000000, 0x08000020, 0x00000020, 0x08000420, 0x08010420, 0x00010020, 0x08010000, 0x00000400, 0x00000420, 0x08010400,
                                0x08010400, 0x08000420, 0x00010020, 0x08010000, 0x00010000, 0x00000020, 0x08000020, 0x08000400, 0x08000000, 0x00010400, 0x08010420, 0x00000000, 0x00010420, 0x08000000, 0x00000400, 0x00010020, 0x08000420, 0x00000400, 0x00000000, 0x08010420, 0x08010020, 0x08010400, 0x00000420, 0x00010000, 0x00010400, 0x08010020, 0x08000400, 0x00000420, 0x00000020, 0x00010420, 0x08010000, 0x08000020,
                            },
                            {
                                0x80000040, 0x00200040, 0x00000000, 0x80202000, 0x00200040, 0x00002000, 0x80002040, 0x00200000, 0x00002040, 0x80202040, 0x00202000, 0x80000000, 0x80002000, 0x80000040, 0x80200000, 0x00202040, 0x00200000, 0x80002040, 0x80200040, 0x00000000, 0x00002000, 0x00000040, 0x80202000, 0x80200040, 0x80202040, 0x80200000, 0x80000000, 0x00002040, 0x00000040, 0x00202000, 0x00202040, 0x80002000,
                                0x00002040, 0x80000000, 0x80002000, 0x00202040, 0x80202000, 0x00200040, 0x00000000, 0x80002000, 0x80000000, 0x00002000, 0x80200040, 0x00200000, 0x00200040, 0x80202040, 0x00202000, 0x00000040, 0x80202040, 0x00202000, 0x00200000, 0x80002040, 0x80000040, 0x80200000, 0x00202040, 0x00000000, 0x00002000, 0x80000040, 0x80002040, 0x80202000, 0x80200000, 0x00002040, 0x00000040, 0x80200040,
                            },
                            {
                                0x00004000, 0x00000200, 0x01000200, 0x01000004, 0x01004204, 0x00004004, 0x00004200, 0x00000000, 0x01000000, 0x01000204, 0x00000204, 0x01004000, 0x00000004, 0x01004200, 0x01004000, 0x00000204, 0x01000204, 0x00004000, 0x00004004, 0x01004204, 0x00000000, 0x01000200, 0x01000004, 0x00004200, 0x01004004, 0x00004204, 0x01004200, 0x00000004, 0x00004204, 0x01004004, 0x00000200, 0x01000000,
                                0x00004204, 0x01004000, 0x01004004, 0x00000204, 0x00004000, 0x00000200, 0x01000000, 0x01004004, 0x01000204, 0x00004204, 0x00004200, 0x00000000, 0x00000200, 0x01000004, 0x00000004, 0x01000200, 0x00000000, 0x01000204, 0x01000200, 0x00004200, 0x00000204, 0x00004000, 0x01004204, 0x01000000, 0x01004200, 0x00000004, 0x00004004, 0x01004204, 0x01000004, 0x01004200, 0x01004000, 0x00004004,
                            },
                            {
                                0x20800080, 0x20820000, 0x00020080, 0x00000000, 0x20020000, 0x00800080, 0x20800000, 0x20820080, 0x00000080, 0x20000000, 0x00820000, 0x00020080, 0x00820080, 0x20020080, 0x20000080, 0x20800000, 0x00020000, 0x00820080, 0x00800080, 0x20020000, 0x20820080, 0x20000080, 0x00000000, 0x00820000, 0x20000000, 0x00800000, 0x20020080, 0x20800080, 0x00800000, 0x00020000, 0x20820000, 0x00000080,
                                0x00800000, 0x00020000, 0x20000080, 0x20820080, 0x00020080, 0x20000000, 0x00000000, 0x00820000, 0x20800080, 0x20020080, 0x20020000, 0x00800080, 0x20820000, 0x00000080, 0x00800080, 0x20020000, 0x20820080, 0x00800000, 0x20800000, 0x20000080, 0x00820000, 0x00020080, 0x20020080, 0x20800000, 0x00000080, 0x20820000, 0x00820080, 0x00000000, 0x20000000, 0x20800080, 0x00020000, 0x00820080,
                            }};

__constant u32 Gb[8][64] = {{
                                0x00000000, 0x00000010, 0x20000000, 0x20000010, 0x00010000, 0x00010010, 0x20010000, 0x20010010, 0x00000800, 0x00000810, 0x20000800, 0x20000810, 0x00010800, 0x00010810, 0x20010800, 0x20010810, 0x00000020, 0x00000030, 0x20000020, 0x20000030, 0x00010020, 0x00010030, 0x20010020, 0x20010030, 0x00000820, 0x00000830, 0x20000820, 0x20000830, 0x00010820, 0x00010830, 0x20010820, 0x20010830,
                                0x00080000, 0x00080010, 0x20080000, 0x20080010, 0x00090000, 0x00090010, 0x20090000, 0x20090010, 0x00080800, 0x00080810, 0x20080800, 0x20080810, 0x00090800, 0x00090810, 0x20090800, 0x20090810, 0x00080020, 0x00080030, 0x20080020, 0x20080030, 0x00090020, 0x00090030, 0x20090020, 0x20090030, 0x00080820, 0x00080830, 0x20080820, 0x20080830, 0x00090820, 0x00090830, 0x20090820, 0x20090830,
                            },
                            {
                                0x00000000, 0x02000000, 0x00002000, 0x02002000, 0x00200000, 0x02200000, 0x00202000, 0x02202000, 0x00000004, 0x02000004, 0x00002004, 0x02002004, 0x00200004, 0x02200004, 0x00202004, 0x02202004, 0x00000400, 0x02000400, 0x00002400, 0x02002400, 0x00200400, 0x02200400, 0x00202400, 0x02202400, 0x00000404, 0x02000404, 0x00002404, 0x02002404, 0x00200404, 0x02200404, 0x00202404, 0x02202404,
                                0x10000000, 0x12000000, 0x10002000, 0x12002000, 0x10200000, 0x12200000, 0x10202000, 0x12202000, 0x10000004, 0x12000004, 0x10002004, 0x12002004, 0x10200004, 0x12200004, 0x10202004, 0x12202004, 0x10000400, 0x12000400, 0x10002400, 0x12002400, 0x10200400, 0x12200400, 0x10202400, 0x12202400, 0x10000404, 0x12000404, 0x10002404, 0x12002404, 0x10200404, 0x12200404, 0x10202404, 0x12202404,
                            },
                            {
                                0x00000000, 0x00000001, 0x00040000, 0x00040001, 0x01000000, 0x01000001, 0x01040000, 0x01040001, 0x00000002, 0x00000003, 0x00040002, 0x00040003, 0x01000002, 0x01000003, 0x01040002, 0x01040003, 0x00000200, 0x00000201, 0x00040200, 0x00040201, 0x01000200, 0x01000201, 0x01040200, 0x01040201, 0x00000202, 0x00000203, 0x00040202, 0x00040203, 0x01000202, 0x01000203, 0x01040202, 0x01040203,
                                0x08000000, 0x08000001, 0x08040000, 0x08040001, 0x09000000, 0x09000001, 0x09040000, 0x09040001, 0x08000002, 0x08000003, 0x08040002, 0x08040003, 0x09000002, 0x09000003, 0x09040002, 0x09040003, 0x08000200, 0x08000201, 0x08040200, 0x08040201, 0x09000200, 0x09000201, 0x09040200, 0x09040201, 0x08000202, 0x08000203, 0x08040202, 0x08040203, 0x09000202, 0x09000203, 0x09040202, 0x09040203,
                            },
                            {
                                0x00000000, 0x00100000, 0x00000100, 0x00100100, 0x00000008, 0x00100008, 0x00000108, 0x00100108, 0x00001000, 0x00101000, 0x00001100, 0x00101100, 0x00001008, 0x00101008, 0x00001108, 0x00101108, 0x04000000, 0x04100000, 0x04000100, 0x04100100, 0x04000008, 0x04100008, 0x04000108, 0x04100108, 0x04001000, 0x04101000, 0x04001100, 0x04101100, 0x04001008, 0x04101008, 0x04001108, 0x04101108,
                                0x00020000, 0x00120000, 0x00020100, 0x00120100, 0x00020008, 0x00120008, 0x00020108, 0x00120108, 0x00021000, 0x00121000, 0x00021100, 0x00121100, 0x00021008, 0x00121008, 0x00021108, 0x00121108, 0x04020000, 0x04120000, 0x04020100, 0x04120100, 0x04020008, 0x04120008, 0x04020108, 0x04120108, 0x04021000, 0x04121000, 0x04021100, 0x04121100, 0x04021008, 0x04121008, 0x04021108, 0x04121108,
                            },
                            {
                                0x00000000, 0x10000000, 0x00010000, 0x10010000, 0x00000004, 0x10000004, 0x00010004, 0x10010004, 0x20000000, 0x30000000, 0x20010000, 0x30010000, 0x20000004, 0x30000004, 0x20010004, 0x30010004, 0x00100000, 0x10100000, 0x00110000, 0x10110000, 0x00100004, 0x10100004, 0x00110004, 0x10110004, 0x20100000, 0x30100000, 0x20110000, 0x30110000, 0x20100004, 0x30100004, 0x20110004, 0x30110004,
                                0x00001000, 0x10001000, 0x00011000, 0x10011000, 0x00001004, 0x10001004, 0x00011004, 0x10011004, 0x20001000, 0x30001000, 0x20011000, 0x30011000, 0x20001004, 0x30001004, 0x20011004, 0x30011004, 0x00101000, 0x10101000, 0x00111000, 0x10111000, 0x00101004, 0x10101004, 0x00111004, 0x10111004, 0x20101000, 0x30101000, 0x20111000, 0x30111000, 0x20101004, 0x30101004, 0x20111004, 0x30111004,
                            },
                            {
                                0x00000000, 0x08000000, 0x00000008, 0x08000008, 0x00000400, 0x08000400, 0x00000408, 0x08000408, 0x00020000, 0x08020000, 0x00020008, 0x08020008, 0x00020400, 0x08020400, 0x00020408, 0x08020408, 0x00000001, 0x08000001, 0x00000009, 0x08000009, 0x00000401, 0x08000401, 0x00000409, 0x08000409, 0x00020001, 0x08020001, 0x00020009, 0x08020009, 0x00020401, 0x08020401, 0x00020409, 0x08020409,
                                0x02000000, 0x0A000000, 0x02000008, 0x0A000008, 0x02000400, 0x0A000400, 0x02000408, 0x0A000408, 0x02020000, 0x0A020000, 0x02020008, 0x0A020008, 0x02020400, 0x0A020400, 0x02020408, 0x0A020408, 0x02000001, 0x0A000001, 0x02000009, 0x0A000009, 0x02000401, 0x0A000401, 0x02000409, 0x0A000409, 0x02020001, 0x0A020001, 0x02020009, 0x0A020009, 0x02020401, 0x0A020401, 0x02020409, 0x0A020409,
                            },
                            {
                                0x00000000, 0x00000100, 0x00080000, 0x00080100, 0x01000000, 0x01000100, 0x01080000, 0x01080100, 0x00000010, 0x00000110, 0x00080010, 0x00080110, 0x01000010, 0x01000110, 0x01080010, 0x01080110, 0x00200000, 0x00200100, 0x00280000, 0x00280100, 0x01200000, 0x01200100, 0x01280000, 0x01280100, 0x00200010, 0x00200110, 0x00280010, 0x00280110, 0x01200010, 0x01200110, 0x01280010, 0x01280110,
                                0x00000200, 0x00000300, 0x00080200, 0x00080300, 0x01000200, 0x01000300, 0x01080200, 0x01080300, 0x00000210, 0x00000310, 0x00080210, 0x00080310, 0x01000210, 0x01000310, 0x01080210, 0x01080310, 0x00200200, 0x00200300, 0x00280200, 0x00280300, 0x01200200, 0x01200300, 0x01280200, 0x01280300, 0x00200210, 0x00200310, 0x00280210, 0x00280310, 0x01200210, 0x01200310, 0x01280210, 0x01280310,
                            },
                            {0x00000000, 0x04000000, 0x00040000, 0x04040000, 0x00000002, 0x04000002, 0x00040002, 0x04040002, 0x00002000, 0x04002000, 0x00042000, 0x04042000, 0x00002002, 0x04002002, 0x00042002, 0x04042002, 0x00000020, 0x04000020, 0x00040020, 0x04040020, 0x00000022, 0x04000022, 0x00040022, 0x04040022, 0x00002020, 0x04002020, 0x00042020, 0x04042020, 0x00002022, 0x04002022, 0x00042022, 0x04042022,
                             0x00000800, 0x04000800, 0x00040800, 0x04040800, 0x00000802, 0x04000802, 0x00040802, 0x04040802, 0x00002800, 0x04002800, 0x00042800, 0x04042800, 0x00002802, 0x04002802, 0x00042802, 0x04042802, 0x00000820, 0x04000820, 0x00040820, 0x04040820, 0x00000822, 0x04000822, 0x00040822, 0x04040822, 0x00002820, 0x04002820, 0x00042820, 0x04042820, 0x00002822, 0x04002822, 0x00042822, 0x04042822}};
void DY(u32x a[2], u32x b[2], u32x c[16], u32x d[16], __local u32 (*e)[64]) {
  u32x f;

  u32x g = b[0];
  u32x h = b[1];

  {
    {
      f = h >> 4;
      f = f ^ g;
      f = f & 0x0f0f0f0f;
      g = g ^ f;
      f = f << 4;
      h = h ^ f;
    };
    {
      f = g >> 16;
      f = f ^ h;
      f = f & 0x0000ffff;
      h = h ^ f;
      f = f << 16;
      g = g ^ f;
    };
    {
      f = h >> 2;
      f = f ^ g;
      f = f & 0x33333333;
      g = g ^ f;
      f = f << 2;
      h = h ^ f;
    };
    {
      f = g >> 8;
      f = f ^ h;
      f = f & 0x00ff00ff;
      h = h ^ f;
      f = f << 8;
      g = g ^ f;
    };
    {
      f = h >> 1;
      f = f ^ g;
      f = f & 0x55555555;
      g = g ^ f;
      f = f << 1;
      h = h ^ f;
    };
  };

  g = P(g, 3u);
  h = P(h, 3u);

  for (u32 i = 0; i < 16; i += 2) {
    u32x j;
    u32x k;

    j = c[i + 0] ^ g;
    k = d[i + 0] ^ P(g, 28u);

    h ^= (e)[(0)][(((j >> 2) & 0x3f))] | (e)[(2)][(((j >> 10) & 0x3f))] | (e)[(4)][(((j >> 18) & 0x3f))] | (e)[(6)][(((j >> 26) & 0x3f))] | (e)[(1)][(((k >> 2) & 0x3f))] | (e)[(3)][(((k >> 10) & 0x3f))] | (e)[(5)][(((k >> 18) & 0x3f))] | (e)[(7)][(((k >> 26) & 0x3f))];

    j = c[i + 1] ^ h;
    k = d[i + 1] ^ P(h, 28u);

    g ^= (e)[(0)][(((j >> 2) & 0x3f))] | (e)[(2)][(((j >> 10) & 0x3f))] | (e)[(4)][(((j >> 18) & 0x3f))] | (e)[(6)][(((j >> 26) & 0x3f))] | (e)[(1)][(((k >> 2) & 0x3f))] | (e)[(3)][(((k >> 10) & 0x3f))] | (e)[(5)][(((k >> 18) & 0x3f))] | (e)[(7)][(((k >> 26) & 0x3f))];
  }

  h = P(h, 29u);
  g = P(g, 29u);

  {
    {
      f = g >> 1;
      f = f ^ h;
      f = f & 0x55555555;
      h = h ^ f;
      f = f << 1;
      g = g ^ f;
    };
    {
      f = h >> 8;
      f = f ^ g;
      f = f & 0x00ff00ff;
      g = g ^ f;
      f = f << 8;
      h = h ^ f;
    };
    {
      f = g >> 2;
      f = f ^ h;
      f = f & 0x33333333;
      h = h ^ f;
      f = f << 2;
      g = g ^ f;
    };
    {
      f = h >> 16;
      f = f ^ g;
      f = f & 0x0000ffff;
      g = g ^ f;
      f = f << 16;
      h = h ^ f;
    };
    {
      f = g >> 4;
      f = f ^ h;
      f = f & 0x0f0f0f0f;
      h = h ^ f;
      f = f << 4;
      g = g ^ f;
    };
  };

  a[0] = h;
  a[1] = g;
}

void DZ(u32x a, u32x b, u32x c[16], u32x d[16], __local u32 (*e)[64]) {
  u32x f;

  {
    f = b >> 4;
    f = f ^ a;
    f = f & 0x0f0f0f0f;
    a = a ^ f;
    f = f << 4;
    b = b ^ f;
  };
  {
    f = a << (16 + 2);
    f = f ^ a;
    f = f & 0xcccc0000;
    a = a ^ f;
    f = f >> (16 + 2);
    a = a ^ f;
  };
  {
    f = b << (16 + 2);
    f = f ^ b;
    f = f & 0xcccc0000;
    b = b ^ f;
    f = f >> (16 + 2);
    b = b ^ f;
  };
  {
    f = b >> 1;
    f = f ^ a;
    f = f & 0x55555555;
    a = a ^ f;
    f = f << 1;
    b = b ^ f;
  };
  {
    f = a >> 8;
    f = f ^ b;
    f = f & 0x00ff00ff;
    b = b ^ f;
    f = f << 8;
    a = a ^ f;
  };
  {
    f = b >> 1;
    f = f ^ a;
    f = f & 0x55555555;
    a = a ^ f;
    f = f << 1;
    b = b ^ f;
  };

  b = ((b & 0x000000ff) << 16) | ((b & 0x0000ff00) << 0) | ((b & 0x00ff0000) >> 16) | ((a & 0xf0000000) >> 4);

  a = a & 0x0fffffff;

  for (u32 g = 0; g < 16; g++) {
    if ((g < 2) || (g == 8) || (g == 15)) {
      a = ((a >> 1) | (a << 27));
      b = ((b >> 1) | (b << 27));
    } else {
      a = ((a >> 2) | (a << 26));
      b = ((b >> 2) | (b << 26));
    }

    a = a & 0x0fffffff;
    b = b & 0x0fffffff;

    const u32x h = (a >> 0) & 0x0000003f;
    const u32x i = (a >> 6) & 0x00383003;
    const u32x j = (a >> 7) & 0x0000003c;
    const u32x k = (a >> 13) & 0x0000060f;
    const u32x l = (a >> 20) & 0x00000001;

    u32x m = (e)[(0)][(((h >> 0) & 0xff))] | (e)[(1)][(((i >> 0) & 0xff) | ((j >> 0) & 0xff))]

             | (e)[(2)][(((k >> 0) & 0xff) | ((i >> 8) & 0xff))]

             | (e)[(3)][(((l >> 0) & 0xff) | ((k >> 8) & 0xff) | ((i >> 16) & 0xff))];

    const u32x n = (b >> 0) & 0x00003c3f;
    const u32x o = (b >> 7) & 0x00003f03;
    const u32x p = (b >> 21) & 0x0000000f;
    const u32x q = (b >> 22) & 0x00000030;

    u32x r = (e)[(4)][(((n >> 0) & 0xff))] | (e)[(5)][(((o >> 0) & 0xff) | ((n >> 8) & 0xff))]

             | (e)[(6)][(((o >> 8) & 0xff))] | (e)[(7)][(((p >> 0) & 0xff) | ((q >> 0) & 0xff))];

    c[g] = ((r << 16) | (m & 0x0000ffff));
    d[g] = ((m >> 16) | (r & 0xffff0000));

    c[g] = P(c[g], 2u);
    d[g] = P(d[g], 2u);
  }
}

__kernel void EA(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global void* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
  const u32 ag = get_global_id(0);
  const u32 ah = get_local_id(0);
  const u32 ai = get_local_size(0);

  __local u32 aj[8][64];
  __local u32 ak[8][64];

  for (u32 al = ah; al < 64; al += ai) {
    aj[0][al] = Ga[0][al];
    aj[1][al] = Ga[1][al];
    aj[2][al] = Ga[2][al];
    aj[3][al] = Ga[3][al];
    aj[4][al] = Ga[4][al];
    aj[5][al] = Ga[5][al];
    aj[6][al] = Ga[6][al];
    aj[7][al] = Ga[7][al];

    ak[0][al] = Gb[0][al];
    ak[1][al] = Gb[1][al];
    ak[2][al] = Gb[2][al];
    ak[3][al] = Gb[3][al];
    ak[4][al] = Gb[4][al];
    ak[5][al] = Gb[5][al];
    ak[6][al] = Gb[6][al];
    ak[7][al] = Gb[7][al];
  }

  barrier(1);

  if (ag >= af)
    return;

  u32 am[4];
  u32 an[4];

  am[0] = a[ag].i[0];
  am[1] = a[ag].i[1];
  am[2] = a[ag].i[2];
  am[3] = a[ag].i[3];
  an[0] = a[ag].i[4];
  an[1] = a[ag].i[5];
  an[2] = a[ag].i[6];
  an[3] = a[ag].i[7];

  const u32 ao = a[ag].pw_len;

  u32 ap[4];
  u32 aq[4];

  ap[0] = r[y].salt_buf[0];
  ap[1] = r[y].salt_buf[1];
  ap[2] = r[y].salt_buf[2];
  ap[3] = r[y].salt_buf[3];
  aq[0] = r[y].salt_buf[4];
  aq[1] = r[y].salt_buf[5];
  aq[2] = r[y].salt_buf[6];
  aq[3] = r[y].salt_buf[7];

  const u32 ar = r[y].salt_len;

  for (u32 as = 0; as < ab; as += 1) {
    u32x at[4] = {0};
    u32x au[4] = {0};
    u32x av[4] = {0};
    u32x aw[4] = {0};

    const u32x ax = BW(am, an, ao, b, as, at, au);

    const u32x ay = (ar + ax) * 2;

    AU(at, au, av, aw, ar);

    u32x az[16];

    az[0] = at[0] | ap[0];
    az[1] = at[1] | ap[1];
    az[2] = at[2] | ap[2];
    az[3] = at[3] | ap[3];
    az[4] = au[0] | aq[0];
    az[5] = au[1] | aq[1];
    az[6] = au[2] | aq[2];
    az[7] = au[3] | aq[3];
    az[8] = av[0];
    az[9] = av[1];
    az[10] = av[2];
    az[11] = av[3];
    az[12] = aw[0];
    az[13] = aw[1];
    az[14] = aw[2];
    az[15] = aw[3];

    u32x ba[16];

    ba[0] = 0x64649040;
    ba[1] = 0x14909858;
    ba[2] = 0xc4b44888;
    ba[3] = 0x9094e438;
    ba[4] = 0xd8a004f0;
    ba[5] = 0xa8f02810;
    ba[6] = 0xc84048d8;
    ba[7] = 0x68d804a8;
    ba[8] = 0x0490e40c;
    ba[9] = 0xac183024;
    ba[10] = 0x24c07c10;
    ba[11] = 0x8c88c038;
    ba[12] = 0xc048c824;
    ba[13] = 0x4c0470a8;
    ba[14] = 0x584020b4;
    ba[15] = 0x00742c4c;

    u32x bb[16];

    bb[0] = 0xa42ce40c;
    bb[1] = 0x64689858;
    bb[2] = 0x484050b8;
    bb[3] = 0xe8184814;
    bb[4] = 0x405cc070;
    bb[5] = 0xa010784c;
    bb[6] = 0x6074a800;
    bb[7] = 0x80701c1c;
    bb[8] = 0x9cd49430;
    bb[9] = 0x4c8ce078;
    bb[10] = 0x5c18c088;
    bb[11] = 0x28a8a4c8;
    bb[12] = 0x3c180838;
    bb[13] = 0xb0b86c20;
    bb[14] = 0xac84a094;
    bb[15] = 0x4ce0c0c4;

    u32x bc[2];

    bc[0] = 0;
    bc[1] = 0;

    for (u32 bd = 0, be = 0; bd < ay; bd += 8, be++) {
      u32x bf[2];

      bf[0] = ((az[be] << 16) & 0xff000000) | ((az[be] << 8) & 0x0000ff00);
      bf[1] = ((az[be] >> 0) & 0xff000000) | ((az[be] >> 8) & 0x0000ff00);

      bf[0] ^= bc[0];
      bf[1] ^= bc[1];

      DY(bc, bf, ba, bb, aj);
    }

    DZ(bc[0], bc[1], ba, bb, ak);

    bc[0] = 0;
    bc[1] = 0;

    for (u32 bd = 0, be = 0; bd < ay; bd += 8, be++) {
      u32x bf[2];

      bf[0] = ((az[be] << 16) & 0xff000000) | ((az[be] << 8) & 0x0000ff00);
      bf[1] = ((az[be] >> 0) & 0xff000000) | ((az[be] >> 8) & 0x0000ff00);

      bf[0] ^= bc[0];
      bf[1] ^= bc[1];

      DY(bc, bf, ba, bb, aj);
    }

    u32x bg = 0;

    {
      const u32 bh[4] = {bc[0], bc[1], bgg, bgg};
      if (Z(bh, g, h, i, j, k, l, m, n, v, w, x)) {
        int bi = X(bh, ac, &p[ad]);
        if (bi != -1) {
          const u32 bj = ad + bi;
          if (atomic_add(&q[bj], 1) == 0) {
            AA(o, t, y, bi, bj, ag, as);
          }
        }
      }
    };
  }
}

__kernel void EB(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global void* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
}

__kernel void EC(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global void* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
}

__kernel void ED(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global void* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
  const u32 ag = get_global_id(0);
  const u32 ah = get_local_id(0);
  const u32 ai = get_local_size(0);

  __local u32 aj[8][64];
  __local u32 ak[8][64];

  for (u32 al = ah; al < 64; al += ai) {
    aj[0][al] = Ga[0][al];
    aj[1][al] = Ga[1][al];
    aj[2][al] = Ga[2][al];
    aj[3][al] = Ga[3][al];
    aj[4][al] = Ga[4][al];
    aj[5][al] = Ga[5][al];
    aj[6][al] = Ga[6][al];
    aj[7][al] = Ga[7][al];

    ak[0][al] = Gb[0][al];
    ak[1][al] = Gb[1][al];
    ak[2][al] = Gb[2][al];
    ak[3][al] = Gb[3][al];
    ak[4][al] = Gb[4][al];
    ak[5][al] = Gb[5][al];
    ak[6][al] = Gb[6][al];
    ak[7][al] = Gb[7][al];
  }

  barrier(1);

  if (ag >= af)
    return;

  u32 am[4];
  u32 an[4];

  am[0] = a[ag].i[0];
  am[1] = a[ag].i[1];
  am[2] = a[ag].i[2];
  am[3] = a[ag].i[3];
  an[0] = a[ag].i[4];
  an[1] = a[ag].i[5];
  an[2] = a[ag].i[6];
  an[3] = a[ag].i[7];

  const u32 ao = a[ag].pw_len;

  u32 ap[4];
  u32 aq[4];

  ap[0] = r[y].salt_buf[0];
  ap[1] = r[y].salt_buf[1];
  ap[2] = r[y].salt_buf[2];
  ap[3] = r[y].salt_buf[3];
  aq[0] = r[y].salt_buf[4];
  aq[1] = r[y].salt_buf[5];
  aq[2] = r[y].salt_buf[6];
  aq[3] = r[y].salt_buf[7];

  const u32 ar = r[y].salt_len;

  const u32 as[4] =
ad[ad[1],
    0,
    0
};

for (u32 at = 0; at < ab; at += 1) {
  u32x au[4] = {0};
  u32x av[4] = {0};
  u32x aw[4] = {0};
  u32x ax[4] = {0};

  const u32x ay = BW(am, an, ao, b, at, au, av);

  const u32x az = (ar + ay) * 2;

  AU(au, av, aw, ax, ar);

  u32x ba[16];

  ba[0] = au[0] | ap[0];
  ba[1] = au[1] | ap[1];
  ba[2] = au[2] | ap[2];
  ba[3] = au[3] | ap[3];
  ba[4] = av[0] | aq[0];
  ba[5] = av[1] | aq[1];
  ba[6] = av[2] | aq[2];
  ba[7] = av[3] | aq[3];
  ba[8] = aw[0];
  ba[9] = aw[1];
  ba[10] = aw[2];
  ba[11] = aw[3];
  ba[12] = ax[0];
  ba[13] = ax[1];
  ba[14] = ax[2];
  ba[15] = ax[3];

  u32x bb[16];

  bb[0] = 0x64649040;
  bb[1] = 0x14909858;
  bb[2] = 0xc4b44888;
  bb[3] = 0x9094e438;
  bb[4] = 0xd8a004f0;
  bb[5] = 0xa8f02810;
  bb[6] = 0xc84048d8;
  bb[7] = 0x68d804a8;
  bb[8] = 0x0490e40c;
  bb[9] = 0xac183024;
  bb[10] = 0x24c07c10;
  bb[11] = 0x8c88c038;
  bb[12] = 0xc048c824;
  bb[13] = 0x4c0470a8;
  bb[14] = 0x584020b4;
  bb[15] = 0x00742c4c;

  u32x bc[16];

  bc[0] = 0xa42ce40c;
  bc[1] = 0x64689858;
  bc[2] = 0x484050b8;
  bc[3] = 0xe8184814;
  bc[4] = 0x405cc070;
  bc[5] = 0xa010784c;
  bc[6] = 0x6074a800;
  bc[7] = 0x80701c1c;
  bc[8] = 0x9cd49430;
  bc[9] = 0x4c8ce078;
  bc[10] = 0x5c18c088;
  bc[11] = 0x28a8a4c8;
  bc[12] = 0x3c180838;
  bc[13] = 0xb0b86c20;
  bc[14] = 0xac84a094;
  bc[15] = 0x4ce0c0c4;

  u32x bd[2];

  bd[0] = 0;
  bd[1] = 0;

  for (u32 be = 0, bf = 0; be < az; be += 8, bf++) {
    u32x bg[2];

    bg[0] = ((ba[bf] << 16) & 0xff000000) | ((ba[bf] << 8) & 0x0000ff00);
    bg[1] = ((ba[bf] >> 0) & 0xff000000) | ((ba[bf] >> 8) & 0x0000ff00);

    bg[0] ^= bd[0];
    bg[1] ^= bd[1];

    DY(bd, bg, bb, bc, aj);
  }

  DZ(bd[0], bd[1], bb, bc, ak);

  bd[0] = 0;
  bd[1] = 0;

  for (u32 be = 0, bf = 0; be < az; be += 8, bf++) {
    u32x bg[2];

    bg[0] = ((ba[bf] << 16) & 0xff000000) | ((ba[bf] << 8) & 0x0000ff00);
    bg[1] = ((ba[bf] >> 0) & 0xff000000) | ((ba[bf] >> 8) & 0x0000ff00);

    bg[0] ^= bd[0];
    bg[1] ^= bd[1];

    DY(bd, bg, bb, bc, aj);
  }

  u32x bh = 0;

  {
    if (((bd[0]) == as[0]) && ((bd[1]) == as[1]) && ((bh) == as[2]) && ((bh) == as[3])) {
      const u32 bi = ad + 0;
      if (atomic_add(&q[bi], 1) == 0) {
        AA(o, t, y, 0, bi, ag, at);
      }
    }
  };
}
}

__kernel void EE(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global void* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
}

__kernel void EF(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global void* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
}