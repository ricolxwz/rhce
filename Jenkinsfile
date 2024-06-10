pipeline {
    agent any
    
    environment {
        CLOUDFLARE_ACCOUNT_ID = credentials('CLOUDFLARE_ACCOUNT_ID')
        CLOUDFLARE_API_TOKEN = credentials('CLOUDFLARE_API_TOKEN')
    }
    
    stages {
        stage('Pull Docker Images') {
            steps {
                script {
                    // Pull the Docker images
                    sh 'docker pull ghcr.io/ricolxwz/python-mkdocs-rhce:latest'
                    sh 'docker pull ghcr.io/ricolxwz/cloudflare-pages-rhce:latest'
                }
            }
        }
        
        stage('Run Python MkDocs Container') {
            steps {
                script {
                    // Run the Python MkDocs container
                    sh '''
                    docker run \
                        --rm \
                        --detach \
                        --volume $WORKSPACE:/app \
                        ghcr.io/ricolxwz/python-mkdocs-rhce:latest
                    '''
                }
            }
        }
        
        stage('Run Cloudflare Pages Container') {
            steps {
                script {
                    // Run the Cloudflare Pages container
                    sh '''
                    docker run \
                        --rm \
                        --volume $WORKSPACE/site:/site \
                        --env CLOUDFLARE_ACCOUNT_ID=$CLOUDFLARE_ACCOUNT_ID \
                        --env CLOUDFLARE_API_TOKEN=$CLOUDFLARE_API_TOKEN \
                        ghcr.io/ricolxwz/cloudflare-pages-rhce
                    '''
                }
            }
        }
    }
}
