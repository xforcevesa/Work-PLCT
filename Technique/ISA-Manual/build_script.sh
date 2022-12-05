if [[ ! -d "./riscv-isa-manual" ]]
then
  git https://github.com/riscv/riscv-isa-manual
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
