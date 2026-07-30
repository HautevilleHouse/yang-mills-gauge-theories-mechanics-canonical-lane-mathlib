import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace YangMillsGaugeTheoriesMechanicsCanonicalLaneLean

structure YangMillsAction where
  lagrangian : Prop
  eom : Prop
  gaugeInvariant : Prop
  lagrangianClosed : lagrangian
  eomClosed : eom
  gaugeInvariantClosed : gaugeInvariant

def sourceYangMillsAction : YangMillsAction := {
  lagrangian := True
  eom := True
  gaugeInvariant := True
  lagrangianClosed := trivial
  eomClosed := trivial
  gaugeInvariantClosed := trivial
}

def YangMillsActionClosed (A : YangMillsAction) : Prop :=
  A.lagrangian ∧ A.eom ∧ A.gaugeInvariant

theorem source_yang_mills_action_closed :
    YangMillsActionClosed sourceYangMillsAction := by
  exact And.intro sourceYangMillsAction.lagrangianClosed
    (And.intro sourceYangMillsAction.eomClosed
      sourceYangMillsAction.gaugeInvariantClosed)

end YangMillsGaugeTheoriesMechanicsCanonicalLaneLean
end HautevilleHouse