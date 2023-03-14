---
title: PCC presentation
paginate: true
marp: true
theme: gaia
style: |
    img[alt~="center"] {
      display: block;
      margin: 0 auto;
    }

---
# Probabilistic Calling Context
## Michael D. Bond
### Published in OOPSLA `07

---
- Maintains a probabilistically unique value representing the current calling context.
- Targets clients that queries calling context at production run
- With 32 bit, produce a unique value for up to millions of contexts with relatively few conflicts
  - Conflict rate is 0.1\% or less for up to 10 million contexts
- With 64 bit, PCC value can probabilistically differentiate billions of unique calling contexts.
- Although a new PCC value indicates a new context, the context is not determinable from the value, so PCC walks the stack when it encounters anomalous behavior or report the calling context.
  - Does it meaning that PCC is not distinguishable?
- Overhead of PCC value computation  is 3\%
- Overhead of Querying at every call in the application is 49\% (No such clients).
- In serveral interesting production scenarios,
  - querying at every system call: no measurable overhead
  - at every java.util call: 3\% overhead
  - every Java API call: 9\% overhead
- Computing PCC values does not have space overhead but clients add space overhead proportional to the number of distinct contexts they store (one word per context).

- their target client is 
  - Residual testing
  - Anomaly-based bug or intrusion detection

- PCC is both persistent and distinguishable
  - It is persistent because `f = 3*V + hash(func_name, lineno)
  - It is distinguishable


- PCC can compute persistent CCID dynamically contrast to DCCE need statically computed edge weight.

- PCC can be implemented by both static and dynamic instrumentation.
  - Static analysis: read function name and line number at compile time and hard code it.
  - Dynamic analysis: read function name and line number for every function call 
  - Dynamic compilation (RVM, Jit Compiler): read function name and line number for cs and instrument `f` with computed cs

- The paper describes how anomalous behavior detection work in practice using PCC.
  - Recorded/Profiled PCC values can be lookup by open-address hashing and double hashing using an array of 2^k slots.[

- They exclude the VM and library call sited from encoding
  

- They provide source code in Jikes RVM
 - Patch against Jikes 2.9.2


- Potential PCC clients
  - System calls: Anomaly-based security intrusion detection
  - Java utility calls: Residual testing
  - Java API calls: Residual testing
  - All calls: code coverage and generating tests with good code coverage

- Decoding is not supported
