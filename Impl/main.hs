import Expand
import Enumerate
import Syntax
import Pretty
import PrintProveTree
import Data.String.Utils


main = putStrLn (printTree 
 (myEnumerate (expand 
 (Quantified 
  Forall 
  (Fcall "allInstance" [(Literal (StringValue "Rel$RelSchema"))]) 
  ("s", (RefType "Rel$RelSchema"))
  (Quantified Forall
    (Navigation "Relations" (Variable ("s", (RefType "Rel$RelSchema"))) (RefType "Rel$Relation"))
    ("r1", (RefType "Rel$Relation"))
    (Quantified Forall
      (Navigation "Relations" (Variable ("s", (RefType "Rel$RelSchema"))) (RefType "Rel$Relation"))
      ("r2", (RefType "Rel$Relation"))
      (BinaryExpression Implies
        (BinaryExpression Neq 
          (Variable ("r1", (RefType "Rel$Relation"))) 
          (Variable ("r2", (RefType "Rel$Relation"))))
        (BinaryExpression Neq 
          (Navigation "name" (Variable ("r1", (RefType "Rel$Relation"))) StringType) 
          (Navigation "name" (Variable ("r2", (RefType "Rel$Relation"))) StringType))
      )
    )
  ) 
 )) Each ) 0)