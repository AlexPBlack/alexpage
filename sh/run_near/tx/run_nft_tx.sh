#!/bin/bash

# create testft1.near  testft2.near
near account create-account fund-myself testft1.near '10 NEAR' autogenerate-new-keypair save-to-keychain sign-as near network-config localnet sign-with-keychain send
near account create-account fund-myself testft2.near '10 NEAR' autogenerate-new-keypair save-to-keychain sign-as near network-config localnet sign-with-keychain send

#deploy nft in testft1.near

near contract deploy testft1.near use-file res/nft_contract_skeleton.wasm without-init-call network-config localnet sign-with-keychain send

# init to testft2.near
near contract call-function as-transaction testft1.near new_default_meta json-args '{"owner_id": "testft2.near"}' prepaid-gas '100.0 Tgas' attached-deposit '0 NEAR' sign-as testft1.near network-config localnet sign-with-keychain send

# create testftuser1.near testftuser2.near testftuser3.near
near account create-account fund-myself testftuser1.near '10 NEAR' autogenerate-new-keypair save-to-keychain sign-as near network-config localnet sign-with-keychain send
near account create-account fund-myself testftuser2.near '10 NEAR' autogenerate-new-keypair save-to-keychain sign-as near network-config localnet sign-with-keychain send
near account create-account fund-myself testftuser3.near '10 NEAR' autogenerate-new-keypair save-to-keychain sign-as near network-config localnet sign-with-keychain send

#testftuser1.near mint nft-1
near contract call-function as-transaction testft1.near nft_mint json-args '{"token_id": "token-1", "metadata": {"title": "My Non Fungible Team Token", "description": "The Team Most Certainly Goes :)", "media": "https://bafybeiftczwrtyr3k7a2k4vutd3amkwsmaqyhrdzlhvpt33dyjivufqusq.ipfs.dweb.link/goteam-gif.gif"}, "receiver_id": "testftuser1.near"}' prepaid-gas '100.0 Tgas' attached-deposit '0.008 NEAR' sign-as testftuser1.near network-config localnet sign-with-keychain send

#testftuser2.near mint nft-2
near contract call-function as-transaction testft1.near nft_mint json-args '{"token_id": "token-2", "metadata": {"title": "My Non Fungible Team Token", "description": "The Team Most Certainly Goes :)", "media": "https://bafybeiftczwrtyr3k7a2k4vutd3amkwsmaqyhrdzlhvpt33dyjivufqusq.ipfs.dweb.link/goteam-gif.gif"}, "receiver_id": "testftuser2.near"}' prepaid-gas '100.0 Tgas' attached-deposit '0.008 NEAR' sign-as testftuser2.near network-config localnet sign-with-keychain send

#testftuser3.near mint nft-3
near contract call-function as-transaction testft1.near nft_mint json-args '{"token_id": "token-3", "metadata": {"title": "My Non Fungible Team Token", "description": "The Team Most Certainly Goes :)", "media": "https://bafybeiftczwrtyr3k7a2k4vutd3amkwsmaqyhrdzlhvpt33dyjivufqusq.ipfs.dweb.link/goteam-gif.gif"}, "receiver_id": "testftuser3.near"}' prepaid-gas '100.0 Tgas' attached-deposit '0.008 NEAR' sign-as testftuser3.near network-config localnet sign-with-keychain send

#create testftuser3
near account create-account fund-myself testftuser4.near '10 NEAR' autogenerate-new-keypair save-to-keychain sign-as near network-config localnet sign-with-keychain send

#transfer nft-1 to testftuser4
near contract call-function as-transaction testft1.near nft_transfer json-args '{"receiver_id":"testftuser4.near","token_id": "token-1"}' prepaid-gas '100.0 Tgas' attached-deposit '1 yoctoNEAR' sign-as testftuser1.near network-config localnet sign-with-keychain send

#transfer nft-2 to testftuser4
near contract call-function as-transaction testft1.near nft_transfer json-args '{"receiver_id":"testftuser4.near","token_id": "token-2"}' prepaid-gas '100.0 Tgas' attached-deposit '1 yoctoNEAR' sign-as testftuser2.near network-config localnet sign-with-keychain send
