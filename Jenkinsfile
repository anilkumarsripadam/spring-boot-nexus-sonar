pipeline {

    agent any

    stages{

        stage('Git Checkout'){

            steps{
                git branch: 'main', url: 'https://github.com/anilkumarsripadam/spring-boot-nexus-sonar.git'
            } 
        }
        stage('Maven Test'){

            steps{
                sh 'mvn test' 
            } 
        }
        stage('Integration testing'){
            steps{
                sh 'mvn verify -DskipUnitTests'
            }
        }
    }
}
