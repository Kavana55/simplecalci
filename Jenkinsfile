pipeline {
    agent any

    tools {
        maven 'Maven'
        jdk 'JDK21'
    }

    options {
        timestamps()
        timeout(time: 30, unit: 'MINUTES')
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Kavana55/simplecalci.git',
                    credentialsId: 'github-token'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Package') {
            steps {
                sh 'mvn package'
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                sh 'sudo cp target/calculator-app.war /var/lib/tomcat10/webapps/'
            }
        }
    }

    post {

        always {
            cleanWs()
        }

        success {
            emailext (
                subject: "SUCCESS: ${JOB_NAME} - Build #${BUILD_NUMBER}",
                body: "Calculator project build successful.\nView Build: ${BUILD_URL}",
                to: "kavanan878@gmail.com"
            )
        }

        failure {
            emailext (
                subject: "FAILED: ${JOB_NAME} - Build #${BUILD_NUMBER}",
                body: "Calculator project build failed.\nCheck Console: ${BUILD_URL}",
                to: "kavanan878@gmail.com"
            )
        }
    }
}
