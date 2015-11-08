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
