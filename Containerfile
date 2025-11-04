FROM scratch AS ctx

COPY build.sh /build.sh

FROM ghcr.io/zirconium-dev/zirconium:latest@sha256:e441bf64a18d593a2518a18f500fc764c98f395a0a41baf0a41686b6f619fc6a

RUN --mount=type=bind,from=ctx,source=/,dst=/tmp/build-scripts \
    --mount=type=cache,dst=/var/cache/libdnf5 \
    --mount=type=cache,dst=/var/cache/rpm-ostree \
    --mount=type=tmpfs,dst=/boot \
    --mount=type=tmpfs,dst=/run \
    /tmp/build-scripts/build.sh

RUN bootc container lint
