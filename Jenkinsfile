pipeline {
    agent any   
    stages {
        stage('Checkout') {
            steps {
                echo "Start checkout project"
                sh 'env'
                step([$class: 'WsCleanup'])
                git url: 'https://github.com/msy53719/Jmeter_Anttest.git', branch: 'master'
                echo 'get artifact from pulugins  pipeline.'
            }
        }
        
        stage('Smoking Test') {
            steps {
                sh 'env'
                echo 'execute test'
                sh 'sh ./script/execute_test.sh'
            }
        }
        
          stage('send report') {
            steps {
             mail bcc: '', body: '${FILE, path="./test_report/Test.html"}', cc: '479979298@qq.com', from: 'tianjiao223@sina.cn', replyTo: '', subject: '测试报告', to: '479979298@qq.com'
             step([$class: 'Mailer', notifyEveryUnstableBuild: true, recipients: emailextrecipients([[$class: 'CulpritsRecipientProvider'], [$class: 'RequesterRecipientProvider']])])
             emailext body: 'A Test EMail', recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']], subject: '测试0001', to: '479979298@qq.com'
            }            
        }
    }
    post {
       success {
          // publish html
          publishHTML target: [
              allowMissing: false,
              alwaysLinkToLastBuild: false,
              keepAll: true,
              reportDir: './test_report/',
              reportFiles: 'Test.html',
              reportName: 'Html Report'
            ]
        }
    
        always {
            echo 'package report'
            sh 'sh ./script/report.sh'
            archiveArtifacts artifacts: 'test-report*.tar.gz', fingerprint: true
        }
        failure {
            echo 'this area is run when failure'
        }
    }

}

