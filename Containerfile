FROM scratch AS ctx

COPY build.sh /build.sh

FROM ghcr.io/zirconium-dev/zirconium:latest@sha256:e441bf64a18d593a2518a18f500fc764c98f395a0a41baf0a41686b6f619fc6a

RUN --mount=type=tmpfs,dst=/var \
    --mount=type=tmpfs,dst=/tmp \
    --mount=type=tmpfs,dst=/boot \
    --mount=type=tmpfs,dst=/run \
    --mount=type=bind,from=ctx,source=/,dst=/tmp/build-scripts \
    /tmp/build-scripts/build.sh

RUN rm -rf /var/* && bootc container lint
