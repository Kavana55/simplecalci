pipeline {
    agent any

    tools {
        maven 'Maven'
        jdk 'JDK21'
    }

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main',
                    credentialsId: 'github-token',
                    url: 'https://github.com/Kavana55/simplecalci.git'
            }
        }

        stage('Build Project') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Deploy WAR File') {
            steps {
                sh 'sudo cp target/calculator-app.war /var/lib/tomcat10/webapps/'
            }
        }

    }

    post {
        success {
            mail to: 'kavanan878@gmail.com',
                 subject: 'BUILD SUCCESS',
                 body: 'Calculator project build completed successfully.'
        }

        failure {
            mail to: 'kavanan878@gmail.com',
                 subject: 'BUILD FAILED',
                 body: 'Calculator project build failed.'
        }
    }
}
