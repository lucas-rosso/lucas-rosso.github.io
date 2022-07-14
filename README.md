# Quick guide to update website

### check the link for the website tutorial:
https://hollina.github.io/make-a-job-market-website.html

this will help to know where to look when editing 

# To edit:
1. Type library(blogdown) in RStudio’s console.
2. blogdown::install_hugo(force = TRUE)
3. blogdown::serve_site() in the console

# To publish 
1. blogdown::hugo_build()
2. delete 'docs' folder
3. rename 'public' as 'docs'

# To shut down the server 
blogdown::stop_server()


# To stage files open Git -> more -> shell and type
git add -A

then commit and push files. Finally, refresh github.

# Change website icon (aka favion)
- Save icon 512x512 pixel image as icon.ong in assets/media/ if it does not exist, create the folder.
# Where to find
- Website icon: `assets/media/icon.png`
- Basic website layout: `config/params.toml`
- Order drop-down menu: `config/menus.toml`
- cv (drop-down menu): Update `cv_ing.pdf` file in `config/menus.toml` (note that path to CV is not within `static`)
- cv (in icon at the rit of github logo) `static/files/cv_ing.pdf`
- Picture and information: `content/authors/admin/_index.md` and `content/authors/admin/avatar.png`.

### Sections:
- Teaching: `content/home/teaching.md`

### Posts:
- Useful commands using STATA
    - In-post figure: `content/post/commands_stata/featured.png`
    - content: `content/post/index.md`
