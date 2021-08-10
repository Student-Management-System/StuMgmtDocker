# Build-time variables for the Docker images. Must be set when building images.
# These can be either left as the URLs, or set to local files (relative to the respective Dockerfiles)

# Helper variable: the version of the sparky-service to pull from jenkins
SPARKY_VERSION=${SPARKY_VERSION:-"1.0.1-SNAPSHOT"}

# Helper variable: the version of Rights-Management to pull from jenkins
RIGHTS_MANAGEMENT_VERSION=${RIGHTS_MANAGEMENT_VERSION:-"0.0.2-SNAPSHOT"}

# Helper variable: the version of SubmissionCheck to pull from jenkins
SUBMISSION_CHECK_VERSION=${SUBMISSION_CHECK_VERSION:-"0.0.2-SNAPSHOT"}

export SPARKY_JAR="https://jenkins-2.sse.uni-hildesheim.de/job/Teaching_Sparkyservice-Project/lastSuccessfulBuild/artifact/target/sparkyservice-api-${SPARKY_VERSION}-spring-boot.jar"
export BACKEND_ARCHIVE="https://jenkins-2.sse.uni-hildesheim.de/job/Teaching_StudentMgmt-Backend/lastSuccessfulBuild/artifact/Backend.tar.gz"
export CLIENT_ARCHIVE="https://jenkins-2.sse.uni-hildesheim.de/job/Teaching_StudentMgmt-Client/lastSuccessfulBuild/artifact/Client-Root.tar.gz"
export RIGHTS_MANAGEMENT_JAR="https://jenkins-2.sse.uni-hildesheim.de/job/Teaching_Rights-Management/lastSuccessfulBuild/artifact/target/RightsManagement-$RIGHTS_MANAGEMENT_VERSION-jar-with-dependencies.jar"
export SUBMISSION_CHECK_BUNDLE="https://jenkins-2.sse.uni-hildesheim.de/job/Teaching_SubmissionCheck/lastSuccessfulBuild/artifact/target/submission-check-$SUBMISSION_CHECK_VERSION-bundle.tar.gz"
