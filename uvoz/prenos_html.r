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


dvojni <- grep("[[:lower:]][[:upper:]]", sorte$Drzava.izvora)
sorte1 <- sorte
sorte1 <- apply(sorte[dvojni, ], 1, . %>% as.list() %>%
{ data.frame(Drzava.izvora = .$Drzava.izvora %>%
               strapplyc((","| "("| " ")) %>% unlist(),
               stringsAsFactors = FALSE) }) %>%
  bind_rows() %>% rbind(sorte[-dvojni, ]) 
