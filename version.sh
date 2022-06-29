# Bumps the version with NPM based upon the provided string ($1)
#
# If the string contains:
#  "major-release"
#  "minor-release"
#
# With "major-release" taking priority. Any other string will default to "patch".

case "$1" in
  *major-release*)
    mvn mvn build-helper:parse-version versions:set -DnewVersion=\${parsedVersion.nextMajorVersion}.\${parsedVersion.minorVersion}.\${parsedVersion.incrementalVersion}
    ;;
  *minor-release*)
    mvn build-helper:parse-version versions:set -DnewVersion=\${parsedVersion.majorVersion}.\${parsedVersion.nextMinorVersion}.\${parsedVersion.incrementalVersion}
    ;;
  *)
    mvn build-helper:parse-version versions:set -DnewVersion=\${parsedVersion.majorVersion}.\${parsedVersion.minorVersion}.\${parsedVersion.nextIncrementalVersion}
    ;;
esac