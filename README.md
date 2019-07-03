# Projeto de Lógica para Computação
Projeto da disciplina Lógica para Computação em 2019.1. UFCG.
- Alunos:
* Cilas Marques
* Gabriel Carvalho
* Nathan Fernandes
* Sérgio Duarte

## Como testar:
### Alloy (Descrição estrutural do sistema):

Abra o arquivo projetoAlloy.als no Alloy Analyzer e o execute

### NuSMV (Descrição comportamental do sistema):

#### No diretório de instalação:
1.Copie o arquivo projetoNUSMV.smv para a pasta onde está o script executável do NuSMV (/bin/):
``` 
$ cp projetoNUSMV.smv ~/Downloads/NuSMV-2.6.0-Linux/bin/
```
2.Execute o NuSMV com o arquivo:
```
$ ./NuSMV projetoNUSMV.smv
```
#### Especificando o caminho para o arquivo:

Va até a pasta onde está baixado e descompactado o NuSMV e depois na pasta interna ```bin``` e execute:
```
$ ./NuSMV /<caminho>/Projeto-Logica/projetoNUSMV.smv
```
