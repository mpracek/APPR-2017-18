# 4. faza: Analiza podatkov

# Povprečne velikosti
povprecno.stevilo.vinogradov <- stidy_zatravljenost %>% group_by(Vinorodna.dezela) %>%
  summarise(povp.vinograd = sum(Stevilo.vinogradov) / 4)

povprecno.vinograd <- ggplot(povprecno.stevilo.vinogradov) + 
  geom_col() +
  aes(x = Vinorodna.dezela,
      y = factor(povp.vinograd)) 
#print(povprecno.vinograd)


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

stevilo_sort <- vse.sorte %>% count(drzava.izvora)

#ekološka predelava
eko_sprememba <- ggplot(ekolosko) + aes(x = Leto,
                                        y = Vinogradi,
                                        col = Meritev) + 
  geom_path() +
  geom_smooth(method=lm) + ggtitle("Število ekoloških vinogradov")
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
  aes(x = Leto, y = st.vinogradov) + geom_line() +
  ggtitle("Ekološke kmetije") + xlab("Leto") + ylab("Število vinogradov")
graf.napovedi.preu <- ggplot(napoved.pre.eko) +
  aes(x = Leto, y =st.vinogradov) + geom_line() +
  ggtitle("Kmetije v preusmeritvi") + xlab("Leto") + ylab("Število vinogradov")

#zdruzene.napovedi <- rbind(graf.napovedi.preu,graf.napovedi.preu)
####Združi oba grafa!!!! 
#naredil v poročilu
#Matičnjaki

Povrsina_maticnjaki <- ggplot(stidy_trsnice.maticnjaki) + 
  aes(x = Povrsina,
      y = Pridelava) +
  geom_point() + ggtitle("")
#print(Povrsina_maticnjaki)

stevilo_maticnjaki_nasadi <- ggplot(stidy_trsnice.maticnjaki) + 
  aes(x = Stevilo.nasadov,
      y = Pridelava) +
  geom_line()
#print(stevilo_maticnjaki_nasadi)
