# Bumps the version with NPM based upon the provided string ($1)
#
# If the string contains:
#  "major-release"
#  "minor-release"
#
# With "major-release" taking priority. Any other string will default to "patch".

case "$1" in
  *major-release*)
    mvn build-helper:parse-version versions:set -DnewVersion=\${parsedVersion.nextMajorVersion}.0.0
    ;;
  *minor-release*)
    mvn build-helper:parse-version versions:set -DnewVersion=\${parsedVersion.majorVersion}.\${parsedVersion.nextMinorVersion}.0
    ;;
  *)
    mvn build-helper:parse-version versions:set -DnewVersion=\${parsedVersion.majorVersion}.\${parsedVersion.minorVersion}.\${parsedVersion.nextIncrementalVersion}
    ;;
esac