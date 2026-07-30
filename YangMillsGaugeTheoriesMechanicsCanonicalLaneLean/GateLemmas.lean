import YangMillsGaugeTheoriesMechanicsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace YangMillsGaugeTheoriesMechanicsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end YangMillsGaugeTheoriesMechanicsCanonicalLaneLean
end HautevilleHouse