FROM redhat/ubi9:latest as build

ARG BUILD_PACKAGES = “package1 package2 package3 package4”

RUN dnf update && dnf install $BUILD_PACKAGES

WORKDIR /app

COPY . /app/

RUN [insert setup commands here]

FROM redhat/ubi9-minimal as app

ARG RUNTIME_PACKAGES = “package1 package2”

RUN microdnf update && dnf install $RUNTIME_PACKAGES

WORKDIR /app

COPY --from=build /app /app

RUN adduser -D nonroot && chown -R nonroot:nonroot /app
USER nonroot
