# Quick guide to update website

# check the link for the website tutorial:
https://hollina.github.io/make-a-job-market-website.html

this will help to know where to look when editing 

# to edit:
1. Type library(blogdown) in RStudio’s console.
2. blogdown::install_hugo(force = TRUE)
3. blogdown::serve_site() in the console

# to publish 
1. blogdown::hugo_build()
2. delete 'docs' folder
3. rename 'public' as 'docs'

# to shut down the server 
blogdown::stop_server()


# to stag files open Git -> more -> shell and type
git add -A

then commit and push files. Finally, refresh github.