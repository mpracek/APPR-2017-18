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

#Sorte point graf
sorte.slika.point <- ggplot(stidy_sorte.povrsina_sadike) + 
  aes(x = Povrsina,
      y = Stevilo.sadik,
      col = Sorta) +
  geom_point() 

sorte.slika.line <- ggplot(stidy_sorte.povrsina_sadike) + 
  aes(x = Povrsina,
      y = Stevilo.sadik) +
  geom_point() + geom_smooth(method=lm)+geom_col() + ggtitle("Število sadik na enoto površine") + 
  xlab("Število sadik") + ylab("Površina") +
  guides(fill = guide_colorbar(title = "Število"))
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
      fill = Sorta) +
  theme(axis.text.x = element_text(angle = 90 , vjust = 0.5, hjust = 1)) +
  geom_col() + ggtitle("Število trt po sortah v vinorodnih deželah") +
  xlab("Število sadik") + ylab("Vinorodna dežela") 

#print(delez_sadik)

#####Sorte po starosti, površini in sadikah
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

sorte_drzave <- ggplot(vse.sorte) + 
  geom_bar() +
  aes(x = drzava.izvora) +
  theme(axis.text.x = element_text(angle = 90 , vjust = 0.5, hjust = 1)) +
  geom_bar()
#print(sorte_drzave)


stevilo_sort <- vse.sorte %>% count(drzava.izvora)


                
#Delo z zemljevidom; število sort po državah sveta
zemljevid <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_map_units.zip",
                             "ne_110m_admin_0_map_units", encoding = "UTF-8") %>%
  pretvori.zemljevid()

# #                                 
zemljevid.drzave <- ggplot() +
  geom_polygon(data = left_join(zemljevid, stevilo_sort, 
                                by = c("NAME_LONG" = "drzava.izvora")), 
               aes(x = long, y = lat, group = group, fill = n), 
               color = "black")  +
               ggtitle("Zemljevid sveta") + xlab("") + ylab("") +
               guides(fill = guide_colorbar(title = "Število avtohtonih sort"))

zemljevid.evropa<- ggplot() +
  geom_polygon(data = left_join(zemljevid, stevilo_sort, 
                                by = c("NAME_LONG" = "drzava.izvora")), 
               aes(x = long, y = lat, group = group, fill = n), 
               color = "black") + coord_cartesian(xlim=c(-10,50), ylim=c(35,60))+
   ggtitle("Zemljevid Evrope") + xlab("") + ylab("") +
  guides(fill = guide_colorbar(title = "Število avtohtonih sort"))
