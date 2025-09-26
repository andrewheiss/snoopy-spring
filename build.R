# Manuscript and further reading
quarto::quarto_render(".", output_format = "all")

# README
quarto::quarto_render("README.qmd")

# Upload site
base_url <- "https://stats.andrewheiss.com/snoopy-spring/"

upload_out <- processx::run("./deploy.sh")

if (upload_out$status == 0) {
  cli::cli_alert_success(paste0("Website uploaded to ", base_url))
} else {
  cli::cli_alert_danger(paste0("Something went wrong! ", upload_out$stderr))
}
