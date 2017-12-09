# 2. faza: Uvoz podatkov
# uporabljal bom locale(decimal_mark = ".", grouping_mark = ",")

###
#V prvem delu bom zbral podatke ki bodo vinograde opisovali po zunanjih dejavnikih,
#kot so nagib, površina vinogradov, število sadik trtna podlaga ter sam izgled
#vinograda.
###

#površina, število vinogradov in sadik 2009, 2015
povrsina.stevilo_vinogradov.sadik <- read_csv2("podatki/povrsina,stevilo.vinograd,sadik.csv",
                                               skip = 2,
                                               locale = locale(encoding = "UTF-8",
                                                               decimal_mark = ".", grouping_mark = ","),
                                               n_max = 48,
                                               na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)
povrsina.stevilo_vinogradov.sadik[[4]] <- parse_number(povrsina.stevilo_vinogradov.sadik[[4]])
povrsina.stevilo_vinogradov.sadik[[5]] <- parse_number(povrsina.stevilo_vinogradov.sadik[[5]])
povrsina.stevilo_vinogradov.sadik[[6]] <- parse_number(povrsina.stevilo_vinogradov.sadik[[6]])
povrsina.stevilo_vinogradov.sadik[[7]] <- parse_number(povrsina.stevilo_vinogradov.sadik[[7]])
povrsina.stevilo_vinogradov.sadik[[8]] <- parse_number(povrsina.stevilo_vinogradov.sadik[[8]])
povrsina.stevilo_vinogradov.sadik[[9]] <- parse_number(povrsina.stevilo_vinogradov.sadik[[9]])
povrsina.stevilo_vinogradov.sadik[[10]] <- parse_number(povrsina.stevilo_vinogradov.sadik[[10]])
povrsina.stevilo_vinogradov.sadik[[11]] <- parse_number(povrsina.stevilo_vinogradov.sadik[[11]])
povrsina.stevilo_vinogradov.sadik[[12]] <- parse_number(povrsina.stevilo_vinogradov.sadik[[12]])
povrsina.stevilo_vinogradov.sadik[[13]] <- parse_number(povrsina.stevilo_vinogradov.sadik[[13]])
povrsina.stevilo_vinogradov.sadik[[14]] <- parse_number(povrsina.stevilo_vinogradov.sadik[[14]])
povrsina.stevilo_vinogradov.sadik[[15]] <- parse_number(povrsina.stevilo_vinogradov.sadik[[15]])
povrsina.stevilo_vinogradov.sadik[[16]] <- parse_number(povrsina.stevilo_vinogradov.sadik[[16]])
povrsina.stevilo_vinogradov.sadik[[17]] <- parse_number(povrsina.stevilo_vinogradov.sadik[[17]])

#Nagib vinogradov po vinorodnih deželah in okoliših

nagib <- read_csv2("podatki/vertikale.csv",
                   skip = 2,
                   locale = locale(encoding = "UTF-8",
                                   decimal_mark = ".", grouping_mark = ","),
                   n_max = 26,
                   col_names = imena.nagib,
                   na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)

imena.nagib <- c("Meritev", "Leto", "Vinorodna dežela","0%","nad 0% do 5%","nad 5% do 15%","nad 15% do 30%","nad 30% do 45%","nad 45%")

nagib[[4]] <- parse_number(nagib[[4]])
nagib[[5]] <- parse_number(nagib[[5]])
nagib[[9]] <- parse_number(nagib[[9]])


#površina, število vinogradov in sadik glede na zatravljenost
zatravljenost <- read_csv2("podatki/zatravljenost.csv",
                          skip = 2,
                          locale = locale(encoding = "UTF-8",
                                          decimal_mark = ".", grouping_mark = ","),
                          n_max = 48,
                          na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)
zatravljenost[[4]] <- parse_number(zatravljenost[[4]])
zatravljenost[[5]] <- parse_number(zatravljenost[[5]])
zatravljenost[[6]] <- parse_number(zatravljenost[[6]])
zatravljenost[[7]] <- parse_number(zatravljenost[[7]])
zatravljenost[[8]] <- parse_number(zatravljenost[[8]])
zatravljenost[[9]] <- parse_number(zatravljenost[[9]])
                          

#podlaga na kateri rastejo trte 2009 in 2015
podlaga <- read_csv2("podatki/podlaga.csv",
                    skip = 2,
                    locale = locale(encoding = "UTF-8",
                                    decimal_mark = ".", grouping_mark = ","),
                    n_max = 48,
                    na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)
podlaga[[4]] <- parse_number(podlaga[[4]])
podlaga[[12]] <- parse_number(podlaga[[12]])
podlaga[[13]] <- parse_number(podlaga[[13]])
podlaga[[18]] <- parse_number(podlaga[[18]])
podlaga[[21]] <- parse_number(podlaga[[21]])


#način gojenja trt
gojenje <- read_csv2("podatki/gojitvena_oblika.csv",
                    skip = 2,
                    locale = locale(encoding = "UTF-8",
                                    decimal_mark = ".", grouping_mark = ","),
                    n_max = 48,
                    na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)

gojenje[[6]] <- parse_number(gojenje[[6]])
gojenje[[11]] <- parse_number(gojenje[[11]])
gojenje[[13]] <- parse_number(gojenje[[13]])
gojenje[[12]] <- parse_number(gojenje[[12]])
gojenje[[15]] <- parse_number(gojenje[[15]])
gojenje[[16]] <- parse_number(gojenje[[16]])

###
#Drugi del je tisti, v katerem bom opisal vinograde po bolj direktnih opisnih dejavnikih, kot so
#sorte in starost trt.
###
#Najpogostejše sorte po površini, številu sadik
sorte.povrsina_sadike <- read_csv2("podatki/povrsina,sadik-sorte.csv",
                                  skip = 2,
                                  locale = locale(encoding = "UTF-8",
                                                  decimal_mark = ".", grouping_mark = ","),
                                  n_max = 48,
                                  na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)
sorte.povrsina_sadike[[4]] <- parse_number(sorte.povrsina_sadike[[4]])
sorte.povrsina_sadike[[5]] <- parse_number(sorte.povrsina_sadike[[5]])
sorte.povrsina_sadike[[6]] <- parse_number(sorte.povrsina_sadike[[6]])
sorte.povrsina_sadike[[7]] <- parse_number(sorte.povrsina_sadike[[7]])
sorte.povrsina_sadike[[8]] <- parse_number(sorte.povrsina_sadike[[8]])
sorte.povrsina_sadike[[9]] <- parse_number(sorte.povrsina_sadike[[9]])
sorte.povrsina_sadike[[10]] <- parse_number(sorte.povrsina_sadike[[10]])
sorte.povrsina_sadike[[11]] <- parse_number(sorte.povrsina_sadike[[11]])
sorte.povrsina_sadike[[12]] <- parse_number(sorte.povrsina_sadike[[12]])
sorte.povrsina_sadike[[13]] <- parse_number(sorte.povrsina_sadike[[13]])
sorte.povrsina_sadike[[14]] <- parse_number(sorte.povrsina_sadike[[14]])
sorte.povrsina_sadike[[15]] <- parse_number(sorte.povrsina_sadike[[15]])
sorte.povrsina_sadike[[16]] <- parse_number(sorte.povrsina_sadike[[16]])
sorte.povrsina_sadike[[17]] <- parse_number(sorte.povrsina_sadike[[17]])
sorte.povrsina_sadike[[20]] <- parse_number(sorte.povrsina_sadike[[20]])
sorte.povrsina_sadike[[21]] <- parse_number(sorte.povrsina_sadike[[21]])
sorte.povrsina_sadike[[22]] <- parse_number(sorte.povrsina_sadike[[22]])
sorte.povrsina_sadike[[15]] <- parse_number(sorte.povrsina_sadike[[15]])
sorte.povrsina_sadike[[26]] <- parse_number(sorte.povrsina_sadike[[26]])
sorte.povrsina_sadike[[25]] <- parse_number(sorte.povrsina_sadike[[25]])
sorte.povrsina_sadike[[29]] <- parse_number(sorte.povrsina_sadike[[29]])
sorte.povrsina_sadike[[30]] <- parse_number(sorte.povrsina_sadike[[30]])


#Starost trt po površini in številu sadik
starost.povrsina_sadike <- read_csv2("podatki/povrsina,sadike-starost.csv",
                                    skip = 2,
                                    locale = locale(encoding = "UTF-8",
                                                    decimal_mark = ".", grouping_mark = ","),
                                    n_max = 48,
                                    na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)
starost.povrsina_sadike[[11]] <- parse_number(starost.povrsina_sadike[[11]])

#Najpogostejše sorte po starosti
sorte_starost <- read_csv2("podatki/sorte_starost.csv",
                          skip = 2,
                          locale = locale(encoding = "UTF-8",
                                          decimal_mark = ".", grouping_mark = ","),
                          n_max = 48,
                          na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)
sorte_starost[[14]] <- parse_number(sorte_starost[[14]])
sorte_starost[[25]] <- parse_number(sorte_starost[[25]])
sorte_starost[[28]] <- parse_number(sorte_starost[[28]])
sorte_starost[[29]] <- parse_number(sorte_starost[[29]])

#Pridelava grozdja
grozdje <- read_csv2("podatki/pridelava_grozdja.csv",
                    skip = 2,
                    locale = locale(encoding = "UTF-8",
                                    decimal_mark = ".", grouping_mark = ","),
                    n_max = 48,
                    na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)

# #Pridelava po količini 2009
# kolicina <- read_csv2("podatki/pridelovalci_kolicina.csv",
#                      skip = 2,
#                      locale = locale(encoding = "UTF-8",
#                                      decimal_mark = ".", grouping_mark = ","),
#                      n_max = 48,
#                      na = c("", '-', "z") %>% fill(1:2) %>% drop_na(3))
                                           
#Primerjalni del
#ekološka pridelava (primerjava)
ekolosko <- read_csv2("podatki/raba_ekoloskih_zemljics.csv", 
                     skip = 2,
                     locale = locale(encoding = "UTF-8",
                                     decimal_mark = ".", grouping_mark = ","),
                     n_max = Inf,
                     na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)
ekolosko[[3]] <- parse_number(ekolosko[[3]])
#ekolosko <- ekolosko[-c(1)]

#površina in število trsnic, matičnjakov in vinogradov (primerjava)
trsnice.maticnjaki <- read_csv2("podatki/trsnice.csv",
                               skip = 5,
                               locale = locale(encoding = "UTF-8"),
                               n_max = 27,
                               na = c("", '-', "z") %>% fill(1:2) %>% drop_na(3))
trsnice.maticnjaki[[3]] <- NULL
trsnice.maticnjaki[[3]] <- parse_number(trsnice.maticnjaki[[3]])
trsnice.maticnjaki[[4]] <- parse_number(trsnice.maticnjaki[[4]])
trsnice.maticnjaki[[5]] <- parse_number(trsnice.maticnjaki[[5]])

#slovenske sorte
slovenske.sorte <- read_csv2("podatki/vivc.slovenija.csv")
slovenske.sorte$Variety.number.VIVC <- NULL
slovenske.sorte$Species <- NULL

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
