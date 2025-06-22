module oracle::data_source {

    use std::ascii;
    use std::ascii::String;
    use std::vector;
    use mgo::clock;
    use mgo::clock::Clock;
    use mgo::object;
    use mgo::object::{UID};
    use mgo::table;
    use mgo::table::Table;
    use mgo::transfer;
    use mgo::transfer::{public_share_object};
    use mgo::tx_context;
    use mgo::tx_context::TxContext;


    struct OracleCap has key, store {
        id: UID
    }

    struct OracleFeedGroup has key, store {
        id: UID,
        feeds: Table<String, OracleFeed>,
        version: u64
    }

    struct OracleFeed has store {
        symbol: String,
        full_name: String,
        price: u64,
        decimals: u8,
        last_update_time: u64,
        enable: bool,
    }


    public entry fun update_oracle_feed_enable_state(
        _: &OracleCap,
        _group: &mut OracleFeedGroup,
        _full_name: vector<u8>,
        _enable: bool
    ) {
        abort 0
    }

    public entry fun create_oracle_feed(
        _: &OracleCap,
        _group: &mut OracleFeedGroup,
        _full_name: vector<u8>,
        _symbol: vector<u8>,
        _decimals: u8,
        _: &mut TxContext
    ) {
        abort 0
    }

    public entry fun feed(  _: &OracleCap,
                          _group: &mut OracleFeedGroup,
                          _full_names: vector< vector<u8> >,
                          _prices: vector<u64>,
                          _cl: &Clock) {
        abort 0
    }

    public fun price(_group: &OracleFeedGroup,_full_name: vector<u8>): (u64, u8, u64) {
        abort 0
    }
}