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