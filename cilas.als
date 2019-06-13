module carro

sig Carro {
	paletas: set Paleta,
	bicos: set Bico
}

sig Paleta {
	bicos: set Bico
}

sig Bico {
}

fact {
	all c:Carro | #(c.bicos) < 4
	all b:Bico | #(b) < 4
	all p:Paleta | #(p.bicos) <= 2
}

pred show[]{
}

run show for 4
