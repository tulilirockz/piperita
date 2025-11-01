FROM scratch AS ctx

COPY build.sh /build.sh

FROM ghcr.io/ublue-os/bazzite:latest

RUN --mount=type=bind,from=ctx,source=/,dst=/tmp/build-scripts \
    --mount=type=cache,dst=/var/cache/libdnf5 \
    --mount=type=cache,dst=/var/cache/rpm-ostree \
    --mount=type=tmpfs,dst=/boot \
    --mount=type=tmpfs,dst=/run \
    /tmp/build-scripts/build.sh

RUN bootc container lint
