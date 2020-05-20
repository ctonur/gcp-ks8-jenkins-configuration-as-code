pipelineJob('hello') {
  definition {
    cpsScm {
        scm {
          git {
            remote {
              url ('https://github.com/ctonur/gcp-ks8-jenkins-configuration-as-code.git')
              credentials('jenkins-github-ssh')
            }
          }
        }
      scriptPath("gcp-ks8-jenkins-configuration-as-code/Jenkinsfile")
    }
  }
}
