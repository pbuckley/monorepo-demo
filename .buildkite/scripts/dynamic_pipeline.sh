#!/usr/bin/env bash

export BUILD_TARGET_FOLDER=${1}

buildkite-agent pipeline upload ${BUILD_TARGET_FOLDER}/pipeline.yml
