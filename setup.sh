# Install Calyx
cd calyx
cargo build

# Change directory to 'fud' and install using flit
cd calyx-py && flit install -s
cd $HOME/turbo-dialect/calyx/fud/ && flit install

# Set global.root to the path of the user's turbo dialect repository
fud config global.root "$HOME/turbo-dialect"

# Run fud check
fud check
