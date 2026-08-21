suppressPackageStartupMessages(library(tidyverse))

"# -------------------------------------------------------------------------
# DO NOT EDIT! THIS FILE IS CREATED AUTOMATICALLY!
# -------------------------------------------------------------------------
" |> 
  write_lines("bbl_nouns_lexicon.lexd")

read_csv("data/kk_merged.csv",
         show_col_types = FALSE, 
         progress = FALSE) |> 
  filter(!is.na(lemma_la),
         !is.na(gender_la),
         !is.na(morphology_la)) |> 
  select(lemma_la, gender_la, morphology_la, en, ka, ru) |> 
  separate(morphology_la, into = c("pl", "gen.sg"), sep = "; ") |> 
  mutate(lemma_la = str_remove_all(lemma_la, "\\d"),
         lemma_la = str_remove_all(lemma_la, "[\\[\\]]"),
         gender_la = toupper(gender_la),
         gender_la = str_remove_all(gender_la, "\\s"),
         pl = str_squish(pl),
         gen.sg = str_squish(gen.sg),
         gen.sg = if_else(is.na(gen.sg) & str_detect(pl, "ⁿ$"),
                          pl,
                          gen.sg),
         pl = if_else(pl == gen.sg & str_detect(pl, "ⁿ$"),
                      NA,
                      pl),
         pl = str_remove_all(pl, "[\\[\\]]"),
         gen.sg = str_remove_all(gen.sg, "[\\[\\]]"),
         pl = str_split(pl, "/")) |> 
  unnest_longer(pl) |> 
  mutate(gen.sg = str_split(gen.sg, "/")) |> 
  unnest_longer(gen.sg) |> 
  mutate(gen.sg = str_split(gen.sg, ", ")) |> 
  unnest_longer(gen.sg) |> 
  mutate(lemma_la = str_split(lemma_la, ", ")) |> 
  unnest_longer(lemma_la) |> 
  mutate(declension_class = case_when(str_detect(gen.sg, "ujⁿ$") & str_detect(lemma_la, "ŏ$") ~ "[o_stem]",
                                      str_detect(gen.sg, "ujⁿ$") & str_detect(lemma_la, "ŭ$") ~ "[u_stem]",
                                      TRUE ~ "")) |> 
  relocate("gen.sg", .before = "pl") |> 
  relocate("declension_class", .before = "gen.sg") ->
  result

result |> 
  mutate(transducer_lexicon_group = "Nouns_Abs",
         transducer_entry = str_c(lemma_la, "<N><", gender_la, ">:", lemma_la),
         transducer_entry = str_pad(transducer_entry, side = "right", width = 50),
         transducer_entry = str_c(transducer_entry, "# ", en, "; ", ka, "; ", ru)) |> 
  select(transducer_entry, transducer_lexicon_group) |> 
  filter(!is.na(transducer_entry)) |> 
  mutate(transducer_lexicon_group = str_c("LEXICON ", transducer_lexicon_group)) |> 
  group_by(transducer_lexicon_group) |> 
  summarise(transducer_entry = str_c(transducer_entry, collapse = "\n")) |> 
  ungroup() |> 
  mutate(result = str_c(transducer_lexicon_group, "\n\n", transducer_entry, "\n\n")) |> 
  select(result) |> 
  na.omit() |> 
  pull(result) |> 
  write_lines("bbl_nouns_lexicon.lexd", append = TRUE)

result |> 
  na.omit() |> 
  mutate(gen.sg_m = str_remove(gen.sg, "(uj)?ⁿ"),
         transducer_lexicon_group = "Nouns_Obl",
         transducer_entry = str_c(lemma_la, "<N><", gender_la, "><obl>:", gen.sg_m, declension_class),
         transducer_entry = str_pad(transducer_entry, side = "right", width = 50),
         transducer_entry = str_c(transducer_entry, "# ", en, "; ", ka, "; ", ru)) |> 
  select(transducer_entry, transducer_lexicon_group) |> 
  mutate(transducer_lexicon_group = str_c("LEXICON ", transducer_lexicon_group)) |> 
  group_by(transducer_lexicon_group) |> 
  summarise(transducer_entry = str_c(transducer_entry, collapse = "\n")) |> 
  ungroup() |> 
  mutate(result = str_c(transducer_lexicon_group, "\n\n", transducer_entry, "\n\n")) |> 
  select(result) |> 
  na.omit() |> 
  pull(result) |> 
  write_lines("bbl_nouns_lexicon.lexd", append = TRUE)



