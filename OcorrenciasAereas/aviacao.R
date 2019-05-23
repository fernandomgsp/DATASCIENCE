
#inicio estudos para gerar graficos no power atraves da linguagem R
setwd("C:/LinguagemR/EstudoR/ProjetoAviacao")
getwd()

#install.packages("readr")
install.packages("dplyr")
#install.packages("stringr")
#library(readr)
install.packages("abjutils")

library(stringr)

library(dplyr)
library(abjutils)


dfvAux <- read.table(file = "C:/LinguagemR/EstudoR/ProjetoAviacao/arquivo.txt", header=TRUE, sep=";",encoding="UTF-8")

#Conversão de Tipo Coluna fato para char
dfvAux$ocorrencia_classificacao <- as.character(dfvAux$ocorrencia_classificacao)
dfvAux$ocorrencia_tipo<- as.character(dfvAux$ocorrencia_tipo)
dfvAux$ocorrencia_tipo_categoria<- as.character(dfvAux$ocorrencia_tipo_categoria)
dfvAux$ocorrencia_cidade<- as.character(dfvAux$ocorrencia_cidade)
dfvAux$ocorrencia_uf<- as.character(dfvAux$ocorrencia_uf)
dfvAux$ocorrencia_pais<- as.character(dfvAux$ocorrencia_pais)
dfvAux$investigacao_status <- as.character(dfvAux$investigacao_status)

#Removendo Coluna x excluir da consulta
dfvAux$codigo_ocorrencia <- NULL
dfvAux$ocorrencia_tipo_categoria <- NULL


#Renomear as colunas

dfvAux <- dfvAux %>% rename("classificacao"="ocorrencia_classificacao",
                            "tipo" = "ocorrencia_tipo",
                            "cidade" = "ocorrencia_cidade",
                            "uf" = "ocorrencia_uf",
                            "pais" = "ocorrencia_pais",
                            "status" = "investigacao_status")
#Criando nova coluna no data frame coluna desc_estado e alterando para o nome do estado
dfvAux$desc_estado <- dfvAux$uf
dfvAux$desc_estado[dfvAux$desc_estado== "RO"] <- "RONDONIA"
dfvAux$desc_estado[dfvAux$desc_estado== "SP"] <- "SAO PAULO"
dfvAux$desc_estado[dfvAux$desc_estado== "RJ"] <- "RIO DE JANEIRO"
dfvAux$desc_estado[dfvAux$desc_estado== "AC"] <- "ACRE"
dfvAux$desc_estado[dfvAux$desc_estado== "AL"] <- "ALAGOAS"
dfvAux$desc_estado[dfvAux$desc_estado== "AM"] <- "AMAZONAS"
dfvAux$desc_estado[dfvAux$desc_estado== "CE"] <- "CEARA"
dfvAux$desc_estado[dfvAux$desc_estado== "DF"] <- "DISTRITO FEDERAL"
dfvAux$desc_estado[dfvAux$desc_estado== "ES"] <- "ESPIRITO SANTO"
dfvAux$desc_estado[dfvAux$desc_estado== "MA"] <- "MARANHAO"
dfvAux$desc_estado[dfvAux$desc_estado== "MT"] <- "MATO GROSSO"
dfvAux$desc_estado[dfvAux$desc_estado== "MS"] <- "MATO GROSSO DO SUL"
dfvAux$desc_estado[dfvAux$desc_estado== "PA"] <- "PARA"
dfvAux$desc_estado[dfvAux$desc_estado== "PB"] <- "PARAIBA"
dfvAux$desc_estado[dfvAux$desc_estado== "PR"] <- "PARANA"
dfvAux$desc_estado[dfvAux$desc_estado== "PE"] <- "PERNANBUCO"
dfvAux$desc_estado[dfvAux$desc_estado== "PI"] <- "PIAUI"
dfvAux$desc_estado[dfvAux$desc_estado== "RN"] <- "RIO GRANDE DO NORTE"
dfvAux$desc_estado[dfvAux$desc_estado== "RS"] <- "RIO GRANDE DO SUL"
dfvAux$desc_estado[dfvAux$desc_estado== "RR"] <- "RORAIMA"
dfvAux$desc_estado[dfvAux$desc_estado== "SC"] <- "SANTA CATARINA"
dfvAux$desc_estado[dfvAux$desc_estado== "SE"] <- "SERGIPE"
dfvAux$desc_estado[dfvAux$desc_estado== "TO"] <- "TOCANTINS"
dfvAux$desc_estado[dfvAux$desc_estado== "GO"] <- "GOIAS"
dfvAux$desc_estado[dfvAux$desc_estado== "BA"] <- "BAHIA"
dfvAux$desc_estado[dfvAux$desc_estado== "AP"] <- "AMAPA"
dfvAux$desc_estado[dfvAux$desc_estado== "MG"] <- "MINAS GERAIS"

#remove caracter da coluna cidade e gravar na coluna nova_cidade
dfvAux$nova_cidade <- abjutils::rm_accent(dfvAux$cidade)



#localiza linhas para serem ajustadas
which(dfvAux$uf == "***")

#Excluindo linhas
dfvAux[which(dfvAux$uf == 4510), ] <-  NULL
dfvAux[which(dfvAux$uf == 4515), ] <-  NULL

df <- dfvAux 
View(df)

