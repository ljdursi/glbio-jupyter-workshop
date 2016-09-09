# Jupyter Notebooks for Performing and Sharing Bioinformatics Analyses

Date: Monday, Sept 12, 2016
Time:  2:00pm-3:30pm

In this workshop, we will learn:
  * The basics of Jupyter notebooks - what they are and how they work
  * How to install and run Jupyter notebooks on their laptop, in R and Python
  * How to perform interactive analyses in a web browser using Jupyter
  * Using markdown and latex to make attractive notebooks 
  * How to "Port" an R bioinformatics workflow from some scripts into a Jupyter notebook
  * How to share a Jupyter notebook online, using three different approaches
      * [SageMathCloud](https://cloud.sagemath.com)
      * [GitHub](https://www.github/com) and git
      * [mybinder.org](http://mybinder.org)

Participants will need to have some familiarity with R (or python), and be comfortable entering commands on
the command line, but need not be an expert at either.

# Preparing for the workshop

We only have two hours together, so there won't be any time during the workshop itself to install the software!
Participants are expected to have followed the instructions below to install the software and set up accounts
on the various services.  If you have problems with this before the workshop, [email the instructor](mailto:jonathan@dursi.ca)
for help.  We hope to be set up in the room an hour before hand for any last-minute issues.  Participants who
don't have the necessary software installed will have to find a partner who has and follow along with them.

Installation instructions follow below:

## GitHub account

If you don't already have one, sign up for a free GitHub account at [https://github.com/](https://github.com/).

## SageMathCloud Account

Sign up for a free SageMathCloud account at [https://cloud.sagemath.com/](https://cloud.sagemath.com/).
(You can just set one up by signing in with your GitHub account)

## Install software and Data Files

Jump to installation instructions for: [Windows](#installation-on-windows), [Mac OS X or Linux](#installation-on-mac-or-linux)

## Installation On Windows

### Get data files

Download and unpack either the .tgz file or .zip file, whichever seems most familar, at:

* [https://github.com/ljdursi/glbio-jupyter-workshop/releases](https://github.com/ljdursi/glbio-jupyter-workshop/releases)

### Install Anacaonda
If you don't have Anaconda already installed, 

* Open [http://continuum.io/downloads](http://continuum.io/downloads) with your web browser.
* Download the Python 3 installer for Windows.
* Install Python 3 using all of the defaults for installation except make sure to check Make Anaconda the default Python.

If you already have Anaconda installed, make sure your Python version is 3.x not 2.x:
* At the command line, type `python --version`

If it is a 3.x version of python, all's good!  If it's a 2.x version of python, 
type the following commands at the command line:

* `conda create --name notebook_tutorial python=3.5 anaconda`
* `activate notebook_tutorial`

### Install the necessary conda packages

Once python3 anaconda is installed, we'll need to install some necessary conda packages.
At the command line, run the following commands to add packages we'll need for the tutorial:

* `conda config --add channels r`
* `conda install r-base=3.2.2`
* `conda install r-essentials=1.1`

Now we'll have to start R and install some BioConductor packages:  from the command line, run `R` and enter:

* `source("https://bioconductor.org/biocLite.R")`
* `biocLite()`
* `biocLite(c('DESeq2'))`
* `install.packages(c('rzmq','repr','IRkernel','IRdisplay','Cairo'), repos = c('http://irkernel.github.io/', 'http://cran.utstat.utoronto.ca/'))`

Now, make sure Jupyter Notebook works by either running "Jupyter Notebook" from the Start menu, or from a command line typing `jupyter notebook`.  
You should either see your browser load a page or, if not, opening the URL `http://localhost:8888/` should show
a webpage with a Jupyter logo.  If this doesn't happen, [email the instructor](mailto:jonathan@dursi.ca).
Otherwise, feel free to start playing around by starting a notebook by selecting Run>Notebooks>R (or Run>Notebooks>Python3)
and entering some R (or Python) commands in the cell and pressing shift-return to run
the commands (or selecting Cell>Run All).

## Installation On Mac Or Linux

If you don't already have anaconda installed, the following script should install everything. 
After the tutorial, deleting the `~/anaconda` directory will remove all installed software:

```
#!/bin/bash
# get the example notebooks + Dockerfile
if [[ ! -d glbio-jupyter-workshop ]]
then
    wget https://github.com/ljdursi/glbio-jupyter-workshop/archive/1.2.0.tar.gz
    tar -xzvf 1.2.0.tar.gz
    rm 1.2.0.tar.gz
fi

if [ "$(uname)" == "Darwin" ]
then
    arch="MacOSX"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    arch="Linux"
else
    >&2 echo "No idea what system this is"
    exit -1
fi

# get Anaconda
if [[ ! -d ~/anaconda3 ]]
then
    wget https://repo.continuum.io/archive/Anaconda3-4.1.1-${arch}-x86_64.sh
    bash Anaconda3-4.1.1-Linux-x86_64.sh -b
    rm Anaconda3-4.1.1-Linux-x86_64.sh
    ~/anaconda3/bin/conda update -y --all
fi

# Get conda channels for R, bioconductor
if [[ ! -f anaconda3/bin/R ]]
then
    ~/anaconda3/bin/conda config --add channels r
    ~/anaconda3/bin/conda install -y r-base=3.2.2
    ~/anaconda3/bin/conda install -y r-essentials=1.1
    ~/anaconda3/bin/conda config --add channels bioconda
    ~/anaconda3/bin/conda install -y bioconductor-deseq2
fi
~/anaconda3/bin/jupyter notebook
```

When this is done, jupyter notebook should be started; to make sure the R kernel and plotting works, try the following:

* In the upper right hand side of the web page, select New>(Notebooks) R
* Then enter the following lines into the first cell of the notebook:
```
time <- seq(from = 0, to=4*pi, length.out = 100)
intensity <- exp(sin(sin(time)))
plot(time, intensity)
```
and select Cell>Run Cells.  You should get a nice plot, in which case you're done; otherwise, contact me
(jonathan@dursi.ca).  


Otherwise you can do the steps manually:

### Get data files

Download the most recent release of these files from:

* [https://github.com/ljdursi/glbio-jupyter-workshop/releases](https://github.com/ljdursi/glbio-jupyter-workshop/releases)

### Install Anacaonda
If you don't have Anaconda already installed, 

* Open [http://continuum.io/downloads](http://continuum.io/downloads) with your web browser.
* Download the Python 3 installer for Mac OS X.
* Install Python 3 using all of the defaults for installation.

If you already have Anaconda installed, make sure your Python version is 3.x not 2.x:
* At the command line, type `python --version`

If it is a 3.x version of python, all's good!  If it's a 2.x version of python, 
type the following commands at the command line:

```
conda create --name notebook_tutorial python=3.5 anaconda
source activate notebook_tutorial
```

### Install the necessary conda packages

Once python3 anaconda is installed, we'll need to install some necessary conda packages.
At the command line, run the following commands to add packages we'll need for the tutorial.
Note that the versions for R matter, as the most recent version breaks plotting in 
notebooks:

```
conda config --add channels r
conda install r-base=3.2.2
conda install r-essentials=1.1
conda config --add channels bioconda
conda install bioconductor-deseq
```

Now, after making sure the anaconda installation is in your path by re-sourcing .bashrc or starting
a new terminal, you should make sure Jupyter Notebook is up and running by, from the command line, running 
`jupyter notebook`.  

You should either see your browser load a page or, if not, opening the URL `http://localhost:8888/` should show
a webpage with a Jupyter logo.  If this doesn't happen, [email the instructor](mailto:jonathan@dursi.ca).
Otherwise, feel free to start playing around by starting a notebook by selecting Run>Notebooks>R (or Run>Notebooks>Python3)
and entering some R (or Python) commands in the cell and pressing shift-return to run
the commands (or selecting Cell>Run All).

To make sure plotting works, enter this into a cell
```
time <- seq(from = 0, to=4*pi, length.out = 100)
intensity <- exp(sin(sin(time)))
plot(time, intensity)
```
and select Cell>Run Cells.  You should get a nice plot, in which case you're done; otherwise, contact me
(jonathan@dursi.ca).  
