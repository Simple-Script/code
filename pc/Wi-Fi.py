# WiFi Speed Monitor

import speedtest
import time

def check_wifi_speed():
    st = speedtest.Speedtest()
    print("Checking download speed...")
    download_speed = st.download() / 1_000_000  # Convert to Mbps
    print("Checking upload speed...")
    upload_speed = st.upload() / 1_000_000  # Convert to Mbps
    return download_speed, upload_speed

def main():
    while True:
        download, upload = check_wifi_speed()
        print(f"Download Speed: {download:.2f} Mbps")
        print(f"Upload Speed: {upload:.2f} Mbps")
        time.sleep(60)  # Wait for 1 minute before checking again

if __name__ == "__main__":
    main()
