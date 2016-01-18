fileIn      = 'content/docs/cv.md'
fileHtmlOut = 'output/pages/cv.html'
filePdfOut  = 'output/docs/cv.pdf'
usrID       = c('Douglas Kelley' = 'AJKyfI4AAAAJ')


## Open and Initailise
doc   = readLines(fileIn)


## Citation info
id = "<<Citation info>>"
info = MakeUserProfile(usrID, 'unformatted')
doc[grepl(id, doc)] = info


## <<Publication info>>
id = "<<Publication info>>"

header = ''

cnameExtra  = '<hr> &nbsp;'
cnameFormat = c('&nbsp; <h3 class = "publication">', '</h3> &nbsp;')
pubSep      = '<hr>'
titleFormat = c('<h3 class = "publication">', '</h3>')
citeFormat  = c('', '')
yearFormat  = c('', '')
textFormat  = c('', '')

footer = ''

outputFile = NULL

info = MakePublicationDocument.list(usrID, NULL, outputFile = NULL)


doc[grepl(id, doc)] = info


cat(doc, file = fileOut, sep = "\n")
command = paste('./../markdown-resume/bin/md2resume html', fileHtmlOut, 'docs')
command = paste('./../markdown-resume/bin/md2resume pdf', filePdfOut, 'docs')

system(command)
