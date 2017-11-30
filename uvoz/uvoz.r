# 2. faza: Uvoz podatkov

sl <- locale("sl", decimal_mark = ",", grouping_mark = ".")

# Funkcija, ki uvozi podatke o vinskih sortah iz Wikipedije
#uvozi.obcine <- function() {
link <- "https://en.wikipedia.org/wiki/List_of_grape_varieties"
stran <- html_session(link) %>% read_html()
rdece.sorte <- stran %>% html_nodes(xpath="//table[@class='wikitable sortable']") %>%.[[1]] %>% html_table(dec = ",")
bele.sorte <- stran %>% html_nodes(xpath="//table[@class='wikitable sortable']") %>%.[[2]] %>% html_table(dec = ",")
  # for (i in 1:ncol(tabela)) {
 #    if (is.character(tabela[[i]])) {
 #      Encoding(tabela[[i]]) <- "UTF-8"
 #    }
 #  }
 #   return(tabela)
 # }

#velikosti vinogradov od 2000 do 2016
velikost_slovenskih_vinogradov = read.csv2("podatki/velikost_vinogradov.csv")
#velikosti vinogradov in število trt 2000 in 2010
velikost.stevilo_trt =read.csv2("podatki/velikost_vinogradov_trte.csv")
#pridelovalci po statističnih regijah
pridelovalci_regije = read.csv2("podatki/pridelovalci")
#Pridelovalci po površini
pridelovalci_povrsina = read.csv2("podatki/sorte_starost")
#pridelovalci po površini
pridelovalci_povrsina =read.csv2("podatki/razredi_pridelovalcev.csv")
#površina in število vinogradov glede na nagib vertikal po vinorodnih deželah in okoliših
vertikale = read.csv2("podatki/nagib_vertikal.csv")
#Nagib vinogradov
nagib = read.csv2("podatki/nagib")
#površina, število vinogradov in sadik glede na zatravljenost
zatravljenost = read.csv2("podatki/zatravljenost.csv")
#površina, število vinogradov in sadik 2009, 2015
povrsina.stevilo_vinogradov.sadik = read.csv2("podatki/povrsina,stevilo.vinograd,sadik.csv")
#podlaga na kateri rastejo trte 2009 in 2015
podlaga = read.csv2("podatki/podlaga")
#način gojenja trt
gojenje = read.csv2("podatki/gojitvena_oblika")


#Drugi del

#Najpogostejše sorte po površini, številu sadik
sorte.povrsina_sadike = read.csv2("podatki/povrsina,sadik-sorte.csv")
#Starost trt po površini in številu sadik
starost.povrsina_sadike = read.csv2("podatki/povrsina,sadike-starost")
#Najpogostejše sorte po starosti
sorte_starost = read.csv2("podatki/sorte_starost.csv")
#Pridelava grozdja
grozdje = read.csv2("podatki/pridelava_grozdja.csv")
#Pridelava po količini 2009
kolicina = read.csv2("podatki/pridelovalci_količina.csv")
                                           
#Primerjalni del
#ekološka pridelava (primerjava)
ekolosko = read.csv2("podatki/ekoloska_pridelava.csv")
#površina in število trsnic, matičnjakov in vinogradov (primerjava)
trsnice.maticnjaki = read.csv2("podatki/trsnice.csv")

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.
