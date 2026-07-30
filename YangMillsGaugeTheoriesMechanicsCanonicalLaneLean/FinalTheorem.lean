import YangMillsGaugeTheoriesMechanicsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace YangMillsGaugeTheoriesMechanicsCanonicalLaneLean

def ConstrainedGaugeMechanicsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_gauge_mechanics_endgame (A : AdmissibleClass) :
    ConstrainedGaugeMechanicsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end YangMillsGaugeTheoriesMechanicsCanonicalLaneLean
end HautevilleHouse