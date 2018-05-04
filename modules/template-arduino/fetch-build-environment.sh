if [ -z ${R2D2_BUILD_ENVIRONMENT} ]; then
git clone https://github.com/JulianvDoorn/r2d2-continuous-integration-template $1
BUILD_ENVIRONMENT="$1"
else
BUILD_ENVIRONMENT=${R2D2_BUILD_ENVIRONMENT}
fi

export R2D2_BUILD_ENVIRONMENT=${BUILD_ENVIRONMENT}

echo "${BUILD_ENVIRONMENT}"
