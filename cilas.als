module projetoLogica

--abstract sig Bool {}
--one sig True, False extends Bool {}
--pred naoEstaChovendo [b: Bool] {b in True }
--pred estaChovendo [b: Bool] {b in True }
--pred chuvaEhFraca [b: Bool] { b in True }
--pred chuvaEhForte [b: Bool] { b in True }

one abstract sig SistemaDeLimpeza{
}

sig Desligado in SistemaDeLimpeza {}
sig ManualR in SistemaDeLimpeza {}
sig ManualRB in SistemaDeLimpeza {}
sig ManualD in SistemaDeLimpeza {}
sig ManualDB in SistemaDeLimpeza {}
sig AutoR in SistemaDeLimpeza {}
sig AutoRB in SistemaDeLimpeza {}
sig AutoD in SistemaDeLimpeza {}
sig AutoDB in SistemaDeLimpeza {}

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
fact {all s:SistemaDeLimpeza | s in Desligado or s in ManualD}
fact {all s:SistemaDeLimpeza | s in  (Desligado + ManualR +ManualD + ManualRB + ManualDB + AutoR + AutoD + AutoRB + AutoDB) }

fact{
	all s:SistemaDeLimpeza | s in Desligado => (s not in Ligado)
	all s:SistemaDeLimpeza | s in ManualD => (s not in Desligado and s not in NotManualD)
	all s:SistemaDeLimpeza | s in ManualDB => (s not in Desligado and s not in NotManualDB)
	all s:SistemaDeLimpeza | s in ManualR => (s not in Desligado and s not in NotManualR)
	all s:SistemaDeLimpeza | s in ManualRB => (s not in Desligado and s not in NotManualRB)
	all s:SistemaDeLimpeza | s in AutoD => (s not in SemChuva and  s not in Desligado) 
	all s:SistemaDeLimpeza | s in AutoDB => (s not in SemChuva and  s not in Desligado)
	all s:SistemaDeLimpeza | s in AutoR => (s not in SemChuva and  s not in Desligado)
	all s:SistemaDeLimpeza | s in AutoRB => (s not in SemChuva and  s not in Desligado)
}

/*Funcoes que retornam um conjunto de estados do sistema*/
fun Ligado: set SistemaDeLimpeza { (ManualR +ManualD + ManualRB + ManualDB + AutoR + AutoD + AutoRB + AutoDB) }
fun SemChuva: set SistemaDeLimpeza { (ManualR + ManualD + ManualRB + ManualDB) }
fun ContraChuvaFraca : set SistemaDeLimpeza { (AutoD) }
fun ContraChuvaFraca2 : set SistemaDeLimpeza { (AutoDB) }
fun ContraChuvaForte : set SistemaDeLimpeza { (AutoR) }
fun ContraChuvaForte2 : set SistemaDeLimpeza { (AutoRB) }
fun NotManualD : set SistemaDeLimpeza {(ManualR + ManualRB + ManualDB + AutoR + AutoD + AutoRB + AutoDB)}
fun NotManualR : set SistemaDeLimpeza {(ManualD + ManualRB + ManualDB + AutoR + AutoD + AutoRB + AutoDB)}
fun NotManualDB : set SistemaDeLimpeza {(ManualR +ManualD + ManualRB + AutoR + AutoD + AutoRB + AutoDB)}
fun NotManualRB : set SistemaDeLimpeza {(ManualR +ManualD + ManualDB + AutoR + AutoD + AutoRB + AutoDB)}



pred show[]{
}

run show for 6 
