#load pROC package to get the ROC Curves functions
library("pROC", lib.loc="C:/myRLib")
library(ineq)
#Get dataset
eq_scores<-read.csv("feb_accs.csv", header= TRUE, sep="|")
#subset the data to get only individuals and exclude businesses
eq_scores1<-subset(eq_scores, IS.Business=="Individual")
#Summarize the data
summary(eq_scores1$score_feb)
summary(eq_scores1$Status)
#Get a box plot to observe the median and dispersion
boxplot(score_feb ~ Status, data = eq_scores1, main="Score Ranking", 
        xlab="Status", ylab="")
#Mann-Whitney-Wilcoxon Test to compare the median scores of both populations
wilcox.test(score_feb ~ Status, data = eq_scores1)
# Smooth ROC Curve compute Area Uder the Curve (AUC), CI (confidence interval)
roc(eq_scores1$Status, eq_scores1$score_feb, ci=TRUE)
#graph
roc1<-roc(eq_scores1$Status, eq_scores1$score_feb, ci=TRUE)
plot(roc1)
