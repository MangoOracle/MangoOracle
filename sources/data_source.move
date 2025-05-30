module oracle::data_source {

    use std::ascii::String;
    use std::option::Option;

    use mgo::clock::Clock;
    use mgo::object::{ID, UID};
    use mgo::table::Table;
    use mgo::tx_context::TxContext;

    struct OracleCap has key, store {
        id: UID
    }

    struct OracleAdmin has key, store {
        id: UID
    }

    struct OracleFeedGroup has key, store {
        id: UID,
        feeds: Table<String, OracleFeedInfo>,
        version: u64
    }

    struct OracleFeedInfo has store {
        feed: ID,
        admin: ID
    }

    struct OracleFeed has key, store {
        id: UID,
        symbol: String,
        price: u64,
        decimals: u8,
        last_update_time: u64,
        enable: bool,
        version: u64
    }


    public entry fun update_oracle_feed_enable_state_by_cap(
        _: &OracleCap,
        _group: &OracleFeedGroup,
        _feed: &mut OracleFeed,
        _enable: bool
    ) {
        abort 0
    }

    public entry fun update_oracle_feed_enable_state(
        _admin: &OracleAdmin,
        _group: &OracleFeedGroup,
        _feed: &mut OracleFeed,
        _enable: bool
    ) {
        abort 0
    }

    public entry fun create_oracle_feed(
        _: &OracleCap,
        _group: &mut OracleFeedGroup,
        _symbol: vector<u8>,
        _decimals: u8,
        _adminer: address,
        _ctx: &mut TxContext
    ) {
        abort 0
    }

    public fun feed_id(_group: &OracleFeedGroup, _symbol: vector<u8>): Option<ID> {
        abort 0
    }

    public entry fun feed(_admin: &OracleAdmin,
                          _group: &OracleFeedGroup,
                          _feed: &mut OracleFeed,
                          _price: u64, _cl: &Clock) {
        abort 0
    }


    public fun price(_feed: &OracleFeed): (u64, u8, u64) {
        abort 0
    }
}