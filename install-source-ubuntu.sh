# SETUP DEPENDENCIES
# 1) Install dependencies
sudo apt-get update
sudo apt-get install -y build-essential
# 2) Install Miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Linux-x86_64.sh
sh Miniconda3-py38_4.10.3-Linux-x86_64.sh
export CONDAPATH="$(pwd)/miniconda3"
export PYTHON="$(pwd)/miniconda3/envs/hummingbot/bin/python3"
# INSTALL HUMMINGBOT
# 3) Clone Hummingbot
git clone https://github.com/dkwon116/hummingbot.git
# 4) Install Hummingbot
export hummingbotPath="$(pwd)/hummingbot" && cd $hummingbotPath 
git checkout dan
./install
# 5) Activate environment and compile code
${CONDAPATH}/bin/activate hummingbot && ${PYTHON} setup.py build_ext --inplace
# 6) Start Hummingbot
${PYTHON} bin/hummingbot.py
# 7) Update .bashrc to register `conda`
exec bash