Wage Predictor
========================================================
author: Igor Proshkin
date: 2/12/2016
[github.com/proshkin/DDPProject] (https://github.com/proshkin/DDPProject)



Wage date from ISLR package
========================================================

Packge ISLR contains Wage and other data for a group of 3000 workers in the Mid-Atlantic region.


```r
names(Wage)
```

```
 [1] "year"       "age"        "sex"        "maritl"     "race"      
 [6] "education"  "region"     "jobclass"   "health"     "health_ins"
[11] "logwage"    "wage"      
```

Prediction model
========================================================

We can try to build linear model to predict wages

```r
ww <- Wage[c( "wage", "age", "maritl", "race", "education", "jobclass", "health")]
wage.lm = lm(log(wage) ~ . ,  data=ww)
```

Predicting
=======================================================
Using the model we can predict the wage base on parameters

```r
df <- data.frame(age = 30, maritl = '2. Married',  race = '1. White', education = '5. Advanced Degree', jobclass = '2. Information', health = '1. <=Good' )
exp(predict(wage.lm, df, interval="predict"))
```

```
     fit      lwr      upr
1 133.24 74.95231 236.8559
```

Shiny application screen
=======================================================
![](./App.png)
