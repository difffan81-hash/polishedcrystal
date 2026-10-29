debugger:
        table_width 2
        dw .map_choose
        assert_table_length NUM_OPTIONS

.map_choose:
 db "map selector@"