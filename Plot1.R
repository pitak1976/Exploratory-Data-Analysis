

SCC <- data.table::as.data.table(x = readRDS(file = "C:/Users/CPF/Desktop/exdata_data_NEI_data/Source_Classification_Code.rds"))
NEI <- data.table::as.data.table(x = readRDS(file = "C:/Users/CPF/Desktop/exdata_data_NEI_data/summarySCC_PM25.rds"))




# Prevents histogram from printing in scientific notation
NEI[, Emissions := lapply(.SD, as.numeric), .SDcols = c("Emissions")]

totalNEI <- NEI[, lapply(.SD, sum, na.rm = TRUE), .SDcols = c("Emissions"), by = year]

png(filename='Plot1.png')

barplot(totalNEI[, Emissions]
        , names = totalNEI[, year]
        , xlab = "Years", ylab = "Emissions"
        , main = "Emissions over the Years")

dev.off()