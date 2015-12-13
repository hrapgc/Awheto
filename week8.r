eightW.df <- read.delim("8weeks.txt")
check.fact(eightW.df)
require(grid)

with(eightW.df, table(Media, Awheto))
with(eightW.df, table(Agar, Luminosity))
with(eightW.df, table(Media, Luminosity, Agar))
bwplot(Media ~ Growth | Agar + Luminosity + Awheto, data = eightW.df, layout = c(2, 4))
bwplot(Media ~ Growth | Agar + Awheto + Luminosity, data = eightW.df, layout = c(2, 4))
bwplot(Media ~ Growth | Awheto + Agar + Luminosity, data = eightW.df, layout = c(2, 4))

## slightly more useful order
media.order <- levels(eightW.df$Media)[c(2, 3, 1, 7, 8, 4, 9, 10, 11, 6, 5)]
eightW.df$Media <- factor(eightW.df$Media, levels = media.order)
## (don't repeat those two steps without rereading the text file)


pdf(file = "AwhetoGrowth.pdf", width = 188/25.4, height = 280/25.4)
    trellis.par.set(kullas())
    remove.shading()
bwplot(Media ~ Growth | Agar + Luminosity + Awheto, data = eightW.df, layout = c(2, 4),
       strip =  stripC(fax =  3, fat = 0.2), between = list(x = 0, y = c(0, 0.5)))
bwplot(Media ~ Growth | Agar + Awheto + Luminosity, data = eightW.df, layout = c(2, 4),
       strip =  stripC(fax =  3, fat = 0.2), between = list(x = 0, y = c(0, 0.5)))
bwplot(Media ~ Growth | Awheto + Agar + Luminosity, data = eightW.df, layout = c(2, 4),
       strip =  stripC(fax =  3, fat = 0.2), between = list(x = 0, y = c(0, 0.5)))

bwplot(Media ~ Growth | Agar + Luminosity + Awheto, data = eightW.df,
       subset = Growth > 0, layout = c(2, 4),
       strip =  stripC(fax =  3, fat = 0.2), between = list(x = 0, y = c(0, 0.5)))
bwplot(Media ~ Growth | Agar + Awheto + Luminosity, data = eightW.df,
       subset = Growth > 0, layout = c(2, 4),
       strip =  stripC(fax =  3, fat = 0.2), between = list(x = 0, y = c(0, 0.5)))
bwplot(Media ~ Growth | Awheto + Agar + Luminosity, data = eightW.df,
       subset = Growth > 0, layout = c(2, 4),
       strip =  stripC(fax =  3, fat = 0.2), between = list(x = 0, y = c(0, 0.5)))
  dev.off()


## Modify above code to add in counts for each boxplot
looksee() # >> AwhetoGrowthA.pdf

### 10/12/15 Version 2 (averaged over 4 measures)
eightWv2.df <- read.delim("AgarType2.txt")
check.fact(eightWv2.df)
## with(eightWv2.df, table(Growth))
eightWv2.df <- within(eightWv2.df, Growth <- fact2num(Growth))
eightWv2.df <- within(eightWv2.df, Treatment <- as.character(Treatment))
eightWv2.df <- within(eightWv2.df, agar <- as.character(agar))
eightWv2.df <- within(eightWv2.df, agar <- gsub('[[:space:]]', '', agar))
eightWv2.df <- within(eightWv2.df, Treatment <- gsub('[[:space:]]', '', Treatment))
eightWv2.df <- within(eightWv2.df, Treatment <- gsub('\\(', '', Treatment))
eightWv2.df <- within(eightWv2.df, Treatment <- gsub('\\+$', '', Treatment))
eightWv2.df <- within(eightWv2.df, Treatment <- gsub('\\+', ' + ', Treatment))

eightWv2.df <- within(eightWv2.df, Agar <- factor(agar))
eightWv2.df <- within(eightWv2.df, Awheto <- factor(paste("Apheto", Awheto)))
eightWv2.df <- within(eightWv2.df, Media <- factor(Treatment))
media.order2 <- levels(eightWv2.df$Media)[c(2:5, 1, 8, 10, 9, 6, 11, 7, 12)]
eightWv2.df$Media <- factor(eightWv2.df$Media, levels = media.order2)

looksee2() # >> AwhetoGrowthA2.pdf






##############################################
##
## Github repository (xterm command line)
##
##########################################

git config --global user.name "Tuxkid"
git config --global core.editor "emacs"
source ~/.bash_profile # to set the proxy server in this directory
git init
git add .
git commit
git remote add origin https://github.com/Tuxkid/Apheto.git 
git push -u origin master
