# 2. faza: Uvoz podatkov
# uporabljal bom locale(decimal_mark = ".", grouping_mark = ",")

###
#V prvem delu bom zbral podatke ki bodo vinograde opisovali po zunanjih dejavnikih,
#kot so nagib, površina vinogradov, število sadik trtna podlaga ter sam izgled
#vinograda.
###

###
#Najprej naredimo vse v Tidy data z melt/ gather, nato pa z rbind združimo tabele
#v dve "veliki" tabeli. 
#NUJNO OPRAVILO.
#površina, število vinogradov in sadik 2009, 2015
stevilo_vinogradov.sadik <- read_csv2("podatki/povrsina,stevilo.vinograd,sadik.csv",
                                               skip = 2,
                                               locale = locale(encoding = "UTF-8",
                                                               decimal_mark = ".",
                                                               grouping_mark = ","),
                                               #n_max=Inf, #ni pravo število vrstic
                                               col_names = imena.stevilo.sadik,
                                               na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)
imena.stevilo.sadik <- c("Meritev","Leto","Vinorodna dežela",
                         "SKUPAJ","< 0,05 ha","0,05 do < 0,10 ha",
                         "0,10 do < 0,20 ha","0,20 do < 0,30 ha",
                         "0,30 do < 0,50 ha","0,50 do < 1 ha",
                         "1 do < 2 ha","2 do < 3 ha","3 do < 5 ha",
                         "5 do < 10 ha","10 do < 20 ha",
                         "20 do < 30 ha",">= 30 ha")
stevilo_vinogradov.sadik[[4]] <- parse_number(stevilo_vinogradov.sadik[[4]])
stevilo_vinogradov.sadik[[5]] <- parse_number(stevilo_vinogradov.sadik[[5]])
stevilo_vinogradov.sadik[[6]] <- parse_number(stevilo_vinogradov.sadik[[6]])
stevilo_vinogradov.sadik[[7]] <- parse_number(stevilo_vinogradov.sadik[[7]])
stevilo_vinogradov.sadik[[8]] <- parse_number(stevilo_vinogradov.sadik[[8]])
stevilo_vinogradov.sadik[[9]] <- parse_number(stevilo_vinogradov.sadik[[9]])
stevilo_vinogradov.sadik[[10]] <- parse_number(stevilo_vinogradov.sadik[[10]])
stevilo_vinogradov.sadik[[11]] <- parse_number(stevilo_vinogradov.sadik[[11]])
stevilo_vinogradov.sadik[[12]] <- parse_number(stevilo_vinogradov.sadik[[12]])
stevilo_vinogradov.sadik[[13]] <- parse_number(stevilo_vinogradov.sadik[[13]])
stevilo_vinogradov.sadik[[14]] <- parse_number(stevilo_vinogradov.sadik[[14]])
stevilo_vinogradov.sadik[[15]] <- parse_number(stevilo_vinogradov.sadik[[15]])
stevilo_vinogradov.sadik[[16]] <- parse_number(stevilo_vinogradov.sadik[[16]])
stevilo_vinogradov.sadik[[17]] <- parse_number(stevilo_vinogradov.sadik[[17]])

tidy_stevilo_vinogradov.sadik <- gather(stevilo_vinogradov.sadik,
                                                key =  "Velikostni razred" ,
                                                value = "Vrednost" ,
                                                -1, -2, -3)

zmanjšan_stevilo_vinogradov.sadik <- stevilo_vinogradov.sadik[c(1,2,3,4)]

#Nagib vinogradov po vinorodnih deželah in okoliših

nagib <- read_csv2("podatki/vertikale.csv",
                   skip = 2,
                   locale = locale(encoding = "UTF-8",
                                   decimal_mark = ".",
                                   grouping_mark = ","),
                   n_max = 26,
                   col_names = imena.nagib,
                   na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)

imena.nagib <- c("Meritev", "Leto", "Vinorodna dežela",
                 "0%","nad 0% do 5%","nad 5% do 15%",
                 "nad 15% do 30%","nad 30% do 45%",
                 "nad 45%")

nagib[[4]] <- parse_number(nagib[[4]])
nagib[[5]] <- parse_number(nagib[[5]])
nagib[[9]] <- parse_number(nagib[[9]])

tidy_nagib <- gather(nagib, key =  "Nagib", value = "Vrednost", -1, -2, -3)

#površina, število vinogradov in sadik glede na zatravljenost
zatravljenost <- read_csv2("podatki/zatravljenost.csv",
                          skip = 2,
                          locale = locale(encoding = "UTF-8",
                                          decimal_mark = ".",
                                          grouping_mark = ","),
                          #n_max = 51, ni pravo število vrstic
                          col_names = imena.zatravljenost,
                          na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)
imena.zatravljenost <- c("Meritev", "Leto",
                         "Vinorodna dežela",
                         "Nezatravljeno", 
                         "Zatravljeno")
zatravljenost[[4]] <- parse_number(zatravljenost[[4]])
zatravljenost[[5]] <- parse_number(zatravljenost[[5]])
zatravljenost[[6]] <- parse_number(zatravljenost[[6]])
zatravljenost[[7]] <- parse_number(zatravljenost[[7]])
zatravljenost[[8]] <- parse_number(zatravljenost[[8]])
zatravljenost[[9]] <- parse_number(zatravljenost[[9]])

tidy_zatravljenost <- gather(zatravljenost,
                             key =  "Zatravljenost",
                             value = "Vrednost",
                             -1, -2, -3)                          

#podlaga na kateri rastejo trte 2009 in 2015
podlaga <- read_csv2("podatki/podlaga.csv",
                    skip = 2,
                    locale = locale(encoding = "UTF-8",
                                    decimal_mark = ".",
                                    grouping_mark = ","),
                   # n_max = Inf, ni pravo število vrstic
                    col_names = imena.podlaga,
                    na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)
imena.podlaga <- c("Meritev","Leto","Vinorodna dežela",
                   "Riparia portalis","Rupestris du lot",
                   "Kober 125aa","Kober 5bb","420 a","So4",
                   "Teleki 8b","Teleki 5 c","V-m","Vi-m",
                   "Binova","8 bč","Boerner","Paulsen 1103",
                   "Richter 99","Richter 110","3309 couderc","41 b",
                   "Ni podatka")
podlaga[[4]] <- parse_number(podlaga[[4]])
podlaga[[12]] <- parse_number(podlaga[[12]])
podlaga[[13]] <- parse_number(podlaga[[13]])
podlaga[[18]] <- parse_number(podlaga[[18]])
podlaga[[21]] <- parse_number(podlaga[[21]])

tidy_podlaga <- gather(podlaga,
                       key =  "Vrsta podlage" ,
                       value = "Vrednost" ,
                       -1, -2, -3)

#način gojenja trt
gojenje <- read_csv2("podatki/gojitvena_oblika.csv",
                    skip = 2,
                    locale = locale(encoding = "UTF-8",
                                    decimal_mark = ".",
                                    grouping_mark = ","),
                    #n_max = Inf, ne izpiše vseh vrstic
                    col_names = imena.gojenje,
                    na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)
imena.gojenje <- c("Meritev","Leto","Vinorodna dežela",
                   "Kraški latnik","Viseči šparoni 'casarsa'",
                   "Navadni latnik","Sylvoz",
                   "Ribji hrbet","Enojni guyot",
                   "Dvojni guyot","Iloška vzgoja",
                   "Pahljačaste vzgoje","Nižji enoramni kordon",
                   "Nižji dvoramni kordon",
                   "Nizka ob kolju (ekstenzivni vinogradi)","Vertiko",
                   "Neznana površina")
gojenje[[6]] <- parse_number(gojenje[[6]])
gojenje[[11]] <- parse_number(gojenje[[11]])
gojenje[[13]] <- parse_number(gojenje[[13]])
gojenje[[12]] <- parse_number(gojenje[[12]])
gojenje[[15]] <- parse_number(gojenje[[15]])
gojenje[[16]] <- parse_number(gojenje[[16]])

tidy_gojenje <- gather(gojenje,
                       key =  "Velikostni razred" ,
                       value = "Vrednost" ,
                       -1, -2, -3)

##
#Prva tabela
##
prva.tabela <- 

###
#Drugi del je tisti, v katerem bom opisal vinograde po bolj direktnih opisnih dejavnikih, kot so
#sorte in starost trt.
###
#Najpogostejše sorte po površini, številu sadik
sorte.povrsina_sadike <- read_csv2("podatki/povrsina,sadik-sorte.csv",
                                  skip = 2,
                                  locale = locale(encoding = "UTF-8",
                                                  decimal_mark = ".",
                                                  grouping_mark = ","),
                                  n_max = 27,
                                  col_names = imena.sorte.povrsina,
                                  na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)
imena.sorte.povrsina <- c("Leto","Meritev","Vinorodna dežela","Bele sorte- Beli pinot",
                   "Bele sorte- Chardonnay","Bele sorte- Kraljevina",
                   "Bele sorte- Laški rizling","Bele sorte- Malvazija",
                   "Bele sorte- Rebula","Bele sorte- Renski rizling",
                   "Bele sorte- Rumeni muškat","Bele sorte- Sauvignon",
                   "Bele sorte- Sivi pinot","Bele sorte- Šipon",
                   "Bele sorte- Traminec","Bele sorte- Zeleni silvanec",
                   "Ostale bele sorte","Rdeče sorte- Barbera",
                   "Rdeče sorte- Cabernet franc","Rdeče sorte- Cabernet sauvignon",
                   "Rdeče sorte- Merlot","Rdeče sorte- Modra frankinja",
                   "Rdeče sorte- Modri pinot","Rdeče sorte- Portugalka",
                   "Rdeče sorte- Refošk","Rdeče sorte- Zweigelt",
                   "Rdeče sorte- Žametovka","Rdeče sorte- Syrah",
                   "Ostale rdeče sorte","Ni podatka o sorti")

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

tidy_sorte.povrsina_sadike <- gather(sorte.povrsina_sadike,
                       key =  "Sorta" ,
                       value = "Vrednost" ,
                       -1, -2, -3)

#Starost trt po površini in številu sadik
starost.povrsina_sadike <- read_csv2("podatki/povrsina,sadike-starost.csv",
                                    skip = 2,
                                    locale = locale(encoding = "UTF-8",
                                                    decimal_mark = ".",
                                                    grouping_mark = ","),
                                    n_max = Inf,
                                    col_names = imena.starost.povrsina,
                                    na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)
imena.starost.povrsina <- c("Meritev","Leto","Vinorodna dežela",
                            "do 1 leta","1 do 2 let",
                            "3 do 5 let","6 do 9 let","10 do 19 let",
                            "20 do 29 let","30 + let","Ni podatka")
starost.povrsina_sadike[[11]] <- parse_number(starost.povrsina_sadike[[11]])

tidy_starost.povrsina_sadike <- gather(starost.povrsina_sadike,
                                     key =  "Sorta" ,
                                     value = "Vrednost" ,
                                     -1, -2, -3)

# #Najpogostejše sorte po starosti
# sorte_starost <- read_csv2("podatki/sorte_starost.csv",
#                           skip = 3,
#                           locale = locale(encoding = "UTF-8",
#                                           decimal_mark = ".",
#                                           grouping_mark = ","),
#                           n_max = 14,
#                           col_names = imena.starost,
#                           na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)
# imena.starost <- c("Leto","Meritev","Bele sorte- Beli pinot",
#                    "Bele sorte- Chardonnay","Bele sorte- Kraljevina",
#                    "Bele sorte- Laški rizling","Bele sorte- Malvazija",
#                    "Bele sorte- Rebula","Bele sorte- Renski rizling",
#                    "Bele sorte- Rumeni muškat","Bele sorte- Sauvignon",
#                    "Bele sorte- Sivi pinot","Bele sorte- Šipon",
#                    "Bele sorte- Traminec","Bele sorte- Zeleni silvanec",
#                    "Ostale bele sorte","Rdeče sorte- Barbera",
#                    "Rdeče sorte- Cabernet franc","Rdeče sorte- Cabernet sauvignon",
#                    "Rdeče sorte- Merlot","Rdeče sorte- Modra frankinja",
#                    "Rdeče sorte- Modri pinot","Rdeče sorte- Portugalka",
#                    "Rdeče sorte- Refošk","Rdeče sorte- Zweigelt",
#                    "Rdeče sorte- Žametovka","Rdeče sorte- Syrah",
#                    "Ostale rdeče sorte","Ni podatka o sorti")
# sorte_starost[[14]] <- parse_number(sorte_starost[[14]])
# sorte_starost[[25]] <- parse_number(sorte_starost[[25]])
# sorte_starost[[28]] <- parse_number(sorte_starost[[28]])
# sorte_starost[[29]] <- parse_number(sorte_starost[[29]])



# Mogoče uporabim, če mi uspe primerjati
#Pridelava grozdja
# grozdje <- read_csv2("podatki/pridelava_grozdja.csv",
#                     skip = 2,
#                     locale = locale(encoding = "UTF-8",
#                                     decimal_mark = ".", grouping_mark = ","),
#                     n_max = 48,
#                     na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)


#Primerjalni del
#ekološka pridelava (primerjava)
ekolosko <- read_csv2("podatki/raba_ekoloskih_zemljics.csv", 
                     skip = 4,
                     locale = locale(encoding = "UTF-8",
                                     decimal_mark = ".",
                                     grouping_mark = ","),
                     col_names = imena.ekolosko,
                     na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)
imena.ekolosko <- c("Meritev", "Leto", "Vinogradi")
ekolosko[[3]] <- parse_number(ekolosko[[3]])


#površina in število trsnic, matičnjakov in vinogradov (primerjava)
#n_max ne dela pravilno
trsnice.maticnjaki <- read_csv2("podatki/trsnice.csv",
                               skip = 2,
                               locale = locale(encoding = "UTF-8"),
                               n_max = 26,
                               col_names = imena.trsnice,
                               na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)

imena.trsnice <- c("Meritev", "Leto", "Vinorodna dežela", "Vinogradi", "Trsnice", "Matičnjaki", "Namizno grozdje")

trsnice.maticnjaki[[3]] <- NULL
trsnice.maticnjaki[[3]] <- parse_number(trsnice.maticnjaki[[3]])
trsnice.maticnjaki[[4]] <- parse_number(trsnice.maticnjaki[[4]])
trsnice.maticnjaki[[5]] <- parse_number(trsnice.maticnjaki[[5]])


tidy_trsnice.maticnjaki <- gather(trsnice.maticnjaki,
                                  key =  "Pridelava" ,
                                  value = "Vrednost" ,
                                  -1, -2, -3)

#slovenske sorte
slovenske.sorte <- read_csv2("podatki/vivc.slovenija.csv")
slovenske.sorte$`Variety number VIVC` <- NULL
slovenske.sorte$Species <- NULL

# Funkcija, ki uvozi podatke o vinskih sortah iz Wikipedije
# Vire sem prenesel 13.12.2017 
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

