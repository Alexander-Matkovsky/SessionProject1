# This shell file should be configured on crontab in order add scheduled task to restart the docker compose (reclone the project and pull docker image):

# add a scheduled task using crontab:
# $crontab -e
# Add  the following command (to be executed on each day at 00:15):
# 15 0 * * * /home/ubuntu/reclone_shell/reclone_project_and_docker_compose.sh >> /home/ubuntu/cron.log 2>&1

# or this one for each 5 minutes (for debug):
# 0,5,10,15,20,25,30,35,40,45,50,55 * * * * /home/ubuntu/reclone_shell/reclone_project_and_docker_compose.sh >> /home/ubuntu/cron.log 2>&1

# make sure to execute the following commands manually on the first time:
# git clone git@github.com:Alexander-Matkovsky/SessionsProject1.git
# mkdir -p /home/ubuntu/reclone_shell
# cp Sessions_Project/reclone_project_and_docker_compose.sh /home/ubuntu/reclone_shell
# chmod +x reclone_shell/reclone_project_and_docker_compose.sh
# cd ./Sessions_Project/src
# sudo docker-compose up -d


echo "------------------"
date -u
echo "------------------"

echo "entring main path"
cd 

echo "compose down"
sudo docker-compose down

echo "removing old clone"
rm -rf SessionProject1/

echo "cloning ssh from Alexander-Matkovsky/SessionProject1.git"
git clone git@github.com:Alexander-Matkovsky/SessionProject1.git

echo "create dedicated dir for reclone_project_and_docker_compose.sh"
mkdir -p reclone_shell

echo "copy reclone_project_and_docker_compose.sh to reclone_shell"
cp SessionProject1/reclone_project_and_docker_compose.sh ./reclone_shell/SessionProject1/reclone_project_and_docker_compose.sh

echo "provide permissions to reclone_shell/reclone_project_and_docker_compose.sh"
chmod +x reclone_shell/reclone_project_and_docker_compose.sh
 
echo "entering cloned project"
cd ./Sessions_Project/src

echo "compose up"
sudo docker-compose up -d
