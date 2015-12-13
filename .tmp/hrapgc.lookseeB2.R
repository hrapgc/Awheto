lookseeB2 <- function(xxx = eightWv2.df)
{
### Purpose:- 
### ----------------------------------------------------------------------
### Modified from:- looksee2
### ----------------------------------------------------------------------
### Arguments:- 
### ----------------------------------------------------------------------
### Author:-   Patrick Connolly, Date:- 11 Dec 2015, 15:57
### ----------------------------------------------------------------------
### Revisions:- 

require(grid)

xxx <- xxx[!is.na(xxx$Growth),]

## Fix duplicate names
## allmedia <- as.character(xxx$Media)
## allmedia[allmedia == "Soil + Litter + Roots"] <- "Roots + Soil + Litter"

levels(xxx$Media[xxx$Media ==  "Soil + Litter + Roots"] <- "Roots + Soil + Litter")

pdf(file = "AwhetoGrowthB2.pdf", width = 188/25.4, height = 280/25.4)
    trellis.par.set(kullas())
    remove.shading()

superpose.symbol <- Rows(trellis.par.get("superpose.symbol"), c(1:2))
use.colours <- superpose.symbol$col

pik1 <- dotplot(Media ~ Growth | Agar + Luminosity, groups = Awheto,
                data = xxx, strip =  stripC(fax =  2, fat = 0.2),
                space = "top",
                key = list(points = superpose.symbol,
                  text = list(levels(xxx$Awheto), col = "black"),
                  col = use.colours, space = "right",
                  columns = 1, cex = .8, 
                  border = "grey80", padding.text = 2))

pik1a <- dotplot(Media ~ Growth | Agar + Luminosity, groups = Awheto,
                data = xxx, subset = Growth > 0, strip =  stripC(fax =  2, fat = 0.2),
                space = "top",
                key = list(points = superpose.symbol,
                  text = list(levels(xxx$Awheto), col = "black"),
                  col = use.colours, space = "right",
                  columns = 1, cex = .8, 
                  border = "grey80", padding.text = 2))

pik2 <- dotplot(Media ~ Growth | Agar + Awheto, groups = Luminosity,
                data = xxx, strip =  stripC(fax =  2, fat = 0.2),
                space = "top",
                key = list(points = superpose.symbol,
                  text = list(levels(xxx$Luminosity), col = "black"),
                  col = use.colours, space = "right",
                  columns = 1, cex = .8, 
                  border = "grey80", padding.text = 2))

pik2a <- dotplot(Media ~ Growth | Agar + Awheto, groups = Luminosity,
                data = xxx, subset = Growth > 0, strip =  stripC(fax =  2, fat = 0.2),
                space = "top",
                key = list(points = superpose.symbol,
                  text = list(levels(xxx$Luminosity), col = "black"),
                  col = use.colours, space = "right",
                  columns = 1, cex = .8, 
                  border = "grey80", padding.text = 2))

pik3 <- dotplot(Media ~ Growth | Awheto + Luminosity, groups = Agar,
                data = xxx, strip =  stripC(fax =  2, fat = 0.2),
                space = "top",
                key = list(points = superpose.symbol,
                  text = list(levels(xxx$Agar), col = "black"),
                  col = use.colours, space = "right",
                  columns = 1, cex = .8, 
                  border = "grey80", padding.text = 2))

pik3a <- dotplot(Media ~ Growth | Awheto + Luminosity, groups = Agar,
                data = xxx, subset = Growth > 0, strip =  stripC(fax =  2, fat = 0.2),
                space = "top",
                key = list(points = superpose.symbol,
                  text = list(levels(xxx$Agar), col = "black"),
                  col = use.colours, space = "right",
                  columns = 1, cex = .8, 
                  border = "grey80", padding.text = 2))


print(pik1, split = c(1, 2, 1, 2), more = TRUE)
print(pik1a, split = c(1, 1, 1, 2), more = FALSE)
print(pik2, split = c(1, 2, 1, 2), more = TRUE)
print(pik2a, split = c(1, 1, 1, 2), more = FALSE)
print(pik3, split = c(1, 2, 1, 2), more = TRUE)
print(pik3a, split = c(1, 1, 1, 2), more = FALSE)
                           

dev.off()

}
