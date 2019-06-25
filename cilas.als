module projetoLogica

one abstract sig SistemaDeLimpeza{}

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

fact {all s:SistemaDeLimpeza | s in  (Desligado + ManualR +ManualD + ManualRB + ManualDB + AutoR + AutoD + AutoRB + AutoDB) }
fact{
	all s:SistemaDeLimpeza | s in Desligado => (s not in Ligado)
	all s:SistemaDeLimpeza | s in ManualD => (s not in Desligado and s not in NotManualD)
	all s:SistemaDeLimpeza | s in ManualDB => (s not in Desligado and s not in NotManualDB)
	all s:SistemaDeLimpeza | s in ManualR => (s not in Desligado and s not in NotManualR)
	all s:SistemaDeLimpeza | s in ManualRB => (s not in Desligado and s not in NotManualRB)
	all s:SistemaDeLimpeza | s in AutoD => (s not in SemChuva and s in Ligado and s not in NotAutoD and s in ContraChuvaFraca) 
	all s:SistemaDeLimpeza | s in AutoDB => (s not in SemChuva and s in Ligado and s not in NotAutoR and s in ContraChuvaFraca)
	all s:SistemaDeLimpeza | s in AutoR => (s not in SemChuva and s in Ligado and s not in NotAutoDB and s in ContraChuvaForte)
	all s:SistemaDeLimpeza | s in AutoRB => (s not in SemChuva and s in Ligado and s not in NotAutoRB and s in ContraChuvaForte)
}

--- Funcoes que retornam um conjunto de estados do sistema
fun Ligado: set SistemaDeLimpeza { (ManualR +ManualD + ManualRB + ManualDB + AutoR + AutoD + AutoRB + AutoDB) }
fun SemChuva: set SistemaDeLimpeza { (ManualR + ManualD + ManualRB + ManualDB) }
fun ContraChuvaForte : set SistemaDeLimpeza { ( AutoR + AutoRB ) }
fun ContraChuvaFraca : set SistemaDeLimpeza { ( AutoD + AutoDB ) }
fun NotAutoD : set SistemaDeLimpeza { (ManualR +ManualD + ManualRB + ManualDB + AutoR + AutoRB + AutoDB) }
fun NotAutoR: set SistemaDeLimpeza { (ManualR +ManualD + ManualRB + ManualDB + AutoD + AutoRB + AutoDB) }
fun NotAutoDB: set SistemaDeLimpeza { (ManualR +ManualD + ManualRB + ManualDB + AutoR + AutoD + AutoRB) }
fun NotAutoRB: set SistemaDeLimpeza { (ManualR +ManualD + ManualRB + ManualDB + AutoR + AutoD + AutoDB) }
fun NotManualD : set SistemaDeLimpeza {(ManualR + ManualRB + ManualDB + AutoR + AutoD + AutoRB + AutoDB)}
fun NotManualR : set SistemaDeLimpeza {(ManualD + ManualRB + ManualDB + AutoR + AutoD + AutoRB + AutoDB)}
fun NotManualDB : set SistemaDeLimpeza {(ManualR +ManualD + ManualRB + AutoR + AutoD + AutoRB + AutoDB)}
fun NotManualRB : set SistemaDeLimpeza {(ManualR +ManualD + ManualDB + AutoR + AutoD + AutoRB + AutoDB)}

--- Testes
assert SistemaDesligado{-- se o sistema esta desligado, entao ele nao pode estar ligado
	all s:SistemaDeLimpeza| s in Desligado => (s not in (Ligado))   
}

assert SistemaLigado{-- se o sistema esta ligado, entao ele nao pode estar desligado
	all s:SistemaDeLimpeza| s in Ligado => (s not in (Desligado))   
}

assert SistemaContraChuvaFraca{-- se o sistema esta contra chuva fraca, entao ele nao pode estar em nenhum automatico rapido
	all s:SistemaDeLimpeza| s in ContraChuvaFraca => (s not in (AutoRB) and s not in (AutoR))   
	-- OBS: Ele pode estar desligado, caso o motorista escolha isso
}

assert SistemaContraChuvaForte{-- se o sistema esta contra chuva forte, entao ele nao pode estar em nenhum automatico devagar
	all s:SistemaDeLimpeza| s in ContraChuvaForte => (s not in (AutoDB) and s not in (AutoD))   
	-- OBS: Ele pode estar desligado, caso o motorista escolha isso
}

assert SistemaSemChuva{-- se o sistema esta sem enfrentar chuva, entao ele nao esta em nenhum modo automatico
	all s:SistemaDeLimpeza| s in SemChuva => (s not in (AutoR) and s not in (AutoD) and s not in (AutoRB) and s not in (AutoDB))   
}

check SistemaLigado
check SistemaDesligado
check SistemaContraChuvaFraca
check SistemaContraChuvaForte
check SistemaSemChuva

pred show[]{
}

run show for 6 
