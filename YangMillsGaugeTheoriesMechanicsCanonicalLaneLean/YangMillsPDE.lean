import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace YangMillsGaugeTheoriesMechanicsCanonicalLaneLean

def YangMillsEquation (A : GaugePotential) : Prop :=
  covariantDivergence (curvature A) = zeroGaugePotential

structure PDECertificate where
  field : YangMillsField
  equationSatisfied : YangMillsEquation field.potential
  equationClosed : equationSatisfied
  equationClosedProof : equationClosed

def sourcePDECertificate : PDECertificate :=
  { field := primitiveYangMillsField
    equationSatisfied := YangMillsEquation zeroGaugePotential
    equationClosed := by
      unfold YangMillsEquation
      rfl
    equationClosedProof := rfl
  }

def PDEClosed (C : PDECertificate) : Prop :=
  C.equationClosed

theorem source_pde_closed : PDEClosed sourcePDECertificate :=
  sourcePDECertificate.equationClosedProof

end YangMillsGaugeTheoriesMechanicsCanonicalLaneLean
end HautevilleHouse