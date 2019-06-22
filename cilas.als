module projetoLogica

abstract sig Bool {}
one sig True, False extends Bool {}

pred naoEstaChovendo [b: Bool] {b in True }
pred estaChovendo [b: Bool] {b in True }
pred chuvaEhFraca [b: Bool] { b in True }
pred chuvaEhForte [b: Bool] { b in True }

one sig Carro {
	paletas: some Paleta,
--	bicos: no Bico
}

sig Paleta {
	bicos: some Bico
}

sig Bico {
}


fact {
	all c:Carro |  #(c.paletas) <= 4  
 	all p:Paleta | #(p.bicos) <= 2 && one #(p.~bicos)  
}

pred show[]{
}

run show for 4
