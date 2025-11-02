FROM scratch AS ctx
COPY build.sh /build.sh

FROM ghcr.io/ublue-os/bazzite:latest@sha256:dab8225bbccb60c2f0e963f8cb63b075dcaad26cd0ec170017495842cefe685d

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

RUN bootc container lint
