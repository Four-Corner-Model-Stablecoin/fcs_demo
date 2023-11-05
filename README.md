# fcs_demo

Demo network for FCS.

## Setup

```bash
$ make launch
# Ports
#   Brand: 3000
#   Issuer: 3001
#   Acquirer: 3002

# Reset database and blockchain
$ make reset
```

## How to use

### 1. Login

Visit http://localhost:3000, username: `user`.

### 2. Issue token

Visit http://localhost:3000/stable_coin/new and specify amount.

You can find result in http://localhost:3001/issuance_transactions .

### 3. Check user's wallet

After issuance, user can find own stablecoin UTXO.

```bash
$ make user/listunspent
```

### 4. Pay to merchant

Pay first of UTXOs to merchant's VC.

```bash
$ make user/payment
```

You can find result in http://localhost:3001/payment_transactions .

### 5. Check merchant's wallet

After payment, merchant can find own stablecoin UTXO.

```bash
$ make merchant/listunspent
```

### 6. Withdraw stablecoin

Withdraw first of UTXOs.

```bash
$ make merchant/withdraw
```

You can find result in http://localhost:3002/withdrawal_transactions and http://localhost:3001/withdrawal_transactions  
Also can check issuer/acquirer's account transaction in http://localhost:3000/accounts/{1,2}/account_transactions
