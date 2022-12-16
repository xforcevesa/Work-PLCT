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


if [[ "$1" == "raw" ]]
then
  echo 0 8 * * openeuler "$(pwd)/build_script.sh raw"  | sudo tee -a /etc/crontab
  sudo systemctl enable crond
  sudo systemctl start crond
  sudo crontab /etc/crontab
fi
