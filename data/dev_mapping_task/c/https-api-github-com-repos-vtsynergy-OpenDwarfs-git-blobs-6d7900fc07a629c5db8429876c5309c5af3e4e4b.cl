typedef struct {
  int phiType, region;

  float one_plus_alpha, beta, alpha_beta, one_plus_alpha_beta, alpha_by_one_minus_beta, inverse_one_plus_ab_by_diel_ext, kappa, Asq, Asq_minus_rnautsq, Asq_minus_rsq, Asq_by_dsq;

} analytical_definitions_struct;

inline float A(float a, float b, float c, float d, float e, float f) {
  float g = a - d, h = b - e, i = c - f;
  return (g * g + h * h + i * i);
}

inline float B(float a, float b, float c, float d, float e, float f) {
  return sqrt(A(a, b, c, d, e, f));
}

__kernel void C(int a, int b, float c, float d, float e, float f, float g, float h, int i, int j, int k, __global unsigned int* l, __global unsigned int* m, float n, float o, float p, __global float* q, __global float* r, __global float* s, __global float* t, __global float* u, __global float* v, __global float* w, __global float* x, __global float* y, __global float* z, __global float* aa, __global float* ab, __global float* ac, __global float* ad, __global float* ae) {
  int af, ag,

      ah;
  float ai, aj, ak;
  float al = 0, am = 0, an = 0, ao = 0, ap = 0, aq = 0, ar = 0, as;
  float at = 0;

  analytical_definitions_struct au;

  j = j + (get_global_size(0) * get_global_size(1) * get_global_id(2)) + (get_global_size(0) * get_global_id(1)) + get_global_id(0);
  if (j >= b)
    return;

  au.Asq = c * c;
  au.Asq_minus_rsq = au.Asq - (n * n);

  au.kappa = 0.316f * sqrt(g);
  au.beta = e / f;
  au.alpha_by_one_minus_beta = .571412f * (1.0f - au.beta);
  au.alpha_beta = .571412f * au.beta;
  au.one_plus_alpha_beta = 1.0f + au.alpha_beta;
  au.one_plus_alpha = 1.0f + .571412f;
  au.inverse_one_plus_ab_by_diel_ext = 1.0f / (au.one_plus_alpha_beta * f);
  au.phiType = i;

  if (n > p) {
    au.region = 3;
  } else if (n > c) {
    au.region = 2;
  } else {
    au.region = 1;
  }

  o = c / 2.0f;
  y[j] = 0;
  au.Asq_minus_rnautsq = au.Asq - o * o;

  {
    for (ag = 0; ag < a; ag++) {
      ah = m[ag];

      for (af = 0; af < ah; af++) {
        ai = B(z[j], aa[j], ab[j], v[l[ag] + af], w[l[ag] + af], x[l[ag] + af]);

        aj = B(ac[j], ad[j], ae[j], v[l[ag] + af], w[l[ag] + af], x[l[ag] + af]);

        au.Asq_by_dsq = c * c * ai * ai;

        ak = u[l[ag] + af];

        if (au.phiType != 3) {
          aq = ak / (ai * e);
        }

        if (au.phiType & 2) {
          if (au.region == 3) {
            al = (ak * (exp(-au.kappa * (ai - aj))) / ai) * (au.one_plus_alpha / (1.0f + au.kappa * aj));

            am = ak * (au.alpha_by_one_minus_beta * exp(-au.kappa * (n - p)) / (n * (1.0f + au.kappa * p)));

            ar = au.inverse_one_plus_ab_by_diel_ext * (al - am);
          } else if (au.region == 2) {
            as = 1.0f / (1.0f + (au.kappa * p));

            al = au.one_plus_alpha * ak / ai;
            am = au.alpha_by_one_minus_beta * ak / n;

            an = ak * (au.alpha_by_one_minus_beta / p) * (1.0f - as);
            ao = au.one_plus_alpha * ak * (1.0f / (aj + au.kappa * aj * aj) - (1.0f / aj));

            ar = au.inverse_one_plus_ab_by_diel_ext * (al - am + an + ao);
          } else {
            as = 1.0f / (1.0f + (au.kappa * p));

            al = 1.0f / (ai * e);

            am = (1.0f / e - 1.0f / f) / (au.one_plus_alpha_beta * c);

            an = au.Asq / sqrt(au.Asq_minus_rnautsq * au.Asq_minus_rsq + au.Asq_by_dsq);

            ap = au.inverse_one_plus_ab_by_diel_ext * (au.one_plus_alpha / aj * (1.0f / (1.0f + au.kappa * aj) - 1.0f) + au.alpha_by_one_minus_beta / p * (1.0f - as));

            ar = (al - am * an + ap) * ak;
          }

          if (au.phiType == 2) {
            ar -= aq;
          }
        } else {
          ar = aq;
        }

        y[j] += ar;
      }
    }
  }
}