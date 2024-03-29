# Build-time variables for the Docker images. Must be set when building images.
# These can be either left as the URLs, or set to local files (relative to the respective Dockerfiles)

# Helper variable: the version of the sparky-service to pull from jenkins
SPARKY_VERSION=${SPARKY_VERSION:-"1.0.1-SNAPSHOT"}

# Helper variable: the version of exercise-submission-server to pull from jenkins
EXERCISE_SUBMISSION_SERVER_VERSION=${EXERCISE_SUBMISSION_SERVER_VERSION:-"1.1.3-SNAPSHOT"}

export SPARKY_JAR="https://jenkins-2.sse.uni-hildesheim.de/job/Teaching_Sparkyservice-Project/lastSuccessfulBuild/artifact/target/sparkyservice-api-${SPARKY_VERSION}-spring-boot.jar"
export BACKEND_ARCHIVE="https://jenkins-2.sse.uni-hildesheim.de/job/Teaching_StudentMgmt-Backend/lastSuccessfulBuild/artifact/Backend.tar.gz"
export CLIENT_ARCHIVE="https://jenkins-2.sse.uni-hildesheim.de/job/Teaching_StudentMgmt-Client/lastSuccessfulBuild/artifact/Client-Root.tar.gz"
export EXERCISE_SUBMISSION_SERVER_JAR="https://jenkins-2.sse.uni-hildesheim.de/job/Teaching_exercise-submitter-server/lastSuccessfulBuild/artifact/target/exercise-submitter-server-${EXERCISE_SUBMISSION_SERVER_VERSION}-jar-with-dependencies.jar"

# Components of the WEB-IDE
export PISTON_GIT="https://github.com/Student-Management-System/piston.git"
# Time that is requred to download ~180MB and unpack them
# With 11 MB you need ~ 240 sec. -> 300 sec includes a buffer and is inteded for lower bandwith
export PISTON_JAVA_DOWNLOAD_DURATION=300
export USER_SPARKY_JAR="https://jenkins-2.sse.uni-hildesheim.de/job/Teaching_UserSparky/lastSuccessfulBuild/artifact/target/user-sparky-0.0.1-SNAPSHOT-jar-with-dependencies.jar"
export WEB_IDE_ARCHIVE="https://jenkins-2.sse.uni-hildesheim.de/job/Teaching_Web-IDE/lastSuccessfulBuild/artifact/WEB-IDE-Root.tar.gz"
export CONVERGENCE_GIT="https://github.com/convergencelabs/convergence-docker-compose.git"
