# ============================================================================
# Category-wise bar chart of Mariana Trench depth observations by tectonic
# plate (R, ggplot2). This produced Figure 12 in the peer-reviewed article:
#   Lemenkova, P. (2019). Statistical Analysis of the Mariana Trench
#   Geomorphology Using R Programming Language.
#   Geodesy and Cartography, 45(2), 57-84.
#   DOI: https://doi.org/10.3846/gac.2019.3785
#   figshare: https://doi.org/10.6084/m9.figshare.9762860
#   HAL: https://hal.science/hal-02277500  Zenodo: https://zenodo.org/record/3385005
# Author: Polina Lemenkova | ORCID: 0000-0002-5759-1089
# ============================================================================

# ЧАСТЬ-1. готовим датафрейм. 
	# шаг-1. вчитываем таблицу. делаем из нее исходный датафрейм
MDepths <- read.csv("DepthTect.csv", header=TRUE, sep = ",")
	# шаг-2. чистим датафрейм от NA значений
MDF <- na.omit(MDepths) 
row.has.na <- apply(MDF, 1, function(x){any(is.na(x))}) # проверяем, удалил ли все NA
sum(row.has.na) # суммируем все NA, должно получиться: [1] 0
head(MDF) # смотрим очищенный датафрейм. теперь с ним работаем. 
	# шаг-3. сшиваем колонки таблицы по трем параметрам, здесь: глубины, тектоника, углы. library(data.table). используем melt от library(data.table)
DFDT = melt(setDT(MDF), measure = patterns("^profile", "^tectonics", "^tg"), value.name = c("depths", "tectonics", "angles"))
DFDT


# ЧАСТЬ 2: рисуем столбчатую диаграмму по категориям, с цветами по категориям.
	# шаг-4. рисуем столбчатую диаграмму, добавляем легенду, оформляем.
g <- ggplot(DFDT, aes(variable)) + 
	geom_bar(aes(fill = tectonics), width = 0.5, na.rm = TRUE) +    
	theme(axis.text.x = element_text(angle=65, vjust=0.6)) +  	   
	xlab("Profiles, Nr.") +
	ylab("Observation Points") + 
	labs(title="马里亚纳海沟。剖面1-25。Mariana Trench, Profiles Nr.1-25.", 
	subtitle = "统计图表。地貌聚类分析, 条形图。Categorywise Bar Chart. \nDistribution of Observation Points across Tectonic Plates: \nMariana, Philippine, Pacific and Caroline",
	caption = "Statistics Processing and Graphs: R Programming. Data Source: QGIS") +
	scale_fill_brewer(palette = "RdBu") +
	theme(
		plot.margin = margin(5, 10, 20, 5),
		plot.title = element_text(margin = margin(t = 0, r = 20, b = 5, l = 0), family = "Kai", face = "bold", size = 12), # китайский шрифт "Кай"
		plot.subtitle = element_text(margin = margin(t = 0, r = 20, b = 4, l = 0), family = "Hei", face = "bold", size = 10), # китайский шрифт "Хэй"
		plot.caption = element_text(face = 2, size = 6),
		panel.background=ggplot2::element_rect(fill = "white"),
		axis.title.y = element_text(size = 8),
		axis.title.x = element_text(size = 8),
		legend.justification = "bottom", 
		legend.position = "bottom",
		legend.box.just = "right",
		legend.direction = "horizontal",
		legend.box = "horizontal",
		legend.box.background = element_rect(colour = "honeydew4",size=0.2),
		legend.background = element_rect(fill = "white"),
		legend.key.width = unit(1,"cm"),
		legend.key.height = unit(.5,"cm"),
		legend.spacing.x = unit(.2,"cm"),
		legend.spacing.y = unit(.1,"cm"),
		legend.text = element_text(colour="black", size=6, face=1),
		legend.title = element_text(colour="black", size=6, face=1))
g
