import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.YangMillsGaugeTheoriesMechanicsCanonicalLaneLean.YangMillsAnalyticCertificate

namespace HautevilleHouse
namespace YangMillsGaugeTheoriesMechanicsCanonicalLaneLean

def gaugeAdmittedObject : AdmittedTheoremObject := {
  object := {
    sourceKey := "yang-mills-gauge-theories-mechanics-lane"
    theoremObject := "Yang-Mills Gauge Theories Mechanics"
    claimBoundary := "Classical Yang-Mills theory with mass gap"
  }
  localWitness := "Yang-Mills analytic certificate with gauge group, instanton bound, mass gap estimate"
  bridgeEvidence := "source-derived Lean certificate fields"
  sourceKeyChecked := rfl
  theoremObjectChecked := rfl
}

def gaugeAdmissibleClass : AdmissibleClass := {
  object := gaugeAdmittedObject
  endpointSatisfied := YangMillsAnalyticCertificateClosed sourceYangMillsAnalyticCertificate
  remainderRecorded := True
  gateWitness := Or.inl source_yang_mills_analytic_certificate_closed
}

def YangMillsAdmittedGaugeMassGapClosure : Prop :=
  YangMillsAnalyticCertificateClosed sourceYangMillsAnalyticCertificate ∧
  ConstrainedTheoremClosure gaugeAdmissibleClass

theorem yang_mills_admitted_gauge_mass_gap_closure_checked :
    YangMillsAdmittedGaugeMassGapClosure := by
  exact And.intro source_yang_mills_analytic_certificate_closed
    (constrained_theorem_closure gaugeAdmissibleClass)

end YangMillsGaugeTheoriesMechanicsCanonicalLaneLean
end HautevilleHouse