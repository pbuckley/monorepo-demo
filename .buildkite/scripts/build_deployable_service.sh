#!/usr/bin/env bash

export REL_VER=$(buildkite-agent meta-data get rel-ver)
export DEPLOY_HOSTS=$(buildkite-agent meta-data get deploy-hosts)

echo "Building ${BUILDKITE_PIPELINE_NAME} with version ${REL_VER} for deploy to hosts ${DEPLOY_HOSTS}..."

# we are assuming success here, this is a mock build that does not demo failure

IFS=',' read -ra DEPLOY_HOST_ARRAY <<< "$DEPLOY_HOSTS"

cat > "build-success.md" <<EOF
# 📊 Build Success Report

## Build Information

** Application:** \`${BUILDKITE_PIPELINE_NAME}\`
** Version:** \`${REL_VER}\`
** Build number:** \`${BUILDKITE_BUILD_NUMBER}\`

## Deployment Targets

The application can be deployed to the following targets:
$(for host in "${DEPLOY_HOST_ARRAY[@]}"; do
    echo "- \`${host}\`"
done)
✅ **Build completed successfully**
EOF

printf '%b\n' "$(cat build-success.md" | buildkite-agent annotate --style "success" --context "built-artifact"
