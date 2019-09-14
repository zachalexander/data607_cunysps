library(stringr)


raw.data <-"555-1239Moe Szyslak(636) 555-0113Burns, C. Montgomery555-6542Rev. Timothy Lovejoy555 8904Ned Flanders636-555-3226Simpson, Homer5553642Dr. Julius Hibbert"

name <- unlist(str_extract_all(raw.data, "[[:alpha:]., ]{2,}"))
phone <- unlist(str_extract_all(raw.data, "\\(?(\\d{3})?\\)?(-| )?\\d{3}(-| )?\\d{4}"))

# 1

## The following steps put the names into first_name last_name order, but also remove second names and titles

# remove the letter indicating the second name ("Burns, C. Mongomery" to "Burns, Montgomery")
name_2 <- unlist(str_replace(name, " \\w{1}\\.", ""))

# for names with commas, locate and flip from last, first to first last
name_3 <- unlist(str_replace(name_2, "(\\w+),\\s(\\w+)", "\\2 \\1"))

# remove titles
just_first_last_name <- unlist(str_replace(name_3, "\\w{1,}\\. ", ""))


## The following steps put the names into first_name last_name order, and include second names and titles in proper order

# locate name with a second name and a comma separating last and first, flip the order to first and last ("Burns, C. Montgomery" to "C. Montgomery Burns")
name_5 <- unlist(str_replace(name, "(\\w+),(\\s(\\w).\\s\\w+)", "\\2 \\1"))

# take this same character and flip the first and second parts so the second name is in the middle ("C. Montgomery Burns" to "Montgomery C. Burns")
name_6 <- unlist(str_replace(name_5, "(\\s\\w.\\s)(\\w+)", "\\2\\1"))

# locate name with a comma separating last and first, flip the order to first and last ("Simpson, Homer" to "Homer Simpson")
name_7 <- unlist(str_replace(name_6, "(\\w+),\\s(\\w+)", "\\2 \\1"))

# remove extra spaces between names
first_last_name_extra <- unlist(str_replace(name_7, "\\s{2}", " "))

# print out final string manipulations

#original vector of names
name

# name vector with just first_name and last_name
just_first_last_name

# name vector with first_name and last_name, but also includes second name and titles
first_last_name_extra


# 2
has_title <- unlist(str_detect(name, "(\\w+).\\s\\w+\\s\\w+"))

#3
has_second_name <- unlist(str_detect(name, "\\w+,\\s\\w.\\s\\w+"))

final_table <- data.frame(name, just_first_last_name, first_last_name_extra, has_title, has_second_name)
final_table



