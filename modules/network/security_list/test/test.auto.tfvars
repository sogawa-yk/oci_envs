security_lists = {
  "security_list1" : {
    ingress_rules: [
      {
        protocol: "6",
        source: "10.0.0.0/16",
        description: "Allow TCP traffic from 10.0.0.0/16",
        source_type: "CIDR_BLOCK",
        stateless: false,
        icmp_options: [],
        tcp_options: [
          {
            destination_port_range_max: 80,
            destination_port_range_min: 80,
            source_port_range: {
              max: 1024,
              min: 1024
            }
          }
        ],
        udp_options: []
      }
    ],
    egress_rules: [
      {
        destination: "0.0.0.0/0",
        protocol: "ALL",
        description: "Allow all egress traffic",
        destination_type: "CIDR_BLOCK",
        stateless: true,
        icmp_options: [],
        tcp_options: [],
        udp_options: []
      }
    ],
    security_list_display_name: "MySecurityList1"
  },
  "security_list2" : {
    ingress_rules: [
      {
        protocol: "17",
        source: "192.168.1.0/24",
        description: "Allow UDP traffic from 192.168.1.0/24",
        source_type: "CIDR_BLOCK",
        stateless: false,
        icmp_options: [],
        tcp_options: [],
        udp_options: [
          {
            destination_port_range_max: 50000,
            destination_port_range_min: 50000,
            source_port_range: {
              max: 10000,
              min: 10000
            }
          }
        ]
      }
    ],
    egress_rules: [
      {
        destination: "172.16.0.0/16",
        protocol: "1",
        description: "Allow ICMP traffic to 172.16.0.0/16",
        destination_type: "CIDR_BLOCK",
        stateless: true,
        icmp_options: [
          {
            type: 8,
            code: 0
          }
        ],
        tcp_options: [],
        udp_options: []
      }
    ],
    security_list_display_name: "MySecurityList2"
  }
}
