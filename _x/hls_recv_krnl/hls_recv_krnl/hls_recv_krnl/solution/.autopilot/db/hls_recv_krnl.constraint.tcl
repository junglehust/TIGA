set clock_constraint { \
    name clk \
    module hls_recv_krnl \
    port ap_clk \
    period 5 \
    uncertainty 1.35 \
}

set all_path {}

set false_path {}

