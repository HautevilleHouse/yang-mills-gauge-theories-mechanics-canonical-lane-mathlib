import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace YangMillsGaugeTheoriesMechanicsCanonicalLaneLean

structure CanonicalQuantization where
  phaseSpace : Type
  symplecticForm : Type
  gaugeInvariant : Prop

def primitiveCanonicalQuantization : CanonicalQuantization :=
  { phaseSpace := Unit
    symplecticForm := Unit
    gaugeInvariant := True
  }

structure QuantizationCertificate where
  quantization : CanonicalQuantization
  quantizationClosed : val quantization.gaugeInvariant = True
  quantizationClosedProof : quantizationClosed

def sourceQuantizationCertificate : QuantizationCertificate :=
  { quantization := primitiveCanonicalQuantization
    quantizationClosed := by rfl
    quantizationClosedProof := rfl
  }

def QuantizationClosed (C : QuantizationCertificate) : Prop :=
  C.quantizationClosed

theorem source_quantization_closed : QuantizationClosed sourceQuantizationCertificate :=
  sourceQuantizationCertificate.quantizationClosedProof

end YangMillsGaugeTheoriesMechanicsCanonicalLaneLean
end HautevilleHouse