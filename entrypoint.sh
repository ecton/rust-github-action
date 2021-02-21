cd web
sed -i s/CACHEBUSTER/`uuidgen`/g static/bootstrap.html
BASWS_CLIENT_ENCRYPTION_KEY=$1 cargo build --target wasm32-unknown-unknown --release
wasm-bindgen target/wasm32-unknown-unknown/release/web.wasm --target web --out-dir static/pkg --out-name web --remove-producers-section
wasm-opt -Os static/pkg/web_bg.wasm -o static/pkg/web_bg.wasm
sass sass/styles.sass static/styles.css

cd ../native
cargo build --bin cosmicverge-server --release
cargo run --bin cosmicverge-server --release -- generate-assets ../web/static/