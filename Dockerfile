### File generated from Dockerfile.in; DO NOT EDIT.###
# Build arguments
ARG SOURCE_CODE=.
ARG CI_CONTAINER_VERSION="unknown"
ARG CI_CONTAINER_RELEASE="unknown"
ARG IMAGES_REGISTRY="quay.io/modh"
ARG IMAGES_SUFFIX="-container"


# Use ubi8/go-toolset as base image
FROM registry.redhat.io/ubi8/go-toolset:1.15.14 as builder

## Build args to be used at this step
ARG SOURCE_CODE

WORKDIR /opt/odh-operator

## Build kfctl
ENV CGO_ENABLED=0
ENV GO111MODULE=on

USER root

COPY ${SOURCE_CODE}/go.mod .
COPY ${SOURCE_CODE}/go.sum .
COPY ${SOURCE_CODE}/cmd ./cmd
COPY ${SOURCE_CODE}/config ./config
COPY ${SOURCE_CODE}/pkg ./pkg

RUN if [ -z ${CACHITO_ENV_FILE} ]; then \
       go mod download; \
    else \
       source ${CACHITO_ENV_FILE}; \
    fi

RUN go build \
       -o /opt/odh-operator/kfctl \
       -gcflags all=-trimpath=/scratch \
       -asmflags all=-trimpath=/scratch \
              github.com/kubeflow/kfctl/v3/cmd/manager


# Use ubi8/ubi as base image
FROM registry.redhat.io/ubi8/ubi:8.5 as manifests

## Build args to be used at this step
ARG SOURCE_CODE
ARG CI_CONTAINER_VERSION
ARG CI_CONTAINER_RELEASE
ARG IMAGES_REGISTRY
ARG IMAGES_SUFFIX

WORKDIR /opt/odh-operator

## Patch the odh-manifests to use product images instead of upstream images
COPY ${SOURCE_CODE}/odh-manifests ./odh-manifests

### ODH dashboard image
# RUN sed -i 's,image: rhods-dashboard.*,image: '"${IMAGES_REGISTRY}"'/odh-dashboard'"${IMAGES_SUFFIX}"':'"${CI_CONTAINER_VERSION}-${CI_CONTAINER_RELEASE}"',g' \
#        ./odh-manifests/odh-dashboard/base/deployment.yaml


# RUN sed -i 's,newName: .*,newName: '"${IMAGES_REGISTRY}"'/odh-dashboard'"${IMAGES_SUFFIX}"',g' \
#      ./odh-manifests/odh-dashboard/base/kustomization.yaml

### Kubeflow notebook controller image
# RUN sed -i 's,newName: .*,newName: '"${IMAGES_REGISTRY}"'/odh-kf-notebook-controller'"${IMAGES_SUFFIX}"',g' \
#        ./odh-manifests/kf-notebook-controller/base/kustomization.yaml && \
#     sed -i 's,newTag: .*,newTag: '"${CI_CONTAINER_VERSION}-${CI_CONTAINER_RELEASE}"',g' \
#        ./odh-manifests/kf-notebook-controller/base/kustomization.yaml

### ODH notebook controller image
# RUN sed -i 's,newName: .*,newName: '"${IMAGES_REGISTRY}"'/odh-notebook-controller'"${IMAGES_SUFFIX}"',g' \
#        ./odh-manifests/odh-notebook-controller/base/kustomization.yaml && \
#     sed -i 's,newTag: .*,newTag: '"${CI_CONTAINER_VERSION}-${CI_CONTAINER_RELEASE}"',g' \
#        ./odh-manifests/odh-notebook-controller/base/kustomization.yaml

### Minimal notebook image and rhods/prebuilt label
# RUN sed -i 's,name: quay.io/.*,name: '"${IMAGES_REGISTRY}"'/odh-minimal-notebook'"${IMAGES_SUFFIX}"':'"${CI_CONTAINER_VERSION}-${CI_CONTAINER_RELEASE}"',g' \
#        ./odh-manifests/jupyterhub/notebook-images/overlays/additional/minimal-notebook-imagestream.yaml && \
#     sed -i 's,rhods/prebuilt:.*,rhods/prebuilt: '"${CI_CONTAINER_VERSION}-${CI_CONTAINER_RELEASE}"',g' \
#        ./odh-manifests/jupyterhub/notebook-images/overlays/additional/minimal-notebook-imagestream.yaml && \
#     sed -i 's,rhodsversion,'"${CI_CONTAINER_VERSION}-${CI_CONTAINER_RELEASE}"',g' \
#        ./odh-manifests/jupyterhub/notebook-images/overlays/additional/minimal-notebook-imagestream.yaml

# RUN sed -i 's,quay.io.*[@],'"${IMAGES_REGISTRY}"'/odh-minimal-notebook'"${IMAGES_SUFFIX}"'@,g' \
#        ./odh-manifests/jupyterhub/notebook-images/overlays/additional/minimal-notebook-imagestream.yaml && \
#     sed -i 's,rhods/prebuilt:.*,rhods/prebuilt: '"${CI_CONTAINER_VERSION}-${CI_CONTAINER_RELEASE}"',g' \
#        ./odh-manifests/jupyterhub/notebook-images/overlays/additional/minimal-notebook-imagestream.yaml && \
#     sed -i 's,rhodsversion,'"${CI_CONTAINER_VERSION}-${CI_CONTAINER_RELEASE}"',g' \
#        ./odh-manifests/jupyterhub/notebook-images/overlays/additional/minimal-notebook-imagestream.yaml

# RUN sed -i 's,quay.io.*[@],'"${IMAGES_REGISTRY}"'/odh-generic-data-science-notebook'"${IMAGES_SUFFIX}"'@,g' \
#        ./odh-manifests/jupyterhub/notebook-images/overlays/additional//generic-data-science-notebook-imagestream.yaml  && \
#     sed -i 's,rhods/prebuilt:.*,rhods/prebuilt: '"${CI_CONTAINER_VERSION}-${CI_CONTAINER_RELEASE}"',g' \
#        ./odh-manifests/jupyterhub/notebook-images/overlays/additional//generic-data-science-notebook-imagestream.yaml  && \
#     sed -i 's,rhodsversion,'"${CI_CONTAINER_VERSION}-${CI_CONTAINER_RELEASE}"',g' \
#        ./odh-manifests/jupyterhub/notebook-images/overlays/additional/generic-data-science-notebook-imagestream.yaml 



### Anaconda validator image
RUN sed -i 's,image: quay.io/openshift/origin-deployer.*,image: '"${IMAGES_REGISTRY}"'/odh-deployer'"${IMAGES_SUFFIX}"':'"${CI_CONTAINER_VERSION}-${CI_CONTAINER_RELEASE}"',g' \
       ./odh-manifests/partners/anaconda/base/anaconda-ce-validator-cron.yaml

### Set version for rhods/prebuilt label on generic
RUN sed -i 's,rhods/prebuilt:.*,rhods/prebuilt: '"${CI_CONTAINER_VERSION}-${CI_CONTAINER_RELEASE}"',g' \
       ./odh-manifests/jupyterhub/notebook-images/overlays/additional/generic-data-science-notebook-imagestream.yaml

## Add in the odh-manifests tarball
RUN tar -czf /opt/odh-operator/odh-manifests.tar.gz \
       --exclude={.*,*.md,Makefile,Dockerfile,Containerfile,OWNERS,tests} \
       odh-manifests


# Use ubi8/ubi-minimal as base image
FROM registry.redhat.io/ubi8/ubi-minimal:8.5

## Build args to be used at this step
ARG CI_CONTAINER_VERSION
ARG CI_CONTAINER_RELEASE

## Install additional packages
RUN microdnf install -y shadow-utils &&\
    microdnf clean all

## Create a non-root user with UID 1001
RUN useradd --uid 1001 --create-home --user-group --system rhods

## Set workdir directory to user home
WORKDIR /home/rhods

## Copy kfctl binary and odh-manifests
COPY --from=builder /opt/odh-operator/kfctl /usr/local/bin

COPY --from=manifests --chown=rhods:root \
       /opt/odh-operator/odh-manifests /opt/manifests-source/
COPY --from=manifests --chown=rhods:root \
       /opt/odh-operator/odh-manifests.tar.gz /opt/manifests/

# Add a symlink here so that the image can be invoked multiple ways
# Autobuilds do not support adding -p binary_name ... so we provide all known names
RUN ln -s /usr/local/bin/kfctl /usr/local/bin/opendatahub-operator

## Switch to a non-root user
USER rhods

ENTRYPOINT [ "/usr/local/bin/opendatahub-operator" ]


LABEL com.redhat.component="odh-operator-container" \
      name="managed-open-data-hub/odh-operator-rhel8" \
      version="${CI_CONTAINER_VERSION}" \
      release="${CI_CONTAINER_RELEASE}" \
      summary="odh-operator" \
      io.openshift.expose-services="" \
      io.k8s.display-name="odh-operator" \
      maintainer="['managed-open-data-hub@redhat.com']" \
      description="odh-operator"

