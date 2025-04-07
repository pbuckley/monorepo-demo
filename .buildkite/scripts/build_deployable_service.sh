#!/usr/bin/env bash

echo "Building ${BUILDKITE_PIPELINE_NAME} with version $(buildkite-agent meta-data get rel-ver) for deploy to hosts $(buildkite-agent meta-data get deploy-hosts)..."
