ARG TAG="20190206"
ARG CONTENTIMAGE1="huggla/epanet:$TAG"
ARG CONTENTSOURCE1="/epanet"
ARG CONTENTIMAGE2="huggla/swmm:$TAG"
ARG CONTENTSOURCE2="/swmm"
ARG BASEIMAGE="huggla/tomcat-oracle:$TAG"
ARG EXECUTABLES="/usr/bin/epanet2 /usr/bin/swmm5"

#--------Generic template (don't edit)--------
FROM ${CONTENTIMAGE1:-scratch} as content1
FROM ${CONTENTIMAGE2:-scratch} as content2
FROM ${INITIMAGE:-${BASEIMAGE:-huggla/base:$TAG}} as init
FROM ${BUILDIMAGE:-huggla/build} as build
FROM ${BASEIMAGE:-huggla/base:$TAG} as image
ARG CONTENTSOURCE1
ARG CONTENTSOURCE1="${CONTENTSOURCE1:-/}"
ARG CONTENTDESTINATION1
ARG CONTENTDESTINATION1="${CONTENTDESTINATION1:-/buildfs/}"
ARG CONTENTSOURCE2
ARG CONTENTSOURCE2="${CONTENTSOURCE2:-/}"
ARG CONTENTDESTINATION2
ARG CONTENTDESTINATION2="${CONTENTDESTINATION2:-/buildfs/}"
ARG CLONEGITSDIR
ARG DOWNLOADSDIR
ARG MAKEDIRS
ARG MAKEFILES
ARG EXECUTABLES
ARG STARTUPEXECUTABLES
ARG EXPOSEFUNCTIONS
COPY --from=build /imagefs /
#---------------------------------------------

#--------Generic template (don't edit)--------
USER starter
ONBUILD USER root
#---------------------------------------------
