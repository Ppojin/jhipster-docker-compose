# !/bin/sh


echo "=================== kubectl apply -f kiali.yml ====================";
kubectl apply -f kiali.yml
# echo "=================== kubectl apply -f kibana-gateway.yml ====================";
# kubectl apply -f kibana-gateway.yml
 
echo "=================== build image ====================";
cd office_app;
jhipster import-jdl office-assistant.jh

# echo "============================================== build ui ==============================================";
# cd ui; ./gradlew bootJar -Pprod jib -Djib.to.image=ppojin/ui;
# echo "============================================== build organization ==============================================";
# cd ../organization; ./gradlew bootJar -Pprod jib -Djib.to.image=ppojin/organization;
# echo "============================================== build leave ==============================================";
# cd ../leave; ./gradlew bootJar -Pprod jib -Djib.to.image=ppojin/leave;
# echo "============================================== build meeting ==============================================";
# cd ../meeting; ./gradlew bootJar -Pprod jib -Djib.to.image=ppojin/meeting;
# echo "============================================== build notification ==============================================";
# cd ../notification; ./gradlew bootJar -Pprod jib -Djib.to.image=ppojin/notification;

cd ui;
./gradlew bootJar -Pprod jibDockerBuild;
cd ../organization;
./gradlew bootJar -Pprod jibDockerBuild;
cd ../leave;
./gradlew bootJar -Pprod jibDockerBuild;
cd ../meeting;
./gradlew bootJar -Pprod jibDockerBuild;
cd ../notification;
./gradlew bootJar -Pprod jibDockerBuild;

# cd ui;
# ./gradlew bootJar -Dorg.gradle.java.home=/Library/Java/JavaVirtualMachines/jdk-11.0.6.jdk/Contents/Home -Pprod jibDockerBuild;
# cd ../organization;
# ./gradlew bootJar -Dorg.gradle.java.home=/Library/Java/JavaVirtualMachines/jdk-11.0.6.jdk/Contents/Home -Pprod jibDockerBuild;
# cd ../leave;
# ./gradlew bootJar -Dorg.gradle.java.home=/Library/Java/JavaVirtualMachines/jdk-11.0.6.jdk/Contents/Home -Pprod jibDockerBuild;
# cd ../meeting;
# ./gradlew bootJar -Dorg.gradle.java.home=/Library/Java/JavaVirtualMachines/jdk-11.0.6.jdk/Contents/Home -Pprod jibDockerBuild;
# cd ../notification;
# ./gradlew bootJar -Dorg.gradle.java.home=/Library/Java/JavaVirtualMachines/jdk-11.0.6.jdk/Contents/Home -Pprod jibDockerBuild;

echo "=================== push image ====================";
docker image tag ui ppojin/ui;
docker image tag organization ppojin/organization;
docker image tag leave ppojin/leave;
docker image tag meeting ppojin/meeting;
docker image tag notification ppojin/notification;

docker push ppojin/ui;
docker push ppojin/organization;
docker push ppojin/leave;
docker push ppojin/meeting;
docker push ppojin/notification;

echo "=================== kubectl apply ====================";
cd ../kubernetes;
./kubectl-apply.sh -f
# kubectl apply -f namespace.yml;
# kubectl label namespace office istio-injection=enabled --overwrite=true;
# kubectl apply -f ui/;
# kubectl apply -f organization/;
# kubectl apply -f leave/;
# kubectl apply -f meeting/;
# kubectl apply -f notification/;
# kubectl apply -f istio/;
# cd ../;

echo "=================== workdone ====================";