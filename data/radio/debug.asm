debugoption:
        table_width 2
        dw .map_choose
        dw .trainer
        assert_table_length NUM_OPTIONS

.map_choose:
 db "map selector@"
.trainer:
 db "trainer@"