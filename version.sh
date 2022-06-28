# Bumps the version with NPM based upon the provided string ($1)
#
# If the string contains:
#  "major-release"
#  "minor-release"
#
# With "major-release" taking priority. Any other string will default to "patch".

case "$1" in
  *major-release*)
    mvn versions:set -DnewVersion=major
    ;;
  *minor-release*)
    mvn versions:set -DnewVersion=minor
    ;;
  *)
    mvn versions:set -DnewVersion=patch
    ;;
esac