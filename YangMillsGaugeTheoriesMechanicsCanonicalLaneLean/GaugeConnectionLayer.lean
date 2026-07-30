import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace YangMillsGaugeTheoriesMechanicsCanonicalLaneLean

structure GaugeConnection where
  potential : GaugePotential
  curvature : CurvatureForm

def zeroGaugeConnection : GaugeConnection :=
  { potential := zeroGaugePotential, curvature := zeroCurvatureForm }

structure ConnectionCertificate where
  connection : GaugeConnection
  connectionClosed : val connection.potential = zeroGaugePotential ∧ val connection.curvature = zeroCurvatureForm
  connectionClosedProof : connectionClosed

def sourceConnectionCertificate : ConnectionCertificate :=
  { connection := zeroGaugeConnection
    connectionClosed := by 
      refine And.intro ?_ ?_
      · rfl
      · rfl
    connectionClosedProof := by
      refine And.intro ?_ ?_
      · rfl
      · rfl
  }

def ConnectionClosed (C : ConnectionCertificate) : Prop :=
  C.connectionClosed

theorem source_connection_closed : ConnectionClosed sourceConnectionCertificate :=
  sourceConnectionCertificate.connectionClosedProof

end YangMillsGaugeTheoriesMechanicsCanonicalLaneLean
end HautevilleHouse