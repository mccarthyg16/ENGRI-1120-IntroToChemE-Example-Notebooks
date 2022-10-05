### A Pluto.jl notebook ###
# v0.16.4

using Markdown
using InteractiveUtils

# ╔═╡ 346a0b1f-0c48-4837-99e0-7bfd8b6d9def
begin
	using PlutoUI
end

# ╔═╡ 23304c9e-2f57-11ec-1412-896477910082
md"""$(PlutoUI.LocalResource("./figs/Fig-ThreeUnitCycle.png"))
__Fig 1__. Schematic of a hypothetical three unit thermodynamic cycle (units=1,2,3) connected by streams 1,2 and 3. 
"""

# ╔═╡ 70a9bb50-7f81-446c-a2d4-69cc97734536
md"""

Consider the hypothetical three unit cycle shown in Fig 1. Each unit has a single input and a single output. 

__Assumptions__
* the cycle operates at steady-state;
* the working fluid has a mass flow rate of $\dot{m}$ = 1.5 kg s$^{-1}$;
* each unit can have both heat and work terms;
* neglect changes in the kinetic and potential energy in the system and streams.


"""

# ╔═╡ 2172328e-0de6-4ede-9acb-cd89cf545e9a
md"""

##### Problem:
Apply the steady-state open energy balance equation to each unit:

$$\begin{equation}
	\dot{Q}_{\star}+\dot{W}_{sh,\star} + \sum_{s\in{streams}}v_{s}\dot{m}_{s}H_{s} = 0
\end{equation}$$
where $\dot{Q}_{\star}$ and $\dot{W}_{sh,\star}$ denote the rate of heat and work for unit $\star$.
Show that the _total_ rate of heat transfer must equal the _total_ rate of work for the cycle:

$$\begin{equation}
\sum_{cycle}\dot{Q}_{\star} + \sum_{cycle}\dot{W}_{sh,\star} = 0
\end{equation}$$

Is the summation relationship given above true for an _arbitrary cyclic process_ in which each unit has a single input and a single output (explain your answer)?
"""

# ╔═╡ 659ab1d4-1015-465d-af19-d896070367e8
md"""

##### Solution:

First, because each unit has a single input and a single ouput we know that $\dot{m}_{1}=\dot{m}_{2}=\dot{m}_{3}\equiv\dot{m}$. Next, apply the open energy balance to each of the hypothetical process units in Fig 1.

$$\begin{eqnarray}
i = 1\qquad~\dot{Q}_{1}+\dot{W}_{sh,1}+\dot{m}\left(H_{3} - H_{1}\right) & = & 0\\
i = 2\qquad~\dot{Q}_{2}+\dot{W}_{sh,2}+\dot{m}\left(H_{1} - H_{2}\right) & = & 0\\
i = 3\qquad~\dot{Q}_{3}+\dot{W}_{sh,3}+\dot{m}\left(H_{2} - H_{3}\right) & = & 0\\
\end{eqnarray}$$

If we sum these equations over the units ($\star_{u}$) in the cycle, we get the _total_ work and heat or:

$$\sum_{u=1}^{3}\dot{Q}_{u}+\sum_{u=1}^{3}\dot{W}_{sh,u}+\dot{m}\left(H_{3} - H_{1} + H_{1} - H_{2} + H_{2} - H_{3}\right) = 0$$

Because we have a cycle, the enthalpy terms sum to 0 i.e., our system state ends where it starts, which leaves:

$$\sum_{u=1}^{3}\dot{Q}_{u}+\sum_{u=1}^{3}\dot{W}_{sh,u} = 0$$

"""

# ╔═╡ 828b05ea-2f9d-4c09-9dc4-d0332a64e607
md"""
###### Is the summation relationship given above true for an arbitrary cyclic process?
Yes, for a cyclic process the summation relationship is always true. 

__Why__? Enthaply is a _state function_ that is path independent, meaning, changes in enthalpy do not depend upon the path taken only on the endpoints. Thus, since we have a cyclic process we always end where we start, hence no overall enthalpy change. 

__Hmmm__: I don't know that about Enthalpy (yet), so how should we approach this problem?
If you create _any_ steady-state cyclic process where which unit has a single input, and a single output, the enthaply terms will sum to zero, hence the heat and work summation expression holds. In symbols, for _any_ steady-state cyclic process where which unit has a single input, and a single output, the following must be true:

$$\sum_{u}\sum_{s}v_{su}\dot{m}_{s}H_{s} = 0$$

where $v_{su}$ denotes a direction parameter that relates stream $s$ and unit $u$; 

* if stream $s$ __enters__ unit $u$ then $v_{su}$ = 1
* if stream $s$ __exits__ unit $u$ then $v_{su}$ = -1
* if stream $s$ __is not connected to__ unit $u$ then $v_{su}$ = 0

Since each unit has a single input and output, $\dot{m}_{1}=\dot{m}_{2}=\dots\equiv{\dot{m}}$ which gives:

$$\dot{m}\left(\sum_{u}\sum_{s}v_{su}H_{s}\right) = 0$$

We know that $\dot{m}\neq{0}$, thus:

$$\left(\sum_{u}\sum_{s}v_{su}H_{s}\right) = 0$$
"""

# ╔═╡ df49d1e4-6ba1-4e8f-80fa-4d9833ef6d0a
md"""
##### Test cases:
"""

# ╔═╡ a80b3623-ebdc-4f32-a120-4f24087c446d
md"""$(PlutoUI.LocalResource("./figs/Fig-Linear-TwoNode-F21.png"))
__Test case I__: Linear two node network
"""

# ╔═╡ ac4ee87c-9b2b-441c-b084-5fdd80a16b02
md"""
Let's run out the sum for the linear two-node network test case. For this case:

$$\sum_{u=1}^{2}\sum_{s=1}^{3}v_{su}H_{s} = \left(v_{11}+v_{12}\right)H_{1} + \left(v_{21}+v_{22}\right)H_{2}+\left(v_{31}+v_{32}\right)H_{3}$$

* Value for $$\left(v_{11}+v_{12}\right)$$ = 1
* Value for $$\left(v_{21}+v_{22}\right)$$ = 0
* Value for $$\left(v_{31}+v_{32}\right)$$ = -1

which gives: 

$$\sum_{u=1}^{2}\sum_{s=1}^{3}v_{su}H_{s} = \left(H_{1} - H_{3}\right)\neq{0}$$

"""

# ╔═╡ 61e17d6d-a898-408a-9d22-6c74ca8a8d8f
md"""$(PlutoUI.LocalResource("./figs/Fig-Cycle-TwoNode-F21.png"))
__Test case II__: Two node cyclic network
"""

# ╔═╡ 5ff6b6c8-b772-48b6-9030-c2911a2753ae
md"""
Let's run out the sum for the cyclic two-node network test case. For this case:

$$\sum_{u=1}^{2}\sum_{s=1}^{2}v_{su}H_{s} = \left(v_{11}+v_{12}\right)H_{1} + \left(v_{21}+v_{22}\right)H_{2}$$

* Value for $$\left(v_{11}+v_{12}\right)$$ = 0
* Value for $$\left(v_{21}+v_{22}\right)$$ = 0

which gives: 

$$\sum_{u=1}^{2}\sum_{s=1}^{2}v_{su}H_{s} = 0$$

We could extend this to higher-order cycles, but the summation relationship will continue to hold.

"""

# ╔═╡ b80e0292-e9cf-4653-b63c-8fbf48bb47c9


# ╔═╡ 8b76c6e5-3623-4dc4-a0bd-bf442f0e5195
html"""
<style>
main {
    max-width: 1200px;
    width: 95%;
    margin: auto;
    font-family: "Roboto, monospace";
}

a {
    color: blue;
    text-decoration: none;
}

.H1 {
    padding: 0px 30px;
}
</style>"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.16"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[HypertextLiteral]]
git-tree-sha1 = "f6532909bf3d40b308a0f360b6a0e626c0e263a8"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.1"

[[IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "98f59ff3639b3d9485a03a72f3ab35bab9465720"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.0.6"

[[PlutoUI]]
deps = ["Base64", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "4c8a7d080daca18545c56f1cac28710c362478f3"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.16"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
"""

# ╔═╡ Cell order:
# ╟─23304c9e-2f57-11ec-1412-896477910082
# ╟─70a9bb50-7f81-446c-a2d4-69cc97734536
# ╟─2172328e-0de6-4ede-9acb-cd89cf545e9a
# ╟─659ab1d4-1015-465d-af19-d896070367e8
# ╟─828b05ea-2f9d-4c09-9dc4-d0332a64e607
# ╟─df49d1e4-6ba1-4e8f-80fa-4d9833ef6d0a
# ╟─a80b3623-ebdc-4f32-a120-4f24087c446d
# ╟─ac4ee87c-9b2b-441c-b084-5fdd80a16b02
# ╟─61e17d6d-a898-408a-9d22-6c74ca8a8d8f
# ╟─5ff6b6c8-b772-48b6-9030-c2911a2753ae
# ╠═b80e0292-e9cf-4653-b63c-8fbf48bb47c9
# ╟─346a0b1f-0c48-4837-99e0-7bfd8b6d9def
# ╟─8b76c6e5-3623-4dc4-a0bd-bf442f0e5195
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
