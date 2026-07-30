import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace YangMillsGaugeTheoriesMechanicsCanonicalLaneLean

structure GaugeGroup where
  dimension : ℕ
  structureConstants : (Fin dimension → Fin dimension → Fin dimension → ℝ)

structure GaugeField where
  potential : Fin 4 → Fin 4 → GaugeGroup
  fieldStrength : Fin 4 → Fin 4 → GaugeGroup

structure YangMillsEquations where
  gaugeInvariance : Prop
  sourceless : Prop
  energyBounded : Prop

defaultInstance : YangMillsEquations := {
  gaugeInvariance := True
  sourceless := True
  energyBounded := True
}

def YangMillsAdmissibleClass (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem yang_mills_admissible_closure (A : AdmissibleClass) :
    YangMillsAdmissibleClass A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end YangMillsGaugeTheoriesMechanicsCanonicalLaneLean
end HautevilleHouse