# Colored output
require(colorout)
setOutputColors256(normal = 15, verbose = FALSE)

test <- c("#178033", "#af01ef")
# Color scales for different numbers of levels
# one_color <- "#af01ef"
# one_fill <- "#cb3dff"
# two_color <- c("#1ca340", "#af01ef")
# two_fill <- c("#1dbf49", "#cb3dff")
# Color blind friendly:
ggcolors <- c("#56B4E9", "#D55E00", "#F0E442", "#0072B2", "#CC79A7", "#E69F00", "#009E73")

# options function te set some global options
options(
    # Disable completion from the language server (use Nvim-R instead)
    languageserver.server_capabilities =
        list(completionProvider = FALSE, completionItemResolve = FALSE),
    # ggplot colors (for aes(color = X, fill = X))
    ggplot2.discrete.colour= c(ggcolors),
    ggplot2.discrete.fill= c(ggcolors)
)
