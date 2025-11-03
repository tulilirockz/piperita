FROM scratch AS ctx
COPY build.sh /build.sh

FROM ghcr.io/ublue-os/bazzite:latest@sha256:8fe30ba1e8a412c31ca62d8acb3bacfae398aad595b478c7d899a1663561ac7d

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

RUN bootc container lint
