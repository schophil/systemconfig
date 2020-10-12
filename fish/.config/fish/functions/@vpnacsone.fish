function @vpnacsone
	sudo openvpn2 --config ~/tools/acsone-vpn/acsone-luxvpn-client.ovpn --compress lzo --tls-auth ~/tools/acsone-vpn/luxvpn-ta-key.pem 1
end
