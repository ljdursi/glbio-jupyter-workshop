# Jupyter Notebooks for Performing and Sharing Bioinformatics Analyses

Date: Monday, May 16, 2016
Time:  10:30am-12:30pm
Location:  VC 101

In this workshop, we will learn:
  * The basics of Jupyter notebooks - what they are and how they work
  * How to install and run Jupyter notebooks on their laptop, in R and Python
  * How to perform interactive analyses in a web browser using Jupyter
  * Using markdown and latex to 
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
(You can just set one up by signing in with your newly-created GitHub account)

Jump to installation instructions for: [Windows](#installation-on-windows), [Mac OS X](#installation-on-mac), [Linux](#installation-on-linux)

## Installation On Windows

### Install Anacaonda
If you don't have Anaconda already installed, 

* Open [http://continuum.io/downloads](http://continuum.io/downloads) with your web browser.
* Download the Python 3 installer for Windows.
* Install Python 3 using all of the defaults for installation except make sure to check Make Anaconda the default Python.

If you already have Anaconda installed, make sure your Python version is 3.x not 2.x:
* At the command line, type `python --version`

If it is a 3.x version of python, all's good!  If it's a 2.x version of python, 
type the following commands at the command line:

* `conda create --name python3 python=3.5 anaconda`
* `activate python3`

### Install the necessary conda packages

Once python3 anaconda is installed, we'll need to install some necessary conda packages.
At the command line, run the following commands to add packages we'll need for the tutorial:

* `conda config --add channels r`
* `conda install r-essentials`
* `conda config --add channels bioconda`
* `conda install bioconductor-deseq2`
* `conda install git`


### Optional - Desktop GitHub Client

If you would prefer to use a graphical client for using git and github to a commandline one, 
you can download and install the GitHub Desktop client here:

* https://desktop.github.com

Now, make sure Jupyter Notebook works by either running "Jupyter Notebook" from the Start menu, or from a command line typing `jupyter notebook`.  
You should either see your browser load a page or, if not, opening the URL `http://localhost:8888/` should show
a webpage with a Jupyter logo.  If this doesn't happen, [email the instructor](mailto:jonathan@dursi.ca).
Otherwise, feel free to start playing around by starting a notebook by selecting Run>Notebooks>R (or Run>Notebooks>Python3)
and entering some R (or Python) commands in the cell and pressing shift-return to run
the commands (or selecting Cell>Run All).

## Installation On Mac

### Install Anacaonda
If you don't have Anaconda already installed, 

* Open [http://continuum.io/downloads](http://continuum.io/downloads) with your web browser.
* Download the Python 3 installer for Mac OS X.
* Install Python 3 using all of the defaults for installation.

If you already have Anaconda installed, make sure your Python version is 3.x not 2.x:
* At the command line, type `python --version`

If it is a 3.x version of python, all's good!  If it's a 2.x version of python, 
type the following commands at the command line:

* `conda create --name python3 python=3.5 anaconda`
* `source activate python3`

### Install the necessary conda packages

Once python3 anaconda is installed, we'll need to install some necessary conda packages.
At the command line, run the following commands to add packages we'll need for the tutorial:

* `conda config --add channels r`
* `conda install r-essentials`
* `conda config --add channels bioconda`
* `conda install bioconductor-deseq2`
* `conda install git`

Now, make sure Jupyter Notebook is up and running by, from the command line, running `jupyter notebook`.  
You should either see your browser load a page or, if not, opening the URL `http://localhost:8888/` should show
a webpage with a Jupyter logo.  If this doesn't happen, [email the instructor](mailto:jonathan@dursi.ca).
Otherwise, feel free to start playing around by starting a notebook by selecting Run>Notebooks>R (or Run>Notebooks>Python3)
and entering some R (or Python) commands in the cell and pressing shift-return to run
the commands (or selecting Cell>Run All).

### Optional - Desktop GitHub Client

If you would prefer to use a graphical client for using git and github to a commandline one, 
you can download and install the GitHub Desktop client here:

* https://desktop.github.com


## Installation On Linux

### Install Anacaonda
If you don't have Anaconda already installed, 

* Open [http://continuum.io/downloads](http://continuum.io/downloads) with your web browser.
* Download the Python 3 installer for Mac OS X.
* Open a terminal and cd to your downloads directory.
* run `source Anaconda*` using the defaults for installation.

If you already have Anaconda installed, make sure your Python version is 3.x not 2.x:
* At the command line, type `python --version`

If it is a 3.x version of python, all's good!  If it's a 2.x version of python, 
type the following commands at the command line:

* `conda create --name python3 python=3.5 anaconda`
* `source activate python3`

### Install the necessary conda packages

Once python3 anaconda is installed, we'll need to install some necessary conda packages.
At the command line, run the following commands to add packages we'll need for the tutorial:

* `conda config --add channels r`
* `conda install r-essentials`
* `conda config --add channels bioconda`
* `conda install bioconductor-deseq2`
* `conda install git`

Now, make sure Jupyter Notebook is up and running by, from the command line, running `jupyter notebook`.  
You should either see your browser load a page or, if not, opening the URL `http://localhost:8888/` should show
a webpage with a Jupyter logo.  If this doesn't happen, [email the instructor](mailto:jonathan@dursi.ca).
Otherwise, feel free to start playing around by starting a notebook by selecting Run>Notebooks>R (or Run>Notebooks>Python3)
and entering some R (or Python) commands in the cell and pressing shift-return to run
the commands (or selecting Cell>Run All).


