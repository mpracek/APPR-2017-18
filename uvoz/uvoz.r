# 2. faza: Uvoz podatkov

sl <- locale("sl", decimal_mark = ",", grouping_mark = ".")

# Funkcija, ki uvozi podatke o vinskih sortah iz Wikipedije
# Vire sem prenesel 30.11.2017 
link <- "https://en.wikipedia.org/wiki/List_of_grape_varieties"
stran <- html_session(link) %>% read_html()

bele.sorte <- stran %>% html_nodes(xpath="//table[@class='wikitable sortable']") %>%.[[2]] %>% html_table(dec = ",")
bele.sorte$Pedigree <- NULL
bele.sorte$`Hectares cultivated (Year)` <- NULL
bele.sorte$'Year of introduction' <- NULL 

rdece.sorte <- stran %>% html_nodes(xpath="//table[@class='wikitable sortable']") %>%.[[1]] %>% html_table(dec = ",")
rdece.sorte$Pedigree <- NULL
rdece.sorte$`Hectares cultivated (Year)` <- NULL
rdece.sorte$'Year of introduction' <- NULL 

#velikosti vinogradov od 2000 do 2016
velikost_slovenskih_vinogradov = read.csv2("podatki/velikost_vinogradov.csv",
                                           encoding = "UTF-8")

#neuporabno, po statističnih regijah, ne vinorodnih okoliših
# #velikosti vinogradov in število trt 2000 in 2010
# velikost.stevilo_trt =read.csv2("podatki/velikost_vinogradov_trte.csv",
#                                 skip = 2,
#                                 encoding = "UTF-8")

#PRidelovalci so po regijah, ne po vinorodnih deželah
# # #pridelovalci po statističnih regijah
# # pridelovalci_regije = read.csv2("podatki/pridelovalci.csv",
#                                 skip = 2,
#                                 encoding = "UTF-8")
#LE vzhodna/zahodna SLO
# #Pridelovalci po kolicini
# pridelovalci_kolicina = read.csv2("podatki/pridelovalci_kolicina.csv",
#                                   skip = 2,
#                                   encoding = "UTF-8")

# ALI BOMO TO UPORABILI??
#pridelovalci po površini
# pridelovalci_povrsina =read.csv2("podatki/razredi_pridelovalcev.csv",
#                                  skip = 2,
#                                  encoding = "UTF-8")

#Nagib vinogradov po vinorodnih deželah in okoliših
nagib = read.csv2("podatki/nagib.csv",
                  skip = 2,
                  encoding = "UTF-8")

#površina, število vinogradov in sadik glede na zatravljenost
zatravljenost = read.csv2("podatki/zatravljenost.csv",
                          encoding = "UTF8",
                          skip = 2,
                          n_max = 48)
#površina, število vinogradov in sadik 2009, 2015
povrsina.stevilo_vinogradov.sadik = read.csv2("podatki/povrsina,stevilo.vinograd,sadik.csv",
                                              skip = 2,
                                              encoding = "UTF-8")
#podlaga na kateri rastejo trte 2009 in 2015
podlaga = read.csv2("podatki/podlaga.csv",
                    skip = 2,
                    encoding = "UTF-8")
#način gojenja trt
gojenje = read.csv2("podatki/gojitvena_oblika.csv",
                    skip = 2,
                    encoding = "UTF-8")


#Drugi del

#Najpogostejše sorte po površini, številu sadik
sorte.povrsina_sadike = read.csv2("podatki/povrsina,sadik-sorte.csv",
                                  skip = 2,
                                  encoding = "UTF-8")

#Starost trt po površini in številu sadik
starost.povrsina_sadike = read.csv2("podatki/povrsina,sadike-starost.csv",
                                    skip = 2,
                                    encoding = "UTF-8")

#Najpogostejše sorte po starosti
sorte_starost = read.csv2("podatki/sorte_starost.csv",
                          skip = 2,
                          encoding = "UTF-8")
#Pridelava grozdja
grozdje = read.csv2("podatki/pridelava_grozdja.csv",
                    skip = 2)

#Pridelava po količini 2009
kolicina = read.csv2("podatki/pridelovalci_kolicina.csv",
                     skip = 2,
                     encoding = "UTF-8")
                                           
#Primerjalni del
#ekološka pridelava (primerjava)
ekolosko = read.csv2("podatki/ekoloska_pridelav.csv", 
                     skip = 2,
                     encoding = "UTF-8")

#površina in število trsnic, matičnjakov in vinogradov (primerjava)
trsnice.maticnjaki = read.csv2("podatki/trsnice.csv",
                               skip = 1)
#slovenske sorte
slovenske.sorte = read.csv2("podatki/vivc.slovenija.csv")
slovenske.sorte$Variety.number.VIVC <- NULL
slovenske.sorte$Species <- NULL

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.
