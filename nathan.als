module carro

sig Carro{
	palhetas: set Palheta
}

sig Bico{}

sig Palheta{
	bicos: set Bico
}

fact{
	all b: Bico | #(b) <= 4 && #(b) >= 1
	all p: Palheta | #(p.bicos) <= 2
}

pred show[]{}

run show for 6
