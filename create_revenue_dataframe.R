##### Form Dataframes from Tennessee Department of Revenue Retail Sales Data 
##### Uses  data gathered from "download_revenue_data.R" script.

library(tidyverse)

files <- list.files("Data")
files <- file.path("Data", files)
sheet <- c(month.name, "Table")
input <- expand_grid(files, sheet)

read_revenue_data <- function(files, sheet) {
  x <- readxl::read_excel(files, 
                          sheet = sheet,
                          skip = 3,
                          .name_repair = "universal") %>%
    setNames(tolower(names(.)))  %>%
    rename(build_mat = starts_with("build"),
           gen_merch = starts_with("general"),
           food = starts_with("food"),
           car_boat_aircraft = starts_with("auto"),
           serv_stat = starts_with("service"),
           apparel = starts_with("apparel"),
           furniture = starts_with("furniture"),
           eat_drink = starts_with("eating"),
           other = starts_with("other")) |>
    mutate(year = as.numeric(str_extract(files, "\\d{4}"))) %>%
    mutate(month = sheet) %>%
    mutate(month_no = as.numeric(match(month, month.name))) %>%
    mutate(date = ymd(paste0(year,"-", month, "-01")))
}

rd <- purrr::map2(input$files, input$sheet,
                       purrr::safely(read_revenue_data)) 

rev_dat_annual <- rd %>%
  lapply(function(x) x$result) %>%
  bind_rows() %>%
  filter(month == "Table") |>
  select(-c(month, month_no, date)) %>%
  pivot_longer(cols = total:other, 
               names_to = "type",
               values_to = "sales")

rev_dat_monthly <- rd %>%
  lapply(function(x) x$result) %>%
  bind_rows() %>% 
  filter(!month == "Table") %>%
  select(-c(year, month, month_no)) %>%
  pivot_longer(cols = total:other, 
               names_to = "type",
               values_to = "sales")

error <- lapply(rd, function(x) x$error$message) %>%
  lapply(function(ll) if (is.null(ll)) "Has Data" else ll) |>
  unlist() %>%
  as.data.frame() %>%
  setNames("status") %>%
  dplyr::bind_cols(input)

max_date <- max(rev_dat_monthly$date, na.rm = TRUE)
print(paste("The most recent data is", max_date))

###### Finished data frames

rev_dat_ann_county <- rev_dat_annual %>%
  filter(!county == "zTotal")

rev_dat_ann_state <- rev_dat_annual %>%
  filter(county == "zTotal") %>%
  mutate(county = "Statewide")

rev_dat_mon_county <- rev_dat_monthly %>%
  filter(!county == "zTotal")

rev_dat_mon_state <- rev_dat_monthly %>%
  filter(county == "zTotal") %>%
  mutate(county = "Statewide")




