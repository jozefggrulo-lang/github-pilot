import socket
target = "192.168.1.1"
ports = [21, 22, 23, 80, 443, 8291]
print(f"Skenujem {target}...")
for port in ports:
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(1)
    result = sock.connect_ex((target, port))
    if result == 0:
        print(f"Port {port}: OTVORENÝ")
    sock.close()
