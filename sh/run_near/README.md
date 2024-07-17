# How to use
1. clone near-core && build
```shell
git clone https://github.com/near/nearcore.git
cd nearcore
cargo build --release
sudo cp -r neard /usr/local/bin/
```

2.run node
```shell
./neard run
```

this has 3 accounts
```json
[
  {
    "account_id": "near",
    "used_as_signer": true
  },
  {
    "account_id": "testpure.near",
    "used_as_signer": true
  },
  {
    "account_id": "test.near",
    "used_as_signer": true
  }
]
```