import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.YangMillsGaugeTheoriesMechanicsCanonicalLaneLean.SourcePackage

namespace HautevilleHouse
namespace YangMillsGaugeTheoriesMechanicsCanonicalLaneLean

structure Dependency where
  name : String
  version : String
  imported : Bool

def dependencies : List Dependency :=
  [ { name := "mathlib", version := "4.0.0", imported := true }
  , { name := "canonical-lane-core", version := "1.0.0", imported := true }
  ]

def dependencyCount : Nat := 2

theorem dependency_count_checked : dependencies.length = 2 := by
  native_decide

end YangMillsGaugeTheoriesMechanicsCanonicalLaneLean
end HautevilleHouse