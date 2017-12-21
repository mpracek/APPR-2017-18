# 3. faza: Vizualizacija podatkov

##
#Prvi del
##

#Nagibi
nagibi <- stidy_nagib$Vinorodna.dezela 
nagibi_slika_povrsina <- ggplot(stidy_nagib) + aes(x = Povrsina,
                                                   y = Nagib) +
                                             geom_line()
print(nagibi_slika_povrsina)

#Gojenje
gojenje_slika_povrsina <- ggplot(stidy_gojenje) + aes(x = Povrsina,
                                                      y = Nacin.gojenja) +
                                                geom_line()
print(gojenje_slika_povrsina)

gojenje_slika_stevilo.sadik <- ggplot(stidy_gojenje) + aes(x = Stevilo.sadik,
                                                      y = Nacin.gojenja) +
  geom_line()
print(gojenje_slika_stevilo.sadik)

#Podlaga
podlaga_slika_povrsina <- ggplot(stidy_podlaga) + aes(x = Povrsina,
                                                      y = Nacin.gojenja) +
  geom_line()
print(podlaga_slika_povrsina)

podlaga_slika_stevilo.sadik <- ggplot(stidy_podlaga) + aes(x = Stevilo.sadik,
                                                           y = Nacin.gojenja) +
  geom_line()
print(podlaga_slika_stevilo.sadik)

#Zatravljenost

zatravljenost_slika_povrsina <- ggplot(stidy_zatravljenost) + 
                                aes(x = Povrsina,
                                    y = Zatravljenost) +
                                geom_line()
print(zatravljenost_slika_povrsina)

zatravljenost_slika_stevilo.sadik <- ggplot(stidy_zatravljenost) + 
                                     aes(x = Stevilo.sadik,
                                         y = Zatravljenost) +
                                     geom_line()
print(zatravljenost_slika_stevilo.sadik)

zatravljenost_slika_stevilo.sadik <- ggplot(stidy_zatravljenost) + 
                                     aes(x = Stevilo.vinogradov,
                                         y = Zatravljenost) +
                                     geom_line()
print(zatravljenost_slika_stevilo.sadik)

##
#Drugi del
##

# Površina in sadike po sortah

sorte_slika_povrsina <- ggplot(stidy_sorte.povrsina_sadike) + 
  aes(x = Povrsina,
      y = Sorta) +
  geom_line()
print(sorte_slika_povrsina)

sorte_slika_stevilo.sadik <- ggplot(stidy_sorte.povrsina_sadike) + 
  aes(x = Stevilo.sadik,
      y = Sorta) +
  geom_line()
print(sorte_slika_stevilo.sadik)

#Sorte po starosti, površini in sadikah
starost_slika_povrsina <- ggplot(stidy_starost.povrsina_sadike) + 
  aes(x = Povrsina,
      y = Starost) +
  geom_line()
print(starost_slika_povrsina)

starost_slika_stevilo.sadik <- ggplot(stidy_starost.povrsina_sadike) + 
  aes(x = Stevilo.sadik,
      y = Starost) +
  geom_line()
print(starost_slika_stevilo.sadik)

#Število vinogradov sadik
stevilo_slika_povrsina <- ggplot(stidy_stevilo_vinogradov.sadik) + 
  aes(x = Povrsina,
      y = Velikostni.razred) +
  geom_line()
print(stevilo_slika_povrsina)

stevilo_slika_stevilo.sadik <- ggplot(stidy_stevilo_vinogradov.sadik) + 
  aes(x = Stevilo.sadik,
      y = Velikostni.razred) +
  geom_line()
print(stevilo_slika_stevilo.sadik)

stevilo_slika_stevilo.sadik <- ggplot(stidy_stevilo_vinogradov.sadik) + 
  aes(x = Stevilo.vinogradov,
      y = Velikostni.razred) +
  geom_line()
print(stevilo_slika_stevilo.sadik)

##
#Dodatna analiza
##

#ekološka predelava
eko_sprememba <- ggplot(ekolosko) + aes(x = Leto, y = Vinogradi) + geom_path()
print(eko_sprememba)

graf <- ggplot(ekolosko) +
  aes(x = Leto, 
      y = Vinogradi, 
      color = Meritev) +
  geom_point()
print(graf)

#Matičnjaki

Povrsina_maticnjaki <- ggplot(stidy_trsnice.maticnjaki) + 
  aes(x = Povrsina,
      y = Pridelava) +
  geom_line()
print(Povrsina_maticnjaki)

stevilo_maticnjaki_nasadi <- ggplot(stidy_trsnice.maticnjaki) + 
  aes(x = Stevilo.nasadov,
      y = Pridelava) +
  geom_line()
print(stevilo_maticnjaki_nasadi)


# Uvozimo zemljevid.
zemljevid <- uvozi.zemljevid("http://baza.fmf.uni-lj.si/OB.zip",
                             "OB/OB", encoding = "Windows-1250")
levels(zemljevid$OB_UIME) <- levels(zemljevid$OB_UIME) %>%
  { gsub("Slovenskih", "Slov.", .) } %>% { gsub("-", " - ", .) }
zemljevid$OB_UIME <- factor(zemljevid$OB_UIME, levels = levels(obcine$obcina))
zemljevid <- pretvori.zemljevid(zemljevid)

# Izračunamo povprečno velikost družine
povprecja <- druzine %>% group_by(obcina) %>%
  summarise(povprecje = sum(velikost.druzine * stevilo.druzin) / sum(stevilo.druzin))
