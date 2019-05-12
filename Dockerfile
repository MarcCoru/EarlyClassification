FROM r-base

## installing dependency GA
RUN Rscript -e "install.packages(c('GA'), dependencies=TRUE)"

## installing dependency TSclust

# requirement for TSclust see 
# https://stackoverflow.com/questions/31820865/error-in-installing-rgl-package
RUN apt-get update && apt-get install -y r-cran-rgl
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y xorg libx11-dev libglu1-mesa-dev 

#RUN Rscript -e "install.packages(c('alphashape3d'), dependencies=TRUE)"
#RUN Rscript -e "install.packages(c('rgl'), dependencies=TRUE)"
#RUN Rscript -e "install.packages(c('longitudinalData'), dependencies=TRUE)"
#RUN Rscript -e "install.packages(c('TSclust'), dependencies=TRUE)"
RUN Rscript -e "install.packages(c('TSdist'), dependencies=TRUE)"

COPY . /EarlyClassification

WORKDIR /EarlyClassification

ENV PATH="/EarlyClassification:${PATH}"

# entry as bash shell
CMD ["/bin/bash"]
