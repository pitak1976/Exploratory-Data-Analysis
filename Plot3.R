SCC <- data.table::as.data.table(x = readRDS(file = "C:/Users/CPF/Desktop/exdata_data_NEI_data/Source_Classification_Code.rds"))
NEI <- data.table::as.data.table(x = readRDS(file = "C:/Users/CPF/Desktop/exdata_data_NEI_data/summarySCC_PM25.rds"))


library(ggplot2)

# Subset NEI data by Baltimore
baltimoreNEI <- NEI[fips=="24510",]


png("plot3.png")

ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

dev.off()