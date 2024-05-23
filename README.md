```bash
# we must manually render because 
# `quarto preview` doesn't run the pre-render
quarto render && quarto preview

# NOTE: This project uses caching to speed up rendering.
#       --no-cache is needed if the data changes.
quarto render . --no-cache && quarto preview .

# deploy
quarto publish
```

Data goes through multiple cleaning steps, and `quarto render` may fail if these run in the wrong order.

1. `quarto render sites_qc.qmd --no-cache` : `Unified_WQ_Database...csv -- sites_qc --> df_cleaned_01.csv`
2. `Rscript R/generate_param_reports.r` creates `parameter_reports/*qmd`
3. `quarto render parameter_reports --no-cache` : `df_cleaned_01.csv -- parameter boundary filtering --> df_cleaned_02.csv`
4. `quarto render . --no-cache` : will run the above again and recreate the same csv files