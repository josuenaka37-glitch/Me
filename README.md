# DNS Enumeration Tool

This tool is a lightweight bash script designed for efficient DNS enumeration. It allows users to query all DNS records simultaneously or target them one at a time for precise information gathering. 

I originally built this tool natively using `nslookup` and `dig` while preparing for my Penetration Testing certification to streamline my workflow. I have now decided to make it public to help other security enthusiasts and professionals with their reconnaissance phases.

## ⚠️ Disclaimer
**For educational and authorized security testing purposes only.** Enumeration or scanning of a domain without explicit prior authorization from the owner is illegal and unethical. The developer assumes no liability for misuse or any damage caused by this tool.

## How to Download and Run

To download this tool directly to your Linux/Unix machine, run the following commands in your terminal:

```bash
# Clone the repository
git clone https://github.com/josuenaka37-glitch/Me.git
# Move into the directory
cd Me

# Make the script executable
chmod +x dns_enum.sh

# Run the tool
./dns_enum.sh
