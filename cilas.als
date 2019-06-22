module projetoLogica

--abstract sig Bool {}
--one sig True, False extends Bool {}
--pred naoEstaChovendo [b: Bool] {b in True }
--pred estaChovendo [b: Bool] {b in True }
--pred chuvaEhFraca [b: Bool] { b in True }
--pred chuvaEhForte [b: Bool] { b in True }

one sig Carro {
    paletas: some Paleta,
    bicos: some Bico
}

sig Bico {
}

sig Paleta {
	bico: some Bico
}

fact {all b:Bico | one b.~bico and some b.~bicos}
--fact {all p:Paleta | some p.~paletas}
fact {all c:Carro | #(c.bicos) < 5 and  #(c.paletas) < 5}
fact {all p:Paleta | #(p.bico) < 3}


pred show[]{
}

run show for 6
