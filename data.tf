data "external" "my_ip_address" {
  program = ["bash", "-c", "curl -s 'https://api.ipify.org?format=json'"]
}