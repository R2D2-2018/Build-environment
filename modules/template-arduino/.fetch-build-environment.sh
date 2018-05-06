# This file clones the specified

github_URL="https://github.com/JulianvDoorn/r2d2-continuous-integration-template"

if [ -z ${R2D2_BUILD_ENVIRONMENT} ]; then
git clone ${github_URL} $1
build_environment="$1"
else
build_environment=${R2D2_BUILD_ENVIRONMENT}
fi

export R2D2_BUILD_ENVIRONMENT=${build_environment}

echo "${build_environment}"
