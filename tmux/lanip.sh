# Check OS
case $(uname -s) in
    Linux)
		# Get the names of all attached NICs.
		all_nics="$(ip addr show | cut -d ' ' -f2 | tr -d :)"
		all_nics=(${all_nics[@]/lo/})	 # Remove lo interface.

		for nic in "${all_nics[@]}"; do
			# Parse IP address for the NIC.
			lan_ip="$(ip addr show ${nic} | grep '\<inet\>' | tr -s ' ' | cut -d ' ' -f3)"
			# Trim the CIDR suffix.
			lan_ip="${lan_ip%/*}"
			# Only display the last entry
			lan_ip="$(echo "$lan_ip" | tail -1)"

			[ -n "$lan_ip" ] && break
		done
      ;;
    Darwin|FreeBSD)
        all_nics=$(ifconfig 2>/dev/null | awk -F':' '/^[a-z]/ && !/^lo/ { print $1 }' | tr '\n' ' ')
		IFS=' ' read -ra all_nics_array <<< "$all_nics"
		for nic in "${all_nics_array[@]}"; do
			ipv4s_on_nic=$(ifconfig ${nic} 2>/dev/null | awk '$1 == "inet" { print $2 }')
			for lan_ip in ${ipv4s_on_nic[@]}; do
				[[ -n "${lan_ip}" ]] && break
			done
			[[ -n "${lan_ip}" ]] && break
		done
      ;;
    CYGWIN*|MINGW32*|MSYS*|MINGW*)
      # leaving empty - TODO - windows compatability
      ;;
    *)
      ;;
esac

echo "${lan_ip-N/a}"
