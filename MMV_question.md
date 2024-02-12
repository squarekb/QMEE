This feels like a trick question to me. But, if the rapid MMV test has a 5% chance of a false positive, and a 0% chance of a false negative, I believe this person who tests positive on a rapid test has a 95% chance of having MMV.

If you learn that your friend tests positive for MMV, tell them that there is a 95% chance that they do in fact have MMV, and that there is a 5% chance that they don't. Ask them a few questions about mathematical models to develop your own hypothesis about their condition.

**BMB**: it's not a trick question ... Bayes' rule will give you the answer that given the base rate of infection in the population, and the probabilities of false negative and positive tests, *if* you have no additional information (e.g. if the person decided to take a test at random, not because they have symptoms), then the conditional prob that they have MMV given a positive test is ...

Pr(MMV) = Prior(MMV)*Pr(pos test|MMV)/(Pr(MMV)) =
Prior(MMV)*Pr(pos_test|MMV)/(Prior(MMV)*Pr(pos_test|MMV) + (1-Prior)*Pr(pos_test|no MMV)) = 0.01*1/((1*0.01) + (0.99*0.05)) = 0.01/0.0595 = 0.168

It is possible to guess the answer, but only if you are guessing the right way! (**Approximately**, for a very rare disease with prevalence p, false positive rate f, and no false negatives, the posterior probability is

(p*1)/((1*p) + (1-p)*f) ~ (p*1)/(p + f)  = p/(p+f).
In this case this 0.01/(0.01 + 0.05) ~ 1/6.

If p is *very* small, then practically all positives are false positives, and the test actually doesn't tell us anything (the probability goes to p).
