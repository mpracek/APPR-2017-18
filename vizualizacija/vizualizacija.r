# 3. faza: Vizualizacija podatkov

##
#Prvi del
##

####Nagibi
nagibi <- stidy_nagib$Vinorodna.dezela 
nagibi_slika_povrsina <- ggplot(stidy_nagib) + 
  aes(x = Povrsina,
      y = Nagib) +
  geom_line() +
  ggtitle("Povprečen nagib vinogradov")
  
  
##print(nagibi_slika_povrsina)

####Gojenje
gojenje_slika_povrsina <- ggplot(stidy_gojenje) +
  aes(x = Povrsina, 
      y = Nacin.gojenja) +
  geom_line()
##print(gojenje_slika_povrsina)

gojenje_slika_stevilo.sadik <- ggplot(stidy_gojenje) + aes(x = Stevilo.sadik,
                                                      y = Nacin.gojenja) +
  geom_line()
##print(gojenje_slika_stevilo.sadik)

#####Podlaga
podlaga_slika_povrsina <- ggplot(stidy_podlaga) + aes(x = Povrsina,
                                                      y = Nacin.gojenja) +
  geom_line()
#print(podlaga_slika_povrsina)

podlaga_slika_stevilo.sadik <- ggplot(stidy_podlaga) + aes(x = Stevilo.sadik,
                                                           y = Nacin.gojenja) +
  geom_line()
#print(podlaga_slika_stevilo.sadik)

#####Zatravljenost

zatravljenost_slika_povrsina <- ggplot(stidy_zatravljenost) + 
                                aes(x = Povrsina,
                                    y = Zatravljenost) +
                                geom_line()
#print(zatravljenost_slika_povrsina)

zatravljenost_slika_stevilo.sadik <- ggplot(stidy_zatravljenost) + 
                                     aes(x = Stevilo.sadik,
                                         y = Zatravljenost) +
                                     geom_line()
#print(zatravljenost_slika_stevilo.sadik)

zatravljenost_slika_stevilo.sadik <- ggplot(stidy_zatravljenost) + 
                                     aes(x = Stevilo.vinogradov,
                                         y = Zatravljenost) +
                                     geom_line()
#print(zatravljenost_slika_stevilo.sadik)

##
#Drugi del
##

##### Površina in sadike po sortah

sorte_slika_povrsina <- ggplot(stidy_sorte.povrsina_sadike) + 
  aes(x = Povrsina,
      y = Sorta) +
  geom_line()
#print(sorte_slika_povrsina)

sorte_slika_stevilo.sadik <- ggplot(stidy_sorte.povrsina_sadike) + 
  aes(x = Stevilo.sadik,
      y = Sorta) +
  geom_line()
#print(sorte_slika_stevilo.sadik)

###DELEŽ SADIK DOLOČENE SORTE
delez_sadik <- ggplot(stidy_sorte.povrsina_sadike)+
  aes(x = Vinorodna.dezela,
      y = Stevilo.sadik,
      fill = Sorta) + geom_col()
#print(delez_sadik)

#Sorte po starosti, površini in sadikah
starost_slika_povrsina <- ggplot(stidy_starost.povrsina_sadike) + 
  aes(x = Povrsina,
      y = Starost) +
  geom_line()
#print(starost_slika_povrsina)

starost_slika_stevilo.sadik <- ggplot(stidy_starost.povrsina_sadike) + 
  aes(x = Stevilo.sadik,
      y = Starost) +
  geom_line()
#print(starost_slika_stevilo.sadik)

#Število vinogradov sadik
stevilo_slika_povrsina <- ggplot(stidy_stevilo_vinogradov.sadik) + 
  aes(x = Povrsina,
      y = Velikostni.razred) +
  geom_line()
#print(stevilo_slika_povrsina)

stevilo_slika_stevilo.sadik <- ggplot(stidy_stevilo_vinogradov.sadik) + 
  aes(x = Stevilo.sadik,
      y = Velikostni.razred) +
  geom_line()
#print(stevilo_slika_stevilo.sadik)

stevilo_slika_stevilo.sadik <- ggplot(stidy_stevilo_vinogradov.sadik) + 
  aes(x = Stevilo.vinogradov,
      y = Velikostni.razred) +
  geom_line()
#print(stevilo_slika_stevilo.sadik)

stidy_slika_stevilo_vinogradov <- ggplot(stidy_stevilo_vinogradov.sadik) + 
  geom_col() +
  aes(x = Vinorodna.dezela,
      y = factor(povp.sadik)) +
  coord_polar() 
##print(povprecno.sadike)


##
#Dodatna analiza
##

#ekološka predelava
eko_sprememba <- ggplot(ekolosko) + aes(x = Leto, y = Vinogradi) + geom_path()
#print(eko_sprememba)

#Matičnjaki

Povrsina_maticnjaki <- ggplot(stidy_trsnice.maticnjaki) + 
  aes(x = Povrsina,
      y = Pridelava) +
  geom_line()
#print(Povrsina_maticnjaki)

stevilo_maticnjaki_nasadi <- ggplot(stidy_trsnice.maticnjaki) + 
  aes(x = Stevilo.nasadov,
      y = Pridelava) +
  geom_line()
#print(stevilo_maticnjaki_nasadi)

# Povprečne velikosti
povprecno.stevilo.vinogradov <- stidy_zatravljenost %>% group_by(Vinorodna.dezela) %>%
  summarise(povp.vinograd = sum(Stevilo.vinogradov) / 4)

povprecno.vinograd <- ggplot(povprecno.stevilo.vinogradov) + 
  geom_col() +
  aes(x = Vinorodna.dezela,
      y = factor(povp.vinograd)) 
#print(povprecno.vinograd)


#NEUPORABNO, A KOPIRAJ ZA TORTNI
# povprecno.vinograd.torta <- ggplot(povprecno.stevilo.vinogradov) + 
#   geom_col() +
#   aes(x = Vinorodna.dezela,
#       y = factor(povp.vinograd)) +
#   coord_polar() 
# #print(povprecno.vinograd.torta)

povprecno.stevilo.sadik <- stidy_zatravljenost %>% group_by(Vinorodna.dezela) %>%
  summarise(povp.sadik = sum(Stevilo.sadik) /4)

povprecno.sadike <- ggplot(povprecno.stevilo.sadik) + 
  geom_col() +
  aes(x = Vinorodna.dezela,
      y = factor(povp.sadik))
##print(povprecno.sadike)


povprecna.povrsina <- stidy_zatravljenost %>% group_by(Vinorodna.dezela) %>%
  summarise(povp.povrsina = sum(Povrsina) /4)

povprecno.povrsina <- ggplot(povprecna.povrsina) + 
  geom_col() +
  aes(x = Vinorodna.dezela,
      y = factor(povp.povrsina))
#print(povprecno.povrsina)


##Sorte po državah sveta

sorte_drzave <- ggplot(vse.sorte) + 
  geom_bar() +
  aes(x = drzava.izvora) +
  theme(axis.text.x = element_text(angle = 90 , vjust = 0.5, hjust = 1)) +
  coord_polar()
#print(sorte_drzave)

#Delo z zemljevidom; število sort po državah sveta
zemljevid <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_map_units.zip",
                             "ne_110m_admin_0_map_units", encoding = "UTF-8") %>%
  pretvori.zemljevid()
