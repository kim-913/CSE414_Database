rm(list = ls())
data=InterestRateData
new=merge(merge(merge(merge(data$DGS1MO,data$DGS3MO),data$DGS6MO),data$DGS1),data$DGS2)
new=merge(merge(merge(new,data$DGS3),data$DGS5),data$DGS7)
new=merge(merge(merge(new,data$DGS10),data$DGS20),data$DGS30)
new$date <- as.Date(new$date)
new$Month <- month(new$date)
new$Year <- year(new$date)
avg<-aggregate(. ~ Month + Year , new , mean)
d<-data.frame(cbind(avg[,1:2],avg[,4:14]))
d$Date <- zoo::as.yearmon(paste(d$Year, d$Month), "%Y %m")
result<-d[3:14]
saveRDS(result, "d")