module projetoLogica

--abstract sig Bool {}
--one sig True, False extends Bool {}
--pred naoEstaChovendo [b: Bool] {b in True }
--pred estaChovendo [b: Bool] {b in True }
--pred chuvaEhFraca [b: Bool] { b in True }
--pred chuvaEhForte [b: Bool] { b in True }

one abstract sig SistemaDeLimpeza{
}

sig PaletaDesligada in SistemaDeLimpeza {}
sig PaletaDevagar in SistemaDeLimpeza {}
sig PaletaRapida in SistemaDeLimpeza {}
sig BicoDesligado in SistemaDeLimpeza {}
sig BicoLigado in SistemaDeLimpeza {}

one sig Carro {
	sistemaLimpeza: one SistemaDeLimpeza,
    paletas: some Paleta,
    bicos: some Bico
}

sig Bico {
}

sig Paleta {
	bico: some Bico
}

fact {all b:Bico | one b.~bico and some b.~bicos}
fact {all p:Paleta | one p.~paletas}
fact {all p:Paleta | #(p.bico) < 3}
fact {all c:Carro | #(c.bicos) < 5 and  #(c.paletas) < 5}
fact {all s:SistemaDeLimpeza | s in (PaletaDesligada + PaletaDevagar + PaletaRapida + BicoDesligado + BicoLigado)}


/*Funcoes que retornam um conjunto de estados do sistema*/
fun Desligado: set SistemaDeLimpeza { (PaletaDesligada + BicoDesligado) }

fun LimpadorBaixo: set SistemaDeLimpeza { (PaletaDevagar + BicoDesligado) }

fun LimpadorAlto: set SistemaDeLimpeza { (PaletaRapida + BicoDesligado) }

fun LimpadorBaixoComBico: set SistemaDeLimpeza { (PaletaDevagar + BicoLigado) }

fun LimpadorAltoComBico: set SistemaDeLimpeza { (PaletaRapida + BicoLigado) }

fun chovendoFracoComBico: set SistemaDeLimpeza { (PaletaDevagar + BicoLigado) }

fun chovendoForteComBico: set SistemaDeLimpeza { (PaletaRapida + BicoLigado) }

fun chovendoFraco: set SistemaDeLimpeza { (PaletaDevagar + BicoDesligado) }

fun chovendoForte: set SistemaDeLimpeza { (PaletaRapida + BicoDesligado) }










pred show[]{
}

run show for 6 
