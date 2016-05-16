install.packages(c('rzmq','repr','IRkernel','IRdisplay'),
                 repos = c('http://irkernel.github.io/',
                           'http://cran.utstat.utoronto.ca/'))

IRkernel::installspec()
