unit        class IBM::Spectrum::Protect::DB::TSMDB1:api<1>:auth<Mark Devine (mark@markdevine.com)>;

class COLUMN {
    has Str $.TABSCHEMA;    # VARCHAR
    has Str $.TABNAME;      # VARCHAR
    has Str $.COLNAME;      # VARCHAR
    has Str $.COLNO;        # SMALLINT
    has Str $.INDEX_KEYSEQ; # VARCHAR
    has Str $.INDEX_ORDER;  # VARCHAR
    has Str $.TYPENAME;     # VARCHAR
    has Str $.LENGTH;       # INTEGER
    has Str $.SCALE;        # SMALLINT
    has Str $.NULLS;        # VARCHAR
    has Str $.REMARKS;      # VARCHAR
}

has COLUMN  @.columns;

=finish
