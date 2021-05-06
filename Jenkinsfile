node{
	def mvnHome
	
	stage('Prepare'){
		git url : 'https://github.com/khp3040/devops-springboot.git', branch: 'develop'
		mvnHome = tool 'mvn'
	}
	
	stage('Build'){
		sh "'${mvnHome}\bin\mvn' -Dmaven.test.failure.ignore clean package "
	}
	
	stage('UnitTest'){
		junit '**/target/surefire-reports/TEST-*.xml'
		archive 'target/*.jar'
	}

	stage('IntegrationTest'){
		sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean verify"
	}
	
	stage('Sonar'){
		sh "'${mvnHome}/bin/mvn' sonar:sonar"	
	}
	
	stage('Deploy'){
		sh 'curl -u admin:admin -T *.war "http://localhost:7080/manager/text/deploy?path=/ibm-devops&update=true"'
	}
	
	stage('SmokeTest'){
		sh 'curl --retry-delay 10 --retry 5 "http://localhost:7080/ibm-devops/api/v1/products"'
	}


}