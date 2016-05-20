Automatic Fault Localization for Relational Model Transformation using Deductive Verification (Online)
=======

Introduction
------
In model-driven engineering, correct model transformation is essential for reliably producing the artefacts that drive software development. While correctness of model transformation can be specified and checked via contracts, existing approaches do not help in finding the precise location of faults that cause the verification to fail. We present an automatic fault-localization approach, based on deductive verification, for the ATL relational model-transformation language. We start by designing and implementing an algorithm for the automatic decomposition of OCL contracts (postcondition in particular) into sub-goals, based on static trace information from the input ATL model transformation: successfully proving all the sub-goals implies the correctness of the decomposed OCL postcondition. Then, we use these sub-goals to slice the ATL model transformation and present the user with simple scenarios that pinpoint the fault. This repository contains the evaluation artefects of our automatic fault localization approach for the ATL language using the VeriATL decutive verification system [url](https://github.com/veriatl/VeriATL.CaseStudies).

Repository structure
------
- CaseStudySourceFiles. The source code of the HSM2FSM case study, including the source and target metamodels, the HSM2FSM transformation in ATL, and the OCL contracts of HSM2FSM in OCL.
- HSM2FSM. The artefects of the original HSM2FSM case study: 
  * Auxu. The corresponding Boogie code of the HSM2FSM case study, generated by VeriATL.
  * Sub-goals. The Boogie code generated by applying our OCL decomposition on each of the input OCL postconditions of the HSM2FSM case study.
- MuTr. The artefects of the mutated HSM2FSM case study, mutated by appending *false* to the filter of each of the original transformation rules, one at a time.
- MuPre. The artefects of the mutated HSM2FSM case study, mutated by eliminating original preconditions, one at a time.
- Problematic_Tr_Scen. The 31 Problematic transformation scenarios generated for the 11 unverified OCL postconditions in HSM2FSM, MuTr and MuPre, to help transformation developers localize the fault.
- Prelude. The core Boogie libraries for the VeriATL verification system.
- Result. the evaluation results of the orignal and mutated HSM2FSM case study in text format.
- Three python scripts to reproduce the evaluation results.
- Example. An example that demonstrates how to verify intermediate enumerated sub-goals to further reduce the size of generated sub-goals. 

Tools required
------
The following tools are needed to reproduce the result of the HSM2FSM case study:
- Python 3.0+
- Boogie 2.2+
- Z3 4.3+