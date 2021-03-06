looksee <- function()
{
### Purpose:- Firstlook at awheto and agar effects
### ----------------------------------------------------------------------
### Modified from:- 
### ----------------------------------------------------------------------
### Arguments:- 
### ----------------------------------------------------------------------
### Author:-   Patrick Connolly, Date:-  9 Nov 2015, 09:11
### ----------------------------------------------------------------------
### Revisions:-

require(grid)


pdf(file = "AwhetoGrowthA.pdf", width = 188/25.4, height = 280/25.4)
    trellis.par.set(kullas())
    remove.shading()
pik1 <- bwplot(Media ~ Growth | Agar + Luminosity + Awheto,
               data = eightW.df, layout = c(2, 4), panel = function(x, y, subscripts){
         panel.df <- eightW.df[subscripts, ]
         panel.count <- table(y)
         ltext(26.5, seq(panel.count), panel.count, col = "orange3", cex = 0.5, adj = 1)
         panel.bwplot(x,  y)
       },
       strip =  stripC(fax =  3, fat = 0.2), between = list(x = 0, y = c(0, 0.5)))
pik2 <- bwplot(Media ~ Growth | Agar + Awheto + Luminosity,
               data = eightW.df, layout = c(2, 4), panel = function(x, y, subscripts){
         panel.df <- eightW.df[subscripts, ]
         panel.count <- table(y)
         ltext(26.5, seq(panel.count), panel.count, col = "orange3", cex = 0.5, adj = 1)
         panel.bwplot(x,  y)
       },
       strip =  stripC(fax =  3, fat = 0.2), between = list(x = 0, y = c(0, 0.5)))
pik3 <- bwplot(Media ~ Growth | Awheto + Agar + Luminosity,
               data = eightW.df, layout = c(2, 4), panel = function(x, y, subscripts){
         panel.df <- eightW.df[subscripts, ]
         panel.count <- table(y)
         ltext(26.5, seq(panel.count), panel.count, col = "orange3", cex = 0.5, adj = 1)
         panel.bwplot(x,  y)
       },
       strip =  stripC(fax =  3, fat = 0.2), between = list(x = 0, y = c(0, 0.5)))

## omitting zeros
pik4 <- bwplot(Media ~ Growth | Agar + Luminosity + Awheto, data = eightW.df,
       subset = Growth > 0, layout = c(2, 4), panel = function(x, y, subscripts){
         panel.df <- eightW.df[subscripts, ]
         panel.count <- table(y)
         ltext(26.5, seq(panel.count), panel.count, col = "orange3", cex = 0.5, adj = 1)
         panel.bwplot(x,  y)
       },
       strip =  stripC(fax =  3, fat = 0.2), between = list(x = 0, y = c(0, 0.5)))
pik5 <- bwplot(Media ~ Growth | Agar + Awheto + Luminosity, data = eightW.df,
       subset = Growth > 0, layout = c(2, 4), panel = function(x, y, subscripts){
         panel.df <- eightW.df[subscripts, ]
         panel.count <- table(y)
         ltext(26.5, seq(panel.count), panel.count, col = "orange3", cex = 0.5, adj = 1)
         panel.bwplot(x,  y)
       },
       strip =  stripC(fax =  3, fat = 0.2), between = list(x = 0, y = c(0, 0.5)))
pik6 <- bwplot(Media ~ Growth | Awheto + Agar + Luminosity, data = eightW.df,
       subset = Growth > 0, layout = c(2, 4), panel = function(x, y, subscripts){
         panel.df <- eightW.df[subscripts, ]
         panel.count <- table(y)
         ltext(26.5, seq(panel.count), panel.count, col = "orange3", cex = 0.5, adj = 1)
         panel.bwplot(x,  y)
       },
       strip =  stripC(fax =  3, fat = 0.2), between = list(x = 0, y = c(0, 0.5)))
print(pik1)
print(pik2)
print(pik3)
print(pik4)
print(pik5)
print(pik6)




dev.off()


  
}
