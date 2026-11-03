pipeline {

    agent any

    options {
         
        timestamps()
   
        skipDefaultCheckout(true)

    }

    stages {
        
        stage('Checkout') {

            steps {

                echo '==== Checkout Source Code ===='

                checkout scm

            }
  
        }

        stage('Inspect') {

            steps {

                echo '==== Inspect Jenkins Environment ===='

                sh '''
                    echo "Hostname:"
                    hostname

        
                    echo ""
                    echo "User:"
                    whoami

                    echo ""
                    echo "Build Number:"
                    echo "${BUILD_NUMBER}"

                    echo ""
                    echo "Git Commit:"
                    git rev-parse HEAD

                    echo ""
                    echo "Files:"
                    ls -la
               '''
            }
  
         }

         stage('Test') {

             steps {
 
                 echo '==== Run Test ===='

                 sh '''
                     chmod +x app.sh
                     chmod +x test.sh

                     ./test.sh
                 '''
             }

         }

         stage('Build') {

             steps {

                 echo '==== Build Artifact ===='

                 sh '''
                     mkdir -p dist

                     cp app.sh dist/hello-ACL.sh

                     echo "${BUILD_NUMBER}" \
                       > dist/build-number.txt

                     git rev-parse HEAD \
                       > dist/git-commit.txt
                 '''

               }
      
           }

           stage('Archive') {

               steps {
 
                   echo '==== Archive Artifact ===='

                   archiveArtifacts(
                       artifacts: 'dist/**',
                       fingerprint: true
                   )

               }
           }

      }

      post {

          success {
 
              echo '==== PIPELINE SUCCESS ===='

          }

          failure {

              echo '==== PIPELINE FAILED ===='
        
          }

          always {

              echo '==== PIPELINE FINISHED ===='

          }

      }

}


