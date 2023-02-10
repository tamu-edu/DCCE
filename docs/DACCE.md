# DACCE

# Main Idea
It lazily encode a known call graph at runtime. If the current call site is not encoded, it pushes information to ccStack and assign ID to MaxID+1. Decoding logic handles these two cases.
Later when many enough call graph information are collected, then start encoding with them (using PCCE).

# Comparison to DCCE
* DCCE's encoding algorithm can be directly used in dynamic encoding without stack.
  * Just compute w and update ID before call site.

# Questions
* Is maxID the maximum number among IDs to the current function or the maximum ID across all functions or the total number of calling context?
* Why 2*maxID+1 is the greatest number for not encoded edge?
* Why is maxID not incremented by 1 when instrumenting not encoded edge?
  * It seems okay because ID = maxID+1 just indicates it's not encoded. Even if there are many ID==1 in ccStack, it looks working so far.
* Why DACCE is fater than PCCE? PCCE has just ID+=w and ID-=w but DACCE has stack operations for non encoded edges.
