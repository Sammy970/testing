#!/usr/bin/env bash
echo "Made by Samyak Jain."
echo " Credits : Akhil Narang , Naman Parashar "
echo "********************************************************************************************************************************************************"
cd
sudo apt-get update 
sudo apt-get upgrade -y
echo "********************************************************************************************************************************************************"
cd
sudo add-apt-repository ppa:openjdk-r/ppa 
cd
mkdir bin
cd bin
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo 
chmod a+x ~/bin/repo
echo "********************************************************************************************************************************************************"
cd
sudo apt-get install bison build-essential curl ccache flex lib32ncurses5-dev lib32z1-dev libesd0-dev libncurses5-dev libsdl1.2-dev libxml2 libxml2-utils lzop pngcrush schedtool squashfs-tools xsltproc zip zlib1g-dev git-core make phablet-tools gperf openjdk-8-jdk -y
echo "********************************************************************************************************************************************************"
cd
cd bin
git clone https://github.com/akhilnarang/scripts.git build
cd
cd bin/build/setup
bash android_build_env.sh
echo "********************************************************************************************************************************************************"
cd
cd bin/build
mkdir aex
cd aex
echo "********************************************************************************************************************************************************"
cd
cd bin/build/aex/
git config --global user.name "Samyak"
git config --global user.email "jainsamyak2002.sj@gmail.com"
echo "********************************************************************************************************************************************************"
cd 
cd bin/build/aex/
repo init --depth=1 -u git://github.com/AospExtended/manifest.git -b 11.x
repo sync -c -q --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)
echo "********************************************************************************************************************************************************"
cd
cd bin/build/aex/
git clone https://github.com/OdSazib/device_xiaomi_jasmine_sprout.git device/xiaomi/jasmine_sprout 
git clone https://github.com/xiaomi-sdm660/android_vendor_xiaomi_sdm660-common.git device/xiaomi/sdm660-common 
git clone https://github.com/OdSazib/vendor_xiaomi_sdm660-common.git vendor/xiaomi/sdm660-common 
git clone https://github.com/OdSazib/halcyon_kernel_sdm660.git kernel/xiaomi/sdm660 
git clone https://github.com/OdSazib/vendor_xiaomi_wayne-common.git vendor/xiaomi/wayne-common
echo "********************************************************************************************************************************************************"

cd
cd bin/build/aex/device/xiaomi/jasmine_sprout/
mv awaken_jasmine_sprout.mk aosp_jasmine_sprout.mk
mv awaken.dependencies aosp.dependencies
nano aosp_jasmine_sprout.mk
nano AndroidProducts.mk
ccache -M 50G

#source build/envsetup.sh
#lunch aosp_jasmine_sprout-userdebug
#mka bacon -j6
