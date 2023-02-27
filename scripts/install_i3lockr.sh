git clone --depth=1 https://github.com/owenthewizard/i3lockr.git && \
    cd i3lockr && \
    cargo build --release && \
    sudo strip -s target/release/i3lockr -o /usr/local/bin/i3lockr && \
    i3lockr --blur 25 -- --nofork --ignore-empty-password 
