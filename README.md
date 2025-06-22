# MangoOracle 

###  OracleFeedGroup
| Symbol          | Feed Address                                                           |
| --------------- | ------------------------------------------------------------------ |
| OracleFeedGroup | 0x15b7a30e7f482f414cf7beeb591757ee3e6c5b28626123aa378abc8384742791 |

### CoinList
<strong> Coin Info</strong>
<div style="overflow-x: auto; max-height: 500px;">
<table>
    <thead>
        <tr>
            <th>Symbol</th>
            <th>FullName</th>
            <th>Address</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>BTC</td>
            <td>Bitcoin</td>
            <td>0x5e12143825ee3b01317ec2e03ee6f46fef495889c96dacedab8b9be8e965459d</td>
        </tr>
        <tr>
            <td>ETH</td>
            <td>Ethereum</td>
            <td>0x99ac6aa76d619a2229062644ced56af0c0dbac12d96277fef88f73fe7acb379c</td>
        </tr>
        <tr>
            <td>BNB</td>
            <td>Binance Coin</td>
            <td>0xd3f2f59c9de934204672e68513280c26fca58857557ca0afcfee369ba743fed8</td>
        </tr>
        <tr>
            <td>SOL</td>
            <td>Solana</td>
            <td>0x19eee2c9b1b9218cd353f952a4ea8255c72681fff981a5f1d41c18748c7a182e</td>
        </tr>
    </tbody>
</table>
</div>



## How to Integrate an Oracle into Your Smart Contract

1. Create a Contract

```bash
mgo move new oracle_caller
```


2. Modify the Move.toml Configuration File

In the [dependencies] section, add the oracle contract's repository address, path, and branch:

```toml

[dependencies]
Oracle = { git = "https://github.com/MangoOracle/MangoOracle.git", subdir = "oracle", rev = "mainnet_1.0.3" }
```


In the  [dependencies] section, add the oracle contract's  address:

```toml

[addresses]
oracle = "0x2598f00582ecdb9fdc178b72cb47f53d7241249e0e402b8409afdab54f3b2c90"
```

3. Contract Integration Development


<p class="mx-auto w-full decoration-primary/6 max-w-3xl page-api-block:ml-0">ℹ️ <i class="font-italic">Tip:</i> Details of <code class="py-[1px] px-1.5 min-w-[1.625rem] justify-center items-center ring-1 ring-inset ring-tint bg-tint rounded text-[.875em] leading-[calc(max(1.20em,1.25rem))]">OracleFeedGroup</code> can be found in the contract configuration parameters.
The mapping between <code class="py-[1px] px-1.5 min-w-[1.625rem] justify-center items-center ring-1 ring-inset ring-tint bg-tint rounded text-[.875em] leading-[calc(max(1.20em,1.25rem))]">feed</code> and <code class="py-[1px] px-1.5 min-w-[1.625rem] justify-center items-center ring-1 ring-inset ring-tint bg-tint rounded text-[.875em] leading-[calc(max(1.20em,1.25rem))]">symbol</code> is available in the token object list.</p>

<br>


```move
module oracle_call::call {
    use oracle::data_source;
    use oracle::data_source::OracleFeedGroup;
    use mgo::tx_context::TxContext;


    public fun get_price_by_feed_group(feedGroup: &OracleFeedGroup,full_name: vector<u8>, _: &TxContext) { 
        let (price , decimals , last_update_time) = data_source::price(feedGroup, full_name);
     .....
    }
}
```
