import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace YangMillsGaugeTheoriesMechanicsCanonicalLaneLean

structure CalorononStructure where
  compactManifold : Prop
  vectorBundleOver : Prop
  connectionOn : Prop
  curvatureForm : Prop

defaultCaloronon : CalorononStructure := {
  compactManifold := True
  vectorBundleOver := True
  connectionOn := True
  curvatureForm := True
}

def CalorononClosed (C : CalorononStructure) : Prop :=
  C.compactManifold ∧ C.vectorBundleOver ∧ C.connectionOn ∧ C.curvatureForm

theorem default_caloronon_closed : CalorononClosed defaultCaloronon := by
  unfolding CalorononClosed defaultCaloronon
  exact ⟨True.intro, True.intro, True.intro, True.intro⟩

end YangMillsGaugeTheoriesMechanicsCanonicalLaneLean
end HautevilleHouse