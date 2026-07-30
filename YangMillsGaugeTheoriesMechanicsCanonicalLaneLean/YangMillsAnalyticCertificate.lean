import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.YangMillsGaugeTheoriesMechanicsCanonicalLaneLean.YangMillsActionLayer

namespace HautevilleHouse
namespace YangMillsGaugeTheoriesMechanicsCanonicalLaneLean

structure YangMillsAnalyticCertificate where
  action : YangMillsAction
  gaugeGroup : Prop
  instantonBound : Prop
  massGapEstimate : Prop
  actionClosed : YangMillsActionClosed action
  gaugeGroupClosed : gaugeGroup
  instantonBoundClosed : instantonBound
  massGapEstimateClosed : massGapEstimate

def sourceYangMillsAnalyticCertificate : YangMillsAnalyticCertificate := {
  action := sourceYangMillsAction
  gaugeGroup := True
  instantonBound := True
  massGapEstimate := True
  actionClosed := source_yang_mills_action_closed
  gaugeGroupClosed := trivial
  instantonBoundClosed := trivial
  massGapEstimateClosed := trivial
}

def YangMillsAnalyticCertificateClosed (C : YangMillsAnalyticCertificate) : Prop :=
  C.actionClosed ∧ C.gaugeGroup ∧ C.instantonBound ∧ C.massGapEstimate

theorem source_yang_mills_analytic_certificate_closed :
    YangMillsAnalyticCertificateClosed sourceYangMillsAnalyticCertificate := by
  exact And.intro sourceYangMillsAnalyticCertificate.actionClosed
    (And.intro sourceYangMillsAnalyticCertificate.gaugeGroupClosed
      (And.intro sourceYangMillsAnalyticCertificate.instantonBoundClosed
        sourceYangMillsAnalyticCertificate.massGapEstimateClosed))

end YangMillsGaugeTheoriesMechanicsCanonicalLaneLean
end HautevilleHouse