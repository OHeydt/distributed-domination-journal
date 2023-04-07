# REVIEW 1
SCORE: 2 (accept)

This paper presents a constant round 20-approximation algorithm for computing a minimum dominating set in planar graphs in the LOCAL model.
Previously there was a constant round 52-approximation algorithm to the problem, and there is a lower bound showing that any deterministic constant round algorithm has an approximation ratio of at least 7.
Techniques: the authors exploit structural properties of planar graphs to reduce the problem to a problem on bounded degree graphs, and then use a greedy algorithm to solve the bounded degree case.

## Evaluation:

## Strengths:

- The paper narrows the gap between the upper and lower bounds for approximating the minimum dominating set problem in planer graphs in the LOCAL model.

## Weaknesses:

- As there are already $O(1)$-round $O(1)$-approximation algorithms to the problem, it seems that the main open question is to obtain algorithms with an optimal approximation of 7, or at least to get closer to it.

- It seems that a simpler variant of the algorithm can give a better approximation (about 13 for the deterministic case, and about 8.4 for the randomized case). The general idea is to replace the last part of the algorithm that deals with bounded degree graphs with alternative existing algorithms that give a better approximation. I discuss it in detail in the comments for authors section.

## Summary:

Given the above, I tend towards rejecting the paper in its current form, but I recommend the authors to check if extending their approach can lead to better approximations.

## Update:

After seeing the new version of the paper, I changed my score to accept, and support accepting the current version of the paper.

## Comments for authors:

Most of the comments refer to the first version, page numbers are with respect to the first version, at the end I added a few minor comments for the new version.

Improving the approximation:

### Deterministic algorithm:

I believe that the following approach can give a better approximation. As you mention at the beginning of the paper, once the problem is reduced to a problem on bounded degree graphs, you can use a constant round algorithm for approximating the minimum dominating set in bounded arboricity graphs. In page 2 you refer to an algorithm of Lenzen and Wattenhofer and say that it would lead to a worse approximation. However, currently there are more recent algorithms for the problem with a better approximation. In particular, you can obtain a 3a-approximation (or 9 for planer graphs where the arboricity is 3) using the following algorithm:

Bansal, Nikhil, and Seeun William Umboh. "Tight approximation bounds for dominating set on graphs of bounded arboricity." Information Processing Letters 122 (2017): 21-24.

This is a centralized algorithm that first finds an optimal fractional solution to the problem, and then uses a very simple deterministic rounding to get a solution to the problem. This can be implemented efficiently in the LOCAL model using an algorithm for (approximately) finding an optimal fractional solution. A $(1+\epsilon)$-approximate fractional solution can be computed in $O(log^2 \Delta)$ rounds (which is constant for bounded degree graphs) using the following distributed algorithm (see section 4):

Kuhn, Fabian, Thomas Moscibroda, and Roger Wattenhofer. "The price of being near-sighted." SODA 2006.

Using this approach you can get a $(9+\epsilon)$-approximation to the minimum dominating set problem in planer graphs of bounded degree.

I believe that this would change the constant in Lemma 17 from $15.9$ to $(9+\epsilon)$, and then following the same arguments you will get a $(13+\epsilon)$-approximation instead of $19.9$. Maybe a closer look at this approach can lead to even better approximation.  

### Randomized algorithm:

It seems that using randomization you can possibly get even better approximation for the bounded degree case, using algorithms that obtain an $O(\ln{\Delta})$-approximation.
For example, it seems that the above mentioned paper from 2006, can give $(1+\epsilon)(1+\ln{\Delta+1})$-approximation in $O(\log^2 \Delta)$ rounds ($O(1)$ for bounded degree graphs), which seems to give even better approximation in your case (it seems that the constant in Lemma 17 would become $1+\ln{31}$ which is roughly $4.4$, and the overall approximation would be around $8.4$), but this is a randomized algorithm. You can see an overview of the literature in this paper:

Deurer, Janosch, Fabian Kuhn, and Yannic Maus. "Deterministic distributed dominating set approximation in the CONGEST model." PODC 2019.

## Other comments:

* Page 1, "with many applications in theory and practice" - I think it would be good to expand a bit more on the motivation and applications, instead of just referring to other papers.

* Page 4, "Note that because the $a_i$ are independent, the vertices $a_i$ themselves are not associated to a dominator" - this sentence is not clear to me, isn't the reason that they are not assigned to a dominator just follows from the fact that you remove them when you construct the sets $B_i$?

* Page 5, I got a bit confused by the definition of $D_2$. Doesn't it follow from symmetry that $D_2 = W$? It seems that any vertex that is in the set $B_v$ is also in $W$ from symmetry. Do you need the alternative definition because of the analysis later? Please clarify.

  > Alex: it is true that B_2=W should be comment on that ?

**Typos:**

* It seems that there are no end of proof signs, would be good to add them.

  > Alex: I think that this is SIROCCO's style, not sure

* Page 8: to many edges -> too many edges

  > Alex: corrected

**Minor comments for the new version:**

* Page 1, towards the end of the page, paragraph that starts with "In this work..", you write that you obtain a 20-approximation, but I guess it should be 12 now.

  > Alex: corrected


* Page 9, in the proof of Lemma 16, you write in a few places "at most 3|R|-6 between", I assume it should be 3|R|-6 *edges* between

  > Alex: corrected



# REVIEW 2

SCORE: 1 (weak accept)
The authors study the problem of approximating a minimum dominated set (MDS) in planar graphs in constant time in the LOCAL model. The previous best approximation ratio under these constraints was 52; the authors present an algorithm that obtains an improved approximation ratio of 20. They also show that their algorithm can be used to obtain approximation ratios below 20 for planar graphs with certain additional properties, namely, being bipartite, triangle-free, outerplanar, or of girth at least 5. Except for the outerplanar case, the obtained approximation ratios improve on the state of the art (in each case by a factor between 2 and 3).
The presented algorithm proceeds in 3 phases. In the first phase, vertices whose neighborhood cannot be dominated by a small number of other vertices are added to the dominating set. In the second phase, pairs of vertices that have a large number of common not-yet-dominated neighbors are added. As the authors show, after the second phase, the graph has degree at most 30. In the third phase, the algorithm iteratively adds (a subset of) vertices that dominate x non-dominated neighbors, where x stepwise decreases from 30 to 0 and always constitutes an upper bound for the largest possible number of non-dominated neighbors of any vertex. The most expensive part, contributing almost 16 to the approximation factor, is the third phase, in which the number of added vertices is bounded by solving some derived linear program.

The paper makes progress on a fairly fundamental problem (approximate MDS), albeit in a quite restricted setting (planar graphs + constant runtime). With the best known lower bound in the general planar case being 7, the improvement in the approximation ratio is significant, though still far from tight.
The general approach and the used techniques rely heavily on previous work. Regarding technical novelty, I would consider the two main contributions to be the use of linear programming for bounding the number of added nodes in phase 3, and Lemma 2, which, roughly speaking, provides a relation between the number of vertices whose neighborhood cannot be covered by a small number of other vertices, the edge density of certain minors, and the chromatic number of the input graph. While not earth-shattering, these contributions expand our understanding of how to obtain better approximations. (Although it should be mentioned that if the correct answer turns out to be 7 or close to it (which the authors consider to be likely; an assessment I agree with), it is far from clear whether these techniques will play a role in an optimal algorithm or significantly contribute to leading to one.)
The paper is very well written, making it a pleasure to read. The proofs are precise and provide all details. The only part where this is not true is the use of linear programming, which, as presented, strictly speaking, does not provide a formal proof. It would be great to have a short formal proof that obtains the presented bounds; however, given that this might be difficult, I have no major complaints regarding this part.

Given the mentioned shortcomings (restricted setting, heavy reliance on previous ideas, "far" from tight), I don't think that the paper has a particularly strong claim on being included into the program but if there is enough space, I think it would be perfectly fine to accept it.

The changes made by the authors to include the suggested LP-based approach seem fine to me. It seems that the approximation ratios could be further improved by an additive 1 - eps (except for the case of girth at least 5) to 11 + eps etc. (for arbitrarily small eps > 0, not to be confused with the epsilon from the paper), by choosing delta appropriately as a function of eps (differently for Corollary 15 and Lemma 18). Given that the presented approximation ratios are already quite small, using this more precise analysis seems worth it.

## Minor remarks:

* p.1 (and later): I'd refrain from using "either ... or" if the or is non-exclusive.

  > Alex: Should we?

* p.1: be -> by

  > Alex: corrected

* p.2: "It remains to analyze the performance of this algorithm." is misleading as in the following you only analyze phase 3.

  > 

* p.2: graphs classes -> graph classes

  > Alex: corrected

* p.2: approximation of factors -> the following approximation factors?

  > Alex: done

* p.3: Lemma 1 would profit from one or more references.

  > 

* p.3: vertices have -> vertices that have

  > Alex: done

* p.3: while in the following -> while in the subsequent?

  > 

* p.7: Shouldn't the index in the union in the definition of D_3 go from 0 to 30?`

  > Alex: Yes, done

* p.8: to many -> too many

  > Alex: done

* p.8: There are several "E_k" and "V_k" which should be "E(k)" and "V(k)".

  > Alex: done

* p.9: on of -> one of

  > Alex: done

* p.12: Reference [4] has been accepted at DISC 2021 meanwhile.

  > Alex: Done

* p.13: straight forward -> straightforward

  > Alex: done

* p.13: "which is then added to the result": please rephrase; it is unclear what, e.g., "then" and "result" mean here

  > Alex: I think it is clear enough

* p.13: "The step 3": What does this refer to?

  > Alex: Again I think it is clear enough

* p.13: "picking less element"

  > Alex: done

* p.13: become predominant -> becomes predominant

  > Alex: done

* p.13: that there -> than there

  > Alex: done

* p.13: The second paragraph in Section A.1 (starting with "First") is quite unclear/vague, please explain more precisely. Also, using d_i and r_i there instead of d[i] and r[i] seems more consistent to me.

  > Alex: this is to match the syntax of the programing language



# REVIEW 3

SCORE: 1 (weak accept)

The paper improves the best-known approximation ratio for algorithms performing in a constant number of rounds solving minimum dominating set (MDS) in planar graphs under the LOCAL model, from 52 to 20. The best-known lower bound for the approximation ratio of O(1)-round algorithms is 7-ε, for every ε>0.

## Pros:

Quantitative and qualitative improvements of the approximation ratio, the latter resulting from a deeper and careful analysis of the dominating number of the neighboring nodes of any given node of the graph.

The paper provides hope to eventually design an approximation algorithm with a ‘reasonable’ approximation ratio.

The presentation is pleasant, the formalism is clear, and the technical results are non-trivial.

## Con:

The paper mostly follows the guidelines established by previous papers, i.e., refinement of the neighborhood domination approach.

The paper holds for planar graphs only, and nothing is said about whether the results and the techniques in the paper can be extended beyond planar graphs, e.g., to graphs with bounded degeneracy, bounded genus, etc.

## Conclusion:

Despite its limitations, the paper is an excellent fit to SIROCCO, establishing connections between structural properties of graphs (here planarity) and the ability to solve problems (here domination) efficiently. The quality and style of the presentation are hints that the paper may yield a nice talk at the conference.
