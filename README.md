# fcs_demo

Demo network for FCS.

### What is FCS?
[![Slide](https://github.com/four-corner-model-stablecoin/fcs_demo/assets/46078198/f58055ab-4c8d-4317-ae7e-7be70ba7b66f)](https://speakerdeck.com/shmn7iii/paburitukuxing-burotukutienshang-nofa-gui-zhi-ke-neng-nasuteburukoinnoti-an-siteyan-jiu-hui)

The details are based on [the paper presented at the SITE workshop](https://ken.ieice.org/ken/paper/20231110UCyv/).  
Technical documents are [here](https://kindai-yamalabo.notion.site/FCS-Document-0ddc7e3fc1e5417a9a54e4763e5a98c6?pvs=4).

## Setup

**Requirements**

- make
- Docker compose
- Google Chrome

> [!IMPORTANT]
> **\* Clone this repository with `--recursive` option.**

```bash
$ git clone --recursive https://github.com/four-corner-model-stablecoin/fcs_demo.git

$ make launch

# Reset database and blockchain
$ make reset
```

```
Ports
  Brand: 3000
  Issuer: 3001
  Acquirer: 3002
  Demo server: 3003
```

## How to use

Run `make launch` and follow the instructions displayed in your browser.
