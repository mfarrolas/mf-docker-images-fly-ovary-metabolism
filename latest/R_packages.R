# Install BiocManager if not already installed
if (!requireNamespace("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager", repos = "http://cran.us.r-project.org")
}

# CRAN Packages
cran_packages <- c(
    "devtools", "dplyr", "ggplot2", "igraph", "pacmap", "sctransform", 
    "data.table", "gridExtra", "ggrepel", "irlba", "log4r", "mixhvg"
)

for (pkg in cran_packages) {
    tryCatch({
        if (!requireNamespace(pkg, quietly = TRUE)) {
            install.packages(pkg, repos = "http://cran.us.r-project.org", dependencies = TRUE)
        }
    }, error = function(e) {
        cat("Error installing CRAN package:", pkg, "\n", e$message, "\n")
    })
}

# Bioconductor Packages
bioc_packages <- c(
    "SingleCellExperiment", "DropletUtils", "scater", "scran", "scuttle",
    "scDblFinder", "HDF5Array", "rhdf5", "rtracklayer", "zellkonverter", "scry", 
    "SoupX"
)

tryCatch({
    BiocManager::install(bioc_packages, ask = FALSE, dependencies = TRUE)
}, error = function(e) {
    cat("Error installing Bioconductor packages:", e$message, "\n")
})

if (!requireNamespace("devtools", quietly = TRUE)) {
    tryCatch({
        install.packages("devtools", repos = "http://cran.us.r-project.org")
    }, error = function(e) {
        cat("Error installing devtools:", e$message, "\n")
    })
}

# GitHub Packages
github_packages <- c(
    "satijalab/seurat",
    "cole-trapnell-lab/monocle3",
    "compbiomed/singleCellTK",
    "theislab/scIB"
)
for (repo in github_packages) {
    tryCatch({
        devtools::install_github(repo)
    }, error = function(e) {
        cat("Error installing GitHub package:", repo, "\n", e$message, "\n")
    })
}

# Additional package
tryCatch({
    remotes::install_github('theislab/kBET')
}, error = function(e) {
    cat("Error installing theislab/kBET:", e$message, "\n")
})

cat("\nValidating installations...\n")
installed <- installed.packages()[, "Package"]
missing_cran <- setdiff(cran_packages, installed)
missing_bioc <- setdiff(bioc_packages, installed)
cat("Missing CRAN packages:", paste(missing_cran, collapse = ", "), "\n")
cat("Missing Bioconductor packages:", paste(missing_bioc, collapse = ", "), "\n")