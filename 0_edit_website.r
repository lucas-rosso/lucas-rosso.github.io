# EDIT WEBSITE

# Edit
    library(blogdown)
    blogdown::install_hugo(force = TRUE)
    blogdown::serve_site()

# Publish
    blogdown::hugo_build(local=TRUE) 
    # 2. delete 'docs' folder
    # 3. rename 'public' as 'docs'

# To shut down the server 
    blogdown::stop_server()
