# 2. faza: Uvoz podatkov
sl <- locale(decimal_mark = ".", grouping_mark = ",")
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
velikost_slovenskih_vinogradov <-  read_csv2("podatki/velikost_vinogradov.csv",
                                             skip = 2,
                                             locale = locale(encoding = "UTF-8",
                                                             decimal_mark = ".", grouping_mark = ","),
                                             n_max = 26,
                                             na = c("", '-', "z")%>% fill(1:2) %>% drop_na(3))
                                             

#Nagib vinogradov po vinorodnih deželah in okoliših
nagib <- read_csv2("podatki/vertikale.csv",
                   skip = 2,
                   locale = locale(encoding = "UTF-8",
                                   decimal_mark = ".", grouping_mark = ","),
                   n_max = 26,
                   na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)
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
                          
#površina, število vinogradov in sadik 2009, 2015
povrsina.stevilo_vinogradov.sadik <- read_csv2("podatki/povrsina,stevilo.vinograd,sadik.csv",
                                              skip = 2,
                                              locale = locale(encoding = "UTF-8",
                                                              decimal_mark = ".", grouping_mark = ","),
                                              n_max = 48,
                                              na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)
#podlaga na kateri rastejo trte 2009 in 2015
podlaga <- read_csv2("podatki/podlaga.csv",
                    skip = 2,
                    locale = locale(encoding = "UTF-8",
                                    decimal_mark = ".", grouping_mark = ","),
                    n_max = 48,
                    na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)
#način gojenja trt
gojenje <- read_csv2("podatki/gojitvena_oblika.csv",
                    skip = 2,
                    locale = locale(encoding = "UTF-8",
                                    decimal_mark = ".", grouping_mark = ","),
                    n_max = 48,
                    na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)


#Drugi del

#Najpogostejše sorte po površini, številu sadik
sorte.povrsina_sadike <- read_csv2("podatki/povrsina,sadik-sorte.csv",
                                  skip = 2,
                                  locale = locale(encoding = "UTF-8",
                                                  decimal_mark = ".", grouping_mark = ","),
                                  n_max = 48,
                                  na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)

#Starost trt po površini in številu sadik
starost.povrsina_sadike <- read_csv2("podatki/povrsina,sadike-starost.csv",
                                    skip = 2,
                                    locale = locale(encoding = "UTF-8",
                                                    decimal_mark = ".", grouping_mark = ","),
                                    n_max = 48,
                                    na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)

#Najpogostejše sorte po starosti
sorte_starost <- read_csv2("podatki/sorte_starost.csv",
                          skip = 2,
                          locale = locale(encoding = "UTF-8",
                                          decimal_mark = ".", grouping_mark = ","),
                          n_max = 48,
                          na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)
#Pridelava grozdja
grozdje <- read_csv2("podatki/pridelava_grozdja.csv",
                    skip = 2,
                    locale = locale(encoding = "UTF-8",
                                    decimal_mark = ".", grouping_mark = ","),
                    n_max = 48,
                    na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)

#Pridelava po količini 2009
kolicina <- read_csv2("podatki/pridelovalci_kolicina.csv",
                     skip = 2,
                     locale = locale(encoding = "UTF-8",
                                     decimal_mark = ".", grouping_mark = ","),
                     n_max = 48,
                     na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3))
                                           
#Primerjalni del
#ekološka pridelava (primerjava)
ekolosko <- read_csv2("podatki/ekoloska_pridelav.csv", 
                     skip = 2,
                     locale = locale(encoding = "UTF-8",
                                     decimal_mark = ".", grouping_mark = ","),
                     n_max = 48,
                     na = c("", '-', "z")) %>% fill(1:2) %>% drop_na(3)

#površina in število trsnic, matičnjakov in vinogradov (primerjava)
trsnice.maticnjaki <- read_csv2("podatki/trsnice.csv",
                               skip = 1,
                               locale = locale(encoding = "UTF-8"),
                               n_max = 48,
                               na = c("", '-', "z") %>% fill(1:2) %>% drop_na(3))
#slovenske sorte
slovenske.sorte <- read_csv2("podatki/vivc.slovenija.csv")
slovenske.sorte$Variety.number.VIVC <- NULL
slovenske.sorte$Species <- NULL

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.
