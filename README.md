# Analiza podatkov s programom R, 2017/18

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2017/18

## Vinogradništvo v Sloveniji

Po tem, ko sem se odločil za vojo tematiko, sem na internetu poiskal podatke, kjer sem si pomagal predvsem s [SURS](http://pxweb.stat.si/pxweb/Database/Okolje/15_kmetijstvo_ribistvo/04_rastlinska_pridelava/06_15283_popis_vinogradov/06_15283_popis_vinogradov.asp), poleg tega pa še z [wikipedio](https://en.wikipedia.org/wiki/List_of_grape_varieties), ter [Vitis International Variety Collection](http://www.vivc.de).
S svojim projektom želim raziskati obširno tematiko vinogradništva v Sloveniji, predvsem s stališča samega izgleda vinogradov, torej podlage, na kateri rastejo, nagib vinogradov, njihova zatravljenost, ter seveda njihova velikost in razširjenost, po drugi strani pa bom pogledal pridelavo grozdja v vinogradih po sortah, ter pogledal avtohtone slovenske sorte.
Pri vsem bom upošteval razdeljenost po vinorodnih deželah.
Podatki, ki sem jih našel na SURS, se nanašajo na zelo različna leta in so zato problematični, saj se jih ne da lepo združiti in/ ali primerjati. Velik problem je tudi nedostopnost podatkov, saj vsi podatki niso splošno dostopni, saj so poslovna tajnost, kar je bil tudi eden izmed razlogov, da nisem obravnaval tudi vinarstva. 

Prvi del mojega raziskovanja, torej vinogradi po zunanjem izgledu je del, kjer bom opazoval zunanje značilnosti, kot so na primer zatravljenost, nagib površine, število trt itd. Prvi stolpev v vsaki tabeli je 'Leto', drugi je 'Vinorodna.dezela', sledi stolpec meritve z opisimi lastnostni. V preostalih stolpcih se nahajajo rezultati meritve v številu trt oziroma v površini.
Tudi v drugem delu bom imel enake prve dva ter zadnje stolpce, le stolpec meritve bo imel drugačne meritve.
Naloga pa bo vsebovala tudi več primerjalnih tabel, in sicer tabelo slovenskih ter  svetovnih avtohtonih sort ter tabelo ekološke pridelave.
 

*1.Zunanji opis vinogradov*
  - `Leto` - Leto meritve
  - `Vinorodna.dezela` - vinogradništvo bom razdelil na 4 regije, Primorsko, Podravsko, Posavsko ter zunaj vinorodnih območij,
  - `Meritev` - zatravljenost, podlaga, nagib, način gojenja
  - `Povrsina` - meritev: površina v hektarih(število)
  - `Število trt` - meritev: število trt 

*2. Vinogradi po trtni sestavi*
  - `Leto` - Leto meritve
  - `Vinorodna dežela` - vinogradništvo bom razdelil na 4 regije, Primorsko, Podravsko, Posavsko ter zunaj vinorodnih območij,
  - `Meritev` - starost, sorta 
  - `Povrsina` - meritev: površina v hektarih(število)
  - `Število trt` - meritev: število trt 

*3. Za mojo nalogo bodo pomembne tudi dve primerjalne tabele, in sicer:*
  - Tabelo slovenskih avtohtonih sort
  - Tabela svetovnih avtohtonih sort
  - Tabela ekološke pridelave 

## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`. Ko ga prevedemo,
se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Zemljevidi v obliki SHP, ki jih program pobere, se
shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `maptools` - za uvoz zemljevidov
* `sp` - za delo z zemljevidi
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `reshape2` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)
* `gridExtra` - za pravilno razporeditev grafov


