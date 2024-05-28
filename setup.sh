git submodule init && git submodule update
python3 -m venv .venv
source .venv/bin/activate
CMAKE_ARGS="-DLLAMA_VULKAN=1" FORCE_CMAKE=1 pip3 install llama-cpp-python --upgrade --force-reinstall --no-cache-dir
cd calyx
cargo build
pip3 install flit
cd calyx-py && flit install -s && cd -
flit -f fud/pyproject.toml install -s --deps production
fud config --create global.root `pwd`
cd ..


