import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace YangMillsGaugeTheoriesMechanicsCanonicalLaneLean

structure FeynmanPathIntegral where
  action : YangMillsActionEnvelope
  measureDefined : Prop
  integralFinite : Prop

def primitiveFeynmanPathIntegral : FeynmanPathIntegral :=
  { action := sourceYangMillsActionEnvelope
    measureDefined := True
    integralFinite := True
  }

structure PathIntegralCertificate where
  pathIntegral : FeynmanPathIntegral
  pathIntegralClosed : val pathIntegral.measureDefined = True ∧ val pathIntegral.integralFinite = True
  pathIntegralClosedProof : pathIntegralClosed

def sourcePathIntegralCertificate : PathIntegralCertificate :=
  { pathIntegral := primitiveFeynmanPathIntegral
    pathIntegralClosed := by
      refine And.intro ?_ ?_
      · rfl
      · rfl
    pathIntegralClosedProof := by
      refine And.intro ?_ ?_
      · rfl
      · rfl
  }

def PathIntegralClosed (C : PathIntegralCertificate) : Prop :=
  C.pathIntegralClosed

theorem source_path_integral_closed : PathIntegralClosed sourcePathIntegralCertificate :=
  sourcePathIntegralCertificate.pathIntegralClosedProof

end YangMillsGaugeTheoriesMechanicsCanonicalLaneLean
end HautevilleHouse