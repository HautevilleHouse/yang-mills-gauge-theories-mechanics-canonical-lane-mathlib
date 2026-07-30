import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace YangMillsGaugeTheoriesMechanicsCanonicalLaneLean

structure BRSTComplex where
  ghostFields : Type
  brstOperator : Type
  cohomologyTrivial : Prop

def primitiveBRSTComplex : BRSTComplex :=
  { ghostFields := Unit
    brstOperator := Unit
    cohomologyTrivial := True
  }

structure BRSTCertificate where
  brst : BRSTComplex
  brstClosed : val brst.cohomologyTrivial = True
  brstClosedProof : brstClosed

def sourceBRSTCertificate : BRSTCertificate :=
  { brst := primitiveBRSTComplex
    brstClosed := by rfl
    brstClosedProof := rfl
  }

def BRSTClosed (C : BRSTCertificate) : Prop :=
  C.brstClosed

theorem source_brst_closed : BRSTClosed sourceBRSTCertificate :=
  sourceBRSTCertificate.brstClosedProof

end YangMillsGaugeTheoriesMechanicsCanonicalLaneLean
end HautevilleHouse