#Creates lowess curve lines on a ggplot. I eventually want this to be a ggproto object so that it's actually
#Compatible with ggplot as a geometry, but that will come later.
geom_lowess<- function(df,x,y){
  x <- enquo(x)
  y <- enquo(y)
  mutate(df,
         lowx = lowess(!!x,!!y)[[1]],
         lowy = lowess(!!x,!!y)[[2]])%>%
    ggplot()+
    geom_point(aes(!!x,!!y))+
    geom_line(aes(lowx,lowy))+
    geom_line(aes(y=0,x=!!x),linetype= 2,color = "RED")+
    theme_bw()+
    labs(title = "Residuals vs Fitted", x = "Fitted values
         lm(Price~Mileage)")
}
