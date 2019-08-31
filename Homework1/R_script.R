library(data.table)
library(dplyr)
library(stringr)
mushroomData <- fread('https://archive.ics.uci.edu/ml/machine-learning-databases/mushroom/agaricus-lepiota.data', header = FALSE, stringsAsFactors = FALSE)

headers <- c('edib-or-poison',
             'cap-shape',
             'cap-surface',
             'cap-color',
             'bruises?',
             'odor',
             'gill-attachment',
             'gill-spacing',
             'gill-size',
             'gill-color',
             'stalk-shape',
             'stalk-root',
             'stalk-surface-above-ring',
             'stalk-surface-below-ring',
             'stalk-color-above-ring',
             'stalk-color-below-ring',
             'veil-type',
             'veil-color',
             'ring-number',
             'ring-type',
             'spore-print-color',
             'population',
             'habitat');

relabels <- rbind(c(1, "e", "edible"), 
                  c(1, "p", "poisonous"),
                  c(2, "a", "almond"),
                  c(2, "l", "anise"),
                  c(2, "c", "creosote"),
                  c(2, "y", "fishy"),
                  c(2, "f", "foul"),
                  c(2, "m", "musty"),
                  c(2, "n", "none"),
                  c(2, "p", "pungent"),
                  c(2, "s", "spicy"),
                  c(3, "n", "brown"),
                  c(3, "b", "buff"),
                  c(3, "c", "cinnamon"),
                  c(3, "g", "gray"),
                  c(3, "r", "green"),
                  c(3, "p", "pink"),
                  c(3, "u", "purple"),
                  c(3, "e", "red"),
                  c(3, "w", "white"),
                  c(3, "y", "yellow"),
                  c(4, "a", "abundant"),
                  c(4, "c", "clustered"),
                  c(4, "n", "numerous"),
                  c(4, "s", "scattered"),
                  c(4, "v", "several"),
                  c(4, "y", "solitary"),
                  c(5, "g", "grasses"),
                  c(5, "l", "leaves"),
                  c(5, "m", "meadows"),
                  c(5, "p", "paths"),
                  c(5, "u", "urban"),
                  c(5, "w", "waste"),
                  c(5, "d", "woods")
);

for(i in 1:length(headers)) {
  names(mushroomData)[i] <- headers[i]
}

mushroomData <- select(mushroomData, 'edib-or-poison', 'odor', 'cap-color', 'population', 'habitat')

for(i in 1:length(test[, 1])){
  if (test[i, 1] == "1"){
    mushroomData$`edib-or-poison` <- replace(mushroomData$`edib-or-poison` , mushroomData$`edib-or-poison` == test[i, 2], test[i, 3])
  }
  if (test[i, 1] == "2"){
    mushroomData$odor <- replace(mushroomData$odor , mushroomData$odor == test[i, 2], test[i, 3])
  }
  if (test[i, 1] == "3"){
    mushroomData$`cap-color` <- replace(mushroomData$`cap-color` , mushroomData$`cap-color` == test[i, 2], test[i, 3])
  }
  if (test[i, 1] == "4"){
    mushroomData$population <- replace(mushroomData$population , mushroomData$population == test[i, 2], test[i, 3])
  }
  if (test[i, 1] == "5"){
    mushroomData$habitat <- replace(mushroomData$habitat , mushroomData$habitat == test[i, 2], test[i, 3])
  }
}

table(mushroomData$`edib-or-poison`)
table(mushroomData$odor)
table(mushroomData$`cap-color`)
table(mushroomData$population)
table(mushroomData$habitat)










