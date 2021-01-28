#Plot SPR data. 2 conditions (match and mismatch)

ObjPlot_df <- SPR-anna %>%
  group_by(region, condition) %>% 
  summarise(meanrt = mean(rt, na.rm=T), se = sd(rt)/sqrt(n()))

objplot = 
  
  ggplot(ObjPlot_df, aes(x=region, y=meanrt, group=condition, linetype=factor(condition, labels = c("Match", "Mismatch")))) + 
  scale_linetype_manual(values = c("solid", "dashed")) +
  geom_errorbar(aes(ymin=meanrt-se, ymax=meanrt+se), width=.1, linetype=1) +
  geom_line() +
  geom_point() + labs(linetype = "Condition") + theme_minimal() +
  scale_x_continuous(breaks = seq(1,16,1)) +
  labs(title = "Object Conditions", x = "Regions", y = "RT")

objplot