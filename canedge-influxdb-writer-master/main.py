from utils import (
    setup_fs,
    load_dbc_files,
    list_log_files,
    ProcessData,
    MultiFrameDecoder,
)
from utils_db import SetupInflux
import inputs as inp

# initialize connection to InfluxDB + get latest data entries per device
influx = SetupInflux(inp.influx_url, inp.token, inp.org_id, inp.influx_bucket, inp.res)
start_times = influx.get_start_times(inp.devices, inp.default_start, inp.dynamic)

# setup filesystem (local/S3), load DBC files and list log files for processing
fs = setup_fs(inp.s3, inp.key, inp.secret, inp.endpoint, inp.pw)
db_list = load_dbc_files(inp.dbc_paths)
log_files = list_log_files(fs, inp.devices, start_times, inp.pw)

# process log files and write extracted signals to InfluxDB
proc = ProcessData(fs, db_list, inp.signals, inp.days_offset)

for log_file in log_files:
    df_raw, device_id = proc.get_raw_data(log_file, inp.pw)

    if inp.tp_type != "":
        tp = MultiFrameDecoder(inp.tp_type)
        df_raw = tp.combine_tp_frames(df_raw)

    df_phys = proc.extract_phys(df_raw)
    proc.print_log_summary(device_id, log_file, df_phys)

    influx.write_signals(device_id, df_phys)
