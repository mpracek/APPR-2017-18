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
  geom_point() + geom_smooth(method=lm)
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


##
#Dodatna analiza
##

#ekološka predelava
eko_sprememba <- ggplot(ekolosko) + aes(x = Leto,
                                        y = Vinogradi,
                                        col = Meritev) + 
  geom_path() +
  geom_smooth(method=lm)
#print(eko_sprememba)
###Napoved spremembe


napoved.ekoloska.pridelava <- lm(Ekoloska.pridelava ~ Leto , data=tidy_ekolosko)
zanima.me <- data.frame(Leto=c(2017:2025))
predict(napoved.ekoloska.pridelava, zanima.me)
napoved <- zanima.me %>% mutate(st.vinogradov=predict(napoved.ekoloska.pridelava, .))

napoved.preusmeritev <- lm(V.preusmeritvi ~ Leto , data=tidy_ekolosko)
zanima.me2 <- data.frame(Leto=c(2017:2025))
predict(napoved.preusmeritev, zanima.me2)
napoved.pre.eko <- zanima.me %>% mutate(st.vinogradov=predict(napoved.preusmeritev, .))


graf_napoved.eko <- ggplot(napoved) +
  aes(x = Leto, y = st.vinogradov) + geom_line()
graf.napovedi.preu <- ggplot(napoved.pre.eko) +
  aes(x = Leto, y =st.vinogradov) + geom_line()
  
#Matičnjaki

Povrsina_maticnjaki <- ggplot(stidy_trsnice.maticnjaki) + 
  aes(x = Povrsina,
      y = Pridelava) +
  geom_point()
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
  geom_bar()
#print(sorte_drzave)
#Število sort po državah sveta


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
   geom_text(data = inner_join(zemljevid, stevilo_sort, by = c("NAME_LONG" = "drzava.izvora")) %>%
                            group_by(NAME_LONG, REGION_WB) %>%
                            summarise(avg_long = mean(long), avg_lat = mean(lat)),
                          aes(x = avg_long, y = avg_lat, label = NAME_LONG), color = "red") +
  ggtitle("Zemljevid Evrope") + xlab("") + ylab("") +
  guides(fill = guide_colorbar(title = "Število avtohtonih sort"))
