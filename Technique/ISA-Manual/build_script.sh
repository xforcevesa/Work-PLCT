if [[ ! -d "./riscv-isa-manual" ]]
then
  git clone https://github.com/riscv/riscv-isa-manual
  cd riscv-isa-manual
else
  cd riscv-isa-manual
  git pull
fi

if ! pdflatex -v &> /dev/null
then
  sudo dnf install texlive{,-multirow,-comment,-verbatimbox} -y
fi

cd build
make

echo 0 8 * * openeuler "cd $(pwd)/riscv-isa-manual; git pull; cd ./build; make" | sudo tee -a /etc/crontab
sudo systemctl enable crond
sudo systemctl start crond
sudo crontab /etc/crontab
