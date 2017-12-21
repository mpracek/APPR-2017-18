# 3. faza: Vizualizacija podatkov

eko_sprememba <- ggplot(ekolosko) + aes(x = Leto, y = Vinogradi) + geom_line()
print(eko_sprememba)


nagibi <- stidy_nagib$Vinorodna.dezela 
nagibi_slika_povrsina <- ggplot(stidy_nagib) + aes(x = Leto,
                                                   y = Povrsina) +
                                             geom_point()
print(nagibi_slika_povrsina)

graf <- ggplot(ekolosko) +
                aes(x = Leto, 
                    y = Vinogradi, 
                    color = Meritev) +
                    geom_point()
print(graf)

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
