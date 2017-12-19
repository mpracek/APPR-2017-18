# 2. faza: Uvoz podatkov
# uporabljal bom locale(decimal_mark = ".", grouping_mark = ",")

###
#V prvem delu bom zbral podatke ki bodo vinograde opisovali po zunanjih dejavnikih,
#kot so nagib, površina vinogradov, število sadik trtna podlaga ter sam izgled
#vinograda.
###

#površina, število vinogradov in sadik 2009, 2015

imena.stevilo.sadik <- c("Meritev","Leto","Vinorodna.dezela",
                         "SKUPAJ","< 0,05 ha","0,05 do < 0,10 ha",
                         "0,10 do < 0,20 ha","0,20 do < 0,30 ha",
                         "0,30 do < 0,50 ha","0,50 do < 1 ha",
                         "1 do < 2 ha","2 do < 3 ha","3 do < 5 ha",
                         "5 do < 10 ha","10 do < 20 ha",
                         "20 do < 30 ha",">= 30 ha")


stevilo_vinogradov.sadik <- read_csv2("podatki/povrsina,stevilo.vinograd,sadik.csv",
                                               skip = 2,
                                               locale = locale(encoding = "UTF-8",
                                                               decimal_mark = ".",
                                                               grouping_mark = ","),
                                               col_names = imena.stevilo.sadik,
                                               na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)

tidy_stevilo_vinogradov.sadik <- arrange(gather(stevilo_vinogradov.sadik,
                                                key =  "Velikostni.razred" ,
                                                value = "Vrednost" ,
                                                -1, -2, -3),
                                         Meritev) %>%
  mutate(Vrednost = parse_number(Vrednost))

stidy_stevilo_vinogradov.sadik <- dcast(tidy_stevilo_vinogradov.sadik,
                            Leto + Vinorodna.dezela + Velikostni.razred ~ Meritev)

zmanjsan_stevilo_vinogradov.sadik <- stevilo_vinogradov.sadik[c(1,2,3,4)]

#Nagib vinogradov po vinorodnih deželah in okoliših

imena.nagib <- c("Meritev", "Leto", "Vinorodna.dezela",
                 "0%","nad 0% do 5%","nad 5% do 15%",
                 "nad 15% do 30%","nad 30% do 45%",
                 "nad 45%")


nagib <- read_csv2("podatki/vertikale.csv",
                   skip = 2,
                   locale = locale(encoding = "UTF-8",
                                   decimal_mark = ".",
                                   grouping_mark = ","),
                   col_names = imena.nagib,
                   na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)


tidy_nagib <- arrange(gather(nagib,
                             key =  "Nagib",
                             value = "Vrednost",
                             -1, -2, -3),
                      Meritev)%>%
  mutate(Vrednost = parse_number(Vrednost))

stidy_nagib <- dcast(tidy_nagib,
                     Leto + Vinorodna.dezela + Nagib ~ Meritev)

#površina, število vinogradov in sadik glede na zatravljenost

imena.zatravljenost <- c("Meritev", "Leto",
                         "Vinorodna.dezela",
                         "Nezatravljeno", 
                         "Zatravljeno")


zatravljenost <- read_csv2("podatki/zatravljenost.csv",
                          skip = 2,
                          locale = locale(encoding = "UTF-8",
                                          decimal_mark = ".",
                                          grouping_mark = ","),
                          col_names = imena.zatravljenost,
                          na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)

tidy_zatravljenost <- arrange(gather(zatravljenost,
                                     key =  "Zatravljenost",
                                     value = "Vrednost",
                                     -1, -2, -3),
                              Meritev)%>%
  mutate(Vrednost = parse_number(Vrednost))

stidy_zatravljenost <- dcast(tidy_zatravljenost,
                             Leto + Vinorodna.dezela + Zatravljenost ~ Meritev)

#podlaga na kateri rastejo trte 2009 in 2015

imena.podlaga <- c("Meritev","Leto","Vinorodna.dezela",
                   "Riparia portalis","Rupestris du lot",
                   "Kober 125aa","Kober 5bb","420 a","So4",
                   "Teleki 8b","Teleki 5 c","V-m","Vi-m",
                   "Binova","8 bč","Boerner","Paulsen 1103",
                   "Richter 99","Richter 110","3309 couderc","41 b",
                   "Ni podatka")


podlaga <- read_csv2("podatki/podlaga.csv",
                    skip = 2,
                    locale = locale(encoding = "UTF-8",
                                    decimal_mark = ".",
                                    grouping_mark = ","),
                    col_names = imena.podlaga,
                    na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)


tidy_podlaga <- arrange(gather(podlaga,
                               key =  "Vrsta.podlage" ,
                               value = "Vrednost" ,
                               -1, -2, -3),
                       Meritev)%>%
  mutate(Vrednost = parse_number(Vrednost))

stidy_podlaga <- dcast(tidy_podlaga,
                       Leto + Vinorodna.dezela + Vrsta.podlage ~ Meritev)

#način gojenja trt

imena.gojenje <- c("Meritev","Leto","Vinorodna.dezela",
                   "Kraški latnik","Viseči šparoni 'casarsa'",
                   "Navadni latnik","Sylvoz",
                   "Ribji hrbet","Enojni guyot",
                   "Dvojni guyot","Iloška vzgoja",
                   "Pahljačaste vzgoje","Nižji enoramni kordon",
                   "Nižji dvoramni kordon",
                   "Nizka ob kolju (ekstenzivni vinogradi)","Vertiko",
                   "Neznana površina")


gojenje <- read_csv2("podatki/gojitvena_oblika.csv",
                    skip = 2,
                    locale = locale(encoding = "UTF-8",
                                    decimal_mark = ".",
                                    grouping_mark = ","),
                    #n_max = Inf, ne izpiše vseh vrstic
                    col_names = imena.gojenje,
                    na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)


tidy_gojenje <- arrange(gather(gojenje,
                               key =  "Nacin.gojenja" ,
                               value = "Vrednost" ,
                               -1, -2, -3),
                        Meritev)%>%
  mutate(Vrednost = parse_number(Vrednost))

stidy_gojenje <- dcast(tidy_gojenje,
                       Leto + Vinorodna.dezela + Nacin.gojenja ~ Meritev)


###
#Drugi del je tisti, v katerem bom opisal vinograde po bolj direktnih opisnih dejavnikih, kot so
#sorte in starost trt.
###
#Najpogostejše sorte po površini, številu sadik

imena.sorte.povrsina <- c("Meritev","Leto","Vinorodna.dezela","Bele sorte- Beli pinot",
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


sorte.povrsina_sadike <- read_csv2("podatki/povrsina,sadik-sorte.csv",
                                  skip = 2,
                                  locale = locale(encoding = "UTF-8",
                                                  decimal_mark = ".",
                                                  grouping_mark = ","),
                                  n_max = 27,
                                  col_names = imena.sorte.povrsina,
                                  na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)

tidy_sorte.povrsina_sadike <- arrange(gather(sorte.povrsina_sadike,
                                             key =  "Sorta" ,
                                             value = "Vrednost" ,
                                             -1, -2, -3),
                                      Meritev)%>%
  mutate(Vrednost = parse_number(Vrednost))

stidy_sorte.povrsina_sadike <- dcast(tidy_sorte.povrsina_sadike,
                       Leto + Vinorodna.dezela + Sorta ~ Meritev)

#Starost trt po površini in številu sadik

imena.starost.povrsina <- c("Meritev","Leto","Vinorodna.dezela",
                            "do 1 leta","1 do 2 let",
                            "3 do 5 let","6 do 9 let","10 do 19 let",
                            "20 do 29 let","30 + let","Ni podatka")


starost.povrsina_sadike <- read_csv2("podatki/povrsina,sadike-starost.csv",
                                    skip = 2,
                                    locale = locale(encoding = "UTF-8",
                                                    decimal_mark = ".",
                                                    grouping_mark = ","),
                                    col_names = imena.starost.povrsina,
                                    na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)

tidy_starost.povrsina_sadike <- arrange(gather(starost.povrsina_sadike,
                                               key =  "Starost" ,
                                               value = "Vrednost" ,
                                               -1, -2, -3),
                                        Meritev)%>%
  mutate(Vrednost = parse_number(Vrednost))

stidy_starost.povrsina_sadike <- dcast(tidy_starost.povrsina_sadike,
                                     Leto + Vinorodna.dezela + Starost ~ Meritev)


#Primerjalni del
#ekološka pridelava (primerjava)

imena.ekolosko <- c("Meritev","Leto","Vinogradi")
  
ekolosko <- read_csv2("podatki/raba_ekoloskih_zemljics.csv", 
                     skip = 4,
                     locale = locale(encoding = "UTF-8",
                                     decimal_mark = ".",
                                     grouping_mark = ","),
                     col_names = imena.ekolosko,
                     na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)

ekolosko[[3]] <- parse_number(ekolosko[[3]])


#površina in število trsnic, matičnjakov in vinogradov (primerjava)

imena.trsnice <- c("Meritev", "Leto", "Vinorodna.dezela", "Vinogradi", "Trsnice", "Matičnjaki", "Namizno grozdje")

trsnice.maticnjaki <- read_csv2("podatki/trsnice.csv",
                               skip = 2,
                               locale = locale(encoding = "UTF-8"),
                               n_max = 26,
                               col_names = imena.trsnice,
                               na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)


tidy_trsnice.maticnjaki <- arrange(gather(trsnice.maticnjaki,
                                          key =  "Pridelava" ,
                                          value = "Vrednost" ,
                                          -1, -2, -3),
                                   Meritev)%>%
  mutate(Vrednost = parse_number(Vrednost))

stidy_trsnice.maticnjaki <- dcast(tidy_trsnice.maticnjaki,
                                  Leto + Vinorodna.dezela + Pridelava ~ Meritev)


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
bele.sorte$'All Synonyms' <- NULL
bele.sorte$'Barva' = 'Bela'
colnames(bele.sorte) <- c('Ime','Drzava.izvora','Barva')


rdece.sorte <- stran %>% html_nodes(xpath="//table[@class='wikitable sortable']") %>%.[[1]] %>% html_table(dec = ",")
rdece.sorte$Pedigree <- NULL
rdece.sorte$`Hectares cultivated (Year)` <- NULL
rdece.sorte$'Year of introduction' <- NULL
rdece.sorte$'All Synonyms' <- NULL
rdece.sorte$'Barva' = 'Rdeca'
colnames(rdece.sorte) <- c('Ime','Drzava.izvora','Barva')

sorte <- rbind(bele.sorte, rdece.sorte)

drzave <- sorte$'Drzava.izvora'
 
veckratnik <- grep()