import YangMillsGaugeTheoriesMechanicsCanonicalLaneLean.MathlibObjects
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace YangMillsGaugeTheoriesMechanicsCanonicalLaneLean

abbrev Euclidean4 := Fin 4 → ℝ
abbrev GaugeFiber := Fin 3 → ℝ
abbrev GaugePotential := Euclidean4 → Fin 4 → GaugeFiber
abbrev CurvatureForm := Euclidean4 → Fin 4 → Fin 4 → GaugeFiber
abbrev ScalarObservable := Euclidean4 → ℝ

def zeroGaugeFiber : GaugeFiber := fun _ => 0
def zeroGaugePotential : GaugePotential := fun _ _ => zeroGaugeFiber
def zeroCurvatureForm : CurvatureForm := fun _ _ _ => zeroGaugeFiber
def zeroObservable : ScalarObservable := fun _ => 0

structure GaugeOperators where
  curvature : GaugePotential → CurvatureForm
  covariantDivergence : CurvatureForm → GaugePotential
  actionDensity : CurvatureForm → ScalarObservable
  gaugeProjection : GaugePotential → GaugePotential
  gaugeProjectionIdempotent : ∀ A, gaugeProjection (gaugeProjection A) = gaugeProjection A

def primitiveGaugeOperators : GaugeOperators := {
  curvature := fun _ => zeroCurvatureForm
  covariantDivergence := fun _ => zeroGaugePotential
  actionDensity := fun _ => zeroObservable
  gaugeProjection := fun A => A
  gaugeProjectionIdempotent := by intro A; rfl
}

structure YangMillsField where
  potential : GaugePotential
  operators : GaugeOperators

def primitiveYangMillsField : YangMillsField := {
  potential := zeroGaugePotential
  operators := primitiveGaugeOperators
}

def CurvatureClosed (F : YangMillsField) : Prop :=
  F.operators.curvature F.potential = zeroCurvatureForm

def YangMillsEquationClosed (F : YangMillsField) : Prop :=
  F.operators.covariantDivergence (F.operators.curvature F.potential) = zeroGaugePotential

def GaugeProjected (F : YangMillsField) : Prop :=
  F.operators.gaugeProjection F.potential = F.potential

def GaugeFieldClosed (F : YangMillsField) : Prop :=
  CurvatureClosed F ∧ YangMillsEquationClosed F ∧ GaugeProjected F

theorem primitive_gauge_projection_idempotent_checked (A : GaugePotential) :
    primitiveGaugeOperators.gaugeProjection (primitiveGaugeOperators.gaugeProjection A) =
      primitiveGaugeOperators.gaugeProjection A := by
  rfl

theorem primitive_curvature_closed_checked :
    CurvatureClosed primitiveYangMillsField := by
  unfold CurvatureClosed
  simp [primitiveYangMillsField, primitiveGaugeOperators, zeroCurvatureForm]

theorem primitive_yang_mills_equation_closed_checked :
    YangMillsEquationClosed primitiveYangMillsField := by
  unfold YangMillsEquationClosed
  simp [primitiveYangMillsField, primitiveGaugeOperators, zeroCurvatureForm, zeroGaugePotential]

theorem primitive_gauge_projected_checked :
    GaugeProjected primitiveYangMillsField := by
  unfold GaugeProjected
  simp [primitiveYangMillsField, primitiveGaugeOperators]

theorem primitive_gauge_field_closed_checked :
    GaugeFieldClosed primitiveYangMillsField := by
  exact And.intro primitive_curvature_closed_checked
    (And.intro primitive_yang_mills_equation_closed_checked primitive_gauge_projected_checked)

end YangMillsGaugeTheoriesMechanicsCanonicalLaneLean
end HautevilleHouse